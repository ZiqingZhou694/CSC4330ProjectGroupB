package com.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pojo.Admin;
import com.pojo.LoginForm;

public interface AdminService extends IService<Admin> {
    Admin login(LoginForm loginForm);


    Admin getAdminById(Long userId);

    IPage<Admin> getAdminsByOpr(Page<Admin> pageParam, String adminName);


}