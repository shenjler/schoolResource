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
<script type="text/javascript" src="js/chooseNum.js"></script>
<title>搜索</title>
<style type="text/css" >
.frame {
	background-image: url(images/seach_bg.png);
	margin-top: 20px;
	background-repeat: no-repeat;
	height: 837px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 20px;
}
.frame .se_ban .result .b {
	color: #333333;
	float: left;
}
.frame .seachlab {
	background-image: url(images/seachLab.png);
	height: 50px;
	width: 129px;
	margin-left: -7px;
	float: left;
}
.frame .small_bg .right_info .firstLine .download_icon {
	background-image: url(images/dowmload_icon.png);
	float: right;
	height: 23px;
	width: 47px;
	margin-top: -20px;
}
.frame .small_bg .right_info .firstLine a .update {
	background-image: url(images/update.png);
	height: 23px;
	width: 47px;
	margin-top: -20px;
	float: right;
}
.frame .small_bg .right_info .firstLine a .del {
	background-image: url(images/del.png);
	height: 23px;
	width: 47px;
	margin-top: -20px;
	float: right;
}
.frame .se_ban .seachlab {
	margin-left: -5px;
}



.bottom {
	/*margin-top: 100px;*/
}
.frame .small_bg {
	background-image: url(images/se_small_bg.png);
	height: 206px;
	width: 795px;
	margin-top: 10px;
	margin-left: 30px;
	float: none;
	padding-top: 20px;
}
.frame .result {
	float: left;
	width:300px;
	margin-top: 10px;
	margin-left: 10px;
}
.frame .small_bg .left_img {
	background-image: url(images/ppt.png);
	float: left;
	height: 137px;
	width: 204px;
	margin-left: 20px;
	margin-right: 20px;
}
.frame .small_bg .right_info {
	float: left;
	padding-right: 10px;
	font-size: 14px;
	width: 530px;
	margin-top: 0px;
	line-height: 24px;
}

.frame .se_ban {
	height: 50px;
	width: 100%;
}
.frame .se_ban .result .col6.a {
	color: #666666;
	float: left;
}
 .col6 {
	color: #666666;
}
 .col3 {
	color: #333333;	
}
.relocate{
	margin-right:50px;
	}
td{
	border:#CECECE solid 1px;
	border-bottom:none;
	border-top:none;
	color:#666666;
	text-align:center;
	font-size:12px;
	padding-top: 5px;
	padding-right: 55px;
	padding-bottom: 5px;
	padding-left: 55px;
	}
.firsttr td,.last td{
	margin-left:25px;
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
	.table{
	margin-left:30px;
	margin-top:10px;
	margin-bottom:10px;
	padding:0px;
	}
</style>
</head>

<body>
<div class="top bgcolor ">

<div class="ban">
	<!--文字GDPU-->
    <div class="gdpu">
    </div>
    
    <!--搜索-->
    <div class="seach" >
    	<div class="word">
    	<%
       		 //编码转换
        	request.setCharacterEncoding("utf-8");
        	response.setCharacterEncoding("utf-8");
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
 <%
 		String search=request.getParameter("search");
      	FileSearchDAO fsd = new FileSearchDAOImpl();

      	//统计总记录数
      	int allcount = 0;//总记录数
      	allcount = fsd.findFileSearchCount(search);
      	//设置每一页要显示多少条记录
      	int everpage = 7;//每页显示17条记录
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

      	List<FileSearch> fileLike =null;
      	fileLike=fsd.queryByLike(currpage, everpage,search);
      %>
<!--中间部分-->
<div class="frame">
  <div class="se_ban">
<div class="seachlab"></div>
            <div class="result">
           	  <div class="col6 a">搜索：</div><div class="b" id="enter"><%=search %></div>
           </div>
  </div>
		
 	 <div class="table"> 
<table >
                            <tr class="firsttr" >
                              <td>文件名称</td>
                              <td>学院</td>
                              <td>课程</td>
                              <td>查看</td>
                              <td>下载</td>               
                            </tr>
                            <%
	
		if (fileLike != null) {
			for (int i = 0; i < fileLike.size(); i++) {
				FileSearch f= fileLike.get(i);
				int fileId=f.getFile_id();
				String fileDisplayName=f.getFile_display_name();
				String collegeName=f.getCollege_name();
				String courseName=f.getCourse_name();
		
%>
                            <tr>
                              <td><%=fileDisplayName %></td>
                              <td><%=collegeName %></td>
                              <td><%=courseName %></td>
                              <td><a href="xingong1.html"><img src="images/star.png" alt="查看" /></a></td>
                              <td><a href="#"><img src="images/download.png" alt="" /></a></td>  
                            </tr>
                            <%
                            	}
			}
		
                             
                            %>              
                      
							<tr  class="last">
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>  
                            </tr>    
       	 </table>
         	<div class="relocate">
        	  <div  class="num near" id="num" >
        	  
                  <a href="fileSearch.jsp?pages=<%=currpage - 1%>&search=<%=search %>" class="gray">&lt;</a>
               	   <!-- <span id="a1 " class="gray">&lt;</span> -->
               	 <% 
             		if(allpages>1){
           				for(int i=1;i<=allpages;i++)
             			{
            	 %>
            	 <a href="fileSearch.jsp?pages=<%=i%>&search=<%=search %>"
            	<%if(currpage==i){%>
            	 class="yellow"
            	 <% }else{ %> 
            	 class="gray"
            	 <%} %> ><%=i %></a>
                 <%
           			  }
           			  }
            	 %>
                 <a href="fileSearch.jsp?pages=<%=currpage + 1%>&search=<%=search %>" class="gray">&gt;</a>
                      </div>
             </div>
      </div>  
      
</div>

<div class="bgcolor bottom"></div>


</body>
</html>
