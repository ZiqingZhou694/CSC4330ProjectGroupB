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
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.example.springboot.common.LDTConfig;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@TableName("sys_file")
@ApiModel(value = "File", description = "")
public class File implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @ApiModelProperty("File name")
    @Alias("File name")
    private String name;

    @ApiModelProperty("size")
    @Alias("size小")
    private Long size;

    @ApiModelProperty("type")
    @Alias("type")
    private String type;

    @ApiModelProperty("url")
    @Alias("url")
    private String url;

    @ApiModelProperty("File summary")
    @Alias("File summary")
    private String md5;

    @ApiModelProperty("location")
    @Alias("location")
    private String location;

    @ApiModelProperty("deleted")
    @Alias("deleted")
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
}