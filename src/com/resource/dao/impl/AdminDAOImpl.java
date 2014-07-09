package com.resource.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import com.resource.dao.DbConn;
import com.resource.dao.AdminDAO;
import com.resource.vo.Admin;

public class AdminDAOImpl extends DbConn implements AdminDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;

	//查询一个管理员、登录验证
	public Admin queryById(int admin_id) throws Exception {
		Admin admin = null;
		sql = "SELECT * FROM admin WHERE admin_id=?";
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, admin_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				admin = new Admin();
				admin.setAdmin_id(rs.getInt("admin_id"));
				admin.setAdmin_name(rs.getString("admin_name"));
				admin.setAdmin_password(rs.getString("admin_password"));
			}
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return admin;
	}

	public int updatePassword(Admin admin) throws Exception {
		String sql="UPDATE admin SET admin_password=? WHERE admin_id=?";
		String[] getValue={admin.getAdmin_password(),""+admin.getAdmin_id()};
		return this.executeSQL(sql, getValue);
	}
	
	//添加管理员账号
	public int addAdmin(Admin admin) throws Exception{
		sql="INSERT INTO admin (admin_id,admin_name,admin_password) VALUES(?,?,?)";
		String[] getValue={""+admin.getAdmin_id(),admin.getAdmin_name(),admin.getAdmin_password()};
		return this.executeSQL(sql, getValue);
	}
	

}
