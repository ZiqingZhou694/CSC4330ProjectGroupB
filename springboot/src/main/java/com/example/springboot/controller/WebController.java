package com.example.springboot.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.example.springboot.common.Result;
import com.example.springboot.controller.domain.LoginDTO;
import com.example.springboot.controller.domain.UserRequest;
import com.example.springboot.entity.User;
import com.example.springboot.service.IUserService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@Slf4j
public class WebController {

    @Resource
    IUserService userService;

    @GetMapping(value = "/")
//    @ApiOperation(value = "Version verification interface")
//    don't know why need this, but it is in the tutorial I learn. might not need or will change this
    public String version() {
        String ver = "user-appointment-0.0.1-SNAPSHOT";  // make up version
        Package aPackage = WebController.class.getPackage();
        String title = aPackage.getImplementationTitle();
        String version = aPackage.getImplementationVersion();
        if (title != null && version != null) {
            ver = String.join("-", title, version);
        }
        return ver;
    }

    @PostMapping("/login")
    public Result login(@RequestBody UserRequest user) {
        long startTime = System.currentTimeMillis();
        LoginDTO res = userService.login(user);
        log.info("Login times {}ms", System.currentTimeMillis() - startTime);
        return Result.success(res);
    }

    @GetMapping("/logout/{uid}")
    public Result logout(@PathVariable String uid) {
        userService.logout(uid);
        return Result.success();
    }

    @PostMapping("/register")
    public Result register(@RequestBody UserRequest user) {
        userService.register(user);
        return Result.success();
    }

    @PostMapping("/password/reset")
    public Result passwordReset(@RequestBody UserRequest userRequest) {
        String newPass = userService.passwordReset(userRequest);
        return Result.success(newPass);
    }

    @PostMapping("/password/change")
    public Result passwordChange(@RequestBody UserRequest userRequest) {
        userService.passwordChange(userRequest);
        return Result.success();
    }

    @PutMapping("/updateUser")
    public Result updateUser(@RequestBody User user) {
        Object loginId = StpUtil.getLoginId();
        if (!loginId.equals(user.getUid())) {
            Result.error("NO PERMISSION");
        }
        userService.updateById(user);
        return Result.success(user);
    }

}
