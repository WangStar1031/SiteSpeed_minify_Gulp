<?php echo $content_top; 
?>

<?php
/*
<div id="custom_unp">
	<?php if($customerLogged){ ?>
	<div class="col-md-6 col-sm-6 col-xs-6">
		<a href="javascript:void(0)" id="showUsualOrders" onclick="showRelativeOrders(this.id)" style="text-decoration:none;z-index:2147483647">
			<div class="oreder_left">
				<div class="top_title col-md-12">
					<img src="<?php echo $base; ?>upload/catalog/view/theme/restaurant/image/menus_head.png" alt="" />
					<h2>order my <b>usual</b></h2>
				</div>
			</div>
		</a>
	</div>
	<?php } ?>
	<?php $pp_class="col-md-12 col-sm-12 col-xs-12"; if($customerLogged){ $pp_class="col-md-6 col-sm-6 col-xs-6"; } ?>
	<div class="<?php echo $pp_class; ?>" style="padding-left:0px;padding-right:0px;" >
	   <div class="oreder_left">
			<a href="javascript:void(0)" id="showPopPicks" onclick="showRelativeOrders(this.id)">
				<div class="top_title col-md-12">
					<div class="margin-center" style="text-align:center;">
						<img src="<?php echo $base; ?>upload/catalog/view/theme/restaurant/image/menus_head1.png" alt="" />
						<h2>popular <b>picks</b></h2>
					</div>	
				</div>
			</a>
		</div>
	</div>
</div>
*/ ?>

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

	function update_all_clover_items() {
		var merchant_id = '<?php echo $_SESSION['merchantID']; ?>';
		$.ajax({
			url: 'https://<?php echo $_SERVER['SERVER_NAME'].$_SERVER['SCRIPT_NAME']; ?>?route=cloverAPI/clover/update_clover_indb',
			dataType: 'json',
			data: { merchant_id : merchant_id },
			success: function(json) {
					console.log(json);
					
				}
		});
	}
	
$( document ).ready(function() {

// update_all_clover_items();

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
					url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/searchCategoriesWithProducts',
					dataType: 'json',
					type: 'post',
					data: {filter_name: request},
					success: function(json) {
						if(json.success) {
							var counter = 1;
							var productName=[];
							$.each(json.data, function(key, val) {
								if(counter <= 15) {
									// productName[key] = val.name; ////+ ' ' +val.price;
									productName.push( val.name );
								}
								counter++;
							});

							response(productName);


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
			url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/searchCategoriesWithProducts',
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
		console.log(json);
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

<div class="col-lg-12 col-md-12 col-sm-12">
	<div class="row" id="productSearchResult">
	</div>
</div>

<div class="clearfix">
	<div class="col-lg-12 col-md-12 col-sm-12 productViewDiv">
	
<?php 	foreach($categories as $category){
		if(count($category['products']) == '0')continue;
?>
<div class="col-lg-6 col-md-12 col-sm-12">
	<div class="menus">
	<ul>
		<a href="javascript:void(0);" onclick="toggle_category_content(this.id)" class="category_title" id="category_<?php echo $category['id']; ?>"><li class="menu"><?php echo $category['name']; ?> <span><?php echo count($category['products']); ?></span><span class="menu-items-arrow"><i class="fa fa-chevron-down"></i></span></li></a>
		<div class="contant_area" id="category_content_<?php echo $category['id']; ?>" style="display:none;">
			<ul>
				<?php
					foreach($category['products'] as $product){
						$product['price']=substr_replace($product['price'],".",-2,0) ;
						$product['price']="$".$product['price'];
						$formatPrice =	explode('.',$product['price']); 
						//to separate dollar and cents to be used in the new UI
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
					<a href="<?php echo $_SERVER['SCRIPT_NAME']."?route=cloverAPI/clover/get_single_product&product_id=".$product['id']; ?>" id="add_to_order" data-product-link="<?php echo $_SERVER['SCRIPT_NAME']; ?>" >
						<div class="text_col text_col_padding"><span><?php echo $product['name']; ?></span><?php echo $product['alternateName']; ?></div>
						<div class="price_col">
						<?php if($dollars == 0 && $cents == 0){ ?>
							<p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars; echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div>
						<?php } else{ 
								if(!$dollars){
									$dollars=0;
								}
								?>
							<p><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></p><div class="add_to_order_button">Order</div>
						<?php } ?>
						</div>
						<div class="price_col" style="background:none; border:none; margin-top:5px;">
							<?php
								foreach($product['tags'] as $tags){
							?>		
								<img src="<?php echo $base.'upload/image/'.$tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
							<?php
								}
							?>
						</div>
					</a>
				</li>
				<?php
					} //end foreach
				?>
			</ul>
		</div>
	</ul>
	</div>
</div>
<?php
	} //end foreach
?>
	</div>
</div>
