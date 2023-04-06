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
@ApiModel(value = "Availability", description = "")
public class Availability implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // tutor name
    @ApiModelProperty("tutor name")
    @Alias("tutor name")
    private String name;

    // subject
    @ApiModelProperty("subject")
    @Alias("subject")
    private String subject;

    // start time
    @ApiModelProperty("start time")
    @Alias("start time")
    private String startTime;

    // end time
    @ApiModelProperty("end time")
    @Alias("end time")
    private String endTime;

    // tutor id
    @ApiModelProperty("tutor id")
    @Alias("tutor id")
    private Integer tutorId;

    // online meeting link
    @ApiModelProperty("online meeting link")
    @Alias("online meeting link")
    private String virtualLink;

    // delete logic
    @ApiModelProperty("delete logic")
    @Alias("delete logic")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;

    @ApiModelProperty("date")
    @Alias("date")
    private String date;

    @ApiModelProperty("status")
    @Alias("status")
    private String status;
}