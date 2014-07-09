<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.resource.vo.*" %>
<%@ page import="com.resource.servlet.*" %>
<%@ page import="com.resource.dao.*" %>
<%@ page import="com.resource.dao.impl.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件</title>
<link href="css/head.css"  rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/left_nav.css"/>
<script   type="text/javascript"src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/left_nav.js"></script>
<link href="css/reply.css" rel="stylesheet" type="text/css" />
<link href="css/ppt_intr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/reply.js"></script> 

<link rel="stylesheet" type="text/css" href="css/upload.css"/>
<script type="text/javascript" src="js/upload.js"></script>
<script type="text/javascript">
jQuery(function($){
		var	Height=$(window).height()
				Width=$(window).width();
				
		var winHeight=$(".win1 .middle ").height(),
	      winWidth=$(".win1 .middle ").width();
	// alert("Height=  "+ winHeight+" Width= "+winWidth);
		$(".update_icon").click(function(){
     	  var  myleft =Math.abs((Width-631)/2);
		   var	 mytop=Math.abs((Height-448)/2);
				// alert("left="+myleft+"  top="+mytop);
				 // $("#update").css({top:"mytop",left:"myleft"});
				/* $("#update").offset({top:mytop,left:0});	*/
				//$("#update").offset({top:mytop, left :myleft });	
				$(".win1 .masker").show();
				$(".win1 .middle").show();
				
				});
		 $(".close").click(function(){
				$(".win1 .masker").hide();
				$(".win1 .middle").hide();
						});
		 $(".delete_icon").click(function(){
					$(".win1 .masker").show();	
					$(".win1 .mydel").show();
										  
							});
		  $("#no").click(function(){
					$(".win1 .masker").hide();	
					$(".win1 .mydel").hide();
										  
							});
		// $(".win1 .masker").show();
	//	$(".win1 .middle").show();
	
	// JavaScript Document
function gbcount(message) 
		{ 
			var max; 
			max =80; 
			var used=$("#used");
			if (message.value.length > max) { 
			message.value = message.value.substring(0,max); 
			used.text(max); 
			//alert("简介不能超过 80 个字!"); 
		} 
		else { 
			var used=$("#used");
			used.text(message.value.length); 
			//alert(used.text());
			} 
		} 

        var zhongYao=["中药学"," 中药制药 "," 中药学(中药分析与鉴定) "," 中药资源与开发"];
        var xinGong=["计算机科学与技术(医学应用)"," 计算机科学与技术(动漫程序设计)","电子信息工程","信息管理与信息系统"];
        var shiPin=["食品质量与安全","食品科学与工程"];
        var huaGong=["化学工程与工艺 ","高分子材料与工程 "," 应用化学(精细化工)"," 应用化学(化妆品科学与技术)"];
        var  shangXue=[" 公共事业管理(卫生事业管理)"," 人力资源管理(医药人力资源管理)"," 电子商务(药品电子商务) ","物流管理(国际医药物流管理)"," 市场营销(医药营销)"];
        var  yaoKe=["药学"," 药学(药物分析)"," 药事管理"," 药事管理(医药贸易)","药物化学","制药工程","药物制剂","药物制剂(天然药物制剂)","临床药学"];
		function makeOptions(start,sel,arr) {
		var opt;
		for (var i=start;i<=arr.length-1;i++) {
			opt = new Option(arr[i],i);
			//alert("aa");
			sel.options[sel.options.length]= opt;
		}
	}
				var majors=$("#majors");
				$("#majors");
			makeOptions(0,majors.get(0),xinGong);
     	 	$("#xueyuan").change( function() {
				var xueyuan=$("#xueyuan").get(0);
				var txt = xueyuan.options[xueyuan.selectedIndex].text;				   
				if(txt=="信工学院")
				{
					//alert(txt);
					$("#majors option").remove();
					makeOptions(0,majors.get(0),xinGong);
					//alert("信工学院"); 
				}else if(txt=="化工学院")
					{
						
						$("#majors option").remove();
						makeOptions(0,majors.get(0),huaGong);
						//alert("化工学院"); 
					}
					else if(txt=="药科学院")
					{
						$("#majors option").remove();
						makeOptions(0,majors.get(0),yaoKe);
					//alert("药科学院"); 
					}else if(txt=="商学院")
					{
						$("#majors option").remove();
						makeOptions(0,majors.get(0),shangXue);
							//alert("商学院"); 
					}else if(txt=="食科学院")
					{
						$("#majors option").remove();
						makeOptions(0,majors.get(0),shiPin);
					//	alert("食科学院"); 
					}	
					else if(txt=="中药学院")
					{
						$("#majors option").remove();
					makeOptions(0,majors.get(0),zhongYao);
						//alert("中药学院"); 
					
					}	
				});
			
		var mytext=$("#mytext");
		$("#mytext").focus(function(){
						
						if(mytext.val()=="谈谈课程的简介吧。。。")		
						{
						$("#mytext").val("").css({color:"#333"});	
						
						}
						
									
									
					});
	$("#mytext").blur(function(){
							  // alert(mytext.get(0).value.length);
						if(mytext.val().length==0)
						{
						$("#mytext").val("谈谈课程的简介吧。。。").css({color:"#ccc"});	
						}			
					
					
					});

	

});



