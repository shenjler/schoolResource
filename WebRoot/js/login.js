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
			if (e && e.preventDefault){//�����FF��ִ�����
			e.preventDefault();
			}else{
			e.returnValue = false;//�����IE��ִ�����
			}
			return false;
			}
		$(".window").css({"display":"block"});
			var winText=$(".window").get(0);
			
	var mywin=new PopWindow({
				title:"������Ϣ",
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
					mask				Boolean				�Ƿ���ʾ����
					title				HTML 					���ڱ���
					content			HTML/Node			��������
					movable 		Boolean				�����Ƿ�����϶�
					maximizable Boolean				�����Ƿ�������
					closable		Boolean				�����Ƿ���Թر�
					resizable		Boolean				�����Ƿ���Ե�����С
					center			Boolean				�����Ƿ�һֱ����
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
			alert("�ף��������ʺź����롣");
			stopDefault(e);
		}
		   
		})
	
	
	
 });
