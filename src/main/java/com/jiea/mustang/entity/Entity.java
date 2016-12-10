package com.jiea.mustang.entity;

import java.util.Date;

public class Entity {

	protected Integer id;

	protected Date createTime;

	protected Integer creator;

	protected Date operateTime;

	protected Integer operator;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getCreator() {
		return creator;
	}

	public void setCreator(Integer creator) {
		this.creator = creator;
	}

	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	public Integer getOperator() {
		return operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

}
