package com.resource.vo;

public class Reply {
	private int reply_id;	//�ظ�id
	private String reply_content;	//�ظ�����
	private String reply_time;	//�ظ�ʱ��
	private int user_id;//�ظ���-�û�id
	private String user_name;
	private int message_id;//��Ӧ����������-����id
	
	

	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int replyId) {
		reply_id = replyId;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String replyContent) {
		reply_content = replyContent;
	}
	public String getReply_time() {
		return reply_time;
	}
	public void setReply_time(String replyTime) {
		reply_time = replyTime;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int messageId) {
		message_id = messageId;
	}

}