</script>

<style type="text/css">
<!--
.frame{
	/*position:relative;*/
	height:auto;
	background: #fff;
	padding-bottom:20px;
	background-image:none;
	border:1px #999 solid;
	box-shadow:2px 2px 2px #999;
	-webkit-box-shadow:2px 2px 2px #999;
	-moz-box-shadow:2px 2px 2px #999;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	margin-bottom:20px;
	border-radius: 6px 6px 6px 6px;
/*	filter: progid:DXImageTransform.Microsoft.Shadow(color='#969696', Direction=135, Strength=5);*/
	}

.frame .middle{
	height: auto;
	width: 100%;
}

.frame .xgLab{
	margin-left:-8px;
	z-index:1;
	position:relative;
	background-image: url(images/xingongLab.png);
}
.huifu {
	color: #2595B7;
	font-size: 12px;
}
.replyContent .huifu_statu {
	font-size: 12px;
}
.huifu_statu .another_time {
	color: #9B9B9B;
	padding-right: 5px;
}
.reply .replyContent {
	margin-left: 25px;
	font-family: "微软雅黑";
	margin-top: 15px;
	border-top-width: 1px;
	border-top-style: dashed;
	border-top-color: #CCC;
	margin-right: 25px;
	padding-top: 5px;
	display:block;
}
.middle .upload {
	
	background-image: url(images/updateLab.png);
	margin-left:-9px;
	margin-top:10px;

}
.win1{
/*display:none;*/
	}
.win1 .middle {

	width:631px;
	height:448px;
	background-image:url(images/xg_small_bg.png);
	position:fixed;
	top:113px;
	left:213px;
	z-index:100;
	display:none;
	
}

