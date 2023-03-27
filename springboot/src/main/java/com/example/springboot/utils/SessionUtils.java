package com.example.springboot.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.example.springboot.common.Constants;
import com.example.springboot.entity.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionUtils {

    // might need this tool to get login user info, having don't have to write the code for session  in controller
    public static User getUser() {
        try {
            return (User) StpUtil.getSession().get(Constants.LOGIN_USER_KEY);
        } catch (Exception e) {
            log.error("get user info fail", e);
            return null;
        }
    }

}
