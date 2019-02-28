function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list li').each(function(index, element) {
		
			// Megnor Start
			html = '';
			html += '<div class="product-block">';
			html += '<div class="product-block-inner">'
			// Megnor End 
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			} 
			
			// Megnor product sale display Start
			var special = $(element).find('.saleblock').html();
			if (special != null) {
				html +=   '<div class="saleblock">' + special + '</div>'  ;
			}
			// Megnor product sale display End
			
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			html += '</div>'; // End left DIV
			// Megnor Start
			
			
			html += '<div class="right">';
			
			var price = $(element).find('.price').html();			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			
			html += '</div>';	
			html += '</div>';
			html += '</div>';
			
			
			
			// Megnor End
			// Megnor Start
			//$(".product-list").css('width', '100%'); 
			$(".product-list > li").css('width', '100%'); 
			$(".product-list > li").css('height', 'auto'); 
			$('.product-list .product-block').css('height', 'auto');
			$('.product-list .product-block').css('width', 'auto');
			// Megnor End
			
			$(element).html(html);
		});		
		
		$('.display').html('<span class="List">List</span><span class="Grid"><a onclick="display(\'grid\');">Grid</a></span>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid li').each(function(index, element) {
			html = '';
			
			// Megnor Start
			html = '';
			html += '<div class="product-block">';
			html += '<div class="product-block-inner">'
			// Megnor End
						
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
				// Megnor product sale display Start
			var special = $(element).find('.saleblock').html();
			if (special != null) {
				html +=   '<div class="saleblock">' + special + '</div>'  ;
			}
			// Megnor product sale display End
				
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

			// Megnor Start
			html += '</div>';
			html += '</div>';
			// Megnor End

			$(element).html(html);
		});	
					
		$('.display').html('<span class="List"><a onclick="display(\'list\');">List</a></span><span class="Grid">Grid</span>');

		// Megnor Start

		$(".product-grid > li").css('width', ''); 
		$(".product-grid > li").css('height', ''); 
		$('.product-grid .product-block').css('height', '');
		$('.product-grid .product-block').css('width', '');
			
		$('ul.product-grid').smartColumnsRows({
			defWidthClss : 'grid_default_width',
			subElement   : 'li',
			subClass     : 'product-block'
		});
		// Megnor End
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
// Megnor Start
function productGridAutoSet() { 
	$('ul.product-grid').smartColumnsRows({
		defWidthClss : 'grid_default_width',
		subElement   : 'li',
		subClass     : 'product-block'
	});
}
$(window).load(function(){productGridAutoSet();});
$(window).resize(function(){productGridAutoSet();});
// Megnor End




function hideListView(){
	if ($(window).width() < 768 )
	{	
	 display('grid');
	 $(".display").css('display','none');
	}else{
		$(".display").css('display','block');
	}
}
$(document).ready(function(){hideListView();});
$(window).resize(function(){hideListView();}); 