package com.resource.dao;

import java.util.List;

import com.resource.vo.History;

public interface HistoryDAO {

	public int addHistory(History history) throws Exception; //添加一条历史记录
	public int deleteHistory(int history_id) throws Exception; //删除一条历史记录
	public int findHistoryCount(int user_id) throws Exception ;//通过用户id查找用户的历史记录总数
	public List<History> queryAll(int currpage,int everpage,int user_id) throws Exception ;// 通过用户id查找用户的全部历史记录
	//public Adhistory queryById(int adhistory_id) throws Exception;//按id查询
}
