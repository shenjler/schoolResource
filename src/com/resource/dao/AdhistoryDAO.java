package com.resource.dao;

import java.util.List;

import com.resource.vo.Adhistory;

public interface AdhistoryDAO {
	
	public int addAdhistory(Adhistory adhistory) throws Exception; //���һ����ʷ��¼
	public int deleteAdhistory(int adhistory_id) throws Exception; //ɾ��һ����ʷ��¼
	
	public int findAdhistoryCount(int admin_id) throws Exception ;//ͨ������Աid���ҹ���Ա����ʷ��¼����
	public List<Adhistory> queryAll(int currpage,int everpage,int admin_id) throws Exception ;// ͨ������Աid��ѯ����Ա��ȫ����ʷ��¼
	//public Adhistory queryById(int adhistory_id) throws Exception;//��id��ѯ
	
	
}
