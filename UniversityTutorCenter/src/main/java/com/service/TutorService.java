package com.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pojo.LoginForm;
import com.pojo.Tutor;


public interface TutorService extends IService<Tutor> {


    Tutor login(LoginForm loginForm);


    Tutor getTutorById(Long userId);

    IPage<Tutor> getTutorsByOpr(Page<Tutor> paraParam, Tutor teacher);


}
