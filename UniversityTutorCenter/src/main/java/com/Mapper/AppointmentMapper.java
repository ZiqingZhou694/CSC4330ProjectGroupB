package com.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Appointment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AppointmentMapper extends BaseMapper<Appointment> {
}
