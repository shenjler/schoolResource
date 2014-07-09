package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.resource.dao.DbConn;
import com.resource.dao.FileUploadDAO;
import com.resource.vo.FileUpload;


public class FileUploadDAOImpl extends DbConn implements FileUploadDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	public int queryFileId() throws Exception {
		sql="SELECT MAX(file.file_id) FROM file";
		int file_id=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				file_id=rs.getInt(1);
			}
		} catch (Exception e) {		
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return file_id;
	}
	
	public int addFile(FileUpload fileUpload) throws Exception {
		String time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		sql="INSERT INTO file " +
		"(file_display_name,file_hide_name,file_type,file_size,file_down_num,file_uptime,file_introduce,user_id,ccgc_id,picture_id) " +
		"VALUES(?,?,?,?,default,?,?,?,?,?) ";
		String[] getValue={fileUpload.getFile_display_name(),fileUpload.getFile_hide_name(),fileUpload.getFile_type(),
				""+fileUpload.getFile_size(),time,fileUpload.getFile_introduce(),""+fileUpload.getUser_id(),
				""+fileUpload.getCcgc_id(),""+fileUpload.getPicture_id()};
		return this.executeSQL(sql, getValue);
	}
	public int deleteFile(int file_id) throws Exception {
		sql = "DELETE  FROM file WHERE file_id=?";
		String[] getValue = {file_id+"" };
		return this.executeSQL(sql, getValue);
	}

	//��ѯ���������ء�
	public List<FileUpload> queryByNum() throws Exception {
		List<FileUpload> all = new ArrayList<FileUpload>();
		sql = "SELECT file_id,file_display_name,file_down_num FROM file ORDER BY file_down_num DESC LIMIT 7";
		try {
		pstmt = this.getConn().prepareStatement(sql);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			FileUpload f = new FileUpload();
			f.setFile_id(rs.getInt("file_id"));
			f.setFile_display_name(rs.getString("file_display_name"));
			f.setFile_down_num(rs.getInt("file_down_num"));
			all.add(f);
		}
		} catch (Exception e) {
			throw new Exception("���������쳣");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}

	//��ѯ�������ϴ���
	public List<FileUpload> queryByTime() throws Exception {
		List<FileUpload> all = new ArrayList<FileUpload>();
		sql = "SELECT file_id,file_display_name,file_uptime FROM file ORDER BY file_uptime DESC LIMIT 7";
		try {
		pstmt = this.getConn().prepareStatement(sql);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// ����󣬽����ݸ�ֵ��student����
			FileUpload f = new FileUpload();
			f.setFile_id(rs.getInt("file_id"));
			f.setFile_display_name(rs.getString("file_display_name"));
			f.setFile_uptime(rs.getDate("file_uptime").toString());
			all.add(f);
		}
		} catch (Exception e) {
			throw new Exception("���������쳣");
		} finally {
			// �ر���ݿ�����
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}
	
	public FileUpload queryById(int file_id) throws Exception {
		FileUpload f = null;
		sql = "SELECT file_hide_name FROM file WHERE file_id = ?";
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, file_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				f = new FileUpload();
				f.setFile_hide_name(rs.getString("file_hide_name"));
			}
		} catch (Exception e) {
			throw new Exception("���������쳣");
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return f;
	}
	

}
