package com.resource.vo;

public class History {
	private int history_id;	//�û�-��ʷ��¼id
	private String history_content;	//����
	private String history_time;	//����ʱ��
	private int file_id;//������-�ļ�id
	private String file_display_name;	//�ļ���-��ҳ����ʾ
	private int user_id;//������-�û�id

	public int getHistory_id() {
		return history_id;
	}
	public void setHistory_id(int historyId) {
		history_id = historyId;
	}
	public String getHistory_content() {
		return history_content;
	}
	public void setHistory_content(String historyContent) {
		history_content = historyContent;
	}
	public String getHistory_time() {
		return history_time;
	}
	public void setHistory_time(String historyTime) {
		history_time = historyTime;
	}
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}

	

}
