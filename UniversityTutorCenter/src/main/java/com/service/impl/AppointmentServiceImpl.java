package com.service.impl;

import com.Mapper.AppointmentMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pojo.Appointment;
import com.pojo.AppointmentStatus;
import com.pojo.TimeSlot;
import com.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {
//    @Autowired
//    private AppointmentMapper appointmentMapper;
//
//    @Override
//    public Appointment getAppointmentById(String appointmentId) {
//        return appointmentMapper.selectById(appointmentId);
//    }
//
//    @Override
//    public List<Appointment> getAppointmentsByStudentId(String studentId) {
//        return appointmentMapper.selectList(new QueryWrapper<Appointment>().eq("student_id", studentId));
//    }
//
//    @Override
//    public List<Appointment> getAppointmentsByTutorId(String tutorId) {
//        return appointmentMapper.selectList(new QueryWrapper<Appointment>().eq("tutor_id", tutorId));
//    }
//
//    @Override
//    public void createAppointment(String appointmentId, String studentId, String tutorId, LocalDate date, TimeSlot timeSlot) {
//        Appointment appointment = new Appointment();
//        appointment.setAppointmentId(appointmentId);
//        appointment.setStudentId(studentId);
//        appointment.setTutorId(tutorId);
//        appointment.setDate(date);
//        appointment.setTimeSlot(timeSlot);
//        appointment.setStatus(AppointmentStatus.REQUESTED);
//        appointmentMapper.insert(appointment);
//    }
//
//    @Override
//    public void updateAppointment(String appointmentId, String studentId, String tutorId, LocalDate date, TimeSlot timeSlot) {
//        Appointment appointment = new Appointment();
//        appointment.setAppointmentId(appointmentId);
//        appointment.setStudentId(studentId);
//        appointment.setTutorId(tutorId);
//        appointment.setDate(date);
//        appointment.setTimeSlot(timeSlot);
//        appointmentMapper.updateById(appointment);
//    }
//
//    @Override
//    public void deleteAppointment(String appointmentId) {
//        appointmentMapper.deleteById(appointmentId);
//    }
}
