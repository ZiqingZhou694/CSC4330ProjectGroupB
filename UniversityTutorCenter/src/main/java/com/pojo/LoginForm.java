package com.pojo;

import lombok.Data;

@Data
public class LoginForm {

    private String email;
    private String password;
    private Integer userType;
//    private String salt;

}
