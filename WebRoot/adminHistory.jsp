<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*"%>
<%@ page import="com.resource.servlet.*"%>
<%@ page import="com.resource.dao.*"%>
<%@ page import="com.resource.dao.impl.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>历史记录</title>
		<link rel="stylesheet" href="css/left_nav.css" type="text/css" />
		<link href="css/head.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.2.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/checkAll.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/chooseNum.js" charset="utf-8"></script>
		<link href="css/ad_historyRecord.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
	jQuery(function($){
			$("tr td:first").css({width:"100px"});
			$("tr td:eq(2)").css({width:"300px"});			
			$("tr td:last").css({width:"200px"});							
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
					<li class="myli special">
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
		<%
			//编码转换
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			AdhistoryDAO ad = new AdhistoryDAOImpl();

			//统计总记录数
			int allcount = 0;//总记录数
			allcount = ad.findAdhistoryCount(a.getAdmin_id());
			//设置每一页要显示多少条记录
			int everpage = 17;//每页显示17条记录
			int r = 0;
			int allpages = 0;//总页数 
			r = allcount % everpage;
			if (r == 0) {
				allpages = allcount / everpage;
			} else {
				allpages = allcount / everpage + 1;
			}
			//当前是哪一页
			String pages = null;
			pages = request.getParameter("pages");
			int currpage = 0;//当前页
			if (pages == null) {
				currpage = 1;
			} else {
				currpage = Integer.parseInt(pages);
				if (currpage < 1) {
					currpage = 1;
				}
				if (currpage > allpages) {
					currpage = allpages;
				}
			}
			List<Adhistory> all = ad.queryAll(currpage, everpage, a
					.getAdmin_id());
		%>
		<!--中间-->
		<div class="frame">
			<div class="his_ban"></div>
			<form method="post" action="AdhistoryServlet" name="myform">
				<table width="800" border="1" class="tab">
					<tr class="firstline">
						<td>
							日期
						</td>
						<td>
							身份
						</td>
						<td>
							帐号
						</td>
						<td>
							操作
						</td>
						<td>
							全部删除
							<input type="checkbox" id="chAll" name="chAll"
								onclick='CheckAll(this.form)' />
						</td>
					</tr>
					<%
						if (all != null) {
							for (int i = 0; i < all.size(); i++) {
								Adhistory adhistory = all.get(i);
								int adhistoryId = adhistory.getAdhistory_id();
								String adhistoryTime = adhistory.getAdhistory_time();
								String userIdentity = adhistory.getUser_identity();
								int userId = adhistory.getUser_id();
								String adhistoryContent = adhistory.getAdhistory_content();
					%>

					<tr>
						<td><%=adhistoryTime%></td>
						<td><%=userIdentity%>
						</td>
						<td><%=userId%>
						</td>
						<td><%=adhistoryContent%></td>
						<td>
							<input type="checkbox" id="" value="<%=adhistoryId%>"
								name="deleteAdhistory" />
						</td>
					</tr>
					<%
							}
						}
					%>

				</table>
				
				<div class="num" id="num">
					<%
						if (allpages > 1) {
					%>
					<a href="adminHistory.jsp?pages=<%=currpage - 1%>" class="gray">&lt;</a>
					<!-- <span id="a1 " class="gray">&lt;</span> -->
					<%
						for (int i = 1; i <= allpages; i++) {
					%>
					<a href="adminHistory.jsp?pages=<%=i%>" <%if (currpage == i) {%>
						class="yellow" <%} else {%> class="gray" <%}%>><%=i%></a>
					<%
						}
					%>
					<a href="adminHistory.jsp?pages=<%=currpage + 1%>" class="gray">&gt;</a>
					<%
						}
					%>
				</div>
				<input type="submit" class="sure" name="sure" value="" />
			</form>
		</div>
		<div class="bgcolor bottom"></div>
	</body>
</html>

