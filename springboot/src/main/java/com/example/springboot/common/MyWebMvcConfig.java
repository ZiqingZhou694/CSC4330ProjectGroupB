package com.example.springboot.common;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;


@Configuration
public class MyWebMvcConfig extends WebMvcConfigurationSupport {
    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns("/", "/login", "/register", "/email", "/password/reset", "/file/download/**", "/**/export")
                .excludePathPatterns("/swagger**/**", "/webjars/**", "/v3/**", "/doc.html", "/favicon.ico");
    }

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.
                addResourceHandler("/swagger-ui/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/springfox-swagger-ui/")
                .resourceChain(false);
    }

    @Override
    protected void addViewControllers(ViewControllerRegistry registry) {
        registry.addRedirectViewController("/swagger-ui/", "/swagger-ui/index.html");
    }
}

