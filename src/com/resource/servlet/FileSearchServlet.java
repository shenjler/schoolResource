package com.resource.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resource.dao.FileSearchDAO;
import com.resource.dao.impl.FileSearchDAOImpl;
import com.resource.vo.FileSearch;

public class FileSearchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String path = null;
		String tip = null;
		String search = request.getParameter("search");
		FileSearchDAO fsd = new FileSearchDAOImpl();
		if (search != null && !"".equals(search)) {
			try {
				//request.setAttribute("search", search);
				//request.setAttribute("allcount", fsd.findFileSearchCount(search));
				//request.setAttribute("fileLike", fsd.queryByLike(a,b,search));
				List<FileSearch> like=fsd.queryByLike(1,10,search);
				if(like.size()==0){
					tip = "抱歉，没有找到与“"+search+"”相关的文档";
					path = "tip.jsp";
				}else{
					path = "fileSearch.jsp";
				}
				
			} catch (Exception e) {
			}
		} else {
			tip = "搜索不能为空";
			path = "tip.jsp";
		}
		request.setAttribute("tips", tip);
		request.getRequestDispatcher(path).forward(request, response);
	}
}
