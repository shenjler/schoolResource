package com.resource.dao;

import com.resource.vo.Admin;

public interface AdminDAO {

	public Admin queryById(int admin_id) throws Exception;//查询一个管理员、登录验证
	public int updatePassword(Admin admin) throws Exception;//修改管理员密码
	public int addAdmin(Admin admin) throws Exception; //添加管理员账号
}
