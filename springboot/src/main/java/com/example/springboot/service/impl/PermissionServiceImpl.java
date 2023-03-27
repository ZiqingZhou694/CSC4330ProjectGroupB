package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.mapper.PermissionMapper;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.service.IPermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;



@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Resource
    RolePermissionMapper rolePermissionMapper;
    @Resource
    PermissionMapper permissionMapper;

    @Override
    public List<Permission> tree() {
        List<Permission> allData = list();

        return childrenTree(null, allData); // Recursively obtain the tree starting from the first level.
    }

    // deleted the permission
    @Override
    @Transactional
    public void deletePermission(Integer id) {
        // deleted the role_permission from database table
        rolePermissionMapper.delete(new UpdateWrapper<RolePermission>().eq("permission_id", id));
        removeById(id);



    }

    // Generate the tree
    private List<Permission> childrenTree(Integer pid, List<Permission> allData) {
        List<Permission> list = new ArrayList<>();
        for (Permission permission : allData) {
            if (Objects.equals(permission.getPid(), pid)) {  // null, first level
                list.add(permission);
                List<Permission> childrenTree = childrenTree(permission.getId(), allData);  // call, extracting second-level nodes, third-level, fourth-level, etc.
                permission.setChildren(childrenTree);
            }
        }
        return list;
    }
}
