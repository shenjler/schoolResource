// JavaScript Document
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
