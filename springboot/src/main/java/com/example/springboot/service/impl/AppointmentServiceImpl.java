package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Appointment;
import com.example.springboot.mapper.AppointmentMapper;
import com.example.springboot.service.IAppointmentService;
import org.springframework.stereotype.Service;


@Service
public class AppointmentServiceImpl extends ServiceImpl<AppointmentMapper, Appointment> implements IAppointmentService {

}
