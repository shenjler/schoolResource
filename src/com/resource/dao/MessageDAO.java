package com.resource.dao;

import java.util.List;

import com.resource.vo.Message;

public interface MessageDAO {
	public List<Message> queryAll(int file_id) throws Exception ;// ͨ�
	public int addMessage(Message message) throws Exception; //
}
