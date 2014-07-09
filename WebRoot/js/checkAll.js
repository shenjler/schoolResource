// JavaScript Document
function CheckAll(form){
			for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if (e.Name != 'chkAll'&&e.disabled==false)
					e.checked = form.chAll.checked;
			}
		}

jQuery(function($){
				$("form input[ type='checkbox'][name!='chAll']").click(function(){		
																				
										$(this).get(0).form.chAll.checked=false;								
					});
				
				$("#chAll").click(function(){										
								CheckAll($(this).get(0).form);										   
								 });
			
					
});