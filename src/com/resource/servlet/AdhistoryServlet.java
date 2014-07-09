package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resource.dao.*;
import com.resource.dao.impl.*;
import com.resource.vo.*;

public class AdhistoryServlet extends HttpServlet {

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

		String adhistoryId[] = request.getParameterValues("deleteAdhistory");
		for (int i = 0; i < adhistoryId.length; i++) {
			if (adhistoryId[i] != null) {
				try {
					AdhistoryDAO ad = new AdhistoryDAOImpl();
					flag=ad.deleteAdhistory(Integer.parseInt(adhistoryId[i]));
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
		request.getRequestDispatcher("adminTip.jsp").forward(request,response);
	}

}
