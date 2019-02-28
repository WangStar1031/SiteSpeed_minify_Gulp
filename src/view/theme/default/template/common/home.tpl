<?php echo $header;?>
<?php //echo '<pre>'; print_r($_SESSION); die(); ?>
<?php //echo '<pre>'; print_r($categories); die(); ?>
<style>
.address_radio input{
-webkit-appearance: auto;
-moz-appearance: auto;
}


/* @media(max-width:1024){
	.mR2555{
		padding-right: 0px !important;
	}
	
} */
</style>
<?php if($online_ordering == 1 ){ ?>

<section class="ordering_options" id="locationAndStuff">
	<h2 class="top_head mR255 search_product" id="home_ribbon_text">ORDERING OPTIONS
	</h2>
  
   <div class="container">
		<div class="row">
			<div class="col-lg-12">
				<?php /*
				<div class="options">
					<div class="main_ordering_div">
						<div class="text_col left_ordering_div">
							<!-- <span class="font_awesome_icon"><i class="fa fa-map-marker"></i></span> -->
							<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/location.png" alt="" /> Choose a location
						</div>
						<div class="rigth_ordering_div">
							<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/chose.png" alt="" />
						</div>
					</div>
				</div>
				*/ ?>
			
			
			  <div class="options" id="accordion" style="display:none;">
				<ul>
					
					<li>
						<a href="javascript:void(0);" id="location_title">	
						  <div class="text_col">
							<!-- <img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/location.png" alt="" /> -->
							<p><i class="fa fa-map-marker"></i><span class="shop_font_color">Choose a location</span></p>
						  </div>
						</a>  
						<a href="javascript:void(0);" style="display:none;" id="location_chose_img" class="chose"><img src="<?php echo IMG_URL; ?>/upload/catalog/view/theme/default/image/chose.png" alt="" /></a>
					</li>
						
					  
					<div class="list_contant" id="location_content" style="display:none;">
					</div>
				</ul>   
				<ul>  
					
					<li>
						<a href="javascript:void(0);" id="time_title">
							<div class="text_col">
								<!-- <img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/time.png" alt="" /> -->
								<p><i class="fa fa-clock-o"></i><span class="shop_font_color">Choose a time</span></p>
							</div>
						</a>	
						<a style="display:none;" id="time_chose_img" class="chose"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/chose.png" alt="" /></a>
					</li>
						
						
					<div class="list_contant" id="time_content" style="display:none;">
					
						<a href="javascript:void(0)" id="order_now_message" style="display:none; hieght:50px;"><li class="gray"><p><span style="float:left;">Sorry,</span><aside style="float:left;" id="order_for_now_disable"></aside></p><center></li>
						</a>	
						<a href="javascript:void(0)" id="order_for_now">
							<li class="white"><p><span style="float:left;" id="order_for_now_title">ORDER FOR NOW -</span> <aside style="float:left; width:100%; margin-top:5px;" id="order_for_now_description">Have your order prepared as soon as possible.</aside></p></li>
						</a>
						
						<a href="javascript:void(0)" id="order_for_later">
							<?php if($order_later_status == 1 && $order_later_enabled_same_day_future_order == 1){?>	
							<li class="gray"><p><span style="float:left;">ORDER FOR LATER -</span> <aside style="float:left; width:100%; margin-top:5px;" id="order_for_later_description">Have your order prepared at a specific future date & time.</aside></p></li>
							<?php } ?>
					
						</a>					
					</div>
				
				</ul>  
				<ul>
					
					<li>
						<a href="javascript:void(0);" id="method_title">
							<div class="text_col">
								<!-- <img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/mathod.png" alt="" /> -->
								<p><i class="fa fa-shopping-bag"></i><span class="shop_font_color">Choose a method</span></p>
							</div>
						</a>
						<a style="display:none;" id="method_chose_img" class="chose"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/chose.png" alt="" /></a>
						
					</li>
					
					<?php if($delivery_option == '' || $delivery_option == 3) { //for both pikcup an delivery ?>
					
						<div class="list_contant" id="method_content" style="display:none;">
							<a href="javascript:void(0);" id="pickup_enabled" style="display:none;">
								<li class="white"><p><span style="float:left;" >PICKUP (<small>Unavailable</small>) </span>  <aside style="float:left; width:100%; margin-top:5px;"> Pickup is not available at this time.</aside></li>
							</a>
							<a href="javascript:void(0);" id="delivery_enabled" style="display:none;">
								<li class="white"><p><span style="float:left;" >Delivery (<small>Unavailable</small>) </span>  <aside style="float:left; width:100%; margin-top:5px;"> Delivery is not available at this time.</aside></li>
							</a>
							<a href="javascript:void(0);" id="order_pickup">
								<li class="white"><p><span style="float:left;" id="method_chosen_pickup">PICKUP -</span>  <aside style="float:left; width:100%; margin-top:5px;" id="method_chosen_pickup_info">at the new location, address of New Location.</aside></p></li>
							</a>
							<a href="javascript:void(0);" id="order_delivery">
								<li class="gray"><p><span id="method_chosen_delivery" style="float:left;">DELIVERY -</span><aside style="float:left; width:100%; margin-top:5px;" id="method_chosen_delivery_info">Your order will be delivered to you as soon as possible.</aside></p></li>
							</a>	
						</div>
						
					<?php }elseif($delivery_option == 2 ){ //for delivery only ?>
					
						<div class="list_contant" id="method_content" style="display:none;">
							<a href="javascript:void(0);" id="delivery_enabled" style="display:none;">
								<li class="white"><p><span style="float:left;" >Delivery (<small>Unavailable</small>) </span>  <aside style="float:left; width:100%; margin-top:5px;"> Delivery is not available at this time.</aside></li>
							</a>
							<a href="javascript:void(0);" id="order_delivery">
								<li class="gray"><p><span id="method_chosen_delivery" style="float:left;">DELIVERY -</span><aside style="float:left; width:100%; margin-top:5px;" id="method_chosen_delivery_info">Your order will be delivered to you as soon as possible.</aside></p></li>
							</a>	
						</div>		
							
					<?php }elseif($delivery_option == 1 ){ //for pickup only ?>
						<div class="list_contant" id="method_content" style="display:none;">
							<a href="javascript:void(0);" id="pickup_enabled" style="display:none;">
								<li class="white"><p><span style="float:left;" >PICKUP (<small>Unavailable</small>) </span>  <aside style="float:left; width:100%; margin-top:5px;"> Pickup is not available at this time.</aside></li>
							</a>
							<a href="javascript:void(0);" id="order_pickup">
								<li class="white"><p><span style="float:left;" id="method_chosen_pickup">PICKUP -</span>  <aside style="float:left; width:100%; margin-top:5px;" id="method_chosen_pickup_info">at the new location, address of New Location.</aside></p></li>
							</a>
						</div>

					<?php } //end if delivery option ?>
					
						
				</ul>
				<ul>
					<!-- <li>
						<a href="javascript:void(0);" id="confirm_title">
							<div class="text_col">
								<img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/mathod.png" alt="" />
								<p><span>Confirm</span></p>
							</div>
							<a href="javascript:void(0);" style="display:none;" id="confirm_chose_img" class="chose"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/chose.png" alt="" /></a>
						</a>
					</li> -->
					
					<div class="list_contant <?php if($deliveryListingStatus == '1') echo 'for_dlvry'; ?> bg-white" id="confirm_delivery_content" style="display:none;">
						<form id="delivery_address_form" class="form-horizontal" role="form">
								<div id="locationField" class="form-group form-group-lg margin-remove margin-remove-mobile">
									<label class="col-sm-4 col-md-4 col-lg-2 control-label delivery-address-label for_dlvry_lbl" for="full_delivery_address" style="padding-left:25px;">Delivery Address</label>
									<div class="col-sm-12 col-md-9 col-lg-9">
										 <div class="col-sm-12 col-md-12 col-lg-12">
											<input class="form_cntrl col-sm-9" type="text" id="full_delivery_address" placeholder="Enter your address..." name="full_delivery_address" autocomplete="false">
											<div class="col-sm-3 margin-top-mobile" id="verify_full_delivery_address">
												<a href="javascript:void(0);" onclick="confirm_delivery_address();" id="delivery_address_confirm" class="button button-green button-block hover-white shop_btn">Verify</a>
											</div>
										 </div>
									</div>
								</div>
								<div class="col-sm-12 col-md-12 col-lg-12 list_contant address_radio"  style=" border-bottom: medium none;  border-left: medium none; border-right: medium none;padding: 0;position: unset;border-top:none;margin:0;">
								<ul id="ajaxAddress">
								</ul>
							
								
								
							
									
									<!-- The table below is used by Google Maps API to post the address as individual value
										for street number, city, state, zip code and country -->
									<table id="address" style="display:none;">
									  <tr>
										<td class="label">Street address</td>
										<td class="slimField">
											<input class="field" name="street_number" id="street_number"	disabled="true"></input>
										</td>
									  </tr>
									  <tr>
										<td class="label">Route/Address 2</td>	
										<td class="wideField" colspan="2">
											<input class="field" name="route" id="route" disabled="true"></input>
										</td>
									  </tr>
									  <tr>
										<td class="label">City</td>
										<td class="wideField" colspan="3"><input class="field" name="locality" id="locality" disabled="true"></input></td>
									  </tr>
									  <tr>
										<td class="label">State</td>
										<td class="slimField"><input class="field"  id="administrative_area_level_1" name="administrative_area_level_1"  disabled="true"></input></td>
									<tr>		  
									</tr>		  
										<td class="label">Zip code</td>
										<td class="wideField"><input class="field" id="postal_code" name="postal_code"  disabled="true"></input></td>
									  </tr>
									  <tr>
										<td class="label">Country</td>
										<td class="wideField" colspan="3"><input class="field" name="country" id="country" disabled="true"></input></td>
									  </tr>
									</table>
								</div>
								
							
							
						</form>
						
						<div id="deliveryMin" style="color:red; padding-left: 20.21%;" class="col-sm-12 deliveryMinCl">	</div>
					</div>
					
					<div class="list_contant pad1 bg-white" id="confirm_pickup_content" style="display:none;">
						<a href="javascript:void(0);" onclick="confirm_pickup_click(); show_categories_div();" id="pickup_confirm" class="button button-green button-block hover-white confirmBtn shop_btn">REVIEW MENU</a>
					</div>
					
					<!-- <li class="confirm_bt green_bt"><a href="#">CONFIRM AND REVIEW MENU</a></li> -->
				</ul>
			  </div>
			</div>
		</div>
    </div>
</section>
<?php }else{ ?>
<section class="ordering_options" id="locationAndStuff">
<h2 class="top_head mR255" id="home_ribbon_text">Online ordering has been disabled for now. Check back later to place your order.</h2>
</section>
<?php } ?>



