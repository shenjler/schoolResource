package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resource.dao.MessageDAO;
import com.resource.dao.impl.MessageDAOImpl;
import com.resource.vo.Message;
import com.resource.vo.User;

public class MessageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String path = "";
		String tip = "";
		int flag = 0;
		 HttpSession session = request.getSession();
			User u = (User) session.getAttribute("users");
			int userId = u.getUser_id();
			int fileId = Integer.parseInt(request.getParameter("fileId"));	
			String messageContent=request.getParameter("textarea");
			// vo
			Message message = new Message();
			message.setMessage_content(messageContent);
			message.setFile_id(fileId);
			message.setUser_id(userId);
			MessageDAO md=new MessageDAOImpl();
			try {
				flag=md.addMessage(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (flag <= 0) {
				tip = "留言不成功";
				path="tip.jsp";
			} else {
				path="fileDetail.jsp";
			}
			request.setAttribute("tips", tip);
			request.getRequestDispatcher(path).forward(request,response);
	}

}
