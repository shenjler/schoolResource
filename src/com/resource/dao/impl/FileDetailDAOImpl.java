package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.resource.dao.DbConn;
import com.resource.dao.FileDetailDAO;
import com.resource.vo.Ccgc;
import com.resource.vo.FileDetail;

public class FileDetailDAOImpl extends DbConn implements FileDetailDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	public FileDetail queryByFileId(int file_id) throws Exception {
		FileDetail f = null;
		sql = "SELECT file_id,file_display_name,file_down_num,file_uptime,file_introduce,user_name," +
		"picture_url,course_name,college_name,college.college_id,grade_name FROM file ,user,picture ,ccgc ,course ,college ,grade " +
		"WHERE file.file_id = ? AND file.ccgc_id = ccgc.ccgc_id AND ccgc.course_id = course.course_id AND " +
		"ccgc.college_id = college.college_id AND ccgc.grade_id = grade.grade_id AND file.user_id = user.user_id " +
		"AND file.picture_id = picture.picture_id ";
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,file_id );
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				f = new FileDetail();
				f.setFile_id(rs.getInt("file_id"));
				f.setFile_display_name(rs.getString("file_display_name"));
				f.setFile_down_num(rs.getInt("file_down_num"));
				f.setFile_uptime(rs.getDate("file_uptime").toString());
				f.setFile_introduce(rs.getString("file_introduce"));
				f.setUser_name(rs.getString("user_name"));
				f.setPicture_url(rs.getString("picture_url"));
				f.setCourse_name(rs.getString("course_name"));
				f.setCollege_id(rs.getInt("college_id"));
				f.setCollege_name(rs.getString("college_name"));
				f.setGrade_name(rs.getString("grade_name"));
			}
		} catch (Exception e) {
			throw new Exception("出错！");
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return f;
	}

}
