<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号修改</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/bottom.js"></script>

<script type="text/javascript"><!--

function delButton2()
{
	//document.getElementById("myform2").action=、、、、
	document.getElementById("form2").submit();
	
}
function delButton1()
{
	//document.getElementById("myform2").action=、、、、
	document.getElementById("form1").submit();
	
}

jQuery(function ($){	
			function stopDefault(event) { 
			e= (event||window.event);
			if (e && e.preventDefault){//如果是FF下执行这个
				e.preventDefault();
			}else{
				e.returnValue = false;//如果是IE下执行这个
			}
			return false;
			}
			
					
			$("#form1").submit(function(e){					
					var zhang=$("#zhang").val();
					
				//	stopDefault(e);
					if(zhang)
					{	
					}else{
					//	alert("账号不能为空");
					$(".error").text(" 账号不能为空！！！").show();
					stopDefault(e);
						}							
			});
				
			
				$("#form2").submit(function(e){	
							var newpsd =$("#newpsd").val(),
								sure_newpsd=$("#sure_newpsd").val();
					if(newpsd&&sure_newpsd)
					{
						
							if(newpsd!=sure_newpsd)
							{
								$(".nosame").show();
								stopDefault(e);
							}
					}else{
						alert("密码不能为空");						
						stopDefault(e);
						}								
								
				});
			$("#sure_newpsd").focus(function(e){
									   
							$(".nosame").hide();		   
									   
								});	
				
				
});


--></script>

<style type="text/css">
<!--
.special{
	background: url(images/home.png);
}
.frame {
	margin-top: 20px;
	height: 411px;
	width: 855px;
	margin-right: auto;
	margin-left: auto;
	background-image: url(images/frame1.png);
	padding-top: 20px;
}
.frame ._ban {
	height: 50px;
	width: 131px;
	margin-left: -6px;
	background-image: url(images/ch_passwd.png);
}
.frame .content .line #ch_bt {
	background-image: url(images/yes.png);
	height: 23px;
	width: 80px;
	margin-left: 10px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	cursor:pointer;
	display: block;
	float: left;
	margin-top: 2px;
}
.frame .content .line .num {
	/*<!--line-height: 23px;-->*/
	height: 23px;
	width: 180px;
	display: block;
	float: left;
}
.frame .content .mes .changeline .jueshe {
	font-size: 14px;
	color: #666;
	text-align: right;
	display: inline;
}
.frame .content .mes .changeline .zhanghao {
	font-size: 14px;
	color: #666;
	display: inline;
}
.frame .content .mes .changeline .mima {
	font-size: 14px;
	color: #666;
	text-align: right;
	display: inline;
}
.frame .content .changeline {
	margin-top: 10px;
}
.frame .content .mes {
	font-size: 14px;
	color: #666;
	border-top-width: 3px;
	border-bottom-width: 3px;
	border-top-style: dashed;
	border-bottom-style: dashed;
	width: 400px;
	margin-top: 20px;
	padding-top: 15px;
	padding-bottom: 15px;
}
.frame .content .mima_ch {
	margin-top: 20px;
}
.frame .content {
	margin-left: 40px;
	font-size: 14px;
	color: #666;
	margin-top: 15px;
}
.frame .content .line .error {
	color: #990000;
	margin-left: 10px;
	margin-top: 3px;
	float: left;
	display: none;
}
.frame .content .line .font {
	float: left;
	margin-top: 3px;
}
.frame .content .line {
	height: 25px;
}
.frame .content .mima_ch .new .newpsd {
	float: left;
	margin-left: 60px;
	line-height: 23px;
	width:100px;
	text-align:right;
}
.frame .content .ch_box .mima_ch .new {
	margin-bottom: 10px;
}
.frame .content .mima_ch #bt2 {
	background-image: url(images/yes.png);
	height: 23px;
	width: 80px;
	margin-top: 20px;
	margin-left: 60px;
	cursor: pointer;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
}
.frame .content .ch_box {
	/*display:none;*/
}
.frame .content .mima_ch .new .newmima {
	height: 23px;
	width: 180px;
}
.frame .content .ch_box .mima_ch .new .suremima {
	display: block;
	margin-bottom: 0px;
}
.frame .content .ch_box .mima_ch .new.mar_bt0 {
	margin-bottom: 0px;
}
.nosame{
	color: #990000;
	margin-left: 10px;
	float:right;
	margin-right:390px;
	margin-top:-20px;
	display:none;
}
-->
</style>
</head>

<body>
<!--head-->
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
                 <span class=""><%=a.getAdmin_name() %> </span> |
           		 <span><a href="adminPassword.jsp">密码修改</a></span>
         		 <span><a class="exit" href="AllUserServlet?status=out">退出</a></span>
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
             <li class="myli "><a href="deleteUser.jsp">帐号删除</a></li>
             <li class="myli"><a href="addUser.jsp">帐号添加</a></li>  
             <li class="myli special"><a href="updateUser.jsp">帐号修改</a></li>
        </ul>
           </div>
 </div>
 <!--middle-->
 <div class="frame">
   <div class="_ban"></div>
        <div class="content">
           <div class="line">
				<form action="UserServlet?status=updateUser" method="post" id="form1">
                        <div class="font">请输入要修改的帐号：</div>
                        <input  type="text" name="id" class="num"  maxlength="20" value="" id="zhang"/>
                        <input type="submit"  id="ch_bt" class="ch_bt" value=""  />
                        <div class="error">账号错误</div>
                        <%
                         	String error=null;
                        	error=(String)request.getAttribute("errors");
							if(error!=null||error!=""){
						%>                                        
                       <!--<p><%=error %></p>  --> 
                  
                        <%}else{} %>	
                       
                   </form>
          	</div>
          
          		<%
					User u = (User) session.getAttribute("users");
					if(u==null){
						System.out.println("u=null");
					}
 		   			if(u!=null){	
 		   			
				%>
                <form action="UserServlet?status=changePassword&identitys=admin" method="post" id="form2">
                <div class="ch_box">
              		<div class="mes">
                    	<div class="changeline" style="margin-top:0px;">
                            <div class="jueshe" >角色：</div><span id=""><%=u.getUser_identity() %></span>   
                        </div>
                    <div class="changeline">                 
                    	<div class="zhanghao">账号：</div><span id=""><%=u.getUser_id() %></span>  
                    </div>
                    <div class="changeline">
                        <div class="mima" >密码：</div><span id=""><%=u.getUser_password() %></span>  
                    </div>
                  	</div>
          			<div class="mima_ch">
                  		<div class="newfont">密码修改</div>
                  	<div class="new">
                       	<div class="newpsd">新密码：</div><input type="password" name="password1" maxlength="20" class="newmima" id="newpsd" />  
            		</div> 
    				<div class="new mar_bt0">       
                      	<div class="newpsd">确定密码：</div><input type="password" name="password2" maxlength="20" class="suremima newmima"  id="sure_newpsd"/>
                      	<label class="nosame">密码不一致</label>                  
            		</div>  	  
					<input type="button" onclick="delButton2();" class="bt2" id="bt2"   value=""/>      
						 </div>
          			</div>
		  		</form>
		  		<% 
        			}
        		%>
   </div>
 </div>
<!--footet-->
<div class="bgcolor bottom"></div>
</body>
</html>

