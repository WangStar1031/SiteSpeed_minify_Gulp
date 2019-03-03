
	$(document).ready(function(){	
		var urlRoute = getURLVar('route');
		
		if($.type(urlRoute) == 'undefined' || urlRoute == 'common/home' ){
			$('#header_logo').show();
		}else{
			$('#header_logo').hide();
		}	
	});