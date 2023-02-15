package com.service.impl;

import com.Mapper.StudentMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pojo.LoginForm;
import com.pojo.Student;
import com.service.StudentService;
import com.util.MD5;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

//    @Autowired
//    private AppointmentMapper appointmentMapper;

    @Override
    public Student login(LoginForm loginForm) {
        QueryWrapper<Student> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("email",loginForm.getEmail());
        queryWrapper.eq("password", MD5.encrypt(loginForm.getPassword()));

        Student student = baseMapper.selectOne(queryWrapper);


        return student;
    }

    @Override
    public Map<String, Object> signUp(Student student){

//        QueryWrapper<Student> queryWrapper=new QueryWrapper<>();
//        queryWrapper.eq("id",signupForm.getId());
//        queryWrapper.eq("firstName",signupForm.getFirstName());
//        queryWrapper.eq("lastName", signupForm.getLastName());
//        queryWrapper.eq("email",signupForm.getEmail());
//        queryWrapper.eq("password", MD5.encrypt(signupForm.getPassword()));
//
//        Student student = baseMapper.insertStudent(queryWrapper);
//        Student student = new Student();
        Map<String, Object> map = new HashMap<>();
        List<Student> studentList = baseMapper.selectStudentByEmail(student.getEmail());
        if(studentList.size() > 0 ){
            map.put("code", 400);
            map.put("message", "账号已存在");
            return map;
        }
        String md5PWD = MD5.encrypt(student.getPassword());
        student.setPassword(md5PWD);

        int result = baseMapper.insertStudent(student);
        if(result > 0){
            map.put("code", 200);
            map.put("message", "注册成功");
            return map;

        }else {
            map.put("code", 400);
            map.put("message", "注册失败");
//            return resultMap;
        }


        return map;
    }

    @Override
    public Student getStudentById(Long userId) {
        QueryWrapper<Student> queryWrapper=new QueryWrapper<Student>();
        queryWrapper.eq("id",userId);
        return baseMapper.selectOne(queryWrapper);
    }

    @Override
    public IPage<Student> getStudentByOpr(Page<Student> pageParam, Student student) {
        QueryWrapper<Student> studentQueryWrapper =new QueryWrapper<>();
        if(!StringUtils.isEmpty(student.getLastName())){
            studentQueryWrapper.like("last_name",student.getLastName());
        }
        studentQueryWrapper.orderByDesc("id");
        Page<Student> studentPage = baseMapper.selectPage(pageParam, studentQueryWrapper);
        return studentPage;
    }



//    @Override
//    public Map<String, Object> signUp(Student student) {
//        Map<String, Object> resultMap = new HashMap<>();
//        List<Student> userList = studentMapper.selectStudentByEmail(student.getEmail());
//        if (userList.size() > 0) {
//            resultMap.put("code", 400);
//            resultMap.put("message", "账号已存在");
//            return resultMap;
//        }
//
//        //the salt is use for encrypted the password
//        String salt = RandomUtil.randomString(6);
//        //encrypted
//        String md5Pwd = SecureUtil.md5(student.getPassword() + salt);
//        student.setSalt(salt);
//        student.setPassword(md5Pwd);
//
//        //add account
//        int result = studentMapper.insertStudent(student);
//        if (result > 0) {
//            resultMap.put("code", 200);
//            return resultMap;
//
//        } else {
//            resultMap.put("code", 201);
////            return resultMap;
//        }
//
//        return resultMap;
//    }

//    @Override
//    public List<Appointment> getAppointments(Integer studentId) {
//        return appointmentMapper.selectList(new QueryWrapper<Appointment>().eq("student_id", studentId));
//    }
//
//    @Override
//    public void scheduleAppointment(Appointment appointment) {
//        appointmentMapper.insert(appointment);
//    }
}
