package com.resource.vo;

public class User {

	private int user_id;	//用户id,账号
	private String user_name;	//用户姓名
	private String user_password;	//用户密码
	private String user_identity;	//用户身份
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String userPassword) {
		user_password = userPassword;
	}
	public String getUser_identity() {
		return user_identity;
	}
	public void setUser_identity(String userIdentity) {
		user_identity = userIdentity;
	}
	
}
