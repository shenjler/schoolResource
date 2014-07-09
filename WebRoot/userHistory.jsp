<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/head.css"  rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/Num.css"/>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/checkAll.js"></script>
<script type="text/javascript" src="js/chooseNum.js"></script>


<title>历史记录</title>
<style type="text/css" >
.frame {
	background-image: url(images/delete_bg.png);
	margin-top: 20px;
	background-repeat: no-repeat;
	height: 726px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 20px;
}
.frame .ch_icon {
	background-image: url(images/his_ban.png);
	height: 50px;
	width: 131px;
	margin-left: -7px;
}
.bottom {
	margin-top: 10px;
}

.special {
	background-image: url(images/home.png);
}

/*表格CSS*/

.table{
	margin-left:30px;
	margin-top:10px;
	margin-bottom:10px;
	padding:0px;
	}
td{
	border:#CECECE solid 1px;
	border-bottom:none;
	border-top:none;
	color:#666666;
	text-align:center;
	font-size:12px;
	padding-top: 7px;
	padding-right: 50px;
	padding-bottom: 7px;
	padding-left: 50px;
	}
.firsttr td,.last td{
	margin-left:25px;
	padding-top: 5px;
	padding-bottom: 5px;
	border-bottom:#CECECE solid 1px;
	border-top:#CECECE solid 1px;
	}
.last td{
	border-top:none;
	}
.firsttr td{
	font-size:14px;
	color:#666666;
	background-image: url(images/yelloLine.png);
	background-repeat: repeat;
	}

.relocate{
	margin-right:35px;	
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
    		if (u != null) {
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
					<li class="myli special">
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
 <%
 	//编码转换
 	request.setCharacterEncoding("utf-8");
 	response.setCharacterEncoding("utf-8");
 	HistoryDAO hd = new HistoryDAOImpl();

 	//统计总记录数
 	int allcount = 0;//总记录数
 	allcount = hd.findHistoryCount(u.getUser_id());
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

 	List<History> all = hd.queryAll(currpage, everpage, u.getUser_id());
 %>   
<!--中间部分-->
<div class="frame">
  <div class="ch_icon"></div>
<div class="m_up">
      <div class="table">
      	<form action="HistoryServlet" method="post" class="" name="">
			  <table >
                            <tr class="firsttr" >
                              <td>日期</td>
                              <td>文件名称</td>
                              <td>操作</td>
                              <td>查看</td> 
                              <td>全部删除
                                <input name="chAll" id="chAll" type="checkbox" value=""/></td>
                            </tr>
							<%
								if (all != null) {
									for (int i = 0; i < all.size(); i++) {
										History history = all.get(i);
										int historyId = history.getHistory_id();
										String historyTime = history.getHistory_time();
										String historyContent = history.getHistory_content();
										int fileId = history.getFile_id();
										String fileDisplayName = history.getFile_display_name();
							%>
							<tr>
                              <td><%=historyTime%></td>
                              <td><%=fileDisplayName%></td>
                              <td><%=historyContent%></td>
                               <td><a href="fileDetail.jsp?fileId=<%=fileId %>"><img src="images/star.png"></a></td> 
                              <td><input name="deleteHistory" type="checkbox" value="<%=historyId%>" /></td>
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
                              <td></td>
                            </tr>
       	 </table>
      	   <div  class="num" id="num" >
      	   <% 
             		if(allpages>1){
             		%>
               	   <a href="userHistory.jsp?pages=<%=currpage - 1%>" class="gray">&lt;</a>
               	   <!-- <span id="a1 " class="gray">&lt;</span> -->
               	 <% 
           				for(int i=1;i<=allpages;i++)
             			{
            	 %>
            	 <a href="userHistory.jsp?pages=<%=i%>"
            	<%if(currpage==i){%>
            	 class="yellow"
            	 <% }else{ %> 
            	 class="gray"
            	 <%} %> ><%=i %></a>
                 <%
           			  
           			  }
            	 %>
                 <a href="userHistory.jsp?pages=<%=currpage + 1%>" class="gray">&gt;</a>
                  <%
           			  
           			  }
            	 %>
                      </div>
              <input type="submit" class="sure" name="sure" value="" />
         </form>
      
   </div>  
  </div>
  
  
</div>
<div class="bgcolor bottom"></div>



</body>
</html>

