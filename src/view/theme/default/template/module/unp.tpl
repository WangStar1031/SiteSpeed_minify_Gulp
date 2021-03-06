<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
@media only screen and (max-width:950px){
	#product_search input[type="text"] {
		width:40%;
}
}

@media only screen and (max-width:768px){
	#product_search input[type="text"] {
		width:100%;
}
}

</style>
<div class="col-lg-12 col-md-12 col-sm-12">
	<div class="row" id="productSearchResult">
	</div>
	<div class="row productViewDiv">

		<div class="col-md-6 col-sm-6 col-xs-6">
			<a href="javascript:void(0)" id="showUsualOrders" <?php if($customerLogged){ ?> onclick="showRelativeOrders(this.id)" <?php }else{ ?> onclick="showLoginForm()" <?php } ?> style="text-decoration:none;z-index:2147483647">
				<div class="oreder_left">
					<div class="top_title col-md-12">
						<span class="menu-item-icons">
							<!-- <img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/menus_head.png" alt="" /> -->
							<i class="fa fa-cutlery"></i>
						</span>	
						<h2>order my <b>usual</b></h2>
					</div>
				</div>
			</a>
		</div>


		<div class="col-md-6 col-sm-6 col-xs-6" >
		   <div class="oreder_left">
				<a href="javascript:void(0)" id="showPopPicks" onclick="showRelativeOrders(this.id)">
					<div class="top_title col-md-12">
						<span class="menu-item-icons">
							<!-- <img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/menus_head1.png" alt="" /> -->
							<i class="fa fa-fire"></i>
						</span>	
						<h2>popular <b>picks</b></h2>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>


<?php if($customerLogged){ ?>			
<div class="col-lg-12 col-md-12 col-sm-12">
	
		<div id="usualOrders" style="display:none;">
			   <?php if(isset($usualOrders['products']) && !empty($usualOrders['products'])){ ?>
			   
					<div class="contant_area usual dp">
						<ul>
							<?php foreach ($usualOrders['products'] as $product) {
									$formatPrice =	explode('.',$product['price']); //to separate dollar and cents to be used in the new UI
									$cents = '00';
									if(isset($formatPrice[1])){
										$cents = $formatPrice[1];
									}
									if(isset($formatPrice[0])){
										$dollarArr =	str_split($formatPrice[0]); // to separate dollar sign and amount to be used in the new UI
										$currencySymbol = '$';
										$dollars = implode('',$dollarArr);
										if(isset($dollarArr[0])){
											$currencySymbol = array_shift($dollarArr);
											$dollars = implode('',$dollarArr);
										}	
				
									}
									
							?>
							<li>
								<a href="<?php echo $product['href']; ?>" id="add_to_order" data-product-link="<?php echo $product['href']; ?>" >
								
								<?php if( !empty($product['thumb']) && file_exists(DIR_IMAGE.'product_img/'.$product['thumb'])){?>
									<div class="cust_product_img1 " style="width:10%; float:left; ">
										<img src="<?php echo $base.'upload/image/product_img/'.$product['thumb']; ?>" alt="" title=" " width="120" class="unp_item_img" />
										<div class="p-call show_hide_unp_price_col" style="display:none; float: right;">
										<?php if($dollars == 0 && $cents == 0){ ?>
										<div class="price_col"><p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars;  echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div></div><br><br><br><br>
										<?php } else{ ?>
										<div class="price_col " ><p><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></p><div class="add_to_order_button">Order</div></div><br><br><br><br>
										<?php } ?>
										<div class="price_col" style="background:none; border:none; margin-top:-5px;">
										
											<?php
												foreach($product['tags'] as $tags){
											?>		
												<img src="<?php echo $base.'upload/image/'.$tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
											<?php
												}
											?>
										</div>
										<div class="clear"></div>
										</div>						
									</div>	
								<?php } ?>									
								
									<div class="text_col top_spacing"><span><?php echo $product['name']; ?></span><?php echo $product['description']; ?></div>
									<div class="p-call show_hide_p-call">
									<?php if($dollars == 0 && $cents == 0){ ?>
									<div class="price_col"><p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars; echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div>
									<?php } else{ ?>
									<div class="price_col"><p><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></p><div class="add_to_order_button">Order</div>
									<?php } ?>
									</div>
									<br><br><br><br>
									<div class="price_col" style="background:none; border:none; margin-top:-5px;">
										<?php
											foreach($product['tags'] as $tags){
										?>		
											<img src="<?php echo $base.'upload/image/'.$tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
										<?php
											}
										?>
									</div>
									<div class="clear"></div>
									</div>
								</a>
							</li>
							<?php } ?>
						</ul>
					</div>
					<div class="clear"></div>
			   <?php }else { ?>
						<div><?php echo $text_empty; ?></div>
			   <?php } ?>
		</div>

</div>

<?php } ?>


