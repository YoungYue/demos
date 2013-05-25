package com.demos.biz.domain;

public class Message {
	private boolean success = true;
	private String info;
	private Object obj;
	
	public void setSuccessIsTrue() {
		this.success = true;
	}
	
	public void setSuccessIsFalse() {
		this.success = false;
	}
	
	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
}
