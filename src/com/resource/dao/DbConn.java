package com.resource.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbConn {
	public final static String DRIVER="com.mysql.jdbc.Driver"; //ï¿½ï¿½
	public final static String URL="jdbc:mysql://localhost:3306/resource?characterEncoding=utf-8";
	public final static String DBNAME="root"; //ï¿½ï¿½ï¿½ï¿½Ã»ï¿½ï¿½Ëºï¿½
	public final static String DHPASS="123456"; //ï¿½ï¿½ï¿½ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½
	
	public Connection getConn() {  //ï¿½ï¿½È¡ï¿½ï¿½Ý¿ï¿½ï¿½ï¿½ï¿½Ó·ï¿½ï¿½ï¿½
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("×¢ï¿½ï¿½ï¿½ï¿½ï¿½ì³£");
			e.printStackTrace();
		}
		Connection conn=null;
		try {
			conn = DriverManager.getConnection(URL,DBNAME,DHPASS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý¿ï¿½ï¿½ì³£");
			e.printStackTrace();
		}
		return conn;
	}
	/*ï¿½Ø±ï¿½ï¿½ï¿½Ô´ï¿½ï¿½ï¿½ï¿½*/
	public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs){
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("RSï¿½Ø±Õ·ï¿½ï¿½ï¿½ï¿½ì³£");
				e.printStackTrace();
			}
		}
		if (pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("pstmtï¿½Ø±Õ·ï¿½ï¿½ï¿½ï¿½ì³£");
				e.printStackTrace();
			}
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("connï¿½Ø±Õ·ï¿½ï¿½ï¿½ï¿½ì³£");
				e.printStackTrace();
			}
		}
	}
	
	
	public int executeSQL(String sql,String[] getValue){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=getConn();  //ï¿½ï¿½È¡ï¿½ï¿½Ý¿ï¿½ï¿½ï¿½ï¿½Ó·ï¿½ï¿½ï¿½
			pstmt=conn.prepareStatement(sql);
			if (getValue!=null) {
				for (int i = 0; i < getValue.length; i++) {
					pstmt.setString(i+1, getValue[i]);
				}
			}
			result=pstmt.executeUpdate();  
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("executeSQLï¿½ï¿½ï¿½ï¿½ï¿½ì³£");
			e.printStackTrace();
		}finally{
			closeAll(conn,pstmt,null);
		}
		return result;
	}
	
	
}
