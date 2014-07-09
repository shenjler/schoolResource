// JavaScript Document
	jQuery(function($){
			
			var chooseNum=1;
			//$("#num a").attr("href"," javascript:void(0)");
			//$("#num a:first").removeClass("gray").addClass("yellow");
			$(".num a").click(function(){
									 //  javascript:void(0);
									  // alert($(this));
									//   $("p").addClass("selected");
						
						$(this).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
								  chooseNum=$(this).index(); 
								 // alert(chooseNum);
							});
			
			$(".num span").mouseover(function(){
											  $(this).removeClass("gray").addClass("yellow");						  
							 }).mouseout(function(){
											 $(this).removeClass("yellow").addClass("gray");
											 });
			$(".num span").click(function(){
							if($(this).text()=="<")
							{
								
								if(chooseNum>1)
								{
									//alert(chooseNum);
									var num=chooseNum-2;																
									$(this).siblings("a").eq(num).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum-=1;
								}								
							}
							else if($(this).text()==">")
							{
								
								if(chooseNum<6)
								{//alert(">");
									var num=chooseNum;						
									$(this).siblings("a").eq(num).removeClass("gray").addClass("yellow").siblings().removeClass("yellow").addClass("gray");
									chooseNum+=1;
								}
							} 
					 });		
			});