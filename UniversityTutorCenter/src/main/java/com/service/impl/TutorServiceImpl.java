package com.service.impl;

import com.Mapper.TutorMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pojo.LoginForm;
import com.pojo.Tutor;
import com.service.TutorService;
import com.util.MD5;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

@Service("tutorService")
@Transactional
public class TutorServiceImpl extends ServiceImpl<TutorMapper, Tutor> implements TutorService {

    @Override
    public Tutor login(LoginForm loginForm) {
        QueryWrapper<Tutor> queryWrapper =new QueryWrapper<>();
        queryWrapper.eq("email",loginForm.getEmail());
        queryWrapper.eq("password", MD5.encrypt(loginForm.getPassword()));
        Tutor tutor = baseMapper.selectOne(queryWrapper);
        return tutor;
    }
    @Override
    public Tutor getTutorById(Long userId) {
        QueryWrapper<Tutor> queryWrapper=new QueryWrapper<Tutor>();
        queryWrapper.eq("id",userId);
        return baseMapper.selectOne(queryWrapper);
    }

    @Override
    public IPage<Tutor> getTutorsByOpr(Page<Tutor> paraParam, Tutor teacher) {
        QueryWrapper queryWrapper =new QueryWrapper();
        if (!StringUtils.isEmpty(teacher.getLastName())){
            queryWrapper.like("last_name",teacher.getLastName());
        }
        if (!StringUtils.isEmpty(teacher.getSubject())){
            queryWrapper.eq("subject",teacher.getSubject());
        }
        queryWrapper.orderByDesc("id");

        Page<Tutor> page = baseMapper.selectPage(paraParam, queryWrapper);
        return page;
    }


}
