// JavaScript Document

jQuery(function ($){		
		function moveCenter(){
					var height=$(document).height();
					var top=height-35;
					$(".bottom").offset({top:top,left:0});			
				}
									
			moveCenter();
			$(window).resize(function(){
				  //alert("Stop it!");
					moveCenter();
			});
});
