package com.example.springboot.schedule;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Appointment;
import com.example.springboot.entity.Availability;
import com.example.springboot.entity.User;
import com.example.springboot.service.IAppointmentService;
import com.example.springboot.service.IAvailabilityService;
import com.example.springboot.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Component
@Slf4j
public class AvailableTask {
    @Resource
    IAvailabilityService availabilityService;
    @Resource
    IAppointmentService appointmentService;
    @Resource
    IUserService userService;

    @Scheduled(fixedRate = 60 * 1000)
    public void task() {
        log.info("I am a scheduled task, and my task to update the availability status begins.");

        List<Availability> updateList = new ArrayList<>();
        // 扫描整个活动表 Scan the entire availability table.
        List<Availability> list = availabilityService.list();
        for (Availability availability : list) {
//            if ("Expired".equals(availability.getStatus())) { // if expire don't change
//                continue;
//            }
            String startTime = availability.getDate() + " " + availability.getStartTime();
            String endTime = availability.getDate() +" "+ availability.getEndTime();
            DateTime startDateTime = DateUtil.parse(startTime, "yyyy-MM-dd HH:mm:ss");  // start
            DateTime endDateTime = DateUtil.parse(endTime, "yyyy-MM-dd HH:mm:ss");   // end
            DateTime now = new DateTime();   // now

            if (now.isAfter(endDateTime)) {
                availability.setStatus("Expired");
                updateList.add(availability);
            }else {
                availability.setStatus("Available");
                updateList.add(availability);
            }

//           if (now.isAfterOrEquals(startDateTime) && now.isBeforeOrEquals(endDateTime)) {
//                availability.setStatus("available");
//                updateList.add(availability);
//            } else if (now.isAfter(endDateTime)) {
//                availability.setStatus("Expired");
//                updateList.add(availability);
//            }

        }

        if (updateList.size() > 0) {
            log.info("The scheduled task is updating the availability status...");
        }
        availabilityService.updateBatchById(updateList);
        log.info("I am a scheduled task, and my task to update the availability status has ended.");


        log.info("I am a scheduled task, and my task to update the appointment status begins.");
//        List<Appointment> appointmentList = appointmentService.list(new QueryWrapper<Appointment>().eq("status", "Pending"));
//        for(Appointment appointment : appointmentList){
//            String time = appointment.getTime();
//            DateTime datetime = DateUtil.parseDateTime(time);
//
//            DateUtil.offsetMinute(datetime, 60);
//            if(datetime.isAfter(new Date())){
//
//                Integer availabilityId = appointment.getAvailabilityId();
//                Availability availability = availabilityService.getById(availabilityId);
//                availability.setNumsLeft(availability.getNumsLeft() + 1);
//                availabilityService.updateById(availability);
//                appointmentService.removeById(appointment.getId());
//                User user = userService.getById(appointment.getUserId());
//                log.info("Cancel {}'s {} appointment ", user.getLastName(), availability.getSubject());
//            }
//        }
        List<Appointment> appointmentList = appointmentService.list(new QueryWrapper<Appointment>().eq("status", "Pending"));
        for(Appointment appointment : appointmentList){
            String time = appointment.getTime();
            DateTime datetime = DateUtil.parseDateTime(time);

            datetime = DateUtil.offsetMinute(datetime, 60);
            if(datetime.isBefore(new Date())){

                Integer availabilityId = appointment.getAvailabilityId();
                Availability availability = availabilityService.getById(availabilityId);
                availability.setNumsLeft(availability.getNumsLeft() + 1);
                availabilityService.updateById(availability);
                appointmentService.removeById(appointment.getId());
                User user = userService.getById(appointment.getUserId());
                log.info("Cancel {}'s {} appointment ", user.getLastName(), availability.getSubject());
            }
        }

        log.info("I am a scheduled task, and my task to update the appointment status has ended.");

        log.info("I am a scheduled task, and my task to update the appointment time begins.");
        List<Appointment> appointmentList2 = appointmentService.list();
        for(Appointment appointment : appointmentList2){
            String time = appointment.getTime();
            DateTime datetime = DateUtil.parseDateTime(time);

            // 偏移30天
            datetime = DateUtil.offsetDay(datetime, 30);
            if(datetime.isBefore(new Date())){

                Integer availabilityId = appointment.getAvailabilityId();
                Availability availability = availabilityService.getById(availabilityId);
//                availability.setNumsLeft(availability.getNumsLeft() + 1);
//                availabilityService.updateById(availability);
                appointmentService.removeById(appointment.getId());
                User user = userService.getById(appointment.getUserId());
                log.info("Cancel {}'s {} appointment ", user.getLastName(), availability.getSubject());
            }
        }
        log.info("I am a scheduled task, and my task to update the appointment status has ended.");
    }
}