<!-- categories section start -->
<section class="ordering_options">
	<div class="outerContainer">
		<div class="contentSection" id="catgories_div" style="display:none;">
		<!-- to be loaded through ajax -->	
		</div>
	</div>
</section>

<!-- Categories section end -->
	
	<?php /*<div class="row">
		<!-- Categories Div start -->
		<div id="catgories_div" style="display:none;">
		</div>
		<!-- Categories Div end -->
	</div> --> */ ?>



<div id="map" style="display:none;"></div>
<!-- order for later date and timings div start -->
<div id="date_and_time_main" style="display:none;">

</div>


<?php //echo '<pre>'; print_r($locationTimingsArr); echo '</pre>'; ?>

<!-- order for later date and timings div start -->

<!--
	This input filed is just to hold the return value of the function initMap to determine
	if the delivery address added is contained in the geofence set in the admin panel
-->	
<input style="float:right;" type="hidden" id="geocodeReturn" value="" />

 
		
<?php if( $_GET['step_back'] != 'categories' ){ ?>		
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACWrGwt3zW3d8EwN4Vf7aFVSEaQCdXkms&libraries=places&callback=initAutocomplete" async defer></script>
<?php } ?>			
<script type="text/javascript"><!--
<?php /* $(document).on('change', 'input[name=\'account\']', function() {
	if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}
	}
});
*/ ?>
var location_coordinates	=	[];
var fullAddress	=	'';
var screenWidth = $( window ).width();

