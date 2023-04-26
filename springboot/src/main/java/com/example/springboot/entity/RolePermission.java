package com.example.springboot.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@TableName("sys_role_permission")
@Data
public class RolePermission {

    @TableId(type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("role id")
    @Alias("role id")
    private Integer roleId;

    @ApiModelProperty("permission id")
    @Alias("permission id")
    private Integer permissionId;
}