<?php if($customerLogged){ $pp_contentArea_class = 'col-lg-6 col-md-6 col-sm-12'; }else{ $pp_contentArea_class = 'col-lg-12 col-md-12 col-sm-12'; } ?>
<div class="<?php echo $pp_contentArea_class = 'col-lg-12 col-md-12 col-sm-12'; ?>">		
		<div id="popPicks" style="display:none; margin-right: 12px;">
		   <?php if($products){ ?>
		   <div class="contant_area usual">
			   <div class="col-lg-12 col-md-12 col-sm-12">
				<?php foreach ($products as $product) {
 
					$formatPrice =	explode('.',$product['price']); //to separate dollar and cents to be used in the new UI
					$cents = '00';
					if(isset($formatPrice[1])){
							$cents = $formatPrice[1];
					}
					if(isset($formatPrice[0])){
						$dollarArr =	str_split($formatPrice[0]); // to separate dollar sign and amount to be used in the new UI
						$currencySymbol = '$';
						$dollars = implode('',$dollarArr);
						if(isset($dollarArr[0])){
							$currencySymbol = array_shift($dollarArr);
							$dollars = implode('',$dollarArr);
						}	

					}
				?>
				<div class="col-md-6 col-sm-6 col-xs-6 popPicks_items">
					<a href="<?php echo $product['href']; ?>" id="add_to_order" data-product-link="<?php echo $product['href']; ?>" >
						<?php if( !empty($product['thumb']) && file_exists(DIR_IMAGE.'product_img/'.$product['thumb'])){?>
							<div class="cust_product_img1 " style="width:10%; float:left; ">
								<img src="<?php echo $base.'upload/image/product_img/'.$product['thumb']; ?>" alt="" title=" " width="120" class="unp_item_img" />
								<div class="p-call show_hide_unp_price_col" style="display:none; float: right;">
								<?php if($dollars == 0 && $cents == 0){ ?>
								<div class="price_col"><p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars;  echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div></div><br><br><br><br>
								<?php } else{ ?>
								<div class="price_col " ><p><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></p><div class="add_to_order_button">Order</div></div><br><br><br><br>
								<?php } ?>
								<div class="price_col" style="background:none; border:none; margin-top:-5px;">
								
									<?php
										foreach($product['tags'] as $tags){
									?>		
										<img src="<?php echo $base.'upload/image/'.$tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
									<?php
										}
									?>
								</div>
								<div class="clear"></div>
								</div>						
							</div>	
						<?php } ?>	
						
						
						<div class="text_col top_spacing" style="float:left;"><span><?php echo $product['name']; ?></span><?php echo $product['description']; ?></div>
						<div class="p-call show_hide_p-call">
						<?php if($dollars == 0 && $cents == 0){ ?>
						<div class="price_col"><p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars;  echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div></div><br><br><br><br>
						<?php } else{ ?>
						<div class="price_col unp_price_col"><p><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></p><div class="add_to_order_button">Order</div></div><br><br><br><br>
						<?php } ?>
						<div class="price_col" style="background:none; border:none; margin-top:-5px;">
						
							<?php
								foreach($product['tags'] as $tags){
							?>		
								<img src="<?php echo $base.'upload/image/'.$tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
							<?php
								}
							?>
						</div>
						<div class="clear"></div>
						</div>
					</a>
				</div>
			   <?php } ?> 
			  
              </div>
              
			</div>
		   <?php } ?>
			<div class="clear"></div>
		</div>

