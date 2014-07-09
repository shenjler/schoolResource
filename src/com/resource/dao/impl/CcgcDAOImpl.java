package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.resource.dao.CcgcDAO;
import com.resource.dao.DbConn;
import com.resource.vo.Adhistory;
import com.resource.vo.Admin;
import com.resource.vo.Ccgc;

public class CcgcDAOImpl extends DbConn implements CcgcDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	//可改
	public Ccgc queryCcgc(Ccgc ccgc) throws Exception {
		Ccgc c = null;
		sql = "SELECT ccgc.ccgc_id FROM ccgc ,class ,college ,course ,grade" +
		" WHERE grade.grade_name =? AND college.college_name =? AND course.course_name = ? " +
		"AND class.class_name=? AND ccgc.grade_id = grade.grade_id AND  ccgc.class_id= class.class_id " +
		"AND ccgc.course_id = course.course_id AND ccgc.college_id=college.college_id";
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,ccgc.getGrade_name() );
			pstmt.setString(2, ccgc.getCollege_name());
			pstmt.setString(3, ccgc.getCourse_name());
			pstmt.setString(4, ccgc.getClass_name());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				c = new Ccgc();
				c.setCcgc_id(rs.getInt("ccgc_id"));
			}
		} catch (Exception e) {
			throw new Exception("出错！");
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return c;
	}
	
	//根据学院名找到对应的学院id
	public String queryCollegeName(int college_id) throws Exception{
		sql="SELECT college_name FROM college WHERE college_id = ?";
		String college_name=null;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,college_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				college_name=rs.getString(1);
			}
		} catch (Exception e) {		
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return college_name;
	}
	
	public String queryCourseName(int course_id) throws Exception{
		sql="SELECT course_name FROM course WHERE course_id = ?";
		String course_name=null;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,course_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				course_name=rs.getString(1);
			}
		} catch (Exception e) {		
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return course_name;
		
	}
	//根据学院找到对应的年级
	public List<Ccgc> queryGrade(int college_id) throws Exception{
		
		List<Ccgc> all = new ArrayList<Ccgc>();
		sql = "SELECT grade.grade_id,grade_name FROM ccgc ,grade ,college " +
		"WHERE college.college_id=? AND college.college_id = ccgc.college_id " +
		"GROUP BY grade.grade_id ORDER BY grade.grade_id ASC";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,college_id);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			//vo
			Ccgc c = new Ccgc();
			c.setGrade_id(rs.getInt(1));
			c.setGrade_name(rs.getString(2));
			all.add(c);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// close
			this.closeAll(conn,pstmt,rs);	
		}
		return all;

	}
	
	//根据学院、年级找到对应的班级
	public List<Ccgc> queryClass(int college_id,int grade_id) throws Exception{
		List<Ccgc> all = new ArrayList<Ccgc>();
		sql = "SELECT class.class_id,class_name FROM ccgc ,grade ,college ,class" +
		" WHERE ccgc.college_id =? AND ccgc.grade_id =? AND ccgc.class_id=class.class_id " +
		"AND ccgc.grade_id=grade.grade_id AND ccgc.college_id=college.college_id GROUP BY ccgc.class_id";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,college_id);
		pstmt.setInt(2,grade_id);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			//vo
			Ccgc c = new Ccgc();
			c.setClass_id(rs.getInt("class.class_id"));
			c.setClass_name(rs.getString("class_name"));
			all.add(c);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// close
			this.closeAll(conn,pstmt,rs);	
		}
		return all;

	}
	
	//根据学院学院、年级、班级找到对应的课程
	public List<Ccgc> queryCourse(int college_id,int grade_id,int class_id) throws Exception{
		List<Ccgc> all = new ArrayList<Ccgc>();
		sql = "SELECT ccgc_id,course.course_id,course.course_name " +
		"FROM ccgc ,grade ,college ,class ,course WHERE ccgc.college_id = ? " +
		"AND ccgc.grade_id = ? AND ccgc.class_id = ? AND ccgc.class_id = class.class_id " +
		"AND ccgc.grade_id = grade.grade_id AND ccgc.college_id = college.college_id " +
		"AND ccgc.course_id = course.course_id GROUP BY ccgc.course_id";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,college_id);
		pstmt.setInt(2,grade_id);
		pstmt.setInt(3,class_id);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			//vo
			Ccgc c = new Ccgc();
			c.setCcgc_id(rs.getInt("ccgc_id"));
			c.setCourse_id(rs.getInt("course.course_id"));
			c.setCourse_name(rs.getString("course.course_name"));
			all.add(c);
		}
		} catch (Exception e) {
			throw new Exception("error!");
		} finally {
			// close
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}

}
