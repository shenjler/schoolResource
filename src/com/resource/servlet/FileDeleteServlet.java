package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resource.dao.FileUploadDAO;
import com.resource.dao.UserDAO;
import com.resource.dao.impl.FileUploadDAOImpl;
import com.resource.dao.impl.UserDAOImpl;

public class FileDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tip = "";
		int flag = 0;

		int fileId=Integer.parseInt(request.getParameter("file_id"));
		System.out.println("fileid="+fileId);
			
				try {
					FileUploadDAO fud = new FileUploadDAOImpl();
					try {
						flag = fud.deleteFile(fileId);
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
				if (flag <= 0) {
					tip = "删除文件不成功";
				} else {
					tip = "删除文件成功";
				}
				
		request.setAttribute("tips", tip);
		request.getRequestDispatcher("tip.jsp").forward(request, response);
	}
}

