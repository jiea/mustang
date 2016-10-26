package com.jiea.mustang.vo;

public class Rtn<T> {

	private boolean success;

	private T data;

	private String code;

	private String msg;

	public Rtn(boolean success) {
		this.success = success;
	}

	public Rtn(boolean success, String msg) {
		this.success = success;
		this.msg = msg;
	}

	public Rtn(boolean success, T data) {
		this.success = success;
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
