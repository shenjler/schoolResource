// JavaScript Document
jQuery(function ($){		
				 
	document.body.appendChild(PopWindow.mask);
	
	var bg=$(".bg").get(0);
	var moveCenter=(function  (){
							   //var de=document.documentElement;
								//var de=document.documentElement;
								//this.node.style.left=(de.clientWidth-this.node.offsetWidth)/2+"px";
								//this.node.style.top=(de.clientHeight-this.node.offsetHeight)/2+"px";
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
				/**
				args {
					width
					height
					minWidth
					minHeight
					mask				Boolean				是否显示遮罩
					title				HTML 					窗口标题
					content			HTML/Node			窗口内容
					movable 		Boolean				窗口是否可以拖动
					maximizable Boolean				窗口是否可以最大化
					closable		Boolean				窗口是否可以关闭
					resizable		Boolean				窗口是否可以调整大小
					center			Boolean				窗口是否一直居中
				}
				*/
			});

	$("#form1").submit(function(e){
							   
		var mima=$("#mima").val(),
		xuehao=$("#xuehao").val(),
		juese=$("#juese").val();
		if(mima&&xuehao)
		{
			if(xuehao=="123"&&mima=="123")
			{
				mywin.toggleVisible();	
				
				//alert(juese);
			}
			else{
					
					mywin.toggleVisible();	
					stopDefault(e);
				
				}
		}
		else
		{
			alert("亲，请输入帐号和密码。");
			stopDefault(e);
		}
		   
		})
	
	
	
 });
