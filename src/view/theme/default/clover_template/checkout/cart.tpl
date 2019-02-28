<?php echo $header; ?>
<section class="ordering_options">
	<h2 class="top_head">SHOPPING BAG</h2>
</section>	
<div class="container">
  
  <?php if ($attention) { ?>

  
  
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php /*if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } */ ?>

  <?php if ($error_warning) { ?>	
  <?php $message = '';
  //get message for stock item
  foreach($error_warning as $val){ $message .= '<i class="fa fa-exclamation-circle"></i>'.$val.'</br>';
	}
  ?>
<div class="alert alert-danger">
<button type="button" class="close" data-dismiss="alert">&times;</button>
 <?php //display message
	echo  $message; ?></div>
 <?php }?>
 
  <div class="row row_mobile_cart">
    <div id="content" class="col-sm-12">
		<div id="mobile_cart">
			<?php 
				$locationSet = false;
				if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
					$locationSet = true;	
				}

				$step_back_url	= false;
				if(isset($breadcrumbs) && !empty($breadcrumbs)){
					$step_back_url 	= $breadcrumbs[0]['href'].'&step_back=categories';
				}
			?>
			<?php $products = $clover_cart['products'];
				  $totals = $clover_cart['totals'];
					if($products){ ?>
			
				<?php 
					$stepback = '';
					if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
						$stepback = '&step_back=categories';	
					}
				?>
			
				<!-- This input field is to update total number of cart items when changed from edit panel -->
					<input type="hidden" id="input_text_items" value="<?php if(isset($text_items) && !empty($text_items)){ echo $text_items; }  ?>" />
				<!-- This input field is to update total number of cart items when changed from edit panel -->
				<div class="view_cart">
					<a href="<?php echo $continue.$stepback; ?>" class="back_bt"><i class="fa fa-mail-reply" aria-hidden="true"></i> &nbsp; BACK TO MENU</a>
					
					<ul class="cart_products_data_list" id="cart_products_list_data_mobile_view">
						<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>
						<?php $tempArrOption = array();
						$temp=0;
						foreach($products as $key =>$product){ 
						$temp++;
						$product['price'] = $product['price']*$product['product_unit'];
						// $product['price']=substr_replace($product['price'],".",-2,0) ;
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
						$prc=$dollars.".".$cents; // string '13' (length=2)
						$prc= intval($prc);
						$total=$total+$prc;
						if(!$dollars){
							$dollars=0;
						}
						$product['price']=$currencySymbol." ".$dollars.".".$cents;
						?>
							<li>
							<p>
								
								<a onclick="updateCartInPanel('mobile')" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box check-icon"></a>
								
								<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
								<input type="text" id="input_cart_mobile_<?php echo $product['product_id']; ?>_<?php echo $temp; ?>" onchange="updateCartInPanel('mobile','<?php echo $product['product_id']; ?>','<?php echo $key; ?>','<?php echo $temp; ?>')" name="quantity[<?php echo $product['id']; ?>]" class="qty desk_quantity" value="<?php echo $product['product_unit']; ?>" />
								
								<span>
									<a class="product-link" href="<?php echo BASE.'index.php?route=cloverAPI/clover/get_single_product&product_key='.$key.'&product_id='.$product['product_id'].'&flag=1'; ?>"><?php echo $product['name']; ?></a>
								</span>
								<b class="prce">
									<?php if($product['price'] != "$0.0"){ 
										echo $product['price']; 
									}else{
									?>
										<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span> 
									<?php } ?>
								</b>
							</p>
							<?php /* if (!$product['stock']) { ?>
							<p><span class="text-danger">***</span></p>
							<?php } */ ?>
							
							<!--<span class="input-group-btn">
							
								<button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
							
								<button type="button" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box hide-mobile" onclick="cart.remove('<?php //echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button> -->
							
							</span>
							
							<?php if(!empty($product['option_qty'])){
					foreach($product['option_qty'] as $alloptions =>$options){
							// echo key($product['modifier_count']);
						?> 
						<div class="pb-5">
						<div  class="m-t60 f-30 m-t31 ml-option-name" style =""><?php echo $options['name']; ?></div>
						<?php	unset($options['name']);
						foreach($options as $option){
							if($option['name'] == $tempOptionName) {
					?>	
							<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>							
							</div>
							<div class="subitems" style="font-size: 135% !important;margin-left: 75px !important;"><?php echo $option['value']; ?></div>
							<div style="float:right;overflow:hidden;font-size: 135%; color: #7F8184;">
								<?php
									if(!empty($option['price'])){
										echo $option['price'];	
									}else{	
								?>	
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<?php
									} //end if
								?>	
							</div>
							<br/>
						<?php			
						} else {
						?>
								<div style="clear:both;"></div>
								<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" class="m-t60">
									<span class="m-l10" style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
								<div  class="m-t60 f-30 m-t31" style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 18px;font-family:'Conv_Oswald-Light'; max-width:68%; text-align:left;"><?php echo $option['qty']." X ".$option['name']; ?></div>

								<div class="m-t40 ex-price">
									<?php
										if($option['price'] != 0){
											echo '$ '.number_format($option['price'],2);	
										}else{
									?>	
											<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
									<?php
										} //end if
									?>
								</div>
								<div style="clear:both;"></div>

						<?php } ?>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
				<?php 	
							// $tempOptionName = $option['name'];
						} ?>

						</div>
<?php
					}//end foreach
									?>

							<?php							 
									}
									?>
							</li>
							
							<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
							<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
						<?php } ?>
					<div style="clear:both;"></div>
					</ul>
					
					<ul>
						<?php if(isset($vouchers)){ 
								foreach($vouchers as $voucher){ ?>
									<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
							<?php } //end foreach ?>	
						<?php } //endif ?>
						<?php 
						if(isset($totals) && !empty($totals)){
							foreach($totals as $total_){
							?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $total_['title']; ?></strong><b class="prce grn">$ <?php echo number_format($total_['text'],2); ?></b></p></li>
						<li style="border:none;"></li>
						<div style="clear:both;"></div>
							<?php	
							}

						?>
					
					</ul>
							<a href="<?php echo BASE; ?>index.php?route=cloverAPI/clover/checkout_form" ><button class="chk_bt_custom"/>PROCEED TO CHECKOUT <i style="color:#fff;" class="fa fa-check" aria-hidden="true"></i></button>  </a>
					<?php 
							} //end if
						?>
				</div>
			<?php }else{ ?>
						<div id="content" class="col-sm-12">		  
							<h1 class="new-design-cart-heading">Shopping Cart</h1>
						  <p>Your shopping cart is empty!</p>
						  <div class="buttons">
							<div class="pull-right"><a href="<?php echo BASE."index.php?route=common/home&step_back=categories"; ?>" class="btn btn-primary new-design-cart-page-btn shop_btn">Continue</a></div>
						  </div>
						  </div>
			<?php } ?>

		</div>		
	
		
		<div id="desktop_cart">
		
		
			<?php 
				$locationSet = false;
				if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
					$locationSet = true;	
				}

				$step_back_url	= false;
				if(isset($breadcrumbs) && !empty($breadcrumbs)){
					$step_back_url 	= $breadcrumbs[0]['href'].'&step_back=categories';
				}
			?>
			<?php 
			if($products){ ?>
			<div class="view_cart view_cart_custom">
				<?php 
					$stepback = '';
					if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
						$stepback = '&step_back=categories';	
					}
				?>
				<a href="<?php echo $continue.$stepback; ?>" class="back_bt back_bt_custom" style="background:none;"><i class="fa fa-mail-reply" aria-hidden="true"></i> BACK TO MENU</a>
				<ul class="cart_products_data_list" id="cart_products_list_data">
					<li><strong class="pull-left" style="margin-left:45px;">QTY</strong><strong class="pull-right">PRICE</strong></li>
					
					<?php $temp=0;
					foreach($products as $key => $product){ 
						$temp++;
						$product['price'] = $product['price']*$product['product_unit'];
						// $product['price']=substr_replace($product['price'],".",-2,0) ;
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
						$prc=$dollars.".".$cents; // string '13' (length=2)
						$prc= intval($prc);
						$total=$total+$prc;
						if(!$dollars){
							$dollars=0;
						}
						$product['price']=$currencySymbol." ".$dollars.".".$cents;
						?>
						
						<li>
							<p style="margin-bottom: 20px;">
								<a onclick="updateCartInPanel('desktop')" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></a>
								<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
								
								<input type="text" id="input_cart_<?php echo $product['product_id']; ?>_<?php echo $temp; ?>" onchange="updateCartInPanel( 'desktop', '<?php echo $product['product_id']; ?>', '<?php echo $key ?>','<?php echo $temp; ?>' )" name="quantity[<?php echo $product['product_id']; ?>]" class="qty" value="<?php echo $product['product_unit']; ?>" />
						
								<span class="desktop-cart-page" style="max-width:100%;">
									<a class="product-link" style="font-size:135%;" href="<?php echo BASE.'index.php?route=cloverAPI/clover/get_single_product&product_key='.$key.'&product_id='.$product['product_id'].'&flag=1'; ?>"><?php echo $product['name']; ?></a>
								</span>
								
								<b class="prce">
<?php
									if( $product['price'] != "$ 0.00" ) {
										echo $product['price'];
									} else {
?>
										<span style="text-decoration: line-through; color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
<?php
									}
?>
								</b>
							</p>
							
							</span>
							
							<?php 
							
						if(!empty($product['option_qty'])){
						foreach($product['option_qty'] as $alloptions =>$options){
						?>
						<div style="margin-bottom:10px;">
						<div class="cart-cs-name" style =""><?php echo $options['name']; ?></div>
						<?php	
						unset($options['name']);
						foreach($options as $option){
							if($option['name'] == $tempOptionName) {
					?>	
							<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>							
							</div>
							<div class="subitems" style="font-size: 135% !important;margin-left: 75px !important;"><?php echo $option['value']; ?></div>
							<div style="float:right;overflow:hidden;font-size: 135%; color: #7F8184;">
								<?php
									if(!empty($option['price'])){
										echo $option['price'];	
									}else{	
								?>	
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<?php
									} //end if
								?>	
							</div>
							<br/>
						<?php			
						} else {
						?>
				
									<div style="clear:both;"></div>

									<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:7px;" >
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</div>									
									<div style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 75px; font-family:Conv_Oswald-Light; max-width:90%; text-align:left; font-size:135%;"><?php echo $option['qty']." X ".$option['name']; ?></div>
									<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
										<?php
											if($option['price'] != 0){
												echo '$ '.number_format($option['price'],2);	
											}else{
										?>	
												<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<?php
											} //end if
										?>
									</div>
									<div style="clear:both;margin-bottom: 10px;"></div>
									

						<?php } ?>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
				<?php 	
							// $tempOptionName = $option['name'];
							} ?>
						<?php
						}//end foreach
						?>
							</div>
							<?php							 
									}
									?>
						</li>
						
						
						
						
						
						<!--
						<li>
						<p><input type="text" name="quantity[<?php //echo $product['key']; ?>]" class="qty" value="<?php //echo $product['quantity']; ?>" /><span class="desktop-cart-page" style="max-width:100%"><a href="<?php //echo $product['href']; ?>"><?php //echo $product['name']; ?></a></span><b class="prce"><?php //echo $product['price']; ?></b></p>
						<?php /* if (!$product['stock']) { ?>
						<p><span class="text-danger">***</span></p>
						<?php } */ ?>
						<span class="input-group-btn">
						<button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
						<button type="button" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box" onclick="cart.remove('<?php //echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span>
						<?php //if(!empty($product['option'])){ 
								//foreach($product['option'] as $option){ ?>
							<p class="list_btm"><span style="padding-left:42px;max-width:92%;"><?php //echo $option['value']; ?></span></p>
						<?php 	//} //end foreach
							  //} //end if ?>
						</li>
						-->
						
						
						
						<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
						<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
					<?php } ?>
				</ul>
				
				<ul>
					<?php /*if(isset($vouchers)){ 
							foreach($vouchers as $voucher){ ?>
								<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
						<?php } //end foreach ?>	
					<?php } //endif */ ?>
					<?php 
					
						if(isset($totals) && !empty($totals)){
							foreach($totals as $total){
					?>
					<?php if(isset($total) && isset($total['title']) && isset($total['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $total['title']; ?></strong><b class="prce grn">$<?php echo number_format($total['text'],2); ?></b></p></li>
					<?php }
						}	?>
					
					<li class="no_border"><a href="<?php echo BASE; ?>index.php?route=cloverAPI/clover/checkout_form" ><button class="chk_bt_custom" style="font-size: 22px; padding: 24px 0; ">PROCEED TO CHECKOUT<i style="color:#fff;" class="fa fa-check" aria-hidden="true"></i></button></a></li>
					<?php 
						}
										//end if
					?>
				</ul>	
			</div>
			<?php }else{
				?>	<div id="content" class="col-sm-12">		  <h1 class="new-design-cart-heading">Shopping Cart</h1>
				  <p>Your shopping cart is empty!</p>
				  <div class="buttons">
					<div class="pull-right"><a href="<?php echo BASE."index.php?route=common/home&step_back=categories"; ?>" class="btn btn-primary new-design-cart-page-btn shop_btn">Continue</a></div>
				  </div>
				  </div>
			<?php } ?>
		</div>
	 <?php /*
	  <div class="wrapper new-design-wrapper">	
		<?php echo $content_top; ?>
      <h1 class="new-design-cart-heading"><?php echo trim($heading_title); ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center hide-mobile"><?php echo $column_image; ?></td>
                <td class="text-left wrap-word"><?php echo $column_name; ?></td>
                <td class="text-left always-hide"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right hide-mobile"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
				  <tr>
					<td class="text-center hide-mobile"><?php if ($product['thumb']) { ?>
					  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
					  <?php } ?></td>
					<td class="text-left wrap-word"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					  <?php if (!$product['stock']) { ?>
					  <span class="text-danger">***</span>
					  <?php } ?>
					  <?php if ($product['option']) { ?>
					  <?php foreach ($product['option'] as $option) { ?>
					  <br />
					  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					  <?php } ?>
					  <?php } ?>
					  <?php if ($product['reward']) { ?>
					  <br />
					  <small><?php echo $product['reward']; ?></small>
					  <?php } ?>
					  <?php if ($product['recurring']) { ?>
					  <br />
					  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
					  <?php } ?></td>
					<td class="text-left always-hide"><?php echo $product['model']; ?></td>
					<td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
						<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
						<span class="input-group-btn">
						<button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
						<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box hide-mobile" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
					<td class="text-right hide-mobile"><?php echo $product['price']; ?></td>
					<td class="text-right"><?php echo $product['total']; ?></td>
				  </tr>
              <?php } ?>
             
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($coupon || $reward || $shipping) { ?>
	  */ ?>	
      <?php /* <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p> */ ?>
	  <?php /*	
      <div class="panel-group new-design-panel" id="accordion"><?php echo $coupon; ?><?php echo $reward; ?><?php //echo $shipping; ?></div>
      <?php } ?>
      <br />
      <div class="row">
        <!-- <div class="col-sm-4 col-sm-offset-8"> original -->
        <div class="col-sm-12">
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons">
		<?php 
			$stepback = '';
			if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
				$stepback = '&step_back=categories';	
			}
		?>	
        <div class="pull-left"><a href="<?php echo $continue.$stepback; ?>" class="btn btn-default new-design-cart-page-btn add_to_order_box"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary new-design-cart-page-btn add_to_order_box"><?php echo $button_checkout; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
	  <div><!-- wrapper end -->
	 </div>
    <?php echo $column_right; ?></div>
	</div>
</div>
*/ ?>
	</div>
</div>

<?php
	
	//rewriting the same code for easy locating..
	// $locationSet = false;
	// if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
		// $locationSet = true;	
	// }

	// $step_back_url	= false;
	// if(isset($breadcrumbs) && !empty($breadcrumbs)){
		// $step_back_url 	= $breadcrumbs[0]['href'].'&step_back=categories';
	// }
?>
<script>
	var step_back_url	= '<?php echo BASE."index.php?route=common/home&step_back=categories"; ?>';

	if(step_back_url){
		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> Categories').show();
	}	
</script>

<?php  echo $footer; ?>