package com.example.springboot.schedule;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.entity.Availability;
import com.example.springboot.service.IAvailabilityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Component
@Slf4j
public class AvailableTask {
    @Resource
    IAvailabilityService availabilityService;

    @Scheduled(fixedRate = 60 * 1000)
    public void task() {
        log.info("I am a scheduled task, and my task to update the activity status begins.");

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

//            if (now.isAfter(endDateTime)) {
//                availability.setStatus("Expired");
//                updateList.add(availability);
//            }else {
//                availability.setStatus("Available");
//                updateList.add(availability);
//            }

           if (now.isAfterOrEquals(startDateTime) && now.isBeforeOrEquals(endDateTime)) {
                availability.setStatus("available");
                updateList.add(availability);
            } else if (now.isAfter(endDateTime)) {
                availability.setStatus("Expired");
                updateList.add(availability);
            }

        }

        if (updateList.size() > 0) {
            log.info("The scheduled task is updating the availability status...");
        }
        availabilityService.updateBatchById(updateList);
        log.info("I am a scheduled task, and my task to update the availability status has ended.");
    }
}
