// JavaScript Document
	jQuery(function($){
				
			$("table:first tr td:first").attr("width","123px");
			$("table:first tr td:eq(2)").attr("width","100px");
			$("table:first tr td:last").attr("width","80px");
			
			$("table:eq(1) tr td:first").attr("width","123px");
			$("table:eq(1) tr td:eq(2)").attr("width","100px");
			$("table:eq(1) tr td:last").attr("width","80px");
			
			$("table:eq(2) tr td:first").attr("width","123px");
			$("table:eq(2) tr td:eq(2)").attr("width","100px");
			$("table:eq(2) tr td:last").attr("width","80px");
					/*	选择数字编号 第一组	*/
			$(".num span").mouseover(function(){
											  $(this).removeClass("gray").addClass("yellow");						  
							 }).mouseout(function(){
											 $(this).removeClass("yellow").addClass("gray");
											 });
			var chooseNum1=1;
			var chooseNum2=1;
			//$("#num a").attr("href"," javascript:void(0)");
			$(".num:first a").click(function(){		
						//alert($("this").parent(".num").index($(".choose1")));					 
						$(this).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
								  chooseNum1=$(this).index(); 
								 // alert(chooseNum);
							});
			
		
			$(".num:first span").click(function(){
							if($(this).text()=="<")
							{
								
								if(chooseNum1>1)
								{
									//alert(chooseNum);
									var num1=chooseNum1-2;																
									$(this).siblings("a").eq(num1).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum1-=1;
								}								
							}
							else if($(this).text()==">")
							{
								
								if(chooseNum1<6)
								{//alert(">");
									var num1=chooseNum1;						
									$(this).siblings("a").eq(num1).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum1+=1;
								}
							} 
					 });		
			
						/*	选择数字编号 第二组	*/
			$(".num:eq(1) a").click(function(){		
						//alert($("this").parent(".num").index($(".choose1")));					 
						$(this).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
								  chooseNum2=$(this).index(); 
								 // alert(chooseNum);
							});
			
		
			$(".num:eq(1) span").click(function(){
							if($(this).text()=="<")
							{
								
								if(chooseNum2>1)
								{
									//alert(chooseNum);
									var num2=chooseNum2-2;																
									$(this).siblings("a").eq(num2).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum2-=1;
								}								
							}
							else if($(this).text()==">")
							{
								
								if(chooseNum2<6)
								{//alert(">");
									var num2=chooseNum2;						
									$(this).siblings("a").eq(num2).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum2+=1;
								}
							} 
					 });		
				
});
