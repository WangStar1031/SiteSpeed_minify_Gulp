
	$(document).ready(function(){
		$(".swal-button").hover(function(){
			$(this).css("background-color", "<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>");
			$(this).css("opacity", "0.8");
			}, function(){
				$(this).css("background-color", "<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>");
				$(this).css("opacity", "1");
		});
	})

	function testjquery(element_id,action_type,target_value){

		if(element_id == '#top'){
			element_id = '.nav';	
		}
		
		if(element_id == '.header-cart button'){
			element_id = '#cart';	
		}
		
		if(element_id == '.topnav-links'){
			element_id = '.nav ul li a';	
		}	
		
		if(element_id == 'shop_color'){
			$('.fa').css('color', target_value);
			$('.shop_btn, .priceCircle, .add_to_order_button').css('background-color', target_value);
			$('.shop_btn').hover( function () {
				$(this).css('background-color', target_value);
			});
		}	
		$(element_id).css(action_type, target_value);
	}
	$(document).ready(function(){
		$( "a.main_menu" ).click(function() {
		});
	});