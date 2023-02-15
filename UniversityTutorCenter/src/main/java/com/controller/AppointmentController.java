package com.controller;

import com.pojo.Appointment;
import com.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/appointment")
public class AppointmentController {
//    @Autowired
//    private AppointmentService appointmentService;
//
//    @GetMapping("/{appointmentId}")
//    public Appointment getAppointment(@PathVariable String appointmentId) {
//        return appointmentService.getAppointmentById(appointmentId);
//    }
//
//    @GetMapping("/student/{studentId}")
//    public List<Appointment> getAppointmentsByStudentId(@PathVariable String studentId) {
//        return appointmentService.getAppointmentsByStudentId(studentId);
//    }
//
//    @GetMapping("/tutor/{tutorId}")
//    public List<Appointment> getAppointmentsByTutorId(@PathVariable String tutorId) {
//        return appointmentService.getAppointmentsByTutorId(tutorId);
//    }
//
//    @PostMapping
//    public void createAppointment(@RequestBody Appointment appointment) {
//        appointmentService.createAppointment(appointment.getAppointmentId(), appointment.getStudentId(),
//                appointment.getTutorId(), appointment.getDate(), appointment.getTimeSlot());
//    }
//
//    @PutMapping("/{appointmentId}")
//    public void updateAppointment(@PathVariable String appointmentId, @RequestBody Appointment appointment) {
//        appointmentService.updateAppointment(appointmentId, appointment.getStudentId(),
//                appointment.getTutorId(), appointment.getDate(), appointment.getTimeSlot());
//    }
//
//    @DeleteMapping("/{appointmentId}")
//    public void deleteAppointment(@PathVariable String appointmentId) {
//        appointmentService.deleteAppointment(appointmentId);
//    }
}

