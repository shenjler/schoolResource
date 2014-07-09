<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理员</title>
		<link rel="stylesheet" type="text/css" href="css/head.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="js/bottom.js" charset="utf-8"></script>
		<style type="text/css">
<!--
.img {
	background-image: url(images/img.png);
	height: 702px;
	width: 960px;
	margin-right: auto;
	margin-left: auto;
}
-->
</style>
	</head>
	<body>
		<div class="top bgcolor ">
			<div class="ban">
				<!--文字GDPU-->
				<div class="gdpu">
				</div>

				<!--搜索-->
				<div class="seach">
					<div class="word">
					<%
						Admin a = (Admin) session.getAttribute("admins");
 		   				if(a!=null){	
					%>
						<span>你好,</span>
						<span class=""><%=a.getAdmin_name() %> </span> |
						<span><a href="adminPassword.jsp">密码修改</a>
						</span>
						<span><a class="exit" href="AllUserServlet?status=out">退出</a>
						</span>
					<% 
        				}
        			%>
					</div>
					<div class="seach_box">
						<form action="" method="post" name="content">
							<input type="text" class="box" maxlength="20" />
							<input type="submit" class="bt" href="#" value="" />
							<!--   <a class="bt" href="#"> </a> -->

						</form>
					</div>
				</div>
			</div>

			<!--导航-->
			<div class="avr">
				<ul class="list">
					<li class="myli special">
						<a href="admin.jsp">首页</a>
					</li>
					<li class="myli">
						<a href="adminHistory.jsp">历史记录</a>
					</li>
					<li class="myli ">
						<a href="deleteUser.jsp">帐号删除</a>
					</li>
					<li class="myli">
						<a href="addUser.jsp">帐号添加</a>
					</li>
					<li class="myli">
						<a href="updateUser.jsp">帐号修改</a>
					</li>
				</ul>
			</div>
		</div>
		<!--中间部分-->
		<div class="img">
		</div>
		<div class="bgcolor bottom"></div>
	</body>
</html>
