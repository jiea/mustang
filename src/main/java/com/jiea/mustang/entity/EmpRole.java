package com.jiea.mustang.entity;

import java.util.Date;

public class EmpRole extends Entity {

	private Integer roleId;

	private Integer empId;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public EmpRole() {
	}

	public EmpRole(Integer empId, Date createTime, Integer creator) {
		this.empId = empId;
		this.createTime = createTime;
		this.creator = creator;
	}
}