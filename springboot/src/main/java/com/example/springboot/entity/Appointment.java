package com.example.springboot.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@ApiModel(value = "Appointment", description = "")
public class Appointment implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // availability id
    @ApiModelProperty("availability id")
    @Alias("availability id")
    private Integer availabilityId;

    // tutor id
    @ApiModelProperty("tutor id")
    @Alias("tutor id")
    private Integer tutorId;

    // user id
    @ApiModelProperty("user id")
    @Alias("user id")
    private Integer userId;

    // appointment time
    @ApiModelProperty("appointment time")
    @Alias("appointment time")
    private String time;

    // pending
    @ApiModelProperty("pending")
    @Alias("pending")
    private String status;

    @ApiModelProperty("delete logic")
    @Alias("delete logic")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;
}