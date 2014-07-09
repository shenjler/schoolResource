package com.resource.dao;

import java.util.List;

import com.resource.vo.Adhistory;

public interface AdhistoryDAO {
	
	public int addAdhistory(Adhistory adhistory) throws Exception; //添加一条历史记录
	public int deleteAdhistory(int adhistory_id) throws Exception; //删除一条历史记录
	
	public int findAdhistoryCount(int admin_id) throws Exception ;//通过管理员id查找管理员的历史记录总数
	public List<Adhistory> queryAll(int currpage,int everpage,int admin_id) throws Exception ;// 通过管理员id查询管理员的全部历史记录
	//public Adhistory queryById(int adhistory_id) throws Exception;//按id查询
	
	
}
