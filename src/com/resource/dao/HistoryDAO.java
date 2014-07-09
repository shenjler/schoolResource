package com.resource.dao;

import java.util.List;

import com.resource.vo.History;

public interface HistoryDAO {

	public int addHistory(History history) throws Exception; //���һ����ʷ��¼
	public int deleteHistory(int history_id) throws Exception; //ɾ��һ����ʷ��¼
	public int findHistoryCount(int user_id) throws Exception ;//ͨ���û�id�����û�����ʷ��¼����
	public List<History> queryAll(int currpage,int everpage,int user_id) throws Exception ;// ͨ���û�id�����û���ȫ����ʷ��¼
	//public Adhistory queryById(int adhistory_id) throws Exception;//��id��ѯ
}
