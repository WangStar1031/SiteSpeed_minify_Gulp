var widthClassOptions = [];
var widthClassOptions = ({
		bestseller       : 'bestseller_default_width',		
		featured         : 'featured_default_width',
		special          : 'special_default_width',
		latest           : 'latest_default_width',
		related          : 'related_default_width',
		additional       : 'additional_default_width',
		module           : 'module_default_width'		
});


$(document).ready(function(){
	
	$('#content select').customSelect();
	$('input[type="checkbox"]').tmMark(); 
	$('input[type="radio"]').tmMark();
	$('ul.breadcrumb').prependTo('#content');


});

/* JS FOR FILTER */

function leftFilter(){
if ($(window).width() <= 767) {
$('#column-left .filterbox').appendTo('.row #content .category_list');
$('#column-right .filterbox').appendTo('.row #content .category_list');
} else {
$('.row #content .category_list .filterbox').appendTo('#column-left .sidebarFilter');
$('.row #content .category_list .filterbox').appendTo('#column-right .sidebarFilter');
}
}
$(document).ready(function(){leftFilter();});
$(window).resize(function(){leftFilter();});

function mobileToggleMenu(){
	//alert($(window).width());
	if ($(window).width() < 980)
	{
		$("#footer .mobile_togglemenu").remove();
		$("#footer .column h5").append( "<a class='mobile_togglemenu'>&nbsp;</a>" );
		$("#footer .column h5").addClass('toggle');
		$("#footer .mobile_togglemenu").click(function(){
			$(this).parent().toggleClass('active').parent().find('ul').toggle('slow');
		});

	}else{
		$("#footer .column h5").parent().find('ul').removeAttr('style');
		$("#footer .column h5").removeClass('active');
		$("#footer .column h5").removeClass('toggle');
		$("#footer .mobile_togglemenu").remove();
	}	
}
$(document).ready(function(){mobileToggleMenu();});
$(window).resize(function(){mobileToggleMenu();});


$(document).ready(function(){
  $(".dropdown-toggle").click(function(){
    $("ul.dropdown-toggle").toggle('slow');
  });
});


function LangCurDropDown(selector,subsel){
	var main_block = new HoverWatcher(selector);
	var sub_ul = new HoverWatcher(subsel);
	$(selector).click(function() {
		$(selector).addClass('active');
		$(subsel).slideToggle('slow');
		setTimeout(function() {
			if (!main_block.isHoveringOver() && !sub_ul.isHoveringOver())
				$(subsel).stop(true, true).slideUp(450);
				$(selector).removeClass('active');
		}, 3000);
	});
	
	$(subsel).hover(function() {
		setTimeout(function() {
			if (!main_block.isHoveringOver() && !sub_ul.isHoveringOver())
				$(subsel).stop(true, true).slideUp(450);
		}, 3000);
	});	
}


$(document).ready(function(){

	LangCurDropDown('.myaccount','.myaccount-menu');
	LangCurDropDown('#currency','.currency-menu');
	LangCurDropDown('#language','.language-menu');
	LangCurDropDown('#cart','.cart-menu');

});



function leftright()
{
	if ($(window).width() < 980){
			if($('.category_filter .col-md-3, .category_filter .col-md-2, .category_filter .col-md-1').hasClass('text-right')==true){
			$(".category_filter .col-md-3, .category_filter .col-md-2, .category_filter .col-md-1").addClass('text-left');
			$(".category_filter .col-md-3, .category_filter .col-md-2, .category_filter .col-md-1").removeClass('text-right');
			}
	}
}

$(document).ready(function(){leftright();});
$(window).resize(function(){leftright();});

function menuResponsive(){
	 
	if ($(window).width() < 980){
		//alert($(window).width());
		$('.nav-responsive').css('display','block');
		if($('.main-navigation').hasClass('treeview')!=true){
			$("#menu").addClass('responsive-menu');
			$("#menu").removeClass('main-menu');
			$("#menu .main-navigation").treeview({
				animated: "slow",
				collapsed: true,
				unique: true		
			});
			$('#menu .main-navigation a.active').parent().removeClass('expandable');
			$('#menu .main-navigation a.active').parent().addClass('collapsable');
			$('#menu .main-navigation .collapsable ul').css('display','block');		
		}
	
	}else{
		$("#menu .hitarea").remove();
		$("#menu").removeClass('responsive-menu');
		$("#menu").addClass('main-menu');
		$(".main-navigation").removeClass('treeview');
		$("#menu ul").removeAttr('style');
		$('#menu li').removeClass('expandable');
		$('#menu li').removeClass('collapsable');
		$('.nav-responsive').css('display','none');
	}

}
$(document).ready(function(){menuResponsive();});
$(window).resize(function(){menuResponsive();});

