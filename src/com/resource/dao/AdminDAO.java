package com.resource.dao;

import com.resource.vo.Admin;

public interface AdminDAO {

	public Admin queryById(int admin_id) throws Exception;//��ѯһ������Ա����¼��֤
	public int updatePassword(Admin admin) throws Exception;//�޸Ĺ���Ա����
	public int addAdmin(Admin admin) throws Exception; //��ӹ���Ա�˺�
}
