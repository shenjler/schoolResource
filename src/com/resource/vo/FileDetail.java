package com.resource.vo;

public class FileDetail extends Ccgc{
	private int file_id;	//�ļ�id
	private String file_display_name;
	private int file_down_num;
	private String file_uptime;	//�ϴ�ʱ��
	private String file_introduce;
	private String user_name;
	private String picture_url;
	
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int fileId) {
		file_id = fileId;
	}
	public String getFile_display_name() {
		return file_display_name;
	}
	public void setFile_display_name(String fileDisplayName) {
		file_display_name = fileDisplayName;
	}
	public int getFile_down_num() {
		return file_down_num;
	}
	public void setFile_down_num(int fileDownNum) {
		file_down_num = fileDownNum;
	}
	public String getFile_uptime() {
		return file_uptime;
	}
	public void setFile_uptime(String fileUptime) {
		file_uptime = fileUptime;
	}
	public String getFile_introduce() {
		return file_introduce;
	}
	public void setFile_introduce(String fileIntroduce) {
		file_introduce = fileIntroduce;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String pictureUrl) {
		picture_url = pictureUrl;
	}
	

}