</div>

<script>
var customerLogged = '<?php echo $customerLogged; ?>';
var baseURL = '<?php echo $base; ?>';

function showRelativeOrders(id){
	if(id == 'showUsualOrders'){
		$('#popPicks').slideUp();
		$('#usualOrders').slideToggle();
	}else if(id == 'showPopPicks'){
		$('#usualOrders').slideUp();
		$('#popPicks').slideToggle();
	}
}	

$( document ).ready(function() {

	function showOriginalContent() {
		if( $('.productViewDiv').is(":hidden") ) {
			$('.productViewDiv').show();
			$('#productSearchResult').slideUp( "fast" );
		}
		if( $('#productSearchButton').hasClass('fa-close') ) {
			$('#productSearchButton').removeClass('fa-close').addClass('fa-search');
			$('#productSearchBox').animate({
				width: 50
			});
			$('#productSearchBox').hide();
			$('#productSearchButton').css('color', '#fff;');
		}
		$('#productSearchBox').val('');
	}

	// function fetch_content() {
		// var string = $('#productSearchBox').val();
		// console.log();
	// }

	$('#productSearchBox').blur(function() {
		if( $('#productSearchBox').val() == '') {
			showOriginalContent();
		}
	});

	$('#productSearchBox').keyup(function() {
		// if( $(this).val().length >= 3 ) {
			// //fetch search contents
			// fetch_content();
		// }
		// console.log( $(this).val() );
		var productName = [];
		$( "#productSearchBox" ).autocomplete({
			'minLength': 3,
			'source': function(request, response) {
				$.ajax({
					url: '<?php echo BASE; ?>index.php?route=common/home/searchCategoriesWithProducts',
					dataType: 'json',
					type: 'post',
					data: {filter_name: request},
					success: function(json) {
						if(json.success) {
							var counter = 1;
							$.each(json.data, function(key, val) {
								if(counter <= 15) {
									productName[key] = val.name; ////+ ' ' +val.price;
								}
								counter++;
							});

							response($.map(productName, function(item) {
								if( typeof item != 'undefined') {
									return {
										label: item,
									}
								}
							}));
						}
					}
				});
			},
			select: function( event, ui ) {
				$('#productSearchBox').val( ui.item.label );
				$('#productSearchButton').addClass('triggered').trigger("click");
			}
		});
	});

	var originalWidth = $('#productSearchBox').width();
	$('#productSearchBox').animate({
		width: 50
	});
	
	var screen_width = $( window ).width();

	$('#productSearchButton').click(function() {
		// $('.menu_item_text').show('slide', { direction: "left"  });
		if( $('#productSearchBox').is(':hidden') ) {
			if(screen_width < 767) {
			}
			$('#productSearchBox').fadeIn('fast');
			$('#productSearchBox').animate({
                width: originalWidth
            });
			$('#productSearchButton').removeClass('fa-search').addClass('fa-close');
			$('#productSearchButton').css('color', '#505e69;');
			return false;
		}
		if( ($('#productSearchBox').val() == '' || $(this).hasClass('fa-close')) && !$(this).hasClass('triggered') ) {
			showOriginalContent();
			return false;
		}
		var string = $('#productSearchBox').val();
		var element = '';
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=common/home/searchCategoriesWithProducts',
			type: 'post',
			data: {string: string},
			beforeSend: function() {
				$('#productSearchResult').slideUp( "fast" );
			},
			success: function(json) {
				if(json.success == false) {
					if( $('.productViewDiv').is(":hidden") ) {
						$('.productViewDiv').fadeIn();
					}
				} else {
					$('#productSearchButton').removeClass('fa-search').removeClass('triggered').addClass('fa-close');
					$('.productViewDiv').fadeOut();
					$('#productSearchResult').html( json );
					$('#productSearchResult').slideDown( "slow" );
				}
			}
		});
	});

    // if(customerLogged != ''){
		// showRelativeOrders('showUsualOrders');
	// }else{
		// showRelativeOrders('showPopPicks');
	// }
	//alert('this is the page');
	
});
</script>