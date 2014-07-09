<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上传文件</title>
		<link rel="stylesheet" type="text/css" href="css/head.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/bottom.js"></script>
		<script type="text/javascript" src="js/upload.js"></script>
		<link href="css/upload.css" rel="stylesheet" type="text/css" />

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
					<li class="myli">
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
					<li class="myli special">
						<a href="uploadFile.jsp">上传文件</a>
					</li>
					<%} %>
				</ul>      
			</div>
		</div>

		<!--中部-->
		<div class="middle">
			<div class="upload"></div>
			<div class="tab">
				<form method="post" action="FileUploadServlet"  name="upLoad" ENCTYPE="multipart/form-data">
					<div class="aline">
						<div class="fileName font_box">
							文件名称:
						</div>
						<input type="text" name="fileDisplayName" value="" maxlength="20" />
					</div>
					<div class="aline">
						<div class="fileTea font_box">
							老师:
						</div><%=u.getUser_name() %>

						<!-- <input type="text" value="" maxlength="20"  />  -->
					</div>

					<div class="aline">
						<div class="grade font_box">
							年级:
						</div>
						<select  name="grade">
							<option>
								2009届
							</option>
							<option>
								2010届
							</option>
							<option>
								2011届
							</option>
							<option>
								2012届
							</option>
						</select>
					</div>
					<div class="aline">
						<div class="academy font_box">
							学院:
						</div>
						<select  name="college" id="xueyuan">
							<option>
								信工学院
							</option>
							<option>
								化工学院
							</option>
							<option>
								药科学院
							</option>
							<option>
								商学院
							</option>
							<option>
								食科学院
							</option>
							<option>
								中药学院
							</option>
						</select>

					</div>

					<div class="aline">
						<div class="major font_box">
							专业:
						</div>
						<select  name="classes" size="1">
								<option>计算机科学与技术(医学应用方向)</option>
								<option>计算机科学与技术(动漫程序设计方向)</option>
								<option>信息管理与信息系统</option>
								<option>电子信息工程</option>
							</select>
						<!-- <select  id="majors"></select>  <input type="text"  name=classes value="" maxlength="20" /> -->

						<div class="aline">
							<div class="courseName font_box">
								课程名称:
							</div>
							
							<select  name="course" size="1">
								<option>物理学</option>
								<option>工程数学</option>
								<option>数字电子技术</option>
								<option>马克思主义基本原理</option>
								<option>大学英语</option>
								<option>数据结构及算法</option>
								
							</select>
							
						</div>

					</div>
					<div class="inbox ">
						<div class="intr font_box">
							课程介绍:
						</div>
						<div class="font_long">
							<span id="used">0</span>/80
						</div>
						<!--这个name要与右边那个form.textarea中的textarea一致-->
						<textarea name="textare" class="text" id="mytext"
							onkeydown="gbcount(this.form.textare);"
							onkeyup="gbcount(this.form.textare);">谈谈课程的简介吧...</textarea>
					</div>
					<div class="aline">
						<div class="localUp font_box">
							本地上传:
						</div>
						 <input name="file1" size="30" type="file">
					</div>
				 <div class="aline myline">
                  <input class="sure" type="submit" value=""/>
                   <input class="cancel" type="reset" value=""/>                      
		  </div>
				</form>
			</div>
		</div>

		<div class="bgcolor bottom"></div>


	</body>
</html>
