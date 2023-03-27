package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.annotation.AutoLog;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IPermissionService;
import com.example.springboot.entity.Permission;

import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/permission")
public class PermissionController {

    @Resource
    private IPermissionService permissionService;

    @PostMapping
    @SaCheckPermission("permission.add")
    public Result save(@RequestBody Permission permission) {
        permissionService.save(permission);
        return Result.success();
    }

    @PutMapping
    @SaCheckPermission("permission.edit")
    public Result update(@RequestBody Permission permission) {
        permissionService.updateById(permission);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @SaCheckPermission("permission.delete")
    public Result delete(@PathVariable Integer id) {
        permissionService.deletePermission(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    @SaCheckPermission("permission.deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        for (Integer id : ids) {
            permissionService.deletePermission(id);
        }
        return Result.success();
    }

    @GetMapping("/tree")
    @SaCheckPermission("permission.list")
    public Result tree() {
        return Result.success(permissionService.tree().stream().sorted(Comparator.comparing(Permission::getOrders)).collect(Collectors.toList()));
    }

    @GetMapping
    @SaCheckPermission("permission.list")
    public Result findAll() {
        return Result.success(permissionService.list());
    }

    @GetMapping("/{id}")
    @SaCheckPermission("permission.list")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(permissionService.getById(id));
    }

    @GetMapping("/page")
    @SaCheckPermission("permission.list")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<Permission>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        return Result.success(permissionService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}
