package com.resource.dao;

import java.util.List;

import com.resource.vo.Reply;

public interface ReplyDAO {

	public List<Reply> queryAll(int message_id) throws Exception ;// ͨ�
	public int addReply(Reply message) throws Exception; //
}
