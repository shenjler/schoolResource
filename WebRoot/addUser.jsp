<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加用户</title>
		<link href="css/head.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"
			charset="utf-8"></script>
		<script type="text/javascript" src="js/bottom.js" charset="utf-8"></script>

<script type="text/javascript">
	jQuery(function($) {
		function stopDefault(event) {
			e = (event || window.event);
			if (e && e.preventDefault) {//如果是FF下执行这个
				e.preventDefault();
			} else {
				e.returnValue = false;//如果是IE下执行这个
			}
			return false;
		}

		$("#myform")
				.submit(
						function(e) {
							var mima = $("#mima").val(), sure_mima = $(
									"#sure_mima").val(), zhanghao = $(
									"#zhanghao").val(), add_name = $(
									"#add_name").val();
							//alert(mima);
							//alert(sure_mima);
							if (mima && sure_mima && add_name && zhanghao) {
								if (mima != sure_mima) {
									$(".fail").show();
									stopDefault(e);
								}
							} else {
								alert("输入不能为空");
								stopDefault(e);
							}
						})
		$("#sure_mima").focus(function() {
			$(".fail").hide();

		})

	});
</script>

<style type="text/css">
<!--
.special {
	background: url(images/home.png);
}

.frame {
	margin-top: 20px;
	height: 278px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	background-image: url(images/add.png);
	padding-top: 20px;
}

.frame .add_ban {
	background-image: url(images/adduse.png);
	height: 50px;
	width: 131px;
	margin-left: -6px;
}

.frame .all_box {
	height: auto;
	width: auto;
	margin-left: 45px;
	margin-top: -5px;
}

.line input {
	height: 23px;
	width: 180px;
}

.frame .all_box form .line {
	margin-top: 7px;
}

.frame .all_box form .line .juese {
	height: 23px;
	width: 183px;
	display: inline;
}

.frame .all_box form .line input {
	font-size: 14px;
	line-height: 23px;
	color: #666;
}

.frame .all_box form .line div {
	font-size: 14px;
	color: #666;
	display: inline-block;
	width: 80px;
	line-height: 23px;
	text-align: right;
	float: left;
}

.frame .all_box form #yes {
	background-image: url(images/yes.png);
	height: 23px;
	width: 80px;
	margin-top: 10px;
	margin-left: 80px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	cursor: pointer;
}

.frame .all_box form #no {
	background-image: url(images/no.png);
	height: 23px;
	width: 80px;
	margin-top: 10px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	cursor: pointer;
}

.frame .all_box form .line .fail {
	font-size: 14px;
	color: #F00;
	display: none;
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
							if (a != null) {
						%>
						<span>你好,</span>
						<span class=""><%=a.getAdmin_name()%> </span> |
						<span><a href="adminPassword.jsp">密码修改</a> </span>
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
					<li class="myli ">
						<a href="admin.jsp">首页</a>
					</li>
					<li class="myli">
						<a href="adminHistory.jsp">历史记录</a>
					</li>
					<li class="myli ">
						<a href="deleteUser.jsp">帐号删除</a>
					</li>
					<li class="myli special">
						<a href="addUser.jsp">帐号添加</a>
					</li>
					<li class="myli">
						<a href="updateUser.jsp">帐号修改</a>
					</li>
				</ul>
			</div>
		</div>
		<!--中间部分-->
		<div class="frame">
			<div class="add_ban"></div>
			<div class="all_box">
				<form method="post" action="UserServlet?status=add" id="myform">
					<div class="line">
						<div class="js">
							角色：
						</div>
						<select name="identity" class="juese">
							<option class="stu">
								学生
							</option>
							<option class="teach">
								老师
							</option>

						</select>
					</div>
					<div class="line">
						<div class="num">
							姓名：
						</div>
						<input type="text" name="name" maxlength="20" id="add_name" />
					</div>
					<div class="line">
						<div class="num">
							帐号：
						</div>
						<input type="text" name="id" maxlength="20" id="zhanghao" />
					</div>
					<div class="line">
						<div class="psd">
							密码：
						</div>
						<input type="password" name="password1" maxlength="20" id="mima" />
					</div>
					<div class="line">
						<div class="spsd">
							确定密码：
						</div>
						<input type="password" name="password2" maxlength="20"
							id="sure_mima" />
						<label class="fail">
							密码不一致
						</label>
					</div>
					<input type="submit" id="yes" class="yes" value="" />
					<input type="reset" id="no" class="no" value="" />
				</form>
			</div>
		</div>
		<div class="bgcolor bottom"></div>
	</body>
</html>

