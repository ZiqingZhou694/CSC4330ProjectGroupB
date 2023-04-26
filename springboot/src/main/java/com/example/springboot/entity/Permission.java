package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import cn.hutool.core.annotation.Alias;
import com.example.springboot.common.LDTConfig;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_permission")
@ApiModel(value = "Permission", description = "")
public class Permission implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("name")
    @Alias("name")
    private String name;

    @ApiModelProperty("path")
    @Alias("path")
    private String path;

    @ApiModelProperty("order")
    @Alias("order")
    private Integer orders;

    @ApiModelProperty("icon")
    @Alias("icon")
    private String icon;

    @ApiModelProperty("page")
    @Alias("page")
    private String page;

    @ApiModelProperty("auth")
    @Alias("auth")
    private String auth;

    @ApiModelProperty("pid")
    @Alias("pid")
    private Integer pid;

    @ApiModelProperty("type")
    @Alias("type")
    private Integer type;

    @ApiModelProperty("delete logic")
    @Alias("delete logic")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;

    @ApiModelProperty("create date")
    @Alias("create date")
    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime createTime;

    @ApiModelProperty("update time")
    @Alias("update time")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime updateTime;

    @TableField(exist = false)
    private List<Permission> children;

    @ApiModelProperty("hide")
    @Alias("hide")
    private Boolean hide;
}