<?php echo $content_top; ?>

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

<?php

if( !empty($eligible_items) ) {

?>
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="oreder_left">
			<div class="top_title col-md-12">
				<h3>You are eligible for the following free items</h3><br/>
					<?php

					$i =0;
					foreach( $eligible_items_arr as $keys => $vals ) {
					?>
					<div class="dropdown" style="margin-bottom: 35px;">Eligible Free Items <?php echo($vals['quantity']);?>:
					  <select id="rewards_product_'<?php echo $rule_id;?>'" class="rewards_product" style="height: 37px;">
						<option value=""> --- Please Reward Product --- </option>
							<?php

							$i =0;
							foreach( $vals as $key => $val ) {
								if($key == "quantity"){ continue;}

							?>
								<option value="<?php echo $val['href']; ?>&is_free=1"><?php echo $val['name']; ?></option>
							<?php
							$rule_id=$val['rule_id'];
							}
							?>
					  </select>
					  <a class="btn btn-primary new-design-cart-page-btn shop_btn" onclick="open_reward_product('<?php echo $rule_id;?>');">Add To Cart</a>
					</div>
					<?php
						}
					?>

			</div>
		</div>
	</div>
<?php
}
?>



<div class="clearfix">
	<div class="col-lg-12 col-md-12 col-sm-12 productViewDiv">
<?php 
	foreach($categories as $category){
		if(count($category['products']) == '0')continue;
?>
<div class="col-lg-6 col-md-12 col-sm-12">
	<div class="menus">
	<ul>
		<a href="javascript:void(0);" onclick="toggle_category_content(this.id)" class="category_title" id="category_<?php echo $category['category_id']; ?>"><li class="menu"><?php echo $category['name']; ?> <span><?php echo count($category['products']); ?></span><span class="menu-items-arrow"><i class="fa fa-chevron-down"></i></span></li></a>
		<div class="contant_area" id="category_content_<?php echo $category['category_id']; ?>" style="display:none;">
			<ul>
				<?php
					foreach($category['products'] as $product){
						// if($product['price']=='$0.00')continue;
						if($product['price']=='$0.00' && $product['optionsPrice'] == false)continue;
						
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

					<!-- This condition is using for UI purpose-->

					<?php if( !empty($product['thumb']) && file_exists(DIR_IMAGE.'product_img/'.$product['thumb'])){?>	
						<div class="text_col text_col_padding cust_text_col_padding" style="padding-left: 0px !important">	
							 
						<div class="col-sm-12 cust_desc_div" style="padding-left: 0px; margin-top: 7px;"> 
							<div class="col-sm-4 col-md-4 col-xs-4 product_img" style="">
								<label>
									<img class="product_img_width" src="<?php echo $base.'upload/image/product_img/'.$product['thumb']; ?>" alt="" title=" " width=" " />
								</label>
							</div>   
							<div class="col-sm-8 col-md-6 col-xs-6 cust_div_product_name" id="test_pro" style="padding: 0px;text-align: justify;">
								<span><?php echo $product['name']; ?></span><?php echo $product['description']; ?>
							</div>
						</div>   
						</div>
					<?php }else{ ?>
						<div class="text_col text_col_padding"><span><?php echo $product['name']; ?></span><?php echo $product['description']; ?></div>
					<?php } ?>					
						<!--<div class="text_col text_col_padding"><span><?php echo $product['name']; ?></span><?php echo $product['description']; ?></div>-->
						<div class="price_col">
						<?php if($dollars == 0 && $cents == 0){ ?>
							<p style="font-size:20px;"><sup><?php $currencySymbol; ?></sup><?php $dollars; echo 'Select'; ?><sup><?php $cents; ?></sup></p><div class="add_to_order_button">Item</div>
						<?php } else{ ?>
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
<style>
@media only screen and (min-width:1250px) and (max-width: 1431px) {
.contant_area .text_col {
	width: 80%;
}
}
</style>

<script>
/*
$(document).ready(function(){
	
	
	// run checkWindowSize on document ready
	checkWindowSize();
	
	// run checkWindowSize when window is re-sized
	$(window).resize(function()
	{
		checkWindowSize();
	}); // end window.resize
		
});

		
function checkWindowSize(){
	
	// assign "window" variable to JQuery's window object
	var $window = $(window);
	// create windowWidth variable
	var windowWidth = $window.width();
	// create windowHeight variable
	var windowHeight = $window.height();
 
	$('#test_pro').text('Height::'+windowHeight+' width::'+windowWidth);
	// switch to sampleResponsiveBase.css if window width > or = 845
	if (windowWidth >= 1920)
	{
		
	}
	
	// switch to adaptive if window width < 845
 
	
}*/
</script>
<script>
var selected_url = 0;
$(document).ready(function() {
	$('#rewards_products').hide();
});

$('#show_reward_products').click(function(){
	var flag = $( "#rewards_products" ).hasClass( "show_product" );
	if(flag){
		$('#rewards_products').hide(1000);
		$('#rewards_products').removeClass('show_product');
	}else{
		$('#rewards_products').show(1000);
		$('#rewards_products').addClass('show_product');
	}
});

function open_reward_product(rule_id){
	console.log(selected_url);
	if(selected_url){
		window.location = selected_url;
	}else{
		return false;
	}
}

$('.rewards_product').on('change', function() {
	selected_url = this.value;
	console.log(selected_url);
});
</script>
