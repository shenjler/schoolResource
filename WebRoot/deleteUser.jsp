<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号删除</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/checkAll.js"></script>
<script type="text/javascript" src="js/delUser.js"></script>
 <script type="text/javascript" src="js/chooseNum.js"></script> 
<link href="css/delUser.css" rel="stylesheet" type="text/css" />
<script  language="JavaScript">

function delButton2()
{
	//document.getElementById("myform2").action=、、、、
	document.getElementById("myform2").submit();
	
}
function delButton1()
{
	//document.getElementById("myform2").action=、、、、
	document.getElementById("myform1").submit();
	
}
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
					Admin a = (Admin) session.getAttribute("admins");
 		   			if(a!=null){
				%>
                    <span>你好,</span>
                  <span class=""><%=a.getAdmin_name()%></span> | 
                    <span><a href="ad_psd_change.html">密码修改</a></span>
                  <span><a class="exit" href="login.html">退出</a></span>
                <% 
        			}
      		  	%>
              </div>
                <div class="seach_box">
                <form action="" method="post" name="content" >
                  <input  type="text" class="box"  maxlength="20" />
                  <input  type="submit" class="bt" href="#" value=""/>
                </form>
                </div>
            </div> 
        </div>
        
        <!--导航-->
                    <div class="avr">
   					 <ul class="list">
                        <li class="myli "><a href="admin.jsp">首页</a></li>
                        <li class="myli"><a href="adminHistory.jsp">历史记录</a></li>
                        <li class="myli special"><a href="deleteUser.jsp">帐号删除</a></li>
                        <li class="myli"><a href="addUser.jsp">帐号添加</a></li>  
                        <li class="myli"><a href="updateUser.jsp">帐号修改</a></li>
                        </ul>
       </div>
        </div>
