<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示</title>
<link href="css/head.css" rel="stylesheet" />
<link href="css/all.css" rel="stylesheet" />
<style type="text/css">
.frame {
	background-image: url(images/ch_su_bg.png);
	margin-top: 20px;
	background-repeat: no-repeat;
	height: 219px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 20px;
}
.frame .ch_icon {
	background-image: url(images/tips.png);
	height: 50px;
	width: 131px;
	margin-left: -7px;
}



.bottom {
	margin-top: 100px;
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

.frame .window .mess .failFont {
	display: none;
}
.frame .window .mess .successFont {
	display: block;
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
    <div class="seach" >
    	<div class="word">
    	<%
				User u = (User) session.getAttribute("users");  
				if(u!=null){	
		%>
        <span>你好,</span>
		<span class=""><%=u.getUser_name()%> | </span>
		<span><a href="userPassword.jsp">密码修改</a></span>
		<span><a class="exit" href="AllUserServlet?status=out">退出</a></span>
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
<!--中间部分-->
<div class="frame">
    <div class="ch_icon"></div>
  	<div class="window">
<div class="success" id="tips"></div>
            <div class="mess">
             <% String tip=(String)request.getAttribute("tips");
					if(tip!=null){%>
				<p class="successFont"><%=tip %></p>
				<%} %>	   
           		
           		<a href="index.jsp">返回首页</a>
           		<!-- <p class="successFont">密码修改成功</p>
            		 <p  class="failFont">密码修改失败</p>
              		<p>返回首页</p> -->
              
            </div>
    </div>
  
 
</div>
<div class="bgcolor bottom"></div>
</body>
</html>