.masker {
	position:fixed;
	z-index:5;
	filter:alpha(opacity=77);       
	-moz-opacity:0.77;       
	-khtml-opacity: 0.77;
	opacity: 0.77;
	left:0px;
	top:0px;
	width:100%;
	height:100%; 
	background:none repeat scroll 0 0 #cccccc;
	display:none;
}
.win1 #update  a{
	float: right;
	width:26px;
	height:26px;
	background:url(images/close1.png);
	margin-right:15px;
	margin-top:3px;
	cursor:pointer;
	display:block;
	
}
.win1 #update a:hover {

	width:30px;
	height:30px;
	background:url(images/close2.png);

	
}
.win1 .mydel {
	background-image: url(images/pop_bg.png);
	height: 175px;
	width: 436px;
	padding-top:20px;
	margin-right: auto;
	margin-left: auto;
	display:none;
	position:fixed;
	top:213px;
	left:313px;
	z-index:10;
}
.win1 .mydel .delpopLab {
	background-image: url(images/del_Lab.png);
	height: 50px;
	width: 131px;
	margin-left: -7px;
}
.win1 .mydel .tip .alert {
	background-image: url(images/alert.png);
	float: left;
	height: 26px;
	width: 30px;
	margin-right: 10px;
}
.win1 .mydel .tip {
	margin-top: 20px;
	margin-left:50px;
}
.win1 .mydel .two_bt form input {
	height: 22px;
	width: 81px;
	margin-right: 10px;
}
.win1 .mydel .tip .alertWord {
	font-size: 14px;
	color: #333;
}
.win1 .mydel .two_bt {
	margin-top: 40px;
	margin-left: 50px;
	float: right;
	width: 200px;
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
<% 
                                        	int file_id = Integer.parseInt(request.getParameter("fileId"));
                                        	FileDetailDAO fdd = new FileDetailDAOImpl();
                                        	FileDetail fileDetail = new FileDetail();
                                        	fileDetail = fdd.queryByFileId(file_id);
                                        	//if (fileDetail != null) {                       		
                                                String file_display_name=fileDetail.getFile_display_name();
                                        		int file_down_num=fileDetail.getFile_down_num();
                                        		String file_uptime=fileDetail.getFile_uptime(); 
                                        		String file_introduce=fileDetail.getFile_introduce();
                                        		String user_name=fileDetail.getUser_name();
                                        		String picture_url=fileDetail.getPicture_url();
                                        		int collegeLiId =fileDetail.getCollege_id();
                                        		String college_name=fileDetail.getCollege_name();
                                        		String grade_name=fileDetail.getGrade_name();
                                        		String course_name=fileDetail.getCourse_name();

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
					<div class="col6 noblock">
						你当前的位置：
					</div>
					<label class="academy">
						<%=college_name %>
					</label>
					&gt;
					<label class="grade">
						<%=grade_name %>
					</label>
					&gt;
					<label class="major">
						<%=course_name %>
					</label>

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
																		int ccgcId=co.getCcgc_id();
											%>


											<a href="2.jsp?courseId=<%=courseId%>" ><%=courseName%></a>
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
   
		

				<div class="right">
					<div class="r_top">
						<div class="small_bg">
							<div class="left_img"></div>
							<div class="right_info">
								<div class="firstLine">
									<div class="name">
										<span class="col6">文件名称：</span><span class="col3" id="name"><%=file_display_name %></span>
									</div>
									<div class="isTeach">
									<%
      									if (u.getUser_identity().equals("老师")) {
      								%>
      								 <div class="delete_icon threebox"></div>
      								 <div class="update_icon threebox"></div>
      								 <% 
      								 }
      								 %>
										<a href="FileDownServlet?file_id=<%=file_id%>" class="download_icon threebox"></a>
									</div>
									<div class="isStu">
										<div class="download_icon threebox"></div>
									</div>
								</div>
								<!-- <div class="grade"><span class="col6">年级：</span><span  class="col3" id="grade">11届/10届</span></div>-->
								<div class="major">
									<span class="col6">下载次数：</span><span class="col3" id="major"><%=file_down_num %></span>
								</div>
								<div class="teaher">
									<span class="col6">老师：</span><span class="col3" id="teaher"><%=user_name %></span>
								</div>
								<!--<div class="academy"><span class="col6">学院：</span><span class="col3" id="academy">信工学院</span></div>-->

								<div class="up_time">
									<span class="col6">上传时间：</span><span class="col3" id="up_time"><%=file_uptime %></span>
								</div>
								<div class="intro">
									<span class="col6">课程简介：</span><span class="col3" id="intro"><%=file_introduce %></span>
								</div>

							</div>
						</div>
					</div>
					

					<div class="r_bottom">
						<div class="xg_small_bg">
							<div id="replyList">
									<%
								MessageDAO md=new MessageDAOImpl();
								List<Message> allMessage = md.queryAll(file_id);
								if (allMessage != null) {
									for (int i = 0; i < allMessage.size(); i++) {
										Message m = allMessage.get(i);
										String messageUserName=m.getUser_name();
										int messageId=m.getMessage_id();
										String messageContent=m.getMessage_content();
										String messageTime = m.getMessage_time();	
										%>
										<div id="<%=messageId %>" class="reply">
									<div class="said">
										<label class="people"></label>
										<label id="xuehao">
											<%=messageUserName %>
										</label>
										<label>
											&nbsp; :&nbsp;
										</label>
										<p class="content">
											<%=messageContent %>
										</p>
										<div class="rightDown">
											<span class="time"><%=messageTime %></span><a
												href="#marker" class="huifu">回复</a>
										</div>
									</div>
									<%
									ReplyDAO rd=new ReplyDAOImpl();
									List<Reply> allReply = rd.queryAll(messageId);
									if (allReply != null) {
									for (int j = 0; j < allReply.size(); j++) {
										Reply r = allReply.get(j);
										String replyUserName=r.getUser_name();
										String replyContent=r.getReply_content();
										String replyTime =r.getReply_time();
										%>
									<!--回复的记录条-->
									<div class="replyContent">
										<label class="people"></label>
										<label id="xuehao"><%=replyUserName %></label>
										<label>	&nbsp; :&nbsp;</label>
										<p class="content">
											<%=replyContent %>
										</p>
										<div class="huifu_statu">
											<span class="another_time"><%=replyTime %></span><a href="#marker"
												class="huifu">回复</a>

										</div>
									</div>
									<%
										}
									}
									%>

									<!-- <div class="bt_line"></div>-->
								</div>
							<%
										}
									}
							 %>
							</div>
							<div class="btm">
								<div class="said_img" id="said"></div>
							</div>

							<div class="myreply">
								<form action="MessageServlet?fileId=<%=file_id %>" method="post" id="fm">
									<textarea id="content" name="textarea" class="re" tabindex="1"></textarea>
									<input class="fa_bt" type="submit" value="" id="submitButton" />
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div style="clear: both;"></div>
		</div>

		<div class="bgcolor bottom"></div>


		<!--<div class="win" style=" width:300px; height:400px; position:relative;z-index:102; background: url(images/adduse.png);"></div>-->
        <div class="win1">
        	<div class="masker" ></div>
            <!--弹窗更新-->
            <div class="middle" id="update"><a  href="#" class="close" ></a>
            <div class="upload"></div>
            <div class="tab">
      <form action="" method="post" name="">
                    <div class="aline">
                              <div class="fileName font_box">文件名称:</div><input type="text" value="" maxlength="20"  />
                      </div>
                    <div class="aline">
                             <div class="fileTea font_box" >老师:</div><input type="text" value="" maxlength="20"  />
                    </div>
                     
                     <div class="aline">
                            <div class="grade font_box">年级:</div><select >
                                                                                            <option  >09届</option>
                                                                                            <option  >10届</option>
                                                                                            <option  >11届</option>
                                                                                            <option  >12届</option>
                                                                                    </select>
                       </div>
                       <div class="aline">
                            <div class="academy font_box">学院:</div><select id="xueyuan" >
                                                                                                 <option  >信工学院</option>
                                                                                                 <option  >化工学院</option>    
                                                                                                <option  >药科学院</option>
                                                                                                <option  >商学院</option>
                                                                                                <option  >食科学院</option>
                                                                                                <option  >中药学院</option>
                                                                                        </select>
                                                                                     
                        </div>
                        
                      <div class="aline">   
                            <div class="major font_box">专业:</div><select  id="majors">
                                                                                 </select>
                         <div class="aline">
                       <div class="courseName font_box">课程名称:</div><!--<input type="text" value=""  maxlength="20"  />--><select size="1">
                                    <option  ></option>
                                    <option  ></option>
                                    <option  ></option>
                                    <option  ></option>
                            </select>
                        </div>
                            
          </div>
                       <div class="inbox ">
                                <div class="intr font_box">课程介绍:</div><div class="font_long"><span id="used">0</span>/80</div>
                                <!--这个name要与右边那个form.textarea中的textarea一致--> 
                         <textarea  name="textare" class="text"  id="mytext"  onkeydown="gbcount(this.form.textare);" onkeyup="gbcount(this.form.textare);">谈谈课程的简介吧。。。</textarea>
                              
                              
                  </div>
    <div class="aline">
            <div class="localUp font_box">本地上传:</div><input type="file"  maxlength="20" value=""   />
                           
            </div>
     <div class="aline myline">
                      <input class="sure" type="submit" value=""/>
                       <input class="cancel" type="reset" value=""/>                      
              </div>
              </form>
      </div>  
            </div>
            <!--弹窗删除-->
            <div class="mydel"><a  href="#" class="close" ></a>
            	<div class="delpopLab"></div>
              <div class="tip">
                		<div class="alert"></div>
                        <div class="alertWord">确定删除该文件吗？</div>
                </div>
                <div class="two_bt">
                		<form method="post" action="FileDeleteServlet?file_id=<%=file_id%>" name="">
                            <input type="submit" value="是"  id="yes"/>
                            <input type="button" value="否"  id="no" />
                  </form>
              </div>
            		
            
            </div>
            
    	</div>


</body>
</html>
