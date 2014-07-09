<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>

<link rel="stylesheet" type="text/css" href="css/all.css"/>
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/dnd.js" ></script>
<script type="text/javascript" src="js/base.js" ></script>
<script type="text/javascript" src="js/pop_window.js" ></script>
<link rel="stylesheet" type="text/css" href="css/base.css"/>


<script type="text/javascript">

jQuery(function ($){	
		 <% String error=(String)request.getAttribute("errors");
			if(error!=null){%>
			var error=null;
			error="<%=error %>";
					<%} %>
	document.body.appendChild(PopWindow.mask);
	
	var bg=$(".bg").get(0);
	var moveCenter=(function  (){
							  
		  var mtop=($(document).height()-630)/2,
		  mleft=($(document).width()-960)/2;
		  $(".bg").offset({ top: mtop, left: mleft });
	});
	moveCenter();
	$(window).resize(function(){
		  //alert("Stop it!");
		moveCenter();
	});

	 

	var bt=$("#bt");	
	bt.mousedown(function(){				
				bt.removeClass("a");
					bt.addClass("b");
				}).mouseup(function(){
					bt.removeClass("b");
					bt.addClass("a");
					
				});
		function stopDefault(event) { 
			e= (event||window.event);
			if (e && e.preventDefault){//如果是FF下执行这个
			e.preventDefault();
			}else{
			e.returnValue = false;//如果是IE下执行这个
			}
			return false;
			}
		$(".window").css({"display":"block"});
			var winText=$(".window").get(0);
			
	var mywin=new PopWindow({
				title:"错误信息",
				content:winText,
				movable:"true",
				width:440,
				height:180,
				mask:true,
				resizable	:false,
				maximizable: false,
				
			});
			//alert(error);
		if(error!="")
		{
			
			if(error=="用户不存在")
			{
				//alert(error);
				//mywin.toggleVisible();
				$(".failFont").text("用户不存在，请重新输入。");
				mywin.toggleVisible();	
			
			}else if(error=="密码不正确")
			{
				//alert(error);
			$(".failFont").text("密码不正确，请重新输入。");
				mywin.toggleVisible();	
			
			}
		}else{
		alert("aaa");
		
		}
	
	
	
	
 });
</script>



<style type="text/css">
<!--
.bg {
	background-image: url(images/bgphoto.png);
	height: 600px;
	width: 960px;
	margin-right: auto;
	margin-left: auto;
	position: relative;
}
.bg form {
	position: absolute;
	left: 140px;
	top: 430px;
	width: 670px;
}

.bg form .xuehao {
	background-image: url(images/xuehao.png);
	height: 25px;
	width: 53px;
	float: left;
	margin-top: 5px;
}
.bg form .ti_jiao {
	height: 43px;
	width: 80px;
	margin-top: 10px;
	border:  medium none;
	cursor:pointer;
	margin-left:575px;
	display:block;
	cursor:pointer;
}
.bg form p .choose {
	display: block;
	float: left;
}
.bg form .mima {
	background-image: url(images/mima.png);
	height: 25px;
	width: 52px;
	float: left;
	margin-top: 5px;
	margin-left: 3px;
}
.bg form .jueshe {
	background-image: url(images/jueShe.png);
	float: left;
	height: 25px;
	width: 52px;
	margin-top: 5px;
	margin-left: 3px;
}
.bg form input {
	display: block;
	float:left;
}
.space{
	line-height:33px;
	width: 164px;
	height:33px;
	display: block;
	float: left;
}

.bg #form1 .box .sel {
	font-weight:normal;
	font-size: 16px;
	vertical-align: bottom;
	padding:10px;

}
.bg #form1 .box .ch {
	font-weight:normal;
	padding:5px 0;
	height: 33px;
	width: 164px;
	font-size: 16px;
	vertical-align:bottom;

	
	
}
.box
{
	height:33px;
	line-height:27px;
	padding-top: 2px;
	display:inline-block;
	
}
.a{
	background-image: url(images/a.png);
	
}
.b{
	background-image: url(images/b.png);
	
}
/*.window .success {
	background-image: url(images/success.png);
	float: left;
	height: 37px;
	width: 46px;
	display: block;
}*/
.window .fail {
	background-image: url(images/fail.png);
	float: left;
	height: 40px;
	width: 40px;
	display: block;
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
 .window {
	 display:none;
	height: 50px;
	width: auto;
	margin-top: 40px;
	margin-left: 30px;
}

 .window .mess .failFont {
	display: block;
	font-size: 14px;
	color: #333333;
}

-->
</style>
</head>

<body>
<div class="bg">
  <form name="form1" id="form1" action="AllUserServlet?status=check" method="post" name="login" >
	    <div class="xuehao"></div>
            <input type="text"  name="id" class="space"  id="xuehao" maxlength="10"  />
            <div  class="mima"></div>
        <input type="password" name="password" class="space" id="mima" maxlength="12" />
            <div  class="jueshe"></div>
            <div class="box">
              <select name="identity"  class="choose ch" id="juese">
                    <option  class="sel" name="student">学生</option>
                    <option  class="sel" name="teacher">老师</option>
                    <option class="sel"  name="admin">管理员</option>
              </select>
    	  </div>
    	   <a class="ti_jiao a" id="bt" onclick="javascript:document.getElementById('form1').submit();"></a>
        <!--   <a href="#"  onclick="javascript:document.getElementById('detailForm').submit();" ></a>
		<div id="example" href="" ><input class="ti_jiao a" type="submit" value=""  id="bt" /></div>
		-->
  </form>
</div>
 	<div class="window">
	<div class="fail" id="tips"></div>
            <div class="mess">      
              <p  class="failFont"></p>   
            </div>
    </div>
</body>
</html>
