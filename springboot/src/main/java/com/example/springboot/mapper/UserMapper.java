package com.example.springboot.mapper;

import com.example.springboot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

public interface UserMapper extends BaseMapper<User> {

    int select1();

}
