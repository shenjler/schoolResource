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
jQuery(function($){
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