$(document).ready(function() {
	
	// if(screenWidth >= 1280){
		// //
		// $('#mobile_cart_hide_first_screen').show();
	// }
	

	//To hide the sidebar with cart info on first screen
	$('#sidebarCart').hide();
	
	var current_url = window.location.href;
	if (current_url.search('step_back=categories') != -1){
		var merchant_id = '<?php echo $_SESSION['merchantID']; ?>';

		var srch_div = '<div id="product_search">		<i style="color:#fff;" class="fa fa-search " aria-hidden="true" id="productSearchButton"></i>		<input style="display:none;" placeholder="Search for any item..." type="text" id="productSearchBox">		</div>';
		if(merchant_id){
			/*get categories from clover*/
			$.ajax({
				url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/getCategoriesWithProducts',
				type: 'get',
				dataType: 'html',
				beforeSend: function() {
					//$('#button-login').button('loading');
				},
				complete: function() {
					//$('#button-login').button('reset');
				},
				success: function(data) {
						$('#accordion').hide();
					
						//$('#content_top_div').fadeIn('1000');
						$('#sidebarCart').show('slide',{direction:'right'},300);
						$('#home_ribbon_text').html('<span class="menu_item_text">MENU ITEMS</span>' + srch_div);
						$('#right_header_cart').show();
						$('#catgories_div').html(data).fadeIn('1000');
						$('#header_logo').hide();
						// banner_fix_showCategoryDiv();	
						if(screenWidth <= 1280){
							//to display the cart button on mobile and tab screens
							$('#mobile_cart_hide_first_screen').show();
						}
						$('#step_back_menu').show();
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			
			});
			return;
		}
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=common/home/getCategoriesWithProducts',
			type: 'get',
			dataType: 'html',
			beforeSend: function() {
				//$('#button-login').button('loading');
			},
			complete: function() {
				//$('#button-login').button('reset');
			},
			success: function(html) {
					$('#accordion').hide();
				
					//$('#content_top_div').fadeIn('1000');
					$('#sidebarCart').show('slide',{direction:'right'},300);
					$('#home_ribbon_text').html('<span class="menu_item_text">MENU ITEMS</span>' + srch_div);
					$('#right_header_cart').show();
					$('#catgories_div').html(html).fadeIn('1000');
					$('#header_logo').hide();
					banner_fix_showCategoryDiv();	
					if(screenWidth <= 1280){
						//to display the cart button on mobile and tab screens
						$('#mobile_cart_hide_first_screen').show();
					}
					$('#step_back_menu').show();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		
		});
		// $('#confirm_view_menu').trigger('click');
		// $('#sidebarCart').show('slide',{direction:'right'},300);
		// show_categories_div();
		return;
	}else{
		$('#accordion').show();
	}	
	
    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/getLocations',
        dataType: 'html',
        success: function(html) {
           // $('#collapse-location-option .panel-body').html(html);

			// $('#collapse-location-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-location-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_option; ?>Choose Location <i class="fa fa-caret-down"></i></a>');
			
			$('#order_pickup_unavailable').attr('id', 'order_pickup');
			$('#order_delivery_unavailable').attr('id', 'order_delivery');
			
			// $('a[href=\'#collapse-location-option\']').trigger('click');
			$('#time_title').attr('id', 'time_title_disabled');
			$('#method_title').attr('id', 'method_title_disabled');
			$('#confirm_title').attr('id', 'confirm_title_disabled');
			$('#location_content').html(html).slideDown();
			$('#location_chose_img').show();
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});


//Reset all other accordions tabs whenever "Choose Location" is clicked
// $(document).delegate('a[href=\'#collapse-location-option\']', 'click', function() {
	// $('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('Choose a Time');
	// $('#collapse-choose-method').parent().find('.panel-heading .panel-title').html('Choose a Method');
	// $('#collapse-confirm').parent().find('.panel-heading .panel-title').html('Confirm');
// });	

//Get selected location
$(document).delegate('[id^="selectedLocation_"]', 'click', function() {
	// $('#order_for_now_id').remove();
	// $('#order_for_later_id').remove();
	$('#time_title_disabled').attr('id', 'time_title');
	var order_later_status = <?php echo $order_later_status; ?>
	
	var location_id = this.id;
		location_id = location_id.replace('selectedLocation_', '');
		
		var clover_enabled = $('#clover_enabled_'+location_id).val();
		// if(merchant_id){ get_merchant_time(merchant_id); return; };
	deliveryAddressListing(location_id);
    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/saveSelectedLocationId',
        type: 'post',
        data: {locationId : location_id,clover_Enabled : clover_enabled},
        dataType: 'json',
        beforeSend: function() {
        	//$('#button-login').button('loading');
		},
        complete: function() {
            //$('#button-login').button('reset');
        },
        success: function(json) {
            // $('.alert, .text-danger').remove();
            // $('.form-group').removeClass('has-error');

            if (json['locationId']) {
				goBackToChooseTime();
				var order_for_now = false;
				if(json['order_for_now'] == true){ order_for_now = true; }

				//console.log('order for now = '+order_for_now);
				
				if(!order_for_now){
					$('#order_for_now_title').html('ORDER FOR NOW (<small>Unavailable</small>) - ');
					$('#order_for_now_disable').html('We are not taking orders this time.');
					if(order_later_status == 1){
						$('#order_now_message').hide();
					}else{
						$('#order_now_message').show();
					}
					$('#order_for_now_description').html('Order for Now is not available at this time. Click here to see hours.');
					$('#order_for_now').attr('id', 'order_for_now_unavailable');
					$('#order_for_now_unavailable').hide(); // .hide() added later as per the requirement - 'If shop is closed, do not show "ORDER NOW". Only show ORDER FOR LATER'
				}else{
					$('#order_now_message').hide();
					$('#order_for_now_title').html('ORDER FOR NOW - ');
					$('#order_for_now_description').html('Have your order prepared as soon as possible.');
					$('#order_for_now_unavailable').attr('id', 'order_for_now');
					$('#order_for_now').show(); // .show() added later as per the requirement - 'If shop is closed, do not show "ORDER NOW". Only show ORDER FOR LATER'
				}	

				/*$('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('<a href="#collapse-choose-time" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_payment_method; ?>Choose a Time <i class="fa fa-caret-down"></i></a>');
				
				$('a[href=\'#collapse-choose-time\']').trigger('click');*/
				
				
				$('#location_content').slideUp();
				$('#time_content').slideDown();
				$('#time_chose_img').show();
				

				// $('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('<?php //echo $text_checkout_confirm; ?>');
						
						
            } else{
				bootbox.alert("<div class='custom_bootbox_error'>Something went wrong, please try again!</div> ", function() {
				});
		    }	   
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});



function deliveryAddressListing(location_id){
	
	// alert(location_id);

	var url = '<?php echo BASE; ?>index.php?route=common/home/get_deliveryListingData';

	  $.ajax({
           type: "post",
           url: url,
		   dataType:'json',
           data: {location_id:location_id}, // serializes the form's elements.
           success: function(data)
           {
			   // alert();
			   //console.log(data.deliveryListingStatus);
			    viewData = '';
				//console.log('1');
				$('#ajaxAddress').css('display','none');
			   if(data.deliveryListingStatus == '1'){
					$('#full_delivery_address').css('display','block');
					
					$('#verify_full_delivery_address').show();
					//console.log('2');
			   }else{
				   //console.log('3');
				   $('#full_delivery_address').css('display','none');
					$('#verify_full_delivery_address').hide();
					$('#ajaxAddress').css('display','block');
					var count=1;
				   $.each(data.deliveryAddressArr, function(key,val) {
					   if( count%2 == 0 )
						   var class_ = 'gray';
					   else if( count%2 == 1 )
						   var class_ = '';
					   
						viewData += '<li class="'+class_+'" onclick="getaddressData('+val.address_id+');"><input class="form-control" value="'+val.address+'" type="hidden" id="address_id_'+val.address_id+'" name="select_address" ><span>'+val.address+'</span></li>';
						count++
					});
						
						$('#confirm_delivery_content').addClass('for_dlvry_nxt');
						$('#ajaxAddress').html(viewData);
						//console.log('3');
				}
			   
			   
			   
			   // $('#input-edit-address').val(data.address);
			   // $('#input-address-id').val(data.address_id);
		   }
	 });
}
	

//Get selected location
$(document).delegate('#order_for_now, #order_for_later', 'click', function() {
	// var type_name = this.id;
// var order_type_id = $('#'+type_name+'_id').val();
// if(order_type_id){
	// order_type(order_type_id,type_name);
	// return;
// }
	$('#order_now_message').hide();
	var order_type_id = this.id;
		// location_id = location_id.replace('selectedLocation_', '');
	
	if(order_type_id == 'order_for_later'){
		$('#order_for_now, #order_for_now_unavailable, #order_for_later').hide();
		// $('#collapse-choose-time .panel-body').append($('#date_and_time_main'));

		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=common/home/get_location_day_dates',
			type: 'get',
			dataType: 'html',
			beforeSend: function() {
				//$('#button-login').button('loading');
			},
			complete: function() {
				//$('#button-login').button('reset');
			},
			success: function(dayDateHtml) {
						<?php // if(strpos($_SERVER['REQUEST_URI'], 'ca/lillyclover') !== false ){ ?>
						//alert(dayDateHtml);
						<?php //} ?>
					$('#date_and_time_main').html(dayDateHtml);
					$('#time_content').append($('#date_and_time_main'));
					$('#date_and_time_main').show();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		
		});
		// $('#confirm_view_menu').trigger('click');
		// $('#sidebarCart').show('slide',{direction:'right'},300);
		// show_categories_div();
		return;
	}	
	
    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/saveSelectedOrderTypeId',
        type: 'post',
        data: {OrderTypeId : order_type_id},
        dataType: 'json',
        beforeSend: function() {
        	//$('#button-login').button('loading');
		},
        complete: function() {
            //$('#button-login').button('reset');
        },
        success: function(json) {
            // $('.alert, .text-danger').remove();
            // $('.form-group').removeClass('has-error');
			
			$('#method_title_disabled').attr('id', 'method_title');
			
            if (json['OrderTypeId']) {
				
				var pickupAvailable = false;
				var deliveryAvailable = false;
				if(json['pickupAvailable']){ pickupAvailable = true; }
				if(json['deliveryAvailable']){ deliveryAvailable = true; }
				
				if(json['deliveryAvailable'] === null){ deliveryAvailable = false; }
								
				var locationInfoArr = [];
					locationInfoArr = json['locationsInfo'];
				// console.log(json);
				// console.log(json);
				// console.log(json);
				// console.log(json);
				if(pickupAvailable && !deliveryAvailable){
					
						$('#pickup_enabled').hide();
						$('#delivery_enabled').hide();
						$('#order_pickup').css('display', 'none');
						$('#order_delivery').css('display', 'none');
						
					if(json['pickup_enabled'] == '1'){
						$('#order_pickup').css('display', 'block');
						$('#method_chosen_pickup').html('Pickup -');
						
						$('#method_chosen_pickup_info').html('Pickup your order at the <strong>'+locationInfoArr['title']+' </strong>.');
						
						$('#order_pickup_unavailable').attr('id', 'order_pickup');
					}else{
						$('#order_pickup').css('display', 'none');
						// $('#pickup_enabled').show();
					}
					
					if(json['delivery_enabled'] == '1'){
						$('#order_delivery').attr('id', 'order_delivery_unavailable');
						
						$('#method_chosen_delivery').html('Delivery (<small>Unavailable</small>) -');
						$('#method_chosen_delivery_info').html('Delivery is not available at this time. Click to see hours.');
					}else{
						$('#order_delivery').css('display', 'none');
						// $('#delivery_enabled').show();
					}
							

				}else if(!pickupAvailable && deliveryAvailable){
					$('#pickup_enabled').hide();
					$('#delivery_enabled').hide();
					$('#order_pickup').css('display', 'none');
					$('#order_delivery').css('display', 'none');
					
					if(json['pickup_enabled'] == '1'){
						$('#method_chosen_pickup').html('Pickup (<small>Unavailable</small>) -');
						$('#method_chosen_pickup_info').html('Pickup is not available at this time. Click to see hours.');
						
						$('#order_pickup').attr('id', 'order_pickup_unavailable');
					}else{
						$('#order_pickup').css('display', 'none');
						$('#pickup_enabled').show();
					}
					
					if(json['delivery_enabled'] == '1'){
						$('#order_delivery_unavailable').attr('id', 'order_delivery');
						
						if(json['laterOrderDay'] && json['laterTime']){
							$('#method_chosen_delivery_info').html('Your order will be delivered to you on <strong>'+json['laterOrderDay']+' around '+json['laterTime']+ '</strong>');
						}else{
							$('#method_chosen_delivery_info').html('Your order will be delivered to you as soon as possible.');
						}
					}else{
						$('#order_delivery').css('display', 'none');
						// $('#delivery_enabled').show();
						
					}
					
				}else if(!pickupAvailable && !deliveryAvailable){
					if(json['pickup_enabled'] == '1' && json['delivery_enabled'] == '1'){
						$('#method_chosen_pickup').html('Pickup (<small>Unavailable</small>) -');
						$('#method_chosen_pickup_info').html('Pickup is not available at this time. Click to see hours.');
						
						$('#order_pickup').attr('id', 'order_pickup_unavailable');
						$('#order_delivery').attr('id', 'order_delivery_unavailable');
											
						$('#method_chosen_delivery').html('Delivery (<small>Unavailable</small>) -');
						$('#method_chosen_delivery_info').html('Delivery is not available at this time. Click to see hours.');
					}
	
				}else{
					$('#pickup_enabled').hide();
					$('#delivery_enabled').hide();
					$('#order_pickup').css('display', 'none');
					$('#order_delivery').css('display', 'none');
					
					if(json['pickup_enabled'] == '1'){
						$('#order_pickup').css('display', 'block');
						$('#method_chosen_pickup').html('Pickup -');
						$('#method_chosen_pickup_info').html('Pickup your order at the <strong>'+locationInfoArr['title']+' </strong>.');
						$('#order_pickup_unavailable').attr('id', 'order_pickup');
						
					}else{
						$('#order_pickup').css('display', 'none');
						// $('#pickup_enabled').show();
					}
					
					if(json['delivery_enabled'] == '1'){
						$('#order_delivery').css('display', 'block');
						$('#order_delivery_unavailable').attr('id', 'order_delivery');
						
						$('#method_chosen_delivery').html('Delivery -');
						if(json['laterOrderDay'] && json['laterTime']){
							$('#method_chosen_delivery_info').html('Your order will be delivered to you on <strong>'+json['laterOrderDay']+' around '+json['laterTime']+'</strong>');
						}else{
							$('#method_chosen_delivery_info').html('Your order will be delivered to you as soon as possible.');
						}	
					}else{
						$('#order_delivery').css('display', 'none');
						// $('#delivery_enabled').show();
					}
				}		
				
				// $('#collapse-choose-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-choose-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_payment_method; ?>Choose a Method <i class="fa fa-caret-down"></i></a>');
				
				// $('a[href=\'#collapse-choose-method\']').trigger('click');
				
				$('#time_content').slideUp();
				$('#method_chose_img').show();
				$('#method_content').slideDown();

				// $('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('<?php //echo $text_checkout_confirm; ?>');
						
						
            } else{
				bootbox.alert("<div class='custom_bootbox_error'>Something went wrong, please try again!</div> ", function() {
				});
		    }	   
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
/*
 * This function will hide the timings div in order_for_later module 
 * and display the choose a time options again
 */
function goBackToChooseTime(){
	$('#date_and_time_main').hide();
	$('#order_now_message').hide();
	$('#order_for_now_unavailable').hide();
	$('#order_for_now,#order_for_later').show();
	//$('#order_for_now, #order_for_now_unavailable, #order_for_later').show();
}	

/*
 * This function will save the timings selected for a later order selected
 * in order_for_later box
 */
function saveLaterOrderTimings(unique){
	
	$('#method_title_disabled').attr('id', 'method_title');
	
	//alert(unique);
	var later_time = $('#later_time_'+unique).val();
	var later_timestamp = $('#later_timestamp_'+unique).val();
	var pickup_status = $('#pickup_status_'+unique).val();
	var delivery_status = $('#delivery_status_'+unique).val();
	var day_id = $('#day_id_'+unique).val();
	var order_type_id = 'order_for_later';
	
	$.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/saveSelectedOrderTypeId',
        type: 'post',
        data: {
				OrderTypeId : order_type_id,
				laterTime: later_time,
				laterTimestamp: later_timestamp,
				pickupStatus: pickup_status,
				deliveryStatus: delivery_status,
				dayId : day_id
			  },
        dataType: 'json',
        beforeSend: function() {
        	//$('#button-login').button('loading');
		},
        complete: function() {
            //$('#button-login').button('reset');
        },
        success: function(json) {
            // $('.alert, .text-danger').remove();
            // $('.form-group').removeClass('has-error');
			
            if (json['OrderTypeId']) {
				
				var pickupAvailable = false;
				var deliveryAvailable = false;
				if(json['pickupAvailable']){ pickupAvailable = true; }
				if(json['deliveryAvailable']){ deliveryAvailable = true; $('#order_delivery').css('display', 'block'); }
				
				var locationInfoArr = [];
					locationInfoArr = json['locationsInfo'];
				
				if(pickupAvailable && !deliveryAvailable) {
					
						$('#order_pickup').css('display', 'none');
						$('#order_delivery').css('display', 'none');
						
					if(json['pickup_enabled'] == '1'){
						$('#order_pickup').css('display', 'block');
					$('#method_chosen_pickup').html('Pickup -');
					$('#method_chosen_pickup_info').html('Pickup your order at the <strong>'+locationInfoArr['title']+' </strong>.');
					
					$('#order_pickup_unavailable').attr('id', 'order_pickup');
					}
					if(json['delivery_enabled'] == '1'){
						 $('#order_delivery').css('display', 'none');
						/*$('#order_delivery').attr('id', 'order_delivery_unavailable');
						
						$('#method_chosen_delivery').html('Delivery (<small>Unavailable</small>) -');
						$('#method_chosen_delivery_info').html('Delivery is not available at this time. Click to see hours.');*/
					}else{
						$('#order_delivery').css('display', 'none');
					}
					
				}else if(!pickupAvailable && deliveryAvailable){
							$('#order_pickup').css('display', 'none');
						$('#order_delivery').css('display', 'none');
						
					if(json['pickup_enabled'] == '1'){
						$('#order_pickup').css('display', 'none');
						/*$('#method_chosen_pickup').html('Pickup (<small>Unavailable</small>) -');
						$('#method_chosen_pickup_info').html('Pickup is not available at this time. Click to see hours.');
						
						$('#order_pickup').attr('id', 'order_pickup_unavailable');*/
					}
					
					if(json['delivery_enabled'] == '1'){
						$('#order_delivery').css('display', 'block');
						$('#order_delivery_unavailable').attr('id', 'order_delivery');
						
						$('#method_chosen_delivery').html('Delivery -');
						if(json['laterOrderDay'] && json['laterTime']){
							$('#method_chosen_delivery_info').html('Your order will be delivered to you on <strong>'+json['laterOrderDay']+' around '+json['laterTime']+ '</strong>');
						}else{
							$('#method_chosen_delivery_info').html('Your order will be delivered to you as soon as possible.');
						}
					}else{
				
						$('#order_delivery').css('display', 'none');
					}
					
				}else if(!pickupAvailable && !deliveryAvailable){
		
					$('#method_chosen_pickup').html('Pickup (<small>Unavailable</small>) -');
					$('#method_chosen_pickup_info').html('Pickup is not available at this time. Click to see hours.');
					
					$('#order_pickup').attr('id', 'order_pickup_unavailable');
					$('#order_delivery').attr('id', 'order_delivery_unavailable');
										
					$('#method_chosen_delivery').html('Delivery (<small>Unavailable</small>) -');
					$('#method_chosen_delivery_info').html('Delivery is not available at this time. Click to see hours.');
					
					
				}else{
						// $('#pickup_enabled').hide();
						// $('#order_delivery').hide();
						$('#order_pickup').css('display', 'none');
						$('#order_delivery').css('display', 'none');
						
						
					if(json['pickup_enabled'] == '1'){
						setTimeout(function(){
							$('#order_pickup').css('display', 'block');
							// console.log('time_'); 
							}, 1);
						// $('#order_pickup').css('display', 'block');
						$('#method_chosen_pickup').html('Pickup -');
						$('#method_chosen_pickup_info').html('Pickup your order at the <strong>'+locationInfoArr['title']+' </strong>.');
						$('#order_pickup_unavailable').attr('id', 'order_pickup');
					}
					
					if(json['delivery_enabled'] == '1'){
						// console.log('1');
						setTimeout(function(){
							$('#order_delivery').css('display', 'block');
							// console.log('time_'); 
							}, 1);
						
						$('#order_delivery_unavailable').attr('id', 'order_delivery');
						
						$('#method_chosen_delivery').html('Delivery -');
						
						if(json['laterOrderDay'] && json['laterTime']){
							$('#method_chosen_delivery_info').html('Your order will be delivered to you on <strong>'+json['laterOrderDay']+' around '+json['laterTime']+'</strong>');
						}else{
							$('#method_chosen_delivery_info').html('Your order will be delivered to you as soon as possible.');
						}	
					}else{
			//console.log('2');
						$('#order_delivery').css('display', 'none');
					}
				}		
				
				// $('#collapse-choose-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-choose-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_payment_method; ?>Choose a Method <i class="fa fa-caret-down"></i></a>');
				
				// $('a[href=\'#collapse-choose-method\']').trigger('click');
				
				
				$('#time_content').slideUp();
				$('#method_chose_img').show();
				$('#method_content').slideDown();


				// $('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('<?php //echo $text_checkout_confirm; ?>');
						
						
            } else{
				bootbox.alert("<div class='custom_bootbox_error'>Something went wrong, please try again!</div> ", function() {
				});
		    }	   
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
	
	
}

//Confirm Order Till now
$(document).delegate('#order_pickup, #order_delivery', 'click', function() {
	
	$('#confirm_title_disabled').attr('id', 'confirm_title');
	
	var chosen_id = this.id;
	var method_chosen_id = $('#'+chosen_id).find('span').attr('id');	
		// location_id = location_id.replace('selectedLocation_', '');
    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/confirmOrder',
        type: 'post',
        data: {MethodChosenId : method_chosen_id},
        dataType: 'json',
        beforeSend: function() {
        	//$('#button-login').button('loading');
		},
        complete: function() {
            //$('#button-login').button('reset');
        },
        success: function(json) {
            // $('.alert, .text-danger').remove();
            // $('.form-group').removeClass('has-error');
            
			if (json['MethodChosenId']) {
				
							// Show delivery fee charges notice
				if( json[ 'show_popup' ] && json[ 'show_popup' ] == true ) {
					console.log(json[ 'popup_msg' ]);
					$('#deliveryMin').html( json[ 'popup_msg' ] );
					// bootbox.dialog({
					  // title: "Delivery Fee Charges: ",
					  // message: json[ 'popup_msg' ],
					  // buttons: {
							// success: {
								// label: "Ok",
								// className: "btn-success"
							// }
						// }
					// });
				}
	
				
				
				
				var pickupAvailable = false;
				var deliveryAvailable = false;
				if(json['pickupAvailable']){ pickupAvailable = true; }
				if(json['deliveryAvailable']){ deliveryAvailable = true; }
				
				var locationInfoArr = [];
					locationInfoArr = json['locationsInfo'];
					
					if( json['delivery_listings_status'] == '2' ){
						$( '#locationField' ).find( 'label' ).text( 'Delivery Listings' );
					}else{
						$( '#locationField' ).find( 'label' ).text( 'Delivery Address' );
					}
				// if(pickupAvailable && json['MethodChosenId'] == 'method_chosen_pickup'){
					// $('#panel_confirm_delivery').hide();
					// $('#panel_confirm_pickup').show();
				// }else if(deliveryAvailable && json['MethodChosenId'] == 'method_chosen_delivery'){
					// $('#panel_confirm_delivery').show();
					// $('#panel_confirm_pickup').hide();				
				// }	
				
				// $('#collapse-confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_payment_method; ?>Confirm <i class="fa fa-caret-down"></i></a>');
				
				// $('a[href=\'#collapse-confirm\']').trigger('click');
				
				$('#method_content').slideUp();
				$('#confirm_chose_img').show();
				
				if(pickupAvailable && json['MethodChosenId'] == 'method_chosen_pickup'){
					$('#confirm_pickup_content').slideDown();
					$('#confirm_delivery_content').hide();
				}else if(deliveryAvailable && json['MethodChosenId'] == 'method_chosen_delivery'){
					$('#confirm_delivery_content').slideDown();
					$('#confirm_pickup_content').hide();				
				}
				
				// $('#collapse-choose-time').parent().find('.panel-heading .panel-title').html('<?php //echo $text_checkout_confirm; ?>');
						
						
            } else{
				bootbox.alert("<div class='custom_bootbox_error'>Something went wrong, please try again!</div> ", function() {
				});
		    }	   
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// //to hide the accordion and show categories and the step_back_menu
// $(document).delegate('#confirm_view_menu', 'click', function() {
	// $('#accordion').hide();
	// $('#catgories_div').fadeIn('2000');
	// $('#step_back_menu').show();
// });

//to hide the accordion and show categories and the step_back_menu
function show_categories_div(){
	
	location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
	return;
	/*
	$('#accordion').hide();
	
	$.ajax({
        url: 'index.php?route=common/home/getCategoriesWithProducts',
        type: 'get',
        dataType: 'html',
        beforeSend: function() {
        	//$('#button-login').button('loading');
		},
        complete: function() {
            //$('#button-login').button('reset');
        },
        success: function(html) {
				//$('#content_top_div').fadeIn('1000');
				$('#sidebarCart').show('slide',{direction:'right'},300);
				$('#home_ribbon_text').html('MENU ITEMS');
				$('#right_header_cart').show();
				$('#catgories_div').html(html).fadeIn('1000');
				$('#header_logo').hide();
		        banner_fix_showCategoryDiv();	
				if(screenWidth <= 1280){
					//to display the cart button on mobile and tab screens
					$('#mobile_cart_hide_first_screen').show();
				}
				$('#step_back_menu').show();
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
	*/
		
}	

//to hide show categories
$(document).delegate('#step_back_menu', 'click', function() {
	
	//bootbox.alert("Your message here…");
	
	var current_url = window.location.href;
	if (current_url.search('step_back=categories') != -1){
		bootbox.dialog({
		  message: "Are you sure you want to cancel this order?",
		  //title: "Custom title",
		  buttons: {
			// success: {
			  // label: "Success!",
			  // className: "btn-success",
			  // callback: function() {
				// Example.show("great success");
			  // }
			// },
			danger: {
			  label: "YES",
			  className: "btn-danger",
			  callback: function() {
				  
				  $.ajax({
					url: '<?php echo BASE; ?>index.php?route=common/home/unsetCurrentOrder',
					type: 'post',
					data: {unset : 'unset'},
					//dataType: 'json',
					beforeSend: function() {
						//$('#button-login').button('loading');
					},
					complete: function() {
						//$('#button-login').button('reset');
					},
					success: function() {
						$('#sidebarCart').hide();
						$('#mobile_cart_hide_first_screen').hide();
						logout_clover_location();
						window.location.href = '<?php echo $home_url; ?>';
						// Example.show("uh oh, look out!");
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
			  }
			},
			main: {
			  label: "NO, DON'T CANCEL.",
			  className: "btn-primary",
			  callback: function() {
				// Example.show("Primary button");
			  }
			}
		  }
		});
		//$('#confirm_view_menu').trigger('click');
		return;
	}
	
	$('#accordion').show();
	
	$('#content_top_div').hide();
	$('#right_header_cart').hide();
	$('#catgories_div').hide();
	$('#header_logo').show();
	banner_fix_hideCategoryDiv();
	$('#home_ribbon_text').html('ORDERING OPTIONS');
	$('#mobile_cart_hide_first_screen').hide();
	$('#step_back_menu').hide();
	$('#sidebarCart').hide();
	$('#accordion').fadeIn('2000');
	// $('a[href=\'#collapse-location-option\']').trigger('click');
	$('#location_title').trigger('click');
});


//show timings for pickup and delivery as per the date and day selected in 'order_for_later'
$(document).delegate('[id^="this_day_"]', 'click', function() {
	var id = this.id;
	$('[id^="this_day_"]').removeClass('active');
	$('#'+id).addClass('active');
	
	// alert(id);
	$('#pick_day_date').hide();
	$('[id^="table_this_day_"]').hide();
	//$('#table_'+id).show();

    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/get_location_timings',
        dataType: 'html',
        success: function(html) {
           $('#allLocationsTiming').html(html);
           $('#table_'+id).show();
		   //console.log('#table_'+id);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
	// alert(id);
});

//show confirm button for a time when a time is selected in 'order_for_later'
function show_confirm_button(time, id){
	$('[id^="order_time_"]').show();
	$('#'+id).hide();
	$('[id^="confirm_order_time_"]').hide();
	$('#button_confirm_'+id).html('Confirm '+time);
	$('#confirm_'+id).show();
};

function logout_clover_location(){
					
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/logout',
		type: 'get',
		success: function(json) {
			return;
		}	
	});
		return;
}

$(document).delegate('#order_for_now_unavailable, #order_pickup_unavailable, #order_delivery_unavailable', 'click', function() {
	showTimings();
});

//ShowTimings Modal
function showTimings(){
	
	$.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/get_location_timings_modal',
        dataType: 'html',
        success: function(html) {
			
			//var parsedhtml = $.parseHTML( html );
			
			bootbox.dialog({
			  //title: "That html",
			  message: html,
			  buttons: {
                    success: {
                        label: "Ok",
                        className: "btn-success"
                    }
                }
			
			});
			
			/*
           $('#collapse-location-option .panel-body').html(html);

			$('#collapse-location-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-location-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php //echo $text_checkout_option; ?>Choose Location <i class="fa fa-caret-down"></i></a>');
			
			$('#order_pickup_unavailable').attr('id', 'order_pickup');
			$('#order_delivery_unavailable').attr('id', 'order_delivery');
			
			$('a[href=\'#collapse-location-option\']').trigger('click');
			*/
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
	//alert('This will be timings modal');
	return;
}	

/*
*	Confirm Button function for method chosen delivery
*	Function to post user details via ajax and save in Session
*/
function confirm_delivery_address(){
	
	// var data	=	{
					// 'input_payment_firstname':$('#delivery_firstname').val(),
					// 'input_payment_lastname':$('#delivery_lastname').val(),
					// 'input_payment_email':$('#delivery_email').val(),
					// 'input_payment_telephone':$('#delivery_telephone').val(),
					// 'input_payment_fax':$('#delivery_fax').val(),
					// 'input_payment_company':$('#delivery_company').val(),
					// 'input_payment_address_1':$('#delivery_address_1').val(),
					// 'input_payment_address_2':$('#delivery_address_2').val(),
					// 'input_payment_postcode':$('#delivery_postcode').val(),
					// 'input_payment_city':$('#delivery_city').val(),
					// 'input_payment_country':$('#delivery_country_id').val(),
					// 'input_payment_zone':$('#delivery_zone_id').val()
					// };
	

	// var countryName = $('#delivery_country_id').find('option:selected').attr('id');
	// var stateName = $('#delivery_zone_id').find('option:selected').attr('id');
	
	//var fullAddress = $('#delivery_address_1').val()+','+$('#delivery_address_2').val()+','+$('#delivery_city').val()+','+stateName+','+countryName;				
	
	var fullAddress = $('#full_delivery_address').val();
	//var data = fullAddress;
	//alert(fullAddress);
	
	if(fullAddress == '' || typeof(fullAddress) == 'undefined'){
		bootbox.alert("<div class='custom_bootbox_error'>Delivery Address Required!</div> ", function() {
		});
		return false;
	}else{	
		
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=common/home/getFenceCoordinates',
			dataType: 'json',
			success: function(json) {
				//$('#geocodeReturn').val('');
				var location_coordinates	=	$.parseJSON(json['locationCoordinates']);
				var initVal = initMap(location_coordinates, fullAddress);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}	
}

/*
 * Functions to verify if the address is in the location range for delivery
 */
/**********************************************************************************/
function initMap(blueCoords, address) {
	var blueCoords1 = blueCoords;
	var map = new google.maps.Map(document.getElementById('map'), {						
		
		center: blueCoords1[0],zoom: 5
	});
 
	//console.log(blueCoords1);
	
	if(blueCoords1 == 'undefined' || blueCoords1 == null){
		//setting up the initial coordinates for polygon1
		var blueCoords1 = [
			{lat: 44.5452, lng: -78.19},
			{lat: 44.29213722690972, lng: -77.99989697265624},
			{lat: 44.46586801436672, lng: -77.51541967773437},
			{lat: 44.697195234376494, lng: -77.67692858886721}
		];
	}
	
	// Construct a draggable blue Polygon1 with geodesic set to false.
	var bermudaPolygon1 = new google.maps.Polygon({
		map: map,
		paths: blueCoords1,
		strokeColor: '#0000FF',
		strokeOpacity: 0.8,
		strokeWeight: 2,
		fillColor: '#0000FF',
		fillOpacity: 0.35,
		draggable: true,
		editable: true,
		geodesic: false
	});
						
	bermudaPolygon1.setMap(map);
	bermudaPolygon1.addListener('mouseup', addLatLng1);
		
	var geocoder = new google.maps.Geocoder();
	
	// document.getElementById('submit').addEventListener('click', function() {
	var geocodeVal = geocodeAddress(geocoder, map, bermudaPolygon1, address);
	
	//console.log(geocodeVal);
	//return;
	
	// });
						
}

//Handles click events on a map, and adds a new point to the Polyline.
function addLatLng1(event) {					
	var vertices = this.getPath();
	//console.log(vertices);
	  
	var contentString = event.latLng.lat() + ',' + event.latLng.lng() ;  

	// Iterate over the vertices.
	for (var i =0; i < vertices.getLength(); i++) {
		var xy = vertices.getAt(i);	
		contentString += ':' + xy.lat() + ',' +xy.lng();
	}
	
	//to display the values in log
	//console.log(contentString); 					
}

function getaddressData(id) { 

	

  var address_id	= id;
  var address = $('#address_id_'+id).val()
  var data	=	{
					'full_delivery_address' 		: address,
					'delivery_listing_id' 			: address_id
				};
	$.ajax({
		  type: 'POST',
		  url: '<?php echo BASE; ?>index.php?route=common/home/add_delivery_address_2_session',
		  data: data,
		  beforeSend: function() {
					  
					},
		  success: function(response) {
			  					$('#confirm_pickup_content').slideDown();
								$('#confirm_delivery_content').hide();
					   // success_function(response);
					   //console.log(response);
					},
		  error: function(response) {
					   //success_function(response);
					   console.log(response);
					},
		  dataType: 'json'
		});			
		// alert(address); return;
		//console.log(data); 
		return;
}  

function geocodeAddress(geocoder, resultsMap, bermudaPolygon1, locationAddress) { 
  var address = locationAddress;
  
  var data	=	{
					'input_payment_firstname'		: '',
					'input_payment_lastname'		: '',
					'input_payment_email'			: '',
					'input_payment_telephone'		: '',
					'input_payment_fax'				: '',
					'input_payment_company'			: '',
					'input_payment_address_1'		: $('#street_number').val(),
					'input_payment_address_2'		: $('#route').val(),
					'input_payment_postcode'		: $('#postal_code').val(),
					'input_payment_city'			: $('#locality').val(),
					'input_payment_country'			: $('#country').val(),
					'input_payment_zone_code'		: $('#administrative_area_level_1').val(),
					'input_payment_zone'			: '',
					'full_delivery_address' 		: $('#full_delivery_address').val(),
					'street_number'					: $('#street_number').val(),
					'route'							: $('#route').val(),
					'postal_code'					: $('#postal_code').val(),
					'locality'						: $('#locality').val(),
					'country'						: $('#country').val(),
					'administrative_area_level_1'	: $('#administrative_area_level_1').val()
				};
  
  
  
  
  var geoFunc = geocoder.geocode({'address': address}, function(results, status) {
	 if (status === google.maps.GeocoderStatus.OK) {
		 var contains1 = google.maps.geometry.poly.containsLocation(results[0].geometry.location , bermudaPolygon1);
		var street_number	=	$('#street_number').val();	
		//console.log(street_number);
		// if(street_number == '' || typeof(street_number) == 'undefined'){
			
			// bootbox.alert("<div class='custom_bootbox_error'>Sorry this location doesn't deliver to this address. Please try again.</div>", function() {
			// });
			// return false;
			
		// }
		 if(contains1){
			// $('#geocodeReturn').val(1);
			$.ajax({
					  type: 'POST',
					  url: '<?php echo BASE; ?>index.php?route=common/home/add_delivery_address_2_session',
					  data: data,
					  beforeSend: function() {
								  
								},
					  success: function(response) {
								   success_function(response);
								   //console.log(response);
								},
					  error: function(response) {
								   //success_function(response);
								   //console.log(response);
								},
					  dataType: 'json'
					});
		 }else{
			// $('#geocodeReturn').val(2);
			bootbox.alert("<div class='custom_bootbox_error'>Sorry! We do not deliver to this address.</div>", function() {
			});
			return false;
		 }  
	 } else {
		//alert('Geocode was not successful for the following reason: ' + status);
	 }
  });
} 

/**********************************************************************************/



function success_function(response){
	if(response == 1){
		// $('#confirm_view_menu').trigger('click');
		show_categories_div();
		//console.log('Hurrah');
	}else{
		bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
			location.reload();
		});
		//console.log('Alas');	
		//location.reload();
	}
}



/*
*	Confirm Button function for method chosen pickup
*/
function confirm_pickup_click(){
	// $('#confirm_view_menu').trigger('click');
	show_categories_div();
}


/*
 * This function will reload the whole page when the cancel button is clicked in the delivery address form
 */
$(document).delegate('#cancel_delivery', 'click', function() {
	location.reload();
});


//Reset all other accordions tabs whenever "Choose a Location" is clicked
$(document).delegate('#location_title, #location_chose_img', 'click', function() {
	//console.log('clicked');
	$('#time_title').attr('id', 'time_title_disabled');
	$('#method_title').attr('id', 'method_title_disabled');
	$('#confirm_title').attr('id', 'confirm_title_disabled');
	$('#time_chose_img, #method_chose_img, #confirm_chose_img').hide();
	$('#location_content').slideDown();
	$('#time_content').slideUp();
	$('#method_content').slideUp();
	$('#confirm_delivery_content').slideUp();
	$('#confirm_pickup_content').slideUp();
	//$('#collapse-confirm').parent().find('.panel-heading .panel-title').html('Confirm');
});


$(document).delegate('#time_title, #time_chose_img', 'click', function() {
	$('#time_content').slideDown();
	$('#location_content').slideUp();
	$('#method_content').slideUp();
	$('#confirm_delivery_content').slideUp();
	$('#confirm_pickup_content').slideUp();
});

$(document).delegate('#method_title, #method_chose_img', 'click', function() {
	$('#method_content').slideDown();
	$('#time_content').slideUp();
	$('#location_content').slideUp();
	$('#confirm_delivery_content').slideUp();
	$('#confirm_pickup_content').slideUp();
});

$(document).delegate('#confirm_title', 'click', function() {
	
	var methodChosen = '';
	
	$.ajax({
        url: '<?php echo BASE; ?>index.php?route=common/home/getMethodChosenForConfirm',
        dataType: 'json',
        success: function(json) {
			methodChosen = json['methodChosen'];
			$('#method_content').slideUp();
			$('#time_content').slideUp();
			$('#location_content').slideUp();
			
			if(methodChosen != '' && methodChosen == 'method_chosen_delivery'){
				$('#confirm_pickup_content').hide();
				$('#confirm_delivery_content').slideDown();
			}else if(methodChosen != '' && methodChosen == 'method_chosen_pickup'){
				$('#confirm_delivery_content').hide();
				$('#confirm_pickup_content').slideDown();
			}else{
				bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
					location.reload();
				});
			}

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

});


/*
 * This function will toggle the products listed in each category
 */
function toggle_category_content(id){
	
	var base_url = '<?php echo $base; ?>';

	var justId = id.replace('category_', '');
	$('[id^="category_content_"]').slideUp();
	$('[id^="category_"]').find('.menu-items-arrow').html('<i class="fa fa-chevron-down"></i>');
	
	if($('#category_content_'+justId).css('display') == 'none'){
		$('#category_content_'+justId).slideDown();
		$('#'+id).find('.menu-items-arrow').html('<i class="fa fa-chevron-up"></i>');
	}else{
		$('#category_content_'+justId).slideUp();
		$('#'+id).find('.menu-items-arrow').html('<i class="fa fa-chevron-down"></i>');
	}	
	
}	



//https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
var placeSearch, autocomplete;

var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

//auto complete address form
function initAutocomplete() {

	autocomplete = new google.maps.places.Autocomplete(
	  /** @type {!HTMLInputElement} */(document.getElementById('full_delivery_address')),
	  {types: ['geocode']});
  
  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', fillInAddress);
}

// [START region_fillform]
function fillInAddress() {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

  for (var component in componentForm) {
    document.getElementById(component).value = '';
    document.getElementById(component).disabled = false;
  }

  // Get each component of the address from the place details
  // and fill the corresponding field on the form.
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}

//--></script>
<?php echo $footer; ?>