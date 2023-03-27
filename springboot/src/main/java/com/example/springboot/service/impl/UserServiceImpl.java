package com.example.springboot.service.impl;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.common.Constants;
import com.example.springboot.controller.domain.LoginDTO;
import com.example.springboot.controller.domain.UserRequest;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.Role;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.IPermissionService;
import com.example.springboot.service.IRoleService;
import com.example.springboot.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    private static final long TIME_IN_MS5 = 5 * 60 * 1000;  // 5 minutes in Millisecond

    @Resource
    RolePermissionMapper rolePermissionMapper;

    @Resource
    IRoleService roleService;

    @Resource
    IPermissionService permissionService;

    @Override
    public LoginDTO login(UserRequest user) {
        User dbUser;
        try {
            dbUser = getOne(new UpdateWrapper<User>().eq("username", user.getUsername())
                    .or().eq("email", user.getUsername()));
        } catch (Exception e) {
            throw new RuntimeException("database error");
        }
        if (dbUser == null) {
            throw new ServiceException("user not found");
        }

        if (!BCrypt.checkpw(user.getPassword(), dbUser.getPassword())) {
            throw new ServiceException("username or password is wrong");
        }
        // Login
        StpUtil.login(dbUser.getUid());  // loginId
        StpUtil.getSession().set(Constants.LOGIN_USER_KEY, dbUser);
        String tokenValue = StpUtil.getTokenInfo().getTokenValue();
//        LoginDTO loginDTO = new LoginDTO(dbUser, tokenValue);

        // find the user's in tree (second levels).
        String flag = dbUser.getRole();
        List<Permission> all = getPermissions(flag);
        List<Permission> menus = getTreePermissions(all); // tree
        // page button for permission
        List<Permission> auths = all.stream().filter(permission -> permission.getType() == 3).collect(Collectors.toList());
        return LoginDTO.builder().user(dbUser).token(tokenValue).menus(menus).auths(auths).build();
    }

    public List<Permission> getPermissions(String roleFlag) {
        Role role = roleService.getOne(new QueryWrapper<Role>().eq("flag", roleFlag));
        List<RolePermission> rolePermissions = rolePermissionMapper.selectList(new QueryWrapper<RolePermission>().eq("role_id", role.getId()));
        List<Integer> permissionIds = rolePermissions.stream().map(RolePermission::getPermissionId).collect(Collectors.toList());
        List<Permission> permissionList = permissionService.list();
        List<Permission> all = new ArrayList<>();
        for (Integer permissionId : permissionIds) {
            permissionList.stream().filter(permission -> permission.getId().equals(permissionId)).findFirst()
                    .ifPresent(all::add);
        }
        return all;
    }

    @Override
    public void passwordChange(UserRequest userRequest) {
        // find user
        User dbUser = getOne(new UpdateWrapper<User>().eq("uid", userRequest.getUid()));
        if (dbUser == null) {
            throw new ServiceException("User not found");
        }
//        check the password
        boolean checkpw = BCrypt.checkpw(userRequest.getPassword(), dbUser.getPassword());
        if (!checkpw) {
            throw new ServiceException("incorrect password");
        }
        String newPass = userRequest.getNewPassword();
        dbUser.setPassword(BCrypt.hashpw(newPass));
        updateById(dbUser);   // set to the database
    }

    // get user in trees
    private List<Permission> getTreePermissions(List<Permission> all) {
        // tree level 1 to 2
        List<Permission> parentList = all.stream().filter(permission -> permission.getType() == 1
                || (permission.getType() == 2 && permission.getPid() == null)).collect(Collectors.toList());// type==1  or  pid = null
        for (Permission permission : parentList) {
            Integer pid = permission.getId();
            List<Permission> level2List = all.stream().filter(permission1 -> pid.equals(permission1.getPid())).collect(Collectors.toList());// level 2 list
            permission.setChildren(level2List);
        }
        return parentList.stream().sorted(Comparator.comparing(Permission::getOrders)).collect(Collectors.toList());  // order
    }

    @Override
    public void register(UserRequest user) {
        User saveUser = new User();
        BeanUtils.copyProperties(user, saveUser);   // Copy the attributes of the request data to the attributes for database storage
        saveUser.setRole("STUDENT");
        saveUser(saveUser);
    }

    @Override
    public String passwordReset(UserRequest userRequest) {
        String email = userRequest.getEmail();
        User dbUser = getOne(new UpdateWrapper<User>().eq("email", email));
        if (dbUser == null) {
            throw new ServiceException("User not found");
        }
        String newPass = "123"; //default password for new user
        dbUser.setPassword(BCrypt.hashpw(newPass));
        updateById(dbUser);
        return newPass;
    }

    @Override
    public void logout(String uid) {
        StpUtil.logout(uid);
        log.info("user{}logout success", uid);
    }


    public User saveUser(User user) {
        User dbUser = getOne(new UpdateWrapper<User>().eq("username", user.getUsername()));
        User dbUserEmail = getOne(new UpdateWrapper<User>().eq("email", user.getEmail()));
        if (dbUser != null) {
            throw new ServiceException("user exist");
        }
        if (dbUserEmail != null) {
            throw new ServiceException("this email already register");
        }

        if (StrUtil.isBlank(user.getPassword())) {
            user.setPassword("123");   // set default password
        }
        // Encrypt password
        user.setPassword(BCrypt.hashpw(user.getPassword()));  // BCrypt Encrypt
        // set uid
        user.setUid(IdUtil.fastSimpleUUID());
        try {
            save(user);
        } catch (Exception e) {
            throw new RuntimeException("register fail", e);
        }
        return user;
    }

}

