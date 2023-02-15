package com.controller;

import com.pojo.Appointment;
import com.pojo.Student;
import com.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {
//    @Autowired
//    private StudentServiceImpl studentServiceImpl;
//
//    @PostMapping("/signup")
//    public ResponseEntity<String> signUp(@RequestBody Student student) {
//        studentServiceImpl.signUp(student);
//        return ResponseEntity.ok("Student registered successfully");
//    }
//
//    @GetMapping("/appointments")
//    public ResponseEntity<List<Appointment>> getAppointments(@RequestParam("studentId") String studentId) {
//        List<Appointment> appointments = studentServiceImpl.getAppointments(studentId);
//        return ResponseEntity.ok(appointments);
//    }
//
//    @PostMapping("/appointments")
//    public ResponseEntity<String> scheduleAppointment(@RequestBody Appointment appointment) {
//        studentServiceImpl.scheduleAppointment(appointment);
//        return ResponseEntity.ok("Appointment scheduled successfully");
//    }
}
