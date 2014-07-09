package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.resource.dao.DbConn;
import com.resource.dao.ReplyDAO;
import com.resource.vo.Reply;

public class ReplyDAOImpl extends DbConn  implements ReplyDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null; 
	
	public int addReply(Reply message) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Reply> queryAll(int message_id) throws Exception {
		List<Reply> all = new ArrayList<Reply>();
		sql = "SELECT reply_content,reply_time,user_name FROM reply ,user " +
		"WHERE reply.message_id = ? AND reply.user_id = user.user_id ORDER BY reply_time ASC";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,message_id);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			Reply r= new Reply();
			
			r.setUser_name(rs.getString("user_name"));
			r.setReply_content(rs.getString("reply_content"));
			r.setReply_time(rs.getDate("reply_time").toString());
			all.add(r);
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
