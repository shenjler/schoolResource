<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学院</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<link href="css/Num.css" rel="stylesheet" type="text/css" />
<link href="css/left_nav.css" rel="stylesheet" type="text/css" />
<link href="css/xueyuanTable.css" rel="stylesheet" type="text/css" />
<script   type="text/javascript"src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/chooseNum.js"></script>
<script type="text/javascript" src="js/left_nav.js"></script>
<style type="text/css">
<!--
.image1{
	background-image: url(images/xingongLab.png);
	}
-->
</style>

<script type="text/javascript">

jQuery(function($){
		$(" .leftGrade ul li").mouseover(function(){	
			$(this).css({"background":"#FFF","color":"#666666"}).children(".zhuanYe_frame").show().end().siblings().children(".zhuanYe_frame").hide().end();		
						
	}).mouseout(function(){
				$(this).children(".zhuanYe_frame").hide().end();			
				$(this).css({"background":"#666666","color":"#fff"});
		});
/*	
$(".zhuanYe_frame").mouseover(function(){	
						$(this).show();					   
											   
						}).mouseout(function(){
							
							$(this).hide();		
							
							});*/
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
        <form action="" method="post" name="content" >
          <input  type="text" class="box"  maxlength="20" />
         <input  type="submit" class="bt"  value=""/>
        </form>
        </div>
    </div>
</div>
<%
	String id=request.getParameter("collegeLiId");
	int collegeLiId = 0;
	String collegeLiName=null;
	if (id != null) {
		collegeLiId = Integer.parseInt(id);
		CcgcDAO cd = new CcgcDAOImpl();
		collegeLiName=cd.queryCollegeName(collegeLiId);
	}
%>
<!--导航-->
            <div class="avr">
              <ul class="list">
            	  	<li class="myli"><a href="index.jsp">首页</a></li>
					<%
						if (collegeLiId == 801) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=801">信工学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=801">信工学院</a>
					</li>
					<%
						}
					%>
					<%
						if (collegeLiId == 802) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=802">化工学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=802">化工学院</a>
					</li>
					<%
						}
					%>
					<%
						if (collegeLiId == 803) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=803">药科学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=803">药科学院</a>
					</li>
					<%
						}
					%>
					<%
						if (collegeLiId == 804) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=804">商学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=804">商学院</a>
					</li>
					<%
						}
					%>
					<%
						if (collegeLiId == 805) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=805">食科学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=805">食科学院</a>
					</li>
					<%
						}
					%>
					<%
						if (collegeLiId == 806) {
					%>
					<li class="myli special">
						<a href="college1.jsp?collegeLiId=806">中药学院</a>
					</li>
					<%
						} else {
					%>
					<li class="myli">
						<a href="college1.jsp?collegeLiId=806">中药学院</a>
					</li>
					<%
						}
					%>

                        <li class="myli"><a href="userHistory.jsp">历史记录</a></li>
      					<%
      						if (u.getUser_identity().equals("老师")) {
      					%>
      					
      					<li class="myli "><a href="uploadFile.jsp">上传文件</a></li>
      					<%
      						}
      					%>
              </ul>
            </div>
</div>
<!--中间部份-->

