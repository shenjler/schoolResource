package com.resource.vo;

public class Admin {

	private int admin_id;	//管理员id,账号
	private String admin_name;	//管理员姓名
	private String admin_password;	//管理员密码
	
	
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int adminId) {
		admin_id = adminId;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String adminName) {
		admin_name = adminName;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String adminPassword) {
		admin_password = adminPassword;
	}
	
}
