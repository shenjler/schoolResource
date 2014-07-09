package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resource.dao.*;
import com.resource.dao.impl.*;

public class HistoryServlet extends HttpServlet {

	
	private static final long serialVersionUID = 8787705694465792324L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "";
		String tip = "";
		int flag = 0;

		String historyId[] = request.getParameterValues("deleteHistory");
		for (int i = 0; i < historyId.length; i++) {
			if (historyId[i] != null) {
				try {
					HistoryDAO hd = new HistoryDAOImpl();
					flag=hd.deleteHistory(Integer.parseInt(historyId[i]));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (flag <= 0) {
					tip = "删除历史记录不成功";break;
				} else {
					tip = "删除历史记录成功";
				}
			}
		}
		request.setAttribute("tips", tip);
		request.getRequestDispatcher("tip.jsp").forward(request,response);
	}

}
