package com.example.springboot.exception;

import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.SaTokenException;
import cn.hutool.core.util.StrUtil;
import com.example.springboot.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DuplicateKeyException.class)
    public Result duplicateKeyException(DuplicateKeyException e) {
        log.error("Data addition error", e);
        return Result.error("500", "Data Duplicate");
    }

    @ExceptionHandler(value = NotPermissionException.class)
    public Result notPermissionException(NotPermissionException e) {
        log.error("Permission verification error", e);
        return Result.error("401", "No Permission");
    }

    @ExceptionHandler(value = SaTokenException.class)
    public Result notLoginException(SaTokenException e) {
        log.error("Permission verification error", e);
        return Result.error("401", "Please login");
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Result methodArgumentNotValidException(MethodArgumentNotValidException e) {
        String msg;
        try {
            msg = e.getBindingResult().getAllErrors().get(0).getDefaultMessage();
        } catch (Exception be) {
            msg = "";
        }
        log.warn("Parameter validation error", e);
        return Result.error(msg);
    }

    @ExceptionHandler(value = ServiceException.class)
    public Result serviceExceptionError(ServiceException e) {
        String code = e.getCode();
        if (StrUtil.isNotBlank(code)) {
            return Result.error(code, e.getMessage());
        }
        return Result.error(e.getMessage());
    }


    @ExceptionHandler(value = Exception.class)
    public Result exceptionError(Exception e) {
        log.error("Unknown error", e);
        return Result.error("Unknown error");
    }

}
