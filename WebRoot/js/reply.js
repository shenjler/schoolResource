

// JavaScript Document

	jQuery(function($){
			var all,save,sign=0,id;	
			function currentTime(){                                
                                                var today = new Date();                                                              
                                                var y=today.getFullYear()+"-";
                                                var month=today.getMonth()+1+"-";
                                                var td=today.getDate()+"  ";                                                
                                                var h=today.getHours();
                                                var m=today.getMinutes();
                                                var s=today.getSeconds(); 
												 all=y+month+td+h+":"+m+":"+s;													
												return	all;
                               			   }    			

		var content=$("#content"),
				yourName=$("#yourName"), 
				fm=$("#fm"),
				reply=$(".reply:last");
		replyContent=$(".replyContent:first");

		fm.submit(function(evt){
						   	   
				if (evt) {//W3C
					evt.preventDefault();
				} else {//IE
					window.event.returnValue=false;
				}	
				//alert(sign);
				if(sign)
				{
					inset2();
					sign=0;
					return;
				}else{
					inset1();
					return;
					
				}
		});
		function inset1()
		{
			var newContent=content.val(),
				newName=yourName.text();
					
				if (newContent) {
					
					
			var   newReply=reply.clone(true),
					newLabel0=newReply.children(".said:last").children("label").eq(0),
					newLabel1=newReply.children(".said:last").children("label").eq(1),
					newSpan=newReply.children(".said").children().children("span"),					
					newP=newReply.children(".said:last").children("p");
					 
					
					newP.text(newContent);					
					newLabel1.text(newName);
			var 	newTime=currentTime();
					newSpan.text(newTime);
					

					$(newReply).appendTo("#replyList");
					content.val("");
				//	 huifu=$(".huifu");					
				//	$("#replyList").append(newReply);
			} else {
			alert("亲，您还未输入任何内容!!!");
			}				
		}
		
		function inset2(){
			var newContent=$("#content").val();
				 
				var reg=new RegExp(save,"g");
				newContent=newContent.replace(/^回复/g,"");
				newContent=newContent.replace(reg,"");
				 var sub=newContent.replace(/^ :/g,"");
				 
				//alert(sub);
				newName=yourName.text();
					
				if (newContent) {
					
					
			var   anotherReply=replyContent.clone(true).css({display:"block"}),
					newLabel0=anotherReply.children("label").eq(0),
					newLabel1=anotherReply.children("label").eq(1),
					newSpanTime=anotherReply.children().children("span"),					
					newP=anotherReply.children("p");
					 
			 var   today = new Date();   
			 var  h=today.getHours();
             var  m=today.getMinutes();
			 var  str=h+":"+m;
					 
					newP.text(sub);					
					newLabel1.text(newName);
		//	var 	newTime=currentTime();
					newSpanTime.text(str);
					
					//alert(save);
					//alert($(".said label[id='xuehao']").text());
					
					$("#id .reply").each(function(){
								//	alert(" xuehao="+$(this).text()+"   save="+save);	
									
									if($(this).attr("id")==id)		
									$(this).children(".said").append(anotherReply);
																
										}); 
					//$(anotherReply).appendTo("#replyList");
					content.val("");
				//	 huifu=$(".huifu");					
				//	$("#replyList").append(newReply);
			} else {
					alert("亲，您未输入任何容!!!");
			}				
			
			
			}
		
	/*	content.focus(function(){					
				content.addClass("focus");				 
								 
			}).blur(function(){
				content.removeClass("focus");		
				
		});*/
	
		var myreply=$(".myreply");
		var fa_bt=$(".fa_bt");
		var flag=true;

		$("#said").click(function(){	
					
					if(flag)
					{
					//myreply.css("display","none");
					myreply.slideDown("slow");
					flag=!flag;
					}else{
					myreply.slideUp("slow");
					//myreply.hide();
					flag=!flag;
					}			
			});
		var huifu=$(".huifu"); 
		huifu.click(function(){
				
					myreply.slideDown("slow");
					var id=$(this).parents(".reply").attr("id");
					alert("id="+id);
					var xuehao=$(this).parent().sibling("#xuehao");
					save=xuehao.text();
					sign=1;
					//alert(xuehao);xuehao.text()
					content.val("回复"+" : ");
				 
				});
					
					
});

