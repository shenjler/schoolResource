package com.resource.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resource.vo.Adhistory;
import com.resource.vo.Admin;
import com.resource.vo.User;
import com.resource.dao.AdhistoryDAO;
import com.resource.dao.AdminDAO;
import com.resource.dao.UserDAO;
import com.resource.dao.impl.AdhistoryDAOImpl;
import com.resource.dao.impl.AdminDAOImpl;
import com.resource.dao.impl.UserDAOImpl;

public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 8919887459612460394L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String status = request.getParameter("status");
		
		String error = "";
		String path = "";
		String tip = "";
		int flag = 0;

		if (status != null) {
			
			//管理员：修改用户密码
			if ("updateUser".equals(status)) {
				String id=null;
				int userId=0;
				try {
					id = request.getParameter("id");
					userId = Integer.parseInt(id);
				} catch (Exception e1) {
					
					e1.printStackTrace();
				}
				
				UserDAO ud=new UserDAOImpl();
				User user=new User();
				try {
					user=ud.queryById(userId);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(user==null){
					error="用户不存在";
					path="updateUser.jsp";
				}else{
					request.getSession().setAttribute("users",user); 
					path="updateUser.jsp";
				}
				request.setAttribute("errors",error) ;
				request.getRequestDispatcher(path).forward(request,response);		
			}
			
			//用户：修改用户密码
			if ("changePassword".equals(status)) {
				String identity = request.getParameter("identitys");
				HttpSession session = request.getSession();
				User u = (User) session.getAttribute("users");
				if (u != null) {
					int userId = u.getUser_id();

					String userPassword = request.getParameter("password1");
					
					// vo
					User user = new User();
					user.setUser_id(userId);
					user.setUser_password(userPassword);

					UserDAO ud = new UserDAOImpl();
					try {
						flag = ud.updatePassword(user);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (flag <= 0) {
						tip = "修改密码不成功";
						path = "tip.jsp";
					} else {
						tip = "修改密码成功";
						path = "tip.jsp";
						if (identity != null) {
							if ("admin".equals(identity)) {
								Admin a = (Admin) session
										.getAttribute("admins");
								// vo
								Adhistory adhistory = new Adhistory();
								adhistory.setAdhistory_content("修改");
								adhistory.setUser_id(userId);
								adhistory.setAdmin_id(a.getAdmin_id());
								AdhistoryDAO ad = new AdhistoryDAOImpl();
								try {
									ad.addAdhistory(adhistory);
								} catch (Exception e) {
									e.printStackTrace();
								}
								path = "adminTip.jsp";
							}
						}
					}
				}else{
					request.getRequestDispatcher("tip.jsp").forward(request,response);
				}
				request.setAttribute("tips", tip);
				request.getRequestDispatcher(path).forward(request,response);

			}

			//添加用户
			if ("add".equals(status)) {
				UserDAO ud = new UserDAOImpl();
				User u = new User();
				String identity = request.getParameter("identity");
				int userId = Integer.parseInt(request.getParameter("id"));
				
				String userName=request.getParameter("name");
				String userPassword = request.getParameter("password1");
				if ("老师".equals(identity)) {
					try {
						u = ud.queryByIdIdentity(userId, "老师");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				if ("学生".equals(identity)) {
					try {
						u = ud.queryByIdIdentity(userId, "学生");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				if (u == null) {
					//vo
					User user = new User();
					user.setUser_id(userId);
					user.setUser_name(userName);
					user.setUser_password(userPassword);
					user.setUser_identity(identity);
					try {
						flag = ud.addUser(user);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (flag <= 0) {
						tip = "添加用户不成功";
					} else {
						tip = "添加用户成功";

						HttpSession session = request.getSession();
						Admin a = (Admin) session.getAttribute("admins");
						//vo
						Adhistory adhistory = new Adhistory();
						adhistory.setAdhistory_content("添加");
						adhistory.setUser_id(userId);
						adhistory.setAdmin_id(a.getAdmin_id());
						AdhistoryDAO ad = new AdhistoryDAOImpl();
						try {
							ad.addAdhistory(adhistory);
						
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					request.setAttribute("tips", tip);
					path = "adminTip.jsp";
				} else {
					error = "用户账号已存在，请重新输入！";
					request.setAttribute("errors", error);
					path = "addUser.jsp";
				}
				request.getRequestDispatcher(path).forward(request, response);

			}
			
			if("delete".equals(status)){
				String userId[] = request.getParameterValues("deleteUser");
				if(userId==null){
					tip = "用户数为0";
				}else{
					for (int i = 0; i < userId.length; i++) {
					if (userId[i] != null) {
						try {
							
							UserDAO ud = new UserDAOImpl();		
							flag=ud.deleteUser(Integer.parseInt(userId[i]));
						} catch (NumberFormatException e) {
							e.printStackTrace();
						} catch (Exception e) {
							e.printStackTrace();
						}
						if (flag <= 0) {
							tip = "删除用户不成功";break;
						} else {
							tip = "删除用户成功";
						}
					}
				}
				}
				request.setAttribute("tips", tip);
				request.getRequestDispatcher("adminTip.jsp").forward(request,response);
			}

		}
	}

}