<div class="frame">
<div class="xg_ban">
      <div class="xgLab image1"></div>
    <div class="result">
                  <div class="col6 noblock">你当前的位置：</div><label  class="academy"><%=collegeLiName %></label>
    </div>
  </div>
  <div class="middle">
       <!--中间左边-->
    <div class="left">
                    <div class="leftGrade">
						<ul >
                        <%
                        	CcgcDAO ad = new CcgcDAOImpl();
                        	List<Ccgc> grade = ad.queryGrade(collegeLiId);
                        	if (grade != null) {
                        		for (int i = 0; i < grade.size(); i++) {
                        			Ccgc g = grade.get(i);
                        			int gradeId = g.getGrade_id();
                        			String gradeName = g.getGrade_name();
                        %>
						 <li class="firstli same "><%=gradeName%><label></label>&gt;
                               <div class="zhuanYe_frame">
                              
                              	<%
                                                            		List<Ccgc> classes = ad.queryClass(collegeLiId, gradeId);
                                                            				if (classes != null) {
                                                            					for (int j = 0; j < classes.size(); j++) {
                                                            						Ccgc cl = classes.get(j);
                                                            						int classId = cl.getClass_id();
                                                            						String className = cl.getClass_name();
                                                            	%>
                                          <div class="major">                                         
               		     				 				<div class="major_left"><%=className%></div>
                                                	   	<div class="major_right">

											<%
												List<Ccgc> course = ad.queryCourse(collegeLiId,
																		gradeId, classId);
																if (course != null) {
																	for (int k = 0; k < course.size(); k++) {
																		Ccgc co = course.get(k);
																		int courseId = co.getCourse_id();
																		String courseName = co.getCourse_name();
																		int ccgcId = co.getCcgc_id();
											%>


											<a href="college2.jsp?courseId=<%=courseId%>&collegeLiId=<%=collegeLiId %>" ><%=courseName%></a>
                                                    <!-- <a href="xinGong2.html" class="f_a">C语言</a> -->
                                        <%
                                        	}
                                        					}
                                        %>
                                             </div>                  
               	 	  		   			</div>
                         		<%
                         			}
                         					}
                         		%>                    
                                 </div>
                             </li>
                       <%
                       	}
                       	}
                       %>        
                      </ul>
	  </div>    
    </div>
   
   <%
      	FileSearchDAO fsd = new FileSearchDAOImpl();

      	//统计总记录数
      	int allcount = 0;//总记录数
      	allcount = fsd.findCollegeFileCount(collegeLiId);
      	//设置每一页要显示多少条记录
      	int everpage = 21;//每页显示17条记录
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

      	List<FileSearch> all = fsd.queryByCollege(currpage, everpage,
      			collegeLiId);
      %>
    <!--中间右边-->
    	<div class="right">
                        
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
								if (all != null) {
									for (int i = 0; i < all.size(); i++) {
										FileSearch fs = all.get(i);
										int fileId = fs.getFile_id();
										String fileDisplayName = fs.getFile_display_name();
										String college_name = fs.getCollege_name();
										String course_name = fs.getCourse_name();
							%>
							<tr>
                                       <td><%=fileDisplayName%></td>
                                      <td><%=college_name%></td>
                                      <td><%=course_name%></td>
                                      <td><a href="fileDetail.jsp?fileId=<%=fileId %>"><img src="images/star.png" alt="查看" /></a></td>
                                      <td><a href="FileDownServlet?file_id=<%=fileId%>"><img src="images/download.png" alt="" /></a></td>  
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
                 
                  <div  class="num near" id="num" >
                      <a href="college1.jsp?pages=<%=currpage - 1%>&collegeLiId=<%=collegeLiId %>" class="gray">&lt;</a>
               	   <!-- <span id="a1 " class="gray">&lt;</span> -->
               	 <% 
             		if(allpages>1){
           				for(int i=1;i<=allpages;i++)
             			{
            	 %>
            	 <a href="college1.jsp?pages=<%=i%>&collegeLiId=<%=collegeLiId %>"
            	<%if(currpage==i){%>
            	 class="yellow"
            	 <% }else{ %> 
            	 class="gray"
            	 <%} %> ><%=i %></a>
                 <%
           			  }
           			  }
            	 %>
                 <a href="college1.jsp?pages=<%=currpage + 1%>&collegeLiId=<%=collegeLiId %>" class="gray">&gt;</a>
                      </div>
  
                      
              </div>  
         

        </div>
</div>
    <!--中间结束-->
    
 </div>
 <div class="bgcolor bottom"></div>     
</body>
</html>

