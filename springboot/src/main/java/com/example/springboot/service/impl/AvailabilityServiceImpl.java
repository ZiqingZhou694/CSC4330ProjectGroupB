package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Availability;
import com.example.springboot.mapper.AvailabilityMapper;
import com.example.springboot.service.IAvailabilityService;
import org.springframework.stereotype.Service;

@Service
public class AvailabilityServiceImpl extends ServiceImpl<AvailabilityMapper, Availability> implements IAvailabilityService {

}
