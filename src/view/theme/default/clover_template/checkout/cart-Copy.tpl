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
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
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
			<?php if(!empty($products)){ ?>
			
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
					<a href="<?php echo $continue.$stepback; ?>" class="back_bt">BACK TO MENU</a>
					
					<ul class="cart_products_data_list" id="cart_products_list_data">
						<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>
						<?php $tempArrOption = array();
						foreach($products as $product){ ?>
							<li>
							<p>
								<img onclick="cart.remove('<?php echo $product['key']; ?>');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" src="<?php echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />
								<input type="text" name="quantity[<?php echo $product['key']; ?>]" class="qty" value="<?php echo $product['quantity']; ?>" />
								
								<span>
									<a class="product-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								</span>
								<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
							</p>
							<?php /* if (!$product['stock']) { ?>
							<p><span class="text-danger">***</span></p>
							<?php } */ ?>
							
							<!--<span class="input-group-btn">
							
								<button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
							
								<button type="button" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box hide-mobile" onclick="cart.remove('<?php //echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button> -->
							
							</span>
							
							<?php if(!empty($product['option'])){ 
									foreach($product['option'] as $option){
							?>			
										<div style="float:left;overflow:hidden;color:#7F8184;" >
											<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
										<div style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 18px;font-family:Conv_Oswald-Light; max-width:68%; text-align:left;"><?php echo $option['name'].' : '.$option['value']; ?></div>
										<div style="float:right;overflow:hidden;color:#7F8184">
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
											$j 	=	1;
											$i 	=   0;	
								/* 	if(in_array($option['name'],$tempArrOption)){
								
							}else{
								echo '<br/><span style ="font-weight: bold;font-color:#635E5E;">'.$option['name'].'</span><br/> ';
								$tempArrOption[] = $option['name'] ;
								$j 	=	1;
								$i 	=   0;		
							} */ ?>
								<p class=""></p>
							<?php 	} //end foreach
								  } //end if ?>
							</li>
							
							<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
							<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
						<?php } ?>
					</ul>
					
					<ul>
						<?php if(isset($vouchers)){ 
								foreach($vouchers as $voucher){ ?>
									<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
							<?php } //end foreach ?>	
						<?php } //endif ?>
						<?php 
							if(isset($totals) && !empty($totals)){
						?>
						<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce"><?php echo $totals[1]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn"><?php echo $totals[3]['text']; ?></b></p></li>
						<?php } ?>
						
						<li class="no_border"><a href="<?php echo /*$cart*/$checkout; ?>" ><input type="button" value="PROCEED TO CHECKOUT"  class="chk_bt_custom"/></a></li>
						<?php 
							} //end if
						?>
					</ul>	
				</div>
			<?php }else{ ?>
					<div class="view_cart">
						<!-- <a class="back_bt">BACK TO MENU</a>
						<ul class="cart_products_data_list">
							<li><?php //echo $text_empty; ?></li>
						</ul> -->
						<figure>
								<img src="<?php echo $base; ?>/upload/catalog/view/theme/default/image/cart_bag_img.png" alt="cart-bag" />
							</figure>
							<h2>Your bag is empty<span>...</span></h2>
							<p class="text-center">and your stomach is sad.</p>
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
			<?php if(!empty($products)){ ?>
			<div class="view_cart view_cart_custom">
				<?php 
					$stepback = '';
					if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
						$stepback = '&step_back=categories';	
					}
				?>
				<a href="<?php echo $continue.$stepback; ?>" class="back_bt back_bt_custom">BACK TO MENU</a>
				<ul class="cart_products_data_list" id="cart_products_list_data">
					<li><strong class="pull-left" style="margin-left:35px;">QTY</strong><strong class="pull-right">PRICE</strong></li>
					<?php foreach($products as $product){ ?>
						
						<li>
							<p>
								<img onclick="cart.remove('<?php echo $product['key']; ?>');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" src="<?php echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />
								<input type="text" name="quantity[<?php echo $product['key']; ?>]" class="qty" value="<?php echo $product['quantity']; ?>" />
								
								<span class="desktop-cart-page" style="max-width:100%;">
									<a class="product-link" style="font-size:135%;" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								</span>
								<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
							</p>
							
							</span>
							
							<?php if(!empty($product['option'])){ 
									foreach($product['option'] as $option){
							?>			
										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;" >
											<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
										<div style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 4%;font-family:Conv_Oswald-Light; max-width:90%; text-align:left; font-size:135%;"><?php echo $option['name'].' : '.$option['value']; ?></div>
										<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
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
											$j 	=	1;
											$i 	=   0;	
								/* 	if(in_array($option['name'],$tempArrOption)){
								
							}else{
								echo '<br/><span style ="font-weight: bold;font-color:#635E5E;">'.$option['name'].'</span><br/> ';
								$tempArrOption[] = $option['name'] ;
								$j 	=	1;
								$i 	=   0;		
							} */ ?>
								<p class=""></p>
							<?php 	} //end foreach
								  } //end if ?>
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
					?>
					<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce"><?php echo $totals[1]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn"><?php echo $totals[3]['text']; ?></b></p></li>
					<?php } ?>
					
					<li class="no_border"><a href="<?php echo /*$cart*/$checkout; ?>" ><input type="button" value="PROCEED TO CHECKOUT"  class="chk_bt_custom shop_btn pad2" style="font-size:135%;" /></a></li>
					<?php 
						} //end if
					?>
				</ul>	
			</div>
			<?php }else{ ?>
					<div class="view_cart view_cart_custom">
						<?php 
							$stepback = '';
							if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
								$stepback = '&step_back=categories';	
							}
						?>
						<a href="<?php echo $continue.$stepback; ?>" class="back_bt back_bt_custom">BACK TO MENU</a>
						<ul class="cart_products_data_list">
							<li><?php echo $text_empty; ?></li>
						</ul>	
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
	$locationSet = false;
	if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
		$locationSet = true;	
	}

	$step_back_url	= false;
	if(isset($breadcrumbs) && !empty($breadcrumbs)){
		$step_back_url 	= $breadcrumbs[0]['href'].'&step_back=categories';
	}
?>
<script>
	var locationSet 	= '<?php echo $locationSet; ?>';
	var step_back_url	= '<?php echo $step_back_url; ?>';

	if(locationSet && step_back_url){
		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> Categories').show();
	}	
</script>

<?php echo $footer; ?>