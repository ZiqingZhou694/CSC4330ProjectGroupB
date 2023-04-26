package com.example.springboot.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import nonapi.io.github.classgraph.json.Id;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@TableName("comment")
public class Comment {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("content")
    @Alias("content")
    private String content;

    @ApiModelProperty("username")
    @Alias("username")
    private String username;

    @ApiModelProperty("user Id")
    @Alias("user Id")
    private Integer userId;

    @ApiModelProperty("rate")
    @Alias("rate")
    private BigDecimal rate;

    @ApiModelProperty("foreign Id")
    @Alias("foreign Id")
    private Integer foreignId;

    @ApiModelProperty("pid")
    @Alias("pid")
    private Integer pid;

    @ApiModelProperty("target")
    @Alias("target")
    private String target;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createtime;

}
