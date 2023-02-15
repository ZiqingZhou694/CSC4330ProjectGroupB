package com.pojo;

import lombok.Data;

import java.sql.Time;
import java.util.Date;

@Data
public class TimeSlot {
    private Date date;
    private Time time;
}
