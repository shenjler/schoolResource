package com.resource.vo;

public class Adhistory {
	private int adhistory_id;	//����Ա-��ʷ��¼id,�˺�
	private String adhistory_content;	//����
	private String adhistory_time;	//����ʱ��
	private int user_id;//��������-�û�id
	private String user_identity;	//�û����
	private int admin_id;//������-����Աid
	

	public int getAdhistory_id() {
		return adhistory_id;
	}
	public void setAdhistory_id(int adhistoryId) {
		adhistory_id = adhistoryId;
	}
	public String getAdhistory_content() {
		return adhistory_content;
	}
	public void setAdhistory_content(String adhistoryContent) {
		adhistory_content = adhistoryContent;
	}
	public String getAdhistory_time() {
		return adhistory_time;
	}
	public void setAdhistory_time(String adhistoryTime) {
		adhistory_time = adhistoryTime;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	
	public String getUser_identity() {
		return user_identity;
	}
	public void setUser_identity(String userIdentity) {
		user_identity = userIdentity;	}
	
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int adminId) {
		admin_id = adminId;
	}

}
