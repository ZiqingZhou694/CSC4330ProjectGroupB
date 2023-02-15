package com.controller;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pojo.*;
import com.service.AdminService;
import com.service.StudentService;
import com.service.TutorService;
import com.util.JwtHelper;
import com.util.Result;
import com.util.ResultCodeEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "System Control")
@RestController
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TutorService tutorService;

//    @ApiOperation("更新用户密码的处理器")
//    @PostMapping("/updatePwd/{oldPwd}/{newPwd}")
//    public Result updatePwd(
//            @ApiParam("token口令") @RequestHeader("token") String token,
//            @ApiParam("旧密码") @PathVariable("oldPwd") String oldPwd,
//            @ApiParam("新密码") @PathVariable("newPwd") String newPwd
//    ){
//        boolean expiration = JwtHelper.isExpiration(token);
//        if (expiration) {
//            // token过期
//            return Result.fail().message("token失效,请重新登录后修改密码");
//        }
//        // 获取用户ID和用类型
//        Long userId = JwtHelper.getUserId(token);
//        Integer userType = JwtHelper.getUserType(token);
//
//        oldPwd= MD5.encrypt(oldPwd);
//        newPwd= MD5.encrypt(newPwd);
//
//        switch (userType) {
//            case 1:
//                QueryWrapper<Admin> queryWrapper1=new QueryWrapper<>();
//                queryWrapper1.eq("id",userId.intValue());
//                queryWrapper1.eq("password",oldPwd);
//                Admin admin =adminService.getOne(queryWrapper1);
//                if (admin != null){
//                    // 修改
//                    admin.setPassword(newPwd);
//                    adminService.saveOrUpdate(admin);
//                }else{
//                    return Result.fail().message("原密码有误!");
//                }
//                break;
//
//            case 2:
//                QueryWrapper<Student> queryWrapper2=new QueryWrapper<>();
//                queryWrapper2.eq("id",userId.intValue());
//                queryWrapper2.eq("password",oldPwd);
//                Student student =studentService.getOne(queryWrapper2);
//                if (student != null){
//                    // 修改
//                    student.setPassword(newPwd);
//                    studentService.saveOrUpdate(student);
//                }else{
//                    return Result.fail().message("原密码有误!");
//                }
//                break;
//            case 3:
//                QueryWrapper<Teacher> queryWrapper3=new QueryWrapper<>();
//                queryWrapper3.eq("id",userId.intValue());
//                queryWrapper3.eq("password",oldPwd);
//                Teacher teacher =teacherService.getOne(queryWrapper3);
//                if (teacher != null){
//                    // 修改
//                    teacher.setPassword(newPwd);
//                    teacherService.saveOrUpdate(teacher);
//                }else{
//                    return Result.fail().message("原密码有误!");
//                }
//                break;
//
//        }
//        return Result.ok();
//    }


    @ApiOperation("通过token口令获取当前登录的用户信息的方法/use token to get the login info")
    @GetMapping("/getInfo")
    public Result getInfoByToken(
            @ApiParam("token口令")@RequestHeader("token") String token){
        boolean expiration = JwtHelper.isExpiration(token);
        if (expiration) {
            return Result.build(null, ResultCodeEnum.TOKEN_ERROR);
        }
        //从token中解析出 用户id 和用户的类型
        Long userId = JwtHelper.getUserId(token);
        Integer userType = JwtHelper.getUserType(token);


        Map<String,Object> map =new LinkedHashMap<>();
        switch (userType){
            case 1:
                Admin admin =adminService.getAdminById(userId);
                map.put("userType",1);
                map.put("user",admin);
                break;
            case 2:
                Student student =studentService.getStudentById(userId);
                map.put("userType",2);
                map.put("user",student);
                break;
            case 3:
                Tutor tutor= tutorService.getTutorById(userId);
                map.put("userType",3);
                map.put("user",tutor);
                break;
        }
        return Result.ok(map);
    }


    @RequestMapping("/login")
//    @SaCheckLogin
    public Result login(LoginForm loginForm){
        // 准备一个map用户存放响应的数据
        Map<String,Object> map=new LinkedHashMap<>();
        switch (loginForm.getUserType()){
            case 1:
                try {
                    Admin admin=adminService.login(loginForm);
                    if (null != admin) {
                        // 用户的类型和用户id转换成一个密文,以token的名称向客户端反馈
                        map.put("token",JwtHelper.createToken(admin.getId().longValue(), 1));
                    }else{
                        throw new RuntimeException("用户名或者密码有误");
                    }
                    return Result.ok(map);
                } catch (RuntimeException e) {
                    e.printStackTrace();
                    return Result.fail().message(e.getMessage());
                }
            case 2:
                try {
                    Student student =studentService.login(loginForm);
                    if (null != student) {
                        // 用户的类型和用户id转换成一个密文,以token的名称向客户端反馈
                        map.put("token",JwtHelper.createToken(student.getId().longValue(), 2));
                    }else{
                        throw new RuntimeException("用户名或者密码有误");
                    }
                    return Result.ok(map);
                } catch (RuntimeException e) {
                    e.printStackTrace();
                    return Result.fail().message(e.getMessage());
                }
            case 3:
                try {
                    Tutor tutor =tutorService.login(loginForm);
                    if (null != tutor) {
                        // 用户的类型和用户id转换成一个密文,以token的名称向客户端反馈
                        map.put("token",JwtHelper.createToken(tutor.getId().longValue(), 3));
                    }else{
                        throw new RuntimeException("用户名或者密码有误");
                    }
                    return Result.ok(map);
                } catch (RuntimeException e) {
                    e.printStackTrace();
                    return Result.fail().message(e.getMessage());
                }
        }
        return Result.fail().message("查无此用户");

    }

    @RequestMapping("/signUp")
    public Map<String, Object> signUp(Student student) {
        return studentService.signUp(student);

    }


//    @SaCheckLogin
//    public Result signUp(@ApiParam("登录提交信息的form表单") SignupForm signupForm) {
//        if(signupForm ==null){
//            return Result.fail("Required request boby is missing");
//        }
//        Map<String, Object> map = new LinkedHashMap<>();
//        switch (signupForm.getUserType()){
//            case 1:
//                try {
//                    Student student=studentService.signUp(signupForm);
//
//                    if (null == student) {
//                        map.put("code", 200);
////                        // 用户的类型和用户id转换成一个密文,以token的名称向客户端反馈
////                        map.put("token",JwtHelper.createToken(student.getId().longValue(), 1));
//                    }else{
//                        throw new RuntimeException("用户已存在");
//                    }
//                    return Result.ok(map);
//                } catch (RuntimeException e) {
//                    e.printStackTrace();
//                    return Result.fail().message(e.getMessage());
//                }
//            case 2:
//                try {
//                    Tutor tutor =tutorService.signUp(signupForm);
//                    if (null == tutor) {
//                        map.put("code", 200);
////                        // 用户的类型和用户id转换成一个密文,以token的名称向客户端反馈
////                        map.put("token",JwtHelper.createToken(tutor.getId().longValue(), 2));
//                    }else{
//                        throw new RuntimeException("用户已存在");
//                    }
//                    return Result.ok(map);
//                } catch (RuntimeException e) {
//                    e.printStackTrace();
//                    return Result.fail().message(e.getMessage());
//                }
//        }
//
//        return Result.fail().message("1");
//    }
}
