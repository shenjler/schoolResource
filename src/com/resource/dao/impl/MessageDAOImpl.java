package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.resource.dao.DbConn;
import com.resource.dao.MessageDAO;
import com.resource.vo.History;
import com.resource.vo.Message;

public class MessageDAOImpl extends DbConn  implements MessageDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;

	public int addMessage(Message message) throws Exception {
		String time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		sql="INSERT INTO message (message_content,message_time,user_id,file_id) VALUES(?,?,?,?)";
		String[] getValue={message.getMessage_content(),time,""+message.getUser_id(),""+message.getFile_id()};
		return this.executeSQL(sql, getValue);
	}

	public List<Message> queryAll(int file_id) throws Exception {
		List<Message> all = new ArrayList<Message>();
		sql = "SELECT user_name,message_time,message_id,message_content FROM message ,user " +
		"WHERE file_id = ? AND message.user_id = user.user_id ORDER BY message_time ASC";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,file_id);
		
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			Message m= new Message();
			m.setUser_name(rs.getString("user_name"));
			m.setMessage_id(rs.getInt("message_id"));
			m.setMessage_content(rs.getString("message_content"));
			m.setMessage_time(rs.getString("message_time"));
			all.add(m);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}

}
