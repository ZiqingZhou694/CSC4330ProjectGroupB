package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Availability;
import com.example.springboot.entity.User;
import com.example.springboot.service.IAvailabilityService;
import com.example.springboot.utils.SessionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("/availability")
public class AvailabilityController {

    @Resource
    private IAvailabilityService availabilityService;

    @AutoLog("Add Availability")
    @PostMapping
    @SaCheckPermission("availability.add")
    public Result save(@RequestBody Availability availability) {
        User user = SessionUtils.getUser();
        availability.setNumsLeft(availability.getNums());
        if(availability.getName() == null){
            availability.setName(user.getFirstName() + " " + user.getLastName());
        }
        if(availability.getTutorId() == null){
            availability.setTutorId(user.getId());
        }

//        availability.setUserid(user.getId());
//        availability.setDate(DateUtil.today());
//        availability.setTime(DateUtil.now());
        availabilityService.save(availability);
        return Result.success();
    }

    @AutoLog("Edit Availability")
    @PutMapping
    @SaCheckPermission("availability.edit")
    public Result update(@RequestBody Availability availability) {
//        availability.setNumsLeft(availability.getNums());
        availabilityService.updateById(availability);
        return Result.success();
    }

    @AutoLog("Delete Availability")
    @DeleteMapping("/{id}")
    @SaCheckPermission("availability.delete")
    public Result delete(@PathVariable Integer id) {
        availabilityService.removeById(id);
        return Result.success();
    }

    @AutoLog("Delete Batch Availability")
    @PostMapping("/del/batch")
    @SaCheckPermission("availability.deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        availabilityService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    @SaCheckPermission("availability.list")
    public Result findAll() {
        return Result.success(availabilityService.list());
    }

    @GetMapping("/{id}")
    @SaCheckPermission("availability.list")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(availabilityService.getById(id));
    }

    @GetMapping("/page")
    @SaCheckPermission("availability.list")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam String subject,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Availability> queryWrapper = new QueryWrapper<Availability>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        queryWrapper.like(!"".equals(subject), "subject", subject);
        User user = SessionUtils.getUser();
        // for tutor
        if(user.getRole().equals("TUTOR")){
            queryWrapper.eq("tutor_id", user.getId());
        }
        //.......
        if(user.getRole().equals("STUDENT")){
            queryWrapper.eq("status", "Available");
        }
        //
        return Result.success(availabilityService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}
