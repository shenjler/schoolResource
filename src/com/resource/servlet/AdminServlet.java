package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resource.dao.*;
import com.resource.dao.impl.*;
import com.resource.vo.*;

public class AdminServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String status = request.getParameter("status");
		
		String path = "";
		String tip = "";
		int flag = 0;
		
		if (status != null) {
			if ("changePassword".equals(status)) {
				HttpSession session = request.getSession();
				Admin a = (Admin) session.getAttribute("admins");
				if (a!= null) {
					int adminId = a.getAdmin_id();

					String adminPassword = request.getParameter("password1");
					
					// vo
					Admin admin = new Admin();
					admin.setAdmin_id(adminId);
					admin.setAdmin_password(adminPassword);

					AdminDAO ad = new AdminDAOImpl();
					try {
						flag = ad.updatePassword(admin);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (flag <= 0) {
						tip = "修改密码不成功";
						
					} else {
						tip = "修改密码成功";
						
					}
			}else{}
				request.setAttribute("tips", tip);
				request.getRequestDispatcher("adminTip.jsp").forward(request,response);
			}
		}
	}

}
