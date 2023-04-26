package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.annotation.AutoLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IFileService;
import com.example.springboot.entity.File;

import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/file")
@Slf4j
public class FileController {

    private static final String FILES_DIR = "/files/";

    @Value("${server.port:9090}")
    private String port;
    @Value("${file.download.ip:localhost}")
    private String downloadIp;

    @Resource
    private IFileService fileService;


    @PostMapping("/upload")
    public Result upload(MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String extName = FileUtil.extName(originalFilename);
        String uniFileFlag = IdUtil.fastSimpleUUID();
        String fileFullName = uniFileFlag + StrUtil.DOT + extName;

        String fileUploadPath = getFileUploadPath(fileFullName);
        long size = file.getSize();

        String name = file.getName();
        log.info("{}, {}, {}", originalFilename, size, name);
        String md5 = SecureUtil.md5(file.getInputStream());

        List<File> existFiles = fileService.list(new QueryWrapper<File>().eq("md5", md5));
        if (existFiles.size() > 0) {
            File existFile = existFiles.get(0);
            String location = existFile.getLocation();
            if (new java.io.File(location).exists()) {
                saveFile(originalFilename, size, md5, extName, existFile.getLocation(), existFile.getUrl());

                return Result.success(existFile.getUrl());
            }
        }
        try {
            java.io.File uploadFile = new java.io.File(fileUploadPath);
            java.io.File parentFile = uploadFile.getParentFile();
            if (!parentFile.exists()) {
                parentFile.mkdirs();
            }
            file.transferTo(uploadFile);
        } catch (Exception e) {
            log.error("file upload fail", e);
            return Result.error("file upload fail");
        }

        String url = "http://" + downloadIp + ":" + port + "/file/download/" + fileFullName;
        saveFile(originalFilename, size, md5, extName, fileUploadPath, url);

        if (existFiles.size() > 0) {
            for (File existFile : existFiles) {
                existFile.setUrl(url);
                existFile.setLocation(fileUploadPath);
                fileService.updateById(existFile);
            }
        }
        return Result.success(url);
    }

    @PostMapping("/uploadImg")
    public Dict uploadImg(MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String extName = FileUtil.extName(originalFilename);
        String uniFileFlag = IdUtil.fastSimpleUUID();
        String fileFullName = uniFileFlag + StrUtil.DOT + extName;

        String fileUploadPath = getFileUploadPath(fileFullName);

        long size = file.getSize();
        String name = file.getName();
        log.info("{}, {}, {}", originalFilename, size, name);
        String md5 = SecureUtil.md5(file.getInputStream());

        List<File> existFiles = fileService.list(new QueryWrapper<File>().eq("md5", md5));
        String url = "";
        if (existFiles.size() > 0) {
            File existFile = existFiles.get(0);
            String location = existFile.getLocation();
            if (new java.io.File(location).exists()) {
                saveFile(originalFilename, size, md5, extName, existFile.getLocation(), existFile.getUrl());

                url = existFile.getUrl();
            }
        } else {
            try {
                java.io.File uploadFile = new java.io.File(fileUploadPath);
                java.io.File parentFile = uploadFile.getParentFile();
                if (!parentFile.exists()) {
                    parentFile.mkdirs();
                }
                file.transferTo(uploadFile);
            } catch (Exception e) {
                log.error("file upload fail", e);
                return Dict.create().set("errno", 1);
            }

            url = "http://" + downloadIp + ":" + port + "/file/download/" + fileFullName;
            saveFile(originalFilename, size, md5, extName, fileUploadPath, url);
            if (existFiles.size() > 0) {
                for (File existFile : existFiles) {
                    existFile.setUrl(url);
                    existFile.setLocation(fileUploadPath);
                    fileService.updateById(existFile);
                }
            }
        }
        Dict dict = Dict.create().set("errno", 0).set("data", Dict.create().set("url", url));
        return dict;
    }

    private void saveFile(String name, long size, String md5, String type, String fileUploadPath, String url) {
        File savedFile = new File();
        savedFile.setName(name);
        savedFile.setSize(size);
        savedFile.setMd5(md5);
        savedFile.setType(type);
        savedFile.setLocation(fileUploadPath);
        savedFile.setUrl(url);
        fileService.save(savedFile);
    }

    @GetMapping("/download/{fileFullName}")
    public void downloadFile(@PathVariable String fileFullName,
                             HttpServletResponse response) throws IOException {
        String fileUploadPath = getFileUploadPath(fileFullName);
        byte[] bytes = FileUtil.readBytes(fileUploadPath);
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileFullName, "UTF-8"));
        OutputStream os = response.getOutputStream();
        os.write(bytes);
        os.flush();
        os.close();
    }


    private String getFileUploadPath(String fileFullName) {
        String uploadPath = System.getProperty("user.dir");
        return uploadPath + FILES_DIR + fileFullName;
    }

    @PostMapping
    @SaCheckPermission("file.add")
    public Result save(@RequestBody File file) {
        fileService.save(file);
        return Result.success();
    }

    @PutMapping
    @SaCheckPermission("file.edit")
    public Result update(@RequestBody File file) {
        fileService.updateById(file);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @SaCheckPermission("file.delete")
    public Result delete(@PathVariable Integer id) {
        fileService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    @SaCheckPermission("file.deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        fileService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    @SaCheckPermission("file.list")
    public Result findAll() {
        return Result.success(fileService.list());
    }

    @GetMapping("/{id}")
    @SaCheckPermission("file.list")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(fileService.getById(id));
    }

    @GetMapping("/page")
    @SaCheckPermission("file.list")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<File> queryWrapper = new QueryWrapper<File>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        return Result.success(fileService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/export")
    @SaCheckPermission("file.export")
    public void export(HttpServletResponse response) throws Exception {

        List<File> list = fileService.list();

        ExcelWriter writer = ExcelUtil.getWriter(true);

        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("File", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    @PostMapping("/import")
    @SaCheckPermission("file.import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        List<File> list = reader.readAll(File.class);

        fileService.saveBatch(list);
        return Result.success();
    }

}
