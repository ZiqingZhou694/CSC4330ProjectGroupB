package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Appointment;
import com.example.springboot.entity.Availability;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.service.IAppointmentService;
import com.example.springboot.service.IAvailabilityService;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.SessionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;


@RestController
@RequestMapping("/appointment")
public class AppointmentController {

    @Resource
    private IAppointmentService appointmentService;

    @Resource
    private IAvailabilityService availabilityService;
    @Resource
    private IUserService userService;

    @AutoLog("Add Appointment")
    @PostMapping
    @SaCheckPermission("appointment.add")
    public Result save(@RequestBody Appointment appointment) {
       Availability availability = availabilityService.getById(appointment.getAvailabilityId());

        User user = SessionUtils.getUser();
        Integer userId = user.getId();
        Appointment appointment1 = appointmentService.getOne(new QueryWrapper<Appointment>().eq("user_id", userId).eq("availability_id", appointment.getAvailabilityId()));
        if(!Objects.isNull(appointment1)){
            throw new ServiceException("you already book this appointment!");
        }
        if(availability.getNumsLeft()<1){
            throw new ServiceException(("sorry the number of appointments is full"));
        }

        availability.setNumsLeft(availability.getNumsLeft() - 1);
        availabilityService.updateById(availability);

        appointment.setUserId(user.getId());
        appointment.setTime(DateUtil.now());
        appointment.setTutorId(availability.getTutorId());
        appointment.setSubject(availability.getSubject());
//        User user = SessionUtils.getUser();
//        appointment.setUser(user.getName());
//        appointment.setUserid(user.getId());
//        appointment.setDate(DateUtil.today());
//        appointment.setTime(DateUtil.now());
        appointmentService.save(appointment);
        return Result.success();
    }

    @AutoLog("Edit Appointment")
    @PutMapping
    @SaCheckPermission(value = {"appointment.edit", "appointment.accept", "appointment.decline"}, mode = SaMode.OR)
    public Result update(@RequestBody Appointment appointment) {
        appointmentService.updateById(appointment);
        return Result.success();
    }

    @AutoLog("Delete Appointment")
    @DeleteMapping("/{id}")
    @SaCheckPermission("appointment.cancel")
    public Result delete(@PathVariable Integer id) {
        //restore the nums
        // cancel the appointment
        Appointment appointment = appointmentService.getById(id);
        Integer availabilityId = appointment.getAvailabilityId();
        Availability availability = availabilityService.getById(appointment.getAvailabilityId());
        availability.setNumsLeft(availability.getNumsLeft() +1);
        availabilityService.updateById(availability);
        appointmentService.removeById(id);
        return Result.success();
    }

    @AutoLog("Delete Batch Appointment")
    @PostMapping("/del/batch")
    @SaCheckPermission("appointment.deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        appointmentService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    @SaCheckPermission("appointment.list")
    public Result findAll() {
        return Result.success(appointmentService.list());
    }


    @GetMapping("/{id}")
    @SaCheckPermission("appointment.list")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(appointmentService.getById(id));
    }

    @GetMapping("/page")
    @SaCheckPermission("appointment.list")
    public Result findPage(@RequestParam(defaultValue = "") String subject,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Appointment> queryWrapper = new QueryWrapper<Appointment>().orderByDesc("id");
        queryWrapper.like(!"".equals(subject), "subject", subject);
        //let appointment show by user's id
        User user = SessionUtils.getUser();
        // for student
        if(user.getRole().equals("STUDENT")){
            queryWrapper.eq("user_id", user.getId());
        }
        // for tutor
        if(user.getRole().equals("TUTOR")){
            queryWrapper.eq("tutor_id", user.getId());
        }

        Page<Appointment> page =appointmentService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<Appointment> records = page.getRecords();
        for(Appointment record : records){
            record.setAvailability(availabilityService.getById(record.getAvailabilityId()));
            record.setUser(userService.getById(record.getUserId()));
        }


        return Result.success(page);
    }

}
