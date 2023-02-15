package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/login")
//    @SaCheckLogin
    public String login(){
        return "Login";
    }

    @RequestMapping("/sign")
//    @SaCheckLogin
    public String signup(){
        return "Sign";
    }
}
