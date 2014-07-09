package com.resource.servlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resource.dao.FileUploadDAO;
import com.resource.dao.HistoryDAO;
import com.resource.dao.impl.FileUploadDAOImpl;
import com.resource.dao.impl.HistoryDAOImpl;
import com.resource.vo.FileUpload;
import com.resource.vo.History;
import com.resource.vo.User;



public class FileDownServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.reset();//�����е�����
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("application/x-download");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		InputStream is=null;
		OutputStream os=null;
		
		int file_id=Integer.parseInt(request.getParameter("file_id"));
		FileUploadDAO fd=new FileUploadDAOImpl();
		FileUpload f=null;
		try {
			f=fd.queryById(file_id);		
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		String file_name=f.getFile_hide_name();
		//String file_name=new String(rfile.getFile_name().getBytes("8859_1"));
		// String file_name=new String(rfile.getFile_name().getBytes("iso-8859-1"),"gbk");
		String path="G:\\myjavaDemo\\schoolResource\\WebRoot\\resourceFile\\"+file_name;
		
		File file=new File(path);
		response.setContentLength((int)file.length());
		

		os=response.getOutputStream();//��ʼ��һ�������
		is=new FileInputStream(new File(path));
		//�����������
		 // response.addHeader("Content-Disposition","attachment;file_name="+file_name);
		  //response.addHeader("Content_Length",new Long(file.length()).toString());
		
		 response.setHeader("Content-Disposition","attachment;filename="+new String

					(file_name.getBytes("gbk"),"iso-8859-1"));  
        
		 int k=-1;//
		 byte [] b=new byte[1024];
		 k=is.read(b);

	    
	     while(k!=-1){
	    	 os.write(b,0,k);
	    	 k=is.read(b);
	        }
        is.close();
        os.flush();
        os.close();
        
        HttpSession session = request.getSession();
		User u = (User) session.getAttribute("users");
		int userId = u.getUser_id();
		
		// vo
		History history = new History();
		history.setHistory_content("下载");
		history.setFile_id(file_id);
		history.setUser_id(userId);
		HistoryDAO hd=new HistoryDAOImpl();
		try {
			hd.addHistory(history);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request,response);
	}

}
