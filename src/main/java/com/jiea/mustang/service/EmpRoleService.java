package com.jiea.mustang.service;

import java.util.List;

public interface EmpRoleService {

    /**
     * 通过员工主键获取对应的角色主键
     * @param empId 员工主键
     * @return  List<Integer>
     */
    List<Integer> getRoleIdsByEmpId(Integer empId);

    /**
     * 员工-角色 授权
     * @param empId     员工主键
     * @param roleIds   角色主键集合
     */
    void empRoleRelation(Integer empId, String roleIds);
}
