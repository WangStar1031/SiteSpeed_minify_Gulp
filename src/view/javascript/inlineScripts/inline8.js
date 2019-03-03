
	function updateCartInPanel( device ){
		if( device== 'mobile') {
			var new_qty = $('#cart_products_list_data_mobile_view input[type=\'text\']');		
		} else if( device== 'desktop') {
			var new_qty = $('#cart_products_list_data input[type=\'text\']');		
		}

		$.ajax({
			url: $BASE + 'index.php?route=checkout/cart/editInPanel',
	        type: 'post',
	        data:  new_qty,
	        dataType: 'html',
	        beforeSend: function() {
			},
	        complete: function() {
				$( ".tooltip ,.tooltip-inner,.tooltip-arrow" ).remove();
	        },
	        success: function(html) {
	            $('.alert, .text-danger').remove();
				$('#cart_info_div').html(html);
				
				var numberOfItems = $('#input_text_items').val();
				if (typeof numberOfItems === "undefined") {
						 numberOfItems = 0;
					}
				console.log( 'total_qty===='+numberOfItems);
				$('.cart-total').text(numberOfItems);
				
				if (getURLVar('route') == 'checkout/cart') { 
					if(numberOfItems == 0 ){
						location = $BASE + 'index.php?route=common/home&step_back=categories';
					}else{
						
					$( ".view_cart_custom" ).load(window.location.href + " .view_cart_custom" );
					$( "#mobile_cart" ).load(window.location.href + " #mobile_cart" );
					
					}
					
				}else if(getURLVar('route') == 'checkout/checkout'){
					loadOrderSummary();  
				}
	        },
				error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }

	    });
	}
	$( window ).resize(function() {
	   adjustlogo();
	});

	function adjustlogo(){
		if( !$( '.cart_bag' ).is( ":hidden" ) ) {
	        $( '.fog' ).find( 'img.m_right' ).addClass( 'mR255' );
	    }
	    if (getURLVar('route') == 'common/home') {
	        if( $( window ).width() >= 1250 && getURLVar('step_back') == "" ) {
	            $('#home_ribbon_text').removeClass( 'mR255' );
	        }
	    } else {
			var query_string = $QUERY_STRING;
			if( query_string == "" ) {
				$('#home_ribbon_text').removeClass( 'mR255' );
			}
		}
	}

	$(document).ready(function(){
	    adjustlogo();
		
		var screenWidth = $( window ).width();

		$( ".tooltip ,.tooltip-inner,.tooltip-arrow" ).remove();
		if (getURLVar('route') == 'common/home' || !getURLVar('route')) {
			$('#mobile_cart').hide();
			$('#cart').hide();
		}else if (getURLVar('route') == 'checkout/cart') {
			if(screenWidth > 1280){
				$('#mobile_cart').hide();
				$('#desktop_cart').show();
			}else{
				$('#mobile_cart').show();
				$('#desktop_cart').hide();
			}
		}else{
			$('#mobile_menu').hide();
		}
		
		//Hide sidebar cart panel in checkout and admin pages
		var urlRoute = getURLVar('route');
		if($.type(urlRoute) != 'undefined' && (urlRoute.search('checkout') > -1 || urlRoute.search('account') > -1 )){
			$('#sidebarCart').hide();
		}
		//Hide cart button on home page
		var urlRoute = getURLVar('route');
		var urlStepBack = getURLVar('step_back');
		if($.type(urlRoute) == 'undefined' || urlRoute == 'common/home'){
			if($.type(urlStepBack) != 'undefined' && urlStepBack != ''){
				$('#right_header_cart').show();
			}else{
				$('#right_header_cart').hide();
			}	
		}
		//to hide banner on product description page and make body color white
		if(getURLVar('route') == 'product/product' && getURLVar('product_id') != 'undefined' &&  getURLVar('product_id') != ''){
			$('body').css('background-color', '#fff');
			$('.banner').hide();
		}
		//To hide 'back to menu' on menu items page
		if( getURLVar('step_back') == "categories" && screenWidth > 1250 && screenWidth < 1280 ) {
		} else {
			fix_banner_ui();
		}
		
		
		if(screenWidth < 1280){
			var priceDivWidth = $(".priceCircle").width();
			var priceChildWidth = $(".priceCircle > div").width();
				priceDivWidth = parseInt(priceDivWidth) + 15;
			$('.priceCircle').css({
				'height': priceDivWidth + 'px',
				'width': priceDivWidth + 'px',
				'padding':'0px'
			});
			var priceDivHeight = $(".priceCircle").height();
			var priceDivHeightHalf = priceDivHeight/2;
			
			
			var priceChildheight = $(".priceCircle > div").height();
			var halfPriceChildheight = priceChildheight/2;
			$('.priceCircle > div').css({
				'padding-top': (priceDivHeightHalf - halfPriceChildheight) + 'px',
				'text-align': 'center'
			});
		}	
	});