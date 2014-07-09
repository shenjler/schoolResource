<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改密码</title>
		<link href="css/head.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/bottom.js"></script>
		<link rel="stylesheet" type="text/css" href="css/psdChange.css" />
		<script type="text/javascript">
	jQuery(function($){
				function stopDefault(event) { 
						e= (event||window.event);
						if (e && e.preventDefault){//如果是FF下执行这个
							e.preventDefault();
						}else{
							e.returnValue = false;//如果是IE下执行这个
							}
						return false;
					}
					
			$("#myform").submit(function(e){	
				var 	oldpsd=$("#oldpsd").val(),
						newpsd=$("#newpsd").val(),
						sure_newpsd=$("#sure_newpsd").val();
						<%
							User u = (User) session.getAttribute("users");
 		   						if(u!=null){
						%>
					var	nowpsd=<%=u.getUser_password() %>;
						<%}%>	
						//alert(newpsd);
						
			 
				if(oldpsd&&newpsd&&sure_newpsd)
					{
						if(oldpsd!=nowpsd){
			 			//alert("不同");
									$("#yes_or_no").show();
									stopDefault(e);		
						}else if(newpsd!=sure_newpsd){
									//alert("不同");
									$("#same").show();
									stopDefault(e);											
						}					
					}else{
							alert("输入不能为空");
							stopDefault(e);					
					}	
			 });
			 
			 
			$("#sure_newpsd").focus(function(){
									   $("#same").hide();									   
									   
									   });	
			$("#oldpsd").focus(function(){
									   $("#yes_or_no").hide();									   
									   
									   });	
						
});
</script>
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
			User user = (User) session.getAttribute("users");
 		   	if(user!=null){
 		   	
		%>
						<span>你好,</span>
						<span class=""><%=user.getUser_name() %> | </span>
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
							<input type="submit" class="bt" value="" />
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
					<li class="myli ">
						<a href="uploadFile.jsp">上传文件</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
		<!--中间部分-->
		<div class="frame">
			<div class="ch_icon"></div>
			<div class="change">
				<form name="password_form" id="myform"
					action="UserServlet?status=changePassword" method="post">
					<div class="item">
						<label class="xuehao">
							账号：
						</label>
						<label id="no"><%=u.getUser_id() %></label>
					</div>
					<div class="item">
						<label class="oldpsd">
							旧密码：
						</label>
						<input type="password" id="oldpsd" name="oldpassword"
							class="old  cave" maxlength="15" />
						<span id="yes_or_no">密码错误!!!</span>
					</div>
					<div class="item">
						<label class="newpsd">
							新密码：
						</label>
						<input type="password" id="newpsd" name="password1"
							class="old cave" maxlength="15" />
					</div>
					<div class="item">
						<label class="true">
							确认密码：
						</label>
						<input type="password" id="sure_newpsd" name="password2"
							class="new cave" maxlength="15" />
						<span id="same">密码不一致</span>
					</div>
					<div class="item ">
						<input type="submit" id="yes" class="yes" value="" />
						<input type="reset" id="no" class="no" value="" />
					</div>
				</form>
			</div>
		</div>
		<div class="bgcolor bottom"></div>
	</body>
</html>

