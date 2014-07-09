package com.resource.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.resource.vo.*;
import com.resource.dao.*;
import com.resource.dao.impl.*;


public class FileUploadServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String tip="";
		
		String fileDisplayName=null;
		String grade=null;
		String college=null;
		String classes=null;
		String course=null;
		String fileIntroduce=null;
		String fileHideName=null;
		String fileType=null;
		int fileSize=0;
		


			DiskFileItemFactory factory = new DiskFileItemFactory();
			//设置最多允许在内存中存储的数据，单位：字节 
			factory.setSizeThreshold(1024*1024*10);
			
			File f = new File("G:\\myjavaDemo\\schoolResource\\WebRoot\\tempFile"); 
			if (!f.exists()) {
				f.mkdirs();
			}
			factory.setRepository(f);

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("utf-8");
			upload.setSizeMax(1024 * 1024 * 100);

			List list = null;
			try {
				list = upload.parseRequest(request);
				Iterator<FileItem> iterator = list.iterator();
				while (iterator.hasNext()) {
					FileItem item = (FileItem) iterator.next();
					if (item.isFormField()) {
						 if("fileDisplayName".equals(item.getFieldName())){
							 fileDisplayName= (String)item.getString("utf-8");
							  System.out.println(": 文件名:"+fileDisplayName); 
						 }
						 else if("grade".equals(item.getFieldName())){
							 grade= item.getString("utf-8");
							  System.out.println(": 年级,:"+grade); 
						 }
						 else if("college".equals(item.getFieldName())){
							 college= (String)item.getString("utf-8");
							  System.out.println(": 学院:"+college); 
						 }
						 else if("classes".equals(item.getFieldName())){
							 classes= item.getString("utf-8");
							  System.out.println(": 专业,:"+classes); 
						 }
						 else if("course".equals(item.getFieldName())){
							 course= (String)item.getString("utf-8");
							  System.out.println(": 课程:"+course); 
						 }
						 else if("textare".equals(item.getFieldName())){
							 fileIntroduce= item.getString("utf-8");
							  System.out.println(": 文件介绍,:"+fileIntroduce); 
						 }
			
					} else {	
						fileHideName = item.getName();
						 new String(fileHideName.getBytes("GBK"),"UTF-8"); 
						 fileSize =(int)item.getSize();
						 fileType=item.getContentType();
						 
						 System.out.println(": 大小,:"+fileSize); 

						 System.out.println(": 类型,:"+fileType); 
						 
						if (fileHideName != null && !fileHideName.equals("")) {
							FileOutputStream fos = new FileOutputStream(
									"G:\\myjavaDemo\\schoolResource\\WebRoot\\resourceFile\\"+ fileHideName);
							if (item.isInMemory()) {
								try {
									fos.write(item.get());
									System.out
											.println("" + fileHideName + "");
								} catch (Exception e) {
									System.out.println("" + fileHideName+ "");
								} finally {
									fos.close();
								}
							} else {
								InputStream is = item.getInputStream();
								try {
									int k = -1;
									byte[] b = new byte[1024 * 2];
									k = is.read(b);
									while (k != -1) {
										fos.write(b, 0, k);
										k = is.read(b);
									}
									System.out.println("" + fileHideName + "");
								} catch (Exception e) {
									System.out.println("" + fileHideName+ "");
									e.printStackTrace();
								} finally {
									is.close();
									fos.flush();
									fos.close();
								}
							}
						}
					}
				}

				HttpSession session = request.getSession();
				User u = (User) session.getAttribute("users");
				int userId = u.getUser_id();
				
				//实例化对象
				Ccgc c=new Ccgc();
				c.setGrade_name(grade);
				c.setCollege_name(college);
				c.setCourse_name(course);
				c.setClass_name(classes);
				
				CcgcDAO cd=new CcgcDAOImpl();
				Ccgc ccgc=cd.queryCcgc(c);
				System.out.println("ccgc_id==" + ccgc.getCcgc_id() + "");
				
				FileUpload file=new FileUpload();
				file.setFile_display_name(fileDisplayName);
				file.setFile_hide_name(fileHideName);
				file.setFile_type(fileType);
				file.setFile_size(fileSize);
				file.setFile_introduce(fileIntroduce);
				file.setUser_id(userId);
				file.setCcgc_id(ccgc.getCcgc_id());
				
	        	file.setPicture_id(1);//xxxxxxxxx
	        	
	        	FileUploadDAO fd=new FileUploadDAOImpl();
	        	try {
					fd.addFile(file);
					System.out.println("成功!");
					tip="上传文件成功";
					
					int fileId=fd.queryFileId();
					System.out.println("fieid="+fileId);
					
					// vo
					History history = new History();
					history.setHistory_content("上传");
					history.setFile_id(fileId);
					history.setUser_id(userId);
					
					HistoryDAO hd=new HistoryDAOImpl();
					try {
						hd.addHistory(history);
						System.out.println("历史记录成功!");
					} catch (Exception e) {
						e.printStackTrace();
						tip="添加历史记录失败！";
						System.out.println("历史记录不成功!");
					}
					
				} catch (Exception e) {
					System.out.println("出错!");
					e.printStackTrace();
					tip="上传文件失败！";
				}
				
				
			} catch (Exception e) {
				System.out.println("不成功!");
				e.printStackTrace();
			}
			
			
			request.setAttribute("tips", tip);
			request.getRequestDispatcher("tip.jsp").forward(request,response);
		
		}
		

}


