package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.resource.dao.UserDAO;
import com.resource.vo.Adhistory;
import com.resource.vo.User;
import com.resource.dao.DbConn;

public class UserDAOImpl extends DbConn implements UserDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	//����û��˺�
	public int addUser(User user) throws Exception{
		sql="INSERT INTO user (user_id,user_name,user_password,user_identity) VALUES(?,?,?,?)";
		String[] getValue={""+user.getUser_id(),user.getUser_name(),user.getUser_password(),user.getUser_identity()};
		return this.executeSQL(sql, getValue);
	}
	
	//ɾ���û��˺�
	public int deleteUser(int user_id) throws Exception {
		sql = "DELETE  FROM user WHERE user_id=?";
		String[] getValue = {user_id+"" };
		return this.executeSQL(sql, getValue);
	}
	
	//�޸�����
	public int updatePassword(User user) throws Exception{
		
		String sql="UPDATE user SET user_password=? WHERE user_id=?";
		String[] getValue={user.getUser_password(),""+user.getUser_id()};
		return this.executeSQL(sql, getValue);
	}
	
	//��identity�����û��˺�����
	public int findUserCount(String user_identity) throws Exception {
		sql="SELECT count(user_id) FROM user WHERE user_identity=? ";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_identity);
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

	//��id��ѯ
	public User queryById(int user_id) throws Exception{
		sql="SELECT * FROM user WHERE user_id=? ";
		User user=null;
		try {
			// ������ݿ�
			conn=this.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,user_id);
			rs=pstmt.executeQuery();  //ִ��SQL���
			if(rs.next()) {
				// ����󣬽����ݸ�ֵ��user����
				user= new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));	
				user.setUser_identity(rs.getString("user_identity"));
			}
		} catch (Exception e) {
			throw new Exception("���������쳣");
		} finally{
			closeAll(conn,pstmt,null);
		}
		return user;
	}
	
	//��id,identity��ѯ,�û���¼
	public User queryByIdIdentity(int user_id,String user_identity) throws Exception{
		User user=null;
		sql="SELECT * FROM user WHERE user_id=? AND user_identity=?";
		try{
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,user_id);
			pstmt.setString(2,user_identity);
			rs=pstmt.executeQuery();
			while(rs.next()){
				user=new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));	
				user.setUser_identity(rs.getString("user_identity"));
			}	
		}catch(Exception e)
		{
			throw new Exception("���������쳣");
		}finally{
			this.closeAll(conn,pstmt,rs);
		}
		return user;
	}
	
	//��id,identity��ѯȫ���û�
	public List<User> queryAllUser(int currpage, int everpage,User user) throws Exception{
		List<User> allUser = new ArrayList<User>();
		sql="SELECT user_id,user_identity FROM user WHERE user_identity=? ORDER BY user_id ASC LIMIT ?,?";
		try{
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user.getUser_identity());
			System.out.print(user.getUser_identity());
			pstmt.setInt(2,(currpage-1)*everpage);
			pstmt.setInt(3, everpage);
			rs=pstmt.executeQuery();
			while(rs.next()){
				User u=new User();
				u.setUser_id(rs.getInt("user_id"));
				//user.setUser_name(rs.getString("user_name"));	
				user.setUser_identity(rs.getString("user_identity"));
				allUser.add(u);
			}	
		}catch(Exception e)
		{
			throw new Exception("error");
		}finally{
			this.closeAll(conn,pstmt,rs);
		}
		return allUser;
	}


}

