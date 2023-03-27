package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Role;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.service.IRoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/role")
@Slf4j
public class RoleController {

    @Resource
    private IRoleService roleService;

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @PostMapping
    @SaCheckPermission("role.add")
    public Result save(@RequestBody Role role) {
        roleService.save(role);
        roleService.savePermissions(role.getId(), role.getPermissionIds());
        return Result.success();
    }

    @PutMapping
    @SaCheckPermission("role.edit")
    public Result update(@RequestBody Role role) {
        roleService.updateById(role);
        roleService.savePermissions(role.getId(), role.getPermissionIds());
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @SaCheckPermission("role.delete")
    public Result delete(@PathVariable Integer id) {
        roleService.deleteRole(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    @SaCheckPermission("role.deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        roleService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    @SaCheckPermission("role.list")
    public Result findAll() {
        return Result.success(roleService.list());
    }

    @GetMapping("/{id}")
    @SaCheckPermission("role.list")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(roleService.getById(id));
    }

    @GetMapping("/page")
    @SaCheckPermission("role.list")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        Page<Role> page = roleService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<RolePermission> rolePermissions = rolePermissionMapper.selectList(null);
        page.getRecords().forEach(v -> {
            v.setPermissionIds(rolePermissions.stream().filter(rolePermission -> rolePermission.getRoleId().equals(v.getId()))
                    .map(RolePermission::getPermissionId).collect(Collectors.toList()));
        });
        return Result.success(page);
    }

}
