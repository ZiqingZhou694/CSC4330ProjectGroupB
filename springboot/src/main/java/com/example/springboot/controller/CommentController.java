package com.example.springboot.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Comment;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.CommentMapper;
import com.example.springboot.service.ICommentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/comment")
public class CommentController {

    @Resource
    ICommentService commentService;

    @PostMapping
    public Result save(@RequestBody Comment comment){
        commentService.save(comment);
        return Result.success();
    }

    @GetMapping
    public Map<String, Object> list(@RequestParam Integer foreignId){
        Map<String, Object> map = new HashMap<>();

        List<Comment> comments = commentService.findByForeignId(foreignId);

        map.put("rate", BigDecimal.ZERO);
        map.put("comments", comments);
        List<Comment> commentList = comments.stream().filter(comment -> comment.getRate() != null).collect(Collectors.toList());
        commentList.stream().map(Comment::getRate).reduce(BigDecimal::add).ifPresent(res -> {
            map.put("rate", res.divide(BigDecimal.valueOf(commentList.size()), 1, RoundingMode.HALF_UP));
        });
        map.put("comments", comments);
        return  map;
    }
//
//    @GetMapping("/{id}")
////    @SaCheckPermission("user.list")
//    public Result findOne(@PathVariable Integer id) {
//        return Result.success(commentService.getById(id));
//    }


//    @GetMapping
//    public Result findByForeignId(@RequestParam Integer foreignId) {
//        Map<String, Object> map = new HashMap<>();
//
//        List<Comment> comments = commentService.findByForeignId(foreignId);
//
//        map.put("rate", BigDecimal.ZERO);
//        List<Comment> commentList = comments.stream().filter(comment -> comment.getRate() != null).collect(Collectors.toList());
//        commentList.stream().map(Comment::getRate).reduce(BigDecimal::add).ifPresent(res -> {
//            map.put("rate", res.divide(BigDecimal.valueOf(commentList.size()), 1, RoundingMode.HALF_UP));
//        });
//
//        map.put("comments", comments);
//
//        return Result.success(map);
//    }
}