<!--中间部分-->
		<div class="frame">
    	<!--stu-->
      <div class="stu">
      		 <div class="stu_icon tab"></div>
      	<%
  		//编码转换
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8"); 
		UserDAO udStu=new UserDAOImpl();
		
		//统计总记录数
		int allcount1=0;//总记录数
		allcount1=udStu.findUserCount("学生");
		//设置每一页要显示多少条记录
		int everpage1=7;//每页显示17条记录
		int r=0;
		int allpages1=0;//总页数 
		r=allcount1%everpage1;
		if(r==0){
			allpages1=allcount1/everpage1;
		}else{
			allpages1=allcount1/everpage1+1;
		}
		//当前是哪一页
		String pages1=null;
		pages1=request.getParameter("pages1");
		int currpage1=0;//当前页
		if(pages1==null){
			currpage1=1;
		}else{
			currpage1=Integer.parseInt(pages1);
			if(currpage1<1){
				currpage1=1;
			}
			if(currpage1>allpages1){
				currpage1=allpages1;
			}
		}
		User student= new User();
		student.setUser_identity("学生");
		List<User> allStu=udStu.queryAllUser(currpage1,everpage1, student);
	%> 	 
        <form name="myform" action="UserServlet?status=delete" method="post" id="myform1">       	
       	<table width="800" border="1" class="tb">
              <tr class="firstTr">
                <td>身份</td>
                <td>帐号</td>
                <td>操作</td>
                <td>全部<input type="checkbox"  id="chAll"  name='chAll'  onclick='CheckAll(this.form)' /></td>
              </tr>

					<%              
                			  		if(allStu!=null){
 										for(int i=0;i<allStu.size();i++){
 					 						User stu=allStu.get(i);
 					 						int stuId=stu.getUser_id();			

           			%>

					<tr>
                <td>学生</td>
                <td><%=stuId %></td>
                <td>删除</td>
                <td><input type="checkbox" value="<%=stuId %>" name="deleteUser"  id="stu1"  /></td>
              </tr>
             <%} 
             }
             %>
             
            </table>
			  <div  class="num choose1" id="num" >    
			      <a href="deleteUser.jsp?pages1=<%=currpage1-1%>" class="gray">&lt;</a>
               	   <!-- <span id="a1 " class="gray">&lt;</span> -->
               	 <% 
             		if(allpages1>1){
           				for(int i=1;i<=allpages1;i++)
             			{
            	 %>
            	 <a href="deleteUser.jsp?pages1=<%=i%>" 
            	<%if(currpage1==i){%>
            	 class="yellow"
            	 <% }else{ %> 
            	 class="gray"
            	 <%} %> ><%=i %></a>
                 <%
           			  }
           			  }
            	 %>
                 <a href="deleteUser.jsp?pages1=<%=currpage1+1%>" class="gray">&gt;</a>
      
               
              </div>
              <input type="button" onclick="delButton1();" class="sure" name="sure" value="" />
            </form>
        </div>
        <!--teach-->
   	  	<div class="stu">
      		 <div class="teach_icon tab"></div>
      		 <%
  		//编码转换
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8"); 
		UserDAO udTea=new UserDAOImpl();
		
		//统计总记录数
		int allcount2=0;//总记录数
		allcount2=udTea.findUserCount("老师");
		//设置每一页要显示多少条记录
		int everpage2=7;//每页显示17条记录
		int r2=0;
		int allpages2=0;//总页数 
		r2=allcount2%everpage2;
		if(r2==0){
			allpages2=allcount2/everpage2;
		}else{
			allpages2=allcount2/everpage2+1;
		}
		//当前是哪一页
		String pages2=null;
		pages2=request.getParameter("pages2");
		int currpage2=0;//当前页
		if(pages2==null){
			currpage2=1;
		}else{
			currpage2=Integer.parseInt(pages2);
			if(currpage2<1){
				currpage2=1;
			}
			if(currpage2>allpages2){
				currpage2=allpages2;
			}
		}
		User teacher= new User();
		teacher.setUser_identity("老师");
		List<User> allTea=udTea.queryAllUser(currpage2,everpage2, teacher);
	%> 	 
        <form name="myform2" action="UserServlet?status=delete" method="post" id="myform2">       	
       	<table width="800" border="1" class="tb">
              <tr class="firstTr">
                <td>身份</td>
                <td>帐号</td>
                <td>操作</td>
                <td>全部<input type="checkbox"  id="chAll"  name='chAll'  onclick='CheckAll(this.form)'  /></td>
              </tr>
              <%              
                			  		if(allTea!=null){
 										for(int j=0;j<allTea.size();j++){
 					 						User tea=allTea.get(j);
 					 						int teaId=tea.getUser_id();			

           			%>
              <tr>
                <td>老师</td>
                <td><%=teaId %></td>
                <td>删除</td>
                <td><input type="checkbox"  value="<%=teaId %>" name="deleteUser" id=""  /></td>
              </tr>
             <%} 
             }
             %>
             
            </table>
			  <div  class="num choose2 " id="num" >
               	 <a href="deleteUser.jsp?pages2=<%=currpage2-1%>" class="gray">&lt;</a>
               	   <!-- <span id="a1 " class="gray">&lt;</span> -->
               	 <% 
             		if(allpages2>1){
           				for(int i=1;i<=allpages2;i++)
             			{
            	 %>
            	 <a href="deleteUser.jsp?pages2=<%=i%>" 
            	<%if(currpage2==i){%>
            	 class="yellow"
            	 <% }else{ %> 
            	 class="gray"
            	 <%} %> ><%=i %></a>
                 <%
           			  }
           			  }
            	 %>
                 <a href="deleteUser.jsp?pages2=<%=currpage2+1%>" class="gray">&gt;</a>
      
              </div>
            <!-- <input type="submit" class="sure" name="sure" value="" /> -->  
               <input  type="button" onclick="delButton2();" class="sure" name="sure" value="" />
              
            </form>
        </div>
    
    
    </div>
    <!--底部-->
<div class="bgcolor bottom"></div>
</body>
</html>
