package com.resource.dao;


import java.util.List;

import com.resource.vo.User;

public interface UserDAO {

	public int addUser(User user) throws Exception; //��ӹ���Ա�˺�
	public int deleteUser(int user_id) throws Exception ;//ɾ���û��˺�
	public int updatePassword(User user) throws Exception;//�޸��û�����
	
	public User queryByIdIdentity(int user_id,String user_identity) throws Exception;//��id,identity��ѯ,�û���¼
	public User queryById(int user_id) throws Exception;//��id��ѯ
	public List<User> queryAllUser(int currpage, int everpage,User user) throws Exception;//��id,identity��ѯȫ���û�
	public int findUserCount(String user_identity) throws Exception ;//��identity�����û��˺�����	
	


}
