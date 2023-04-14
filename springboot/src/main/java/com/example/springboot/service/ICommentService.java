package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.Comment;

import java.util.List;

public interface ICommentService extends IService<Comment> {

    List<Comment> findByForeignId(Integer foreignId);
}
