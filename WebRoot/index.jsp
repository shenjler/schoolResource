<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页</title>
		<link href="css/head.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>


		<style type="text/css">
.middle {
	width: 100%;
	height: auto;
	background: #FFF;
}

.m_up {
	width: 855px;
	background: url(images/frame1.png);
	margin-top: 20px;
	margin-right: auto;
	margin-bottom: 15px;
	margin-left: auto;
	height: 405px;
	padding-top: 5px;
}

.m_down {
	background: url(images/frame1.png);
	width: 855px;
	height: 402px;
	margin-top: 15px;
	margin-right: auto;
	margin-bottom: 15px;
	margin-left: auto;
	padding-top: 10px;
}

.table {
	margin-left: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 0px;
}

td {
	border: #CECECE solid 1px;
	border-bottom: none;
	border-top: none;
	color: #666666;
	text-align: center;
	font-size: 12px;
	padding-top: 5px;
	padding-right: 70px;
	padding-bottom: 5px;
	padding-left: 70px;
}

.firsttr td,.last td {
	margin-left: 25px;
	border-bottom: #CECECE solid 1px;
	border-top: #CECECE solid 1px;
}

.last td {
	border-top: none;
}

.firsttr td {
	font-size: 14px;
	color: #666666;
	background-image: url(images/yelloLine.png);
	background-repeat: repeat;
}

.bothload {
	width: 131px;
	height: 50px;
	margin-top: 20px;
}

.upload {
	background: url(images/upload1.png);
	margin-left: -6px;
}

.download {
	background: url(images/download2.png);
	margin-left: -5px;
}

.shadow {
	background: url(images/lineShadow.png);
	width: 852px;
	height: 9px;
	margin-left: -4px;
	margin: 0px auto;
	margin-top: -15px;
	margin-bottom: 10px;
}
</style>

	</head>
	<body>
		<!--头部-->
		<div class="top bgcolor ">

			<div class="ban">
				<!--文字GDPU-->
				<div class="gdpu">
				</div>

				<!--搜索-->
				<div class="seach">
					<div class="word">
						<%
							User u = (User) session.getAttribute("users");  
							if(u!=null){	
						%>
						<span>你好,</span>
						<span class=""><%=u.getUser_name()%> | </span>
						<span><a href="userPassword.jsp">密码修改</a>
						</span>
						<span><a class="exit" href="AllUserServlet?status=out">退出</a>
						</span>
						<% 
        					}
        				%>
					</div>
					<div class="seach_box">
						<form action="FileSearchServlet" method="post" name="search">
							<input type="text" name="search" class="box" maxlength="20" />
							 <input  type="submit" class="bt"  value=""/>
						</form>
					</div>
				</div>
			</div>
			
			<!--导航-->
			<div class="avr">
				<ul class="list">
					<li class="myli special">
						<a href="index.jsp">首页</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=801">信工学院</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=802">化工学院</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=803">药科学院</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=804">商学院</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=805">食科学院</a>
					</li>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=806">中药学院</a>
					</li>
					<li class="myli">
						<a href="userHistory.jsp">历史记录</a>
					</li>
					<%  
							if(u.getUser_identity().equals("老师")){	
						%>
					<li class="myli ">
						<a href="uploadFile.jsp">上传文件</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
		<!--中部-->
		<div class="middle">
			<!--up-->
			<div class="m_up">
				<div class=" bothload upload"></div>
				<div class="table">
					<table>
						<tr class="firsttr">
							<td>
								文件名称
							</td>
							<td>
								日期
							</td>
							<td>
								查看
							</td>
							<td>
								下载
							</td>
						</tr>

						<%
  				//编码转换
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8"); 
				FileUploadDAO fd=new FileUploadDAOImpl();
				List<FileUpload> all1=fd.queryByTime();
				if(all1!=null){
					for(int i=0;i<all1.size();i++){
 					 	FileUpload file1=all1.get(i);
 					 	int fileId=file1.getFile_id();
 					 	String fileDisplayName=file1.getFile_display_name();
 					 	String fileUptime=file1.getFile_uptime();
				%>
						<tr>
							<td><%=fileDisplayName %></td>
							<td><%=fileUptime %></td>
							<td>
								<a href="fileDetail.jsp?fileId=<%=fileId %>"><img src="images/star.png">
								</a>
							</td>
							<td>
								<a href="FileDownServlet?file_id=<%=fileId%>"><img
										src="images/download.png">
								</a>
							</td>
						</tr>
						<%
 							}
 								}	
 		  				 %>
						<tr class="last">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</table>

				</div>
				</div>

					<!--down-->
					<div class="m_down">
						<div class="download bothload"></div>
						<div class="table">
							<table>
								<tr class="firsttr">
									<td>
										文件名称
									</td>
									<td>
										下载次数
									</td>
									<td>
										查看
									</td>
									<td>
										下载
									</td>
								</tr>
								<%
				List<FileUpload> all2=fd.queryByNum();
				if(all2!=null){
					for(int i=0;i<all2.size();i++){
 					 	FileUpload file2=all2.get(i);
 					 	int fileId=file2.getFile_id();
 					 	String fileDisplayName=file2.getFile_display_name();
 					 	int fileDownNum=file2.getFile_down_num();
				%>
								<tr>
									<td><%=fileDisplayName %></td>
									<td><%=fileDownNum %></td>
									<td>
										<a href="fileDetail.jsp?fileId=<%=fileId %>"><img src="images/star.png">
										</a>
									</td>
									<td>
										<a href="FileDownServlet?file_id=<%=fileId%>"><img src="images/download.png">
										</a>
									</td>
								</tr>
								<%
 				}
 					}	
 		   %>
								<tr class="last">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!--底部-->
				<div class="bgcolor bottom"></div>
	</body>
</html>

