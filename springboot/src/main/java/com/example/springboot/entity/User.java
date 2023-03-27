package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
@TableName("sys_user")
@ApiModel(value = "User model", description = "")
public class User implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("username")
    @Alias("username")
    private String username;

    @ApiModelProperty("password")
    @Alias("password")
    private String password;

    @ApiModelProperty("first name")
    @Alias("first name")
    private String firstName;

    @ApiModelProperty("last name")
    @Alias("last name")
    private String lastName;

    @ApiModelProperty("email")
    @Alias("email")
    private String email;

    @ApiModelProperty("address")
    @Alias("address")
    private String address;

    @ApiModelProperty("uid")
    @Alias("uid")
    private String uid;

    @ApiModelProperty("avatar")
    @Alias("avatar")
    private String avatar;

    // delete logic 0 exist else not shown
    @ApiModelProperty("delete logic")
    @Alias("delete logic")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;

    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime updateTime;

    @ApiModelProperty("role")
    @Alias("role")
    private String role;
}