package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.persistence.Entity;


@Data
@TableName("admins")
public class Admin {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;

}
