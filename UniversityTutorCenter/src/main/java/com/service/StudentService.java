package com.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pojo.LoginForm;
import com.pojo.Student;

import java.util.List;
import java.util.Map;

public interface StudentService extends IService<Student>{
    Map<String, Object> signUp(Student student);

    Student login(LoginForm loginForm);

    Student getStudentById(Long userId);

    IPage<Student> getStudentByOpr(Page<Student> pageParam, Student student);


//    List<Appointment> getAppointments(String studentId);
//    void scheduleAppointment(Appointment appointment);
}






