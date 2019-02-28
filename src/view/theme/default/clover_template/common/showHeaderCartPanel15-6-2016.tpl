<?php if(!empty($products)){ ?>
	<!-- This input field is to update total number of cart items when changed from edit panel -->
		<input type="hidden" id="input_text_items" value="<?php if(isset($text_items) && !empty($text_items)){ echo $text_items; }  ?>" />
	<!-- This input field is to update total number of cart items when changed from edit panel -->
	<div class="view_cart">
		<a href="<?php echo $base.'index.php?route=common/home&step_back=categories'; ?>" class="back_bt showHeaderCartPanel_back_bt">BACK TO MENU</a>
		
		<ul class="cart_products_data_list" id="cart_products_list_data">
			<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>
			<?php $tempArrOption = array();
			$y= 1;
			foreach($products as $product){ 
			$tempArrOption = array(); ?>
				<li>
				<?php if($y == 1){ ?> 
				<p>
					<img onclick="cart.remove('<?php echo $product['key']; ?>');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" src="<?php echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" class ="desk_img"/>
					<input type="text" name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity" value="<?php echo $product['quantity']; ?>"  />
					
					<span class ="desktop_cart_product_link">
						<a class="product-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</span>
					<b class="prce desk_price_m"><?php echo $product['uncalculatedPrice']; ?></b>
				</p>
				<?php }else{ ?>
				<p>
					<img onclick="cart.remove('<?php echo $product['key']; ?>');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" src="<?php echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />
					<input type="text" name="quantity[<?php echo $product['key']; ?>]" class="qty" value="<?php echo $product['quantity']; ?>" />
					
					<span class ="">
						<a class="product-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</span>
					<b class="prce "><?php echo $product['uncalculatedPrice']; ?></b>
				</p>
				<?php }?>
			
				<?php /* if (!$product['stock']) { ?>
				<p><span class="text-danger">***</span></p>
				<?php } */ ?>
				
				<!--<span class="input-group-btn">
				
					<button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
				
					<button type="button" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box hide-mobile" onclick="cart.remove('<?php //echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button> -->
				
				</span>
				
				<?php if(!empty($product['option'])){ 
						foreach($product['option'] as $option){ 
							//if(in_array($option['name'],$tempArrOption)){
							
						//}else{
							//echo '<br/>- '.$option['name'].': ';
					?>	
							<div style="float:left;overflow:hidden;color:#7F8184" >
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</div>
							<div style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 28px;font-family:Conv_Oswald-Light; max-width:145px; text-align:left;"><?php echo $option['name'].' : '.$option['value']; ?></div>
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
						//} ?>
								<p class=""><span><?php// echo $option['value']; ?></span></p>
				<?php 	} //end foreach
					  } //end if ?>
				</li>
				
				<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
				<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
			<?php  $y++ ; } ?>
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