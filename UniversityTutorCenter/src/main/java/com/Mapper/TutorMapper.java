package com.Mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Tutor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TutorMapper extends BaseMapper<Tutor> {


    Tutor insertTutor(QueryWrapper<Tutor> queryWrapper);
}
