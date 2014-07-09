package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.resource.dao.DbConn;
import com.resource.dao.HistoryDAO;
import com.resource.vo.Adhistory;
import com.resource.vo.History;

public class HistoryDAOImpl extends DbConn implements HistoryDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	public int addHistory(History history) throws Exception {
		String time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		sql="INSERT INTO history (history_content,history_time,user_id,file_id) VALUES(?,?,?,?)";
		String[] getValue={history.getHistory_content(),time,""+history.getUser_id(),""+history.getFile_id()};
		return this.executeSQL(sql, getValue);
	}

	public int deleteHistory(int history_id) throws Exception {
		sql = "DELETE FROM history WHERE history_id=?";
		String[] getValue = {history_id+"" };
		return this.executeSQL(sql, getValue);
	}

	public int findHistoryCount(int user_id) throws Exception {
		sql="SELECT count(*) FROM history WHERE user_id=?";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				allcount=rs.getInt(1);
			}
		} catch (Exception e) {		
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return allcount;
	}

	public List<History> queryAll(int currpage, int everpage, int user_id)
			throws Exception {
		List<History> all = new ArrayList<History>();
		sql = "SELECT history_id,history_content,history_time,file_display_name,file.file_id " +
		"FROM file,history WHERE history.file_id=file.file_id" +
		" AND history.user_id=? " +
		"ORDER BY history_time DESC LIMIT ?,?";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,user_id);
		pstmt.setInt(2,(currpage-1)*everpage);
		pstmt.setInt(3, everpage);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			History h= new History();
			h.setHistory_id(rs.getInt("history_id"));
			h.setHistory_content(rs.getString("history_content"));
			h.setHistory_time(rs.getDate("history_time").toString());
			h.setFile_id(rs.getInt("file.file_id"));
			h.setFile_display_name(rs.getString("file_display_name"));
			all.add(h);
		}
		} catch (Exception e) {
			throw new Exception("���������쳣");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}

}
