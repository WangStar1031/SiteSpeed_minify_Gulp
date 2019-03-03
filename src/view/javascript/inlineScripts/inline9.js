
	function fix_banner_ui(){
		//To fix banner UI and footer powered by logo when sidebar is not there for desktops
		var screenWidth = $( window ).width();
		var urlRoute = getURLVar('route');
		
		if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && urlRoute != 'common/home' ){
			$('.fog img').addClass('mR255');
			$('.top_head').addClass('mR255');
			$('.powerby').addClass('mR255');
		}else if(screenWidth >= 1250){
			$('.fog img').removeClass('mR255');
			$('.top_head').removeClass('mR255');
			$('.powerby').removeClass('mR255');
		}	
		
		//for checkout and acount pages
		if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && (urlRoute.search('checkout') > -1 || urlRoute.search('account') > -1 )){
			$('.fog img').removeClass('mR255');
			$('.top_head').removeClass('mR255');
			$('.powerby').removeClass('mR255');
		}else if(screenWidth >= 1250){
			$('.fog img').addClass('mR255');
			$('.top_head').addClass('mR255');
			$('.powerby').addClass('mR255');
		}

		//console.log(urlRoute);
		if(screenWidth >= 1250 && ($.type(urlRoute) == 'undefined' || urlRoute == 'common/home')){
			$('.fog img').removeClass('mR255');
			$('.top_head').removeClass('mR255');
			$('.powerby').removeClass('mR255');
		}		
	}
	function banner_fix_showCategoryDiv(){
		//To fix banner UI when sidebar is not there for desktops
		var screenWidth = $( window ).width();
		if(screenWidth >= 1280){
			$('.fog img').addClass('mR255');
			$('.top_head').addClass('mR255');
			$('.powerby').addClass('mR255');
		}	
	}
	function banner_fix_hideCategoryDiv(){
		//To fix banner UI when sidebar is not there for desktops
		var screenWidth = $( window ).width();
		if(screenWidth >= 1280){
			$('.fog img').removeClass('mR255');
			$('.top_head').removeClass('mR255');
			$('.powerby').removeClass('mR255');
		}	
	}