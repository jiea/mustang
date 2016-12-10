package com.jiea.mustang.service.impl;

import com.jiea.mustang.dao.EmpRoleMapper;
import com.jiea.mustang.entity.EmpRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.service.EmpRoleService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("empRoleService")
public class EmpRoleServiceImpl implements EmpRoleService {

    @Autowired
    private EmpRoleMapper empRoleMapper;

    @Override
    public List<Integer> getRoleIdsByEmpId(Integer empId) {
        return empRoleMapper.getRoleIdsByEmpId(empId);
    }

    @Override
    public void empRoleRelation(Integer empId, String roleIds) {
        empRoleMapper.deleteByEmpId(empId);
        List<EmpRole> empRoles = new ArrayList<>();
        String[] roleIdArr = roleIds.split(",");
        for(String roleId : roleIdArr){
            EmpRole empRole = new EmpRole(empId, new Date(), 1);
            empRole.setRoleId(Integer.parseInt(roleId));
            empRoles.add(empRole);
        }
        empRoleMapper.insertBatch(empRoles);
    }
}