function productCarouselAutoSet() { 
	$("#content .product-carousel, .banners-slider-carousel .product-carousel").each(function() {
		var objectID = $(this).attr('id');
		var myObject = objectID.replace('-carousel','');
		if(myObject.indexOf("-") >= 0)
			myObject = myObject.substring(0,myObject.indexOf("-"));		
		if(widthClassOptions[myObject])
			var myDefClass = widthClassOptions[myObject];
		else
			var myDefClass= 'grid_default_width';
		var slider = $("#content #" + objectID + ",  .banners-slider-carousel #"+ objectID);
		slider.sliderCarousel({
			defWidthClss : myDefClass,
			subElement   : '.slider-item',
			subClass     : 'product-block',
			firstClass   : 'first_item_tm',
			lastClass    : 'last_item_tm',
			slideSpeed : 200,
			paginationSpeed : 800,
			autoPlay : false,
			stopOnHover : false,
			goToFirst : true,
			goToFirstSpeed : 1000,
			goToFirstNav : true,
			pagination : false,
			paginationNumbers: false,
			responsive: true,
			responsiveRefreshRate : 200,
			baseClass : "slider-carousel",
			theme : "slider-theme",
			autoHeight : true
		});
		
		var nextButton = $(this).parent().find('.next');
		var prevButton = $(this).parent().find('.prev');
		nextButton.click(function(){
			slider.trigger('slider.next');
		})
		prevButton.click(function(){
			slider.trigger('slider.prev');
		})
	});
}
//$(window).load(function(){productCarouselAutoSet();});
$(document).ready(function(){productCarouselAutoSet();});

function productListAutoSet() { 
	$("#content .product-grid").each(function(){
		var objectID = $(this).attr('id');
		if(objectID.length >0){
			if(widthClassOptions[objectID.replace('-grid','')])
				var myDefClass= widthClassOptions[objectID.replace('-grid','')];
		}else{
			var myDefClass= 'grid_default_width';
		}	
		$(this).smartColumnsRows({
			defWidthClss : myDefClass,
			subElement   : '.product-items',
			subClass     : 'product-block'
		});
	});		
}
$(window).load(function(){productListAutoSet();});
$(window).resize(function(){productListAutoSet();});


function HoverWatcher(selector){
	this.hovering = false;
	var self = this;

	this.isHoveringOver = function() {
		return self.hovering;
	}

	$(selector).hover(function() {
		self.hovering = true;
	}, function() {
		self.hovering = false;
	})
}

function LangCurDropDown(selector,subsel){
	var main_block = new HoverWatcher(selector);
	var sub_ul = new HoverWatcher(subsel);
	$(selector).click(function() {
		$(selector).addClass('active');
		$(subsel).slideToggle('slow');
		setTimeout(function() {
			if (!main_block.isHoveringOver() && !sub_ul.isHoveringOver())
				$(subsel).stop(true, true).slideUp(450);
				$(selector).removeClass('active');
		}, 3000);
	});
	
	$(subsel).hover(function() {
		setTimeout(function() {
			if (!main_block.isHoveringOver() && !sub_ul.isHoveringOver())
				$(subsel).stop(true, true).slideUp(450);
		}, 3000);
	});	
}

$(document).ready(function(){

	LangCurDropDown('#currency','.currency_div');
	LangCurDropDown('#language','.language_div');
	LangCurDropDown('#header-links','.header_links');


	$('.nav-responsive').click(function() {
        $('.responsive-menu .main-navigation').slideToggle();
		$('.nav-responsive div').toggleClass('active');
		
    }); 


	$(".treeview-list").treeview({
		animated: "slow",
		collapsed: true,
		unique: true		
	});
	$('.treeview-list a.active').parent().removeClass('expandable');
	$('.treeview-list a.active').parent().addClass('collapsable');
	$('.treeview-list .collapsable ul').css('display','block');
});

 
/*$(document).ready(function(){
  $("#header-links").click(function(){
    $(".header_links").toggle('slow');
  });
  
});*/

/*For Grid and List View Buttons*/
function gridlistactive(){
$('.btn-list-grid button').on('click', function() {
if($(this).hasClass('grid')) {
  $('.btn-list-grid button').addClass('active');
  $('.btn-list-grid button.list').removeClass('active');
}
  else if($(this).hasClass('list')) {
$('.btn-list-grid button').addClass('active');
  $('.btn-list-grid button.grid').removeClass('active');
  }
});
}
$(document).ready(function(){gridlistactive()});
$(window).resize(function(){gridlistactive()});



