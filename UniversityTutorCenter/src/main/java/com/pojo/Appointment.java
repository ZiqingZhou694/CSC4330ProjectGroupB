package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDate;

@Data
@TableName("appointment")
public class Appointment {
    @TableId(value = "appointment_id", type = IdType.AUTO)
    private Integer id;
    private Integer studentId;
    private Integer tutorId;
    private String startTime;
    private String endTime;
    private AppointmentStatus status;
}
