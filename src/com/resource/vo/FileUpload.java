package com.resource.vo;

public class FileUpload {
	private int file_id;	//文件id
	private String file_display_name;	//�ļ���-��ҳ����ʾ
	private String file_hide_name;	//�ļ���-�ļ���ʵ��
	private String file_type;	//�ļ���ʽ
	private int file_size;//�ļ���С
	private int file_down_num;//���ش���
	private String file_uptime;	//�ϴ�ʱ��
	private String file_introduce;	//�ļ����
	private int user_id;//�ϴ���-��ʦid

	private int ccgc_id;
	private int picture_id;//ͼƬid
	
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
	public String getFile_hide_name() {
		return file_hide_name;
	}
	public void setFile_hide_name(String fileHideName) {
		file_hide_name = fileHideName;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String fileType) {
		file_type = fileType;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int fileSize) {
		file_size = fileSize;
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public int getCcgc_id() {
		return ccgc_id;
	}
	public void setCcgc_id(int ccgcId) {
		ccgc_id = ccgcId;
	}
	public int getPicture_id() {
		return picture_id;
	}
	public void setPicture_id(int pictureId) {
		picture_id = pictureId;
	}

}
