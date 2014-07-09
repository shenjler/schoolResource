package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.resource.dao.DbConn;
import com.resource.dao.FileSearchDAO;
import com.resource.vo.FileSearch;
import com.resource.vo.History;

public class FileSearchDAOImpl extends DbConn implements FileSearchDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	public int findCollegeFileCount(int college_id) throws Exception {
		sql="SELECT count(file.file_id) FROM ccgc,file WHERE college_id=? AND file.ccgc_id=ccgc.ccgc_id";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, college_id);
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
	
	public int findCourseFileCount(int college_id,int course_id) throws Exception {
		sql="SELECT count(file.file_id) FROM ccgc,file WHERE college_id=? AND course_id=? AND file.ccgc_id=ccgc.ccgc_id";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, college_id);
			pstmt.setInt(2, course_id);
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

	public List<FileSearch> queryByCollege(int currpage, int everpage,
			int college_id) throws Exception {
		List<FileSearch> all = new ArrayList<FileSearch>();
		sql = "SELECT file_display_name,college_name,course_name,file_id " +
		"FROM file ,college ,course ,ccgc WHERE college.college_id =? " +
		"AND ccgc.college_id = college.college_id AND ccgc.course_id = course.course_id " +
		"AND ccgc.ccgc_id = file.ccgc_id ORDER BY file.file_uptime DESC LIMIT ?,?";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,college_id);
		pstmt.setInt(2,(currpage-1)*everpage);
		pstmt.setInt(3, everpage);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			FileSearch fs= new FileSearch();
			fs.setFile_id(rs.getInt("file_id"));
			fs.setFile_display_name(rs.getString("file_display_name"));
			fs.setCollege_name(rs.getString("college_name"));
			fs.setCourse_name(rs.getString("course_name"));
			all.add(fs);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}

	public List<FileSearch> queryByCourse(int currpage,int everpage,int college_id,int course_id) throws Exception {
		List<FileSearch> all = new ArrayList<FileSearch>();
		sql = "SELECT file_display_name,college_name,course_name,file_id " +
		"FROM file ,college ,course ,ccgc WHERE college.college_id =?  AND course.course_id=? " +
		"AND ccgc.college_id = college.college_id AND ccgc.course_id = course.course_id " +
		"AND ccgc.ccgc_id = file.ccgc_id ORDER BY file.file_uptime DESC LIMIT ?,?";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,college_id);
		pstmt.setInt(2,course_id);
		pstmt.setInt(3,(currpage-1)*everpage);
		pstmt.setInt(4, everpage);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			FileSearch fs= new FileSearch();
			fs.setFile_id(rs.getInt("file_id"));
			fs.setFile_display_name(rs.getString("file_display_name"));
			fs.setCollege_name(rs.getString("college_name"));
			fs.setCourse_name(rs.getString("course_name"));
			all.add(fs);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}
	
	public List<FileSearch> queryByLike(int currpage,int everpage,String search) throws Exception{
		List<FileSearch> all = new ArrayList<FileSearch>();
		sql = "SELECT file_id,file_display_name,college_name,course_name " +
		"FROM file ,college ,course ,ccgc WHERE file_display_name LIKE ? " +
		"OR college_name LIKE ? OR course_name LIKE ?  " +
		"AND file.ccgc_id = ccgc.ccgc_id AND ccgc.college_id = college.college_id " +
		"AND ccgc.course_id = course.course_id GROUP BY file_id ORDER BY file.file_uptime DESC LIMIT ?,? ";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setString(1, "%"+search+"%");
		pstmt.setString(2, "%"+search+"%");
		pstmt.setString(3, "%"+search+"%");
		pstmt.setInt(4,(currpage-1)*everpage);
		pstmt.setInt(5, everpage);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// vo
			FileSearch fs= new FileSearch();
			fs.setFile_id(rs.getInt("file_id"));
			fs.setFile_display_name(rs.getString("file_display_name"));
			fs.setCollege_name(rs.getString("college_name"));
			fs.setCourse_name(rs.getString("course_name"));
			all.add(fs);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}
	
	public int findFileSearchCount(String search) throws Exception {
		sql= "SELECT COUNT(file_id) " +
		"FROM file ,college ,course ,ccgc WHERE file.file_display_name LIKE ? " +
		"AND file.ccgc_id = ccgc.ccgc_id AND ccgc.college_id = college.college_id " +
		"AND ccgc.course_id = course.course_id ";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			
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
	
	
}
