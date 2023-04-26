package com.example.springboot.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Dict;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IDictService;

import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/dict")
public class DictController {

    @Resource
    private IDictService dictService;

    @PostMapping
    @CacheEvict(value="findIcons", allEntries=true)
    public Result save(@RequestBody Dict dict) {
        dictService.save(dict);
        return Result.success();
    }

    @PutMapping
    @CacheEvict(value="findIcons", allEntries=true)
    public Result update(@RequestBody Dict dict) {
        dictService.updateById(dict);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @CacheEvict(value="findIcons", allEntries=true)
    public Result delete(@PathVariable Integer id) {
        dictService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    @CacheEvict(value="findIcons", allEntries=true)
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        dictService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(dictService.list());
    }

    @GetMapping("/icons")
    public Result findByType() {
        return Result.success(dictService.findIcons());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(dictService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<Dict>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "code", name);
        return Result.success(dictService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}
