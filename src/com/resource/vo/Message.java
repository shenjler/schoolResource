package com.resource.vo;

public class Message {
	private int message_id;	//����id
	private String message_content;	//��������
	private String message_time;	//����ʱ��
	private int user_id;//������-�û�id
	private String user_name;
	private int file_id;//����λ��-�ļ�id
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int messageId) {
		message_id = messageId;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String messageContent) {
		message_content = messageContent;
	}
	public String getMessage_time() {
		return message_time;
	}
	public void setMessage_time(String messageTime) {
		message_time = messageTime;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int fileId) {
		file_id = fileId;
	}
	

	
}
