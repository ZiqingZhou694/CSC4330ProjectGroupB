package com.example.springboot.service.impl;

import cn.dev33.satoken.stp.StpInterface;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.User;
import com.example.springboot.service.IUserService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component    // Ensure that this class is scanned by SpringBoot to complete the custom permission validation extension for Sa-Token.
public class StpInterfaceImpl implements StpInterface {

    @Resource
    IUserService userService;


//     Return a collection of permission codes that an account possesses

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        User user = userService.getOne(new QueryWrapper<User>().eq("uid", loginId));
        String roleFlag = user.getRole();
        List<Permission> permissions = userService.getPermissions(roleFlag);
        return permissions.stream().map(Permission::getAuth).filter(StrUtil::isNotBlank)
                .collect(Collectors.toList());  // A collection of permissions as strings
        //  ["user.add", "user.edit"]
    }

//    Return a collection of role identifiers that an account possesses (permissions and roles can be checked separately)
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        User user = userService.getOne(new QueryWrapper<User>().eq("uid", loginId));
        String roleFlag = user.getRole();
        return StrUtil.isBlank(roleFlag) ? new ArrayList<>() : CollUtil.newArrayList(roleFlag);  // ["ADMIN"]
    }

}
