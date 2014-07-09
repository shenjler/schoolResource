package com.resource.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.resource.dao.AdhistoryDAO;
import com.resource.dao.DbConn;
import com.resource.vo.Adhistory;


public class AdhistoryDAOImpl extends DbConn implements AdhistoryDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String sql = null;
	private ResultSet rs = null;
	
	//添加一条历史记录
	public int addAdhistory(Adhistory adhistory) throws Exception{
		String time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		sql="INSERT INTO adhistory (adhistory_content,adhistory_time,user_id,admin_id) VALUES(?,?,?,?)";
		String[] getValue={adhistory.getAdhistory_content(),time,""+adhistory.getUser_id(),""+adhistory.getAdmin_id()};
		return this.executeSQL(sql, getValue);
	} 
	
	//删除留言
	public int deleteAdhistory(int adhistoryId) throws Exception {
		sql = "DELETE  FROM adhistory WHERE adhistory_id=?";
		String[] getValue = {adhistoryId+"" };
		return this.executeSQL(sql, getValue);
	}
	
	
	//通过管理员id查找管理员的历史记录总数
	public int findAdhistoryCount(int admin_id) throws Exception {
		sql="SELECT count(*) FROM adhistory WHERE admin_id=?";
		int allcount=0;
		try {
			conn=this.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, admin_id);
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
	
	
	// 查询全部历史记录
	public List<Adhistory> queryAll(int currpage, int everpage,int admin_id)throws Exception {
		List<Adhistory> all = new ArrayList<Adhistory>();
		sql = "SELECT adhistory_id,adhistory_content,adhistory_time,user_identity,user.user_id FROM adhistory ,user WHERE adhistory.user_id = user.user_id AND adhistory.admin_id=? ORDER BY adhistory_time DESC LIMIT ?,?";
		try {
		pstmt = this.getConn().prepareStatement(sql);
		pstmt.setInt(1,admin_id);
		pstmt.setInt(2,(currpage-1)*everpage);
		pstmt.setInt(3, everpage);
	    rs = pstmt.executeQuery();
		while (rs.next()) {
			// 查出后，将内容赋值给student对象
			Adhistory adhistory = new Adhistory();
			adhistory.setAdhistory_id(rs.getInt("adhistory_id"));
			adhistory.setAdhistory_content(rs.getString("adhistory_content"));
			adhistory.setAdhistory_time(rs.getDate("adhistory_time").toString());
			//adhistory.setAdhistory_time(rs.getString("adhistory_time"));
			adhistory.setUser_identity(rs.getString("user_identity"));
			adhistory.setUser_id(rs.getInt("user.user_id"));
			all.add(adhistory);
		}
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			// 关闭数据库连接
			this.closeAll(conn,pstmt,rs);	
		}
		return all;
	}
	


}
