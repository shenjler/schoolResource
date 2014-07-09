package com.resource.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resource.dao.*;
import com.resource.dao.impl.*;
import com.resource.vo.*;



public class AllUserServlet extends HttpServlet {

	private static final long serialVersionUID = 5777625534279604586L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		this.doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");	
		String status=request.getParameter("status");
		String identity=request.getParameter("identity");
		String error="";
		String path = "" ;
		String tip="";
		int flag=0;
		
		if(status!=null){
			//登录
			if("check".equals(status)){
				
				//System.out.println(identity);
				if("管理员".equals(identity)){
					AdminDAO ad=new AdminDAOImpl();
					Admin admin=new Admin();
					int adminId=Integer.parseInt(request.getParameter("id"));
					String adminPassword=request.getParameter("password");
					try {
						admin=ad.queryById(adminId);
					} catch (Exception e) {	
						e.printStackTrace();
					}
					
					if(admin==null){
						error="用户不存在";
						path="login.jsp";
					}else if(!admin.getAdmin_password().equals(adminPassword)){
						error="密码不正确";
						path="login.jsp";
					}else{
						request.getSession().setAttribute("admins",admin); 
						path="admin.jsp";
					}
				}else{
					UserDAO ud=new UserDAOImpl();
					User user=new User();
					int userId=Integer.parseInt(request.getParameter("id"));
					String userPassword=request.getParameter("password");

					if("学生".equals(identity)){
						
						try {
							user = ud.queryByIdIdentity(userId, "学生");				
						} catch (Exception e) {
							e.printStackTrace();
						}	
					}
					if("老师".equals(identity)){
						try {
							user=ud.queryByIdIdentity(userId, "老师");	
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					if(user==null){
						error="用户不存在";
						path="login.jsp";
					}else if(!user.getUser_password().equals(userPassword)){
						error="密码不正确";
						path="login.jsp";
					}else{
						request.getSession().setAttribute("users",user); 
						path="index.jsp";
					}
				}
				request.setAttribute("errors",error) ;
				request.getRequestDispatcher(path).forward(request,response);	
			}
			
			if("out".equals(status)){
				// 退出
				HttpSession session=request.getSession();
				session.invalidate() ;
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
		}
	}
}
