<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加成功</title>
		<link href="css/head.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js" charset="utf-8"></script>
		<script type="text/javascript">
	jQuery(function($){
			function moveCenter(){
					var height=$(document).height();
					var top=height-35;
					$(".bottom").offset({top:top,left:0});			
				}
									
			moveCenter();
			$(window).resize(function(){
				  //alert("Stop it!");
					moveCenter();
			});
			$("#jueshe").text("学生");
					
					
});
</script>

		<style type="text/css">
<!--
.special {
	background: url(images/home.png);
}

.frame {
	margin-top: 20px;
	height: 219px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	/*background-image: url(images/add.png);*/
	padding-top: 20px;
	background-image: url(images/ch_su_bg.png);
}

.frame .add_ban {
	background-image: url(images/adduse.png);
	height: 50px;
	width: 131px;
	margin-left: -6px;
}

.window .success {
	background-image: url(images/success.png);
	float: left;
	height: 37px;
	width: 46px;
	display: block;
}

.window .fail {
	background-image: url(images/fail.png);
	float: left;
	height: 40px;
	width: 40px;
	display: block;
}

.frame .window #tips {
	
}

.window .mess {
	font-family: "微软雅黑";
	font-size: 18px;
	color: #333333;
	float: left;
	margin-left: 30px;
	height: 37px;
	width: auto;
	line-height: 18px;
}

.frame .window {
	height: 50px;
	width: auto;
	margin-top: 40px;
	margin-left: 70px;
}

.frame .window .mess .successFont {
	display: block;
	font-size: 14px;
	color: #333;
}

.frame .window .mess p {
	font-size: 14px;
	color: #333;
}
-->
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
						</form>
					</div>
				</div>
			</div>

			<!--导航-->
			<div class="avr">
				<ul class="list">
					<li class="myli">
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
				</ul>
			</div>
		</div>
		<!--中间部分-->

		<div class="frame">
			<div class="add_ban"></div>
			<div class="window">
				<div class="success" id="tips"></div>
				<div class="mess">

					<!--  <p class="successFont">添加<label id="jueshe">老师</label>成功</p>
           			   <p>返回首页</p>	-->

					<% String tip=(String)request.getAttribute("tips");
					if(tip!=null){%>
					<p class="successFont"><%=tip %></p>
					<%} %>

					<a href="admin.jsp">返回首页</a>
				</div>
			</div>
		</div>
		<!--底部-->
		<div class="bgcolor bottom"></div>
	</body>
</html>
