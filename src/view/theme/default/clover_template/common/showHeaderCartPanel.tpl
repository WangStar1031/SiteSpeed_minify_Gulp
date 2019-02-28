<?php 
if(isset($clover_cart['products'])){
	$products = $clover_cart['products'];
}else{
	$products = NULL;
}

if(isset($clover_cart['totals'])){
	$totals = $clover_cart['totals'];
}else{
	$totals = NULL;
}
if(!empty($products)){ ?>
	<!-- This input field is to update total number of cart items when changed from edit panel -->
		<input type="hidden" id="input_text_items" value="<?php if(isset($text_items) && !empty($text_items)){ echo $text_items; }  ?>" />
	<!-- This input field is to update total number of cart items when changed from edit panel -->
	<div class="view_cart">
		<a href="<?php echo $_SERVER['SCRIPT_NAME'].'index.php?route=common/home&step_back=categories'; ?>" class="back_bt showHeaderCartPanel_back_bt">BACK TO MENU</a>
		<form method = "post" action="<?php echo $product['href']; ?>" id="submit_form">
		<ul class="cart_products_data_list" id="cart_products_list_data">
			<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>
			<?php $tempArrOption = array();
			$y= 1;
			$total=0;
			$temp = 0; 
			foreach($products as $key => $product){
				$temp++;
						// $product['price'] = ($product['price']*$product['unitQty'])/1000;
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
			$tempArrOption = array(); 
			?>
				<li>
				<?php if($y == 1){ ?> 
				<p>
					<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" class ="desk_img"/>-->
					
					<a onclick="updateCartInPanel('desktop')" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; padding:0px 3px 0 0; font-size: 23px;"></a>
					
					<input type="text" id="input_carts_<?php echo $product['product_id']; ?>_<?php echo $temp; ?>" onchange="updateCartInPanel( 'desktop', '<?php echo $product['product_id']; ?>', '<?php echo $key ?>' ,'<?php echo $temp; ?>')"  name="quantity[<?php echo $product['product_id']; ?>]" class="qty desk_quantity add_to_order_box" value="<?php echo $product['product_unit']; ?>"  />
					
					<span class ="desktop_cart_product_link" style="padding: 3px 3px 3px 10px;">
						<a class="product-link" href="<?php echo BASE.'index.php?route=cloverAPI/clover/get_single_product&product_id='.$product['product_id'].'&product_key='.$key; ?>&flag=1" id="product-link-key"><?php echo $product['name']; ?></a>
					</span>
					 <?php //if(isset($product['uncalculatedPrice'])){
						// $price = $product['uncalculatedPrice'];
					// }else{
						// $price = $product['price'];
					// }?>
					
					<b class="prce desk_price_m">
<?php
						if( $product['price'] != "$ 0.00" ) {
							echo $product['price'];
						} else {
?>
							<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
<?php
						}
?>
					</b>
				</p>
<?php
				} else {
?>
					<p>
						<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
						<a onclick="updateCartInPanel('desktop')" id="qtyin<?php echo $y; ?>" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; padding:0px 3px 0 0; font-size: 23px;"></a>
						
						<input type="text" id="input_carts_<?php echo $product['product_id']; ?>_<?php echo $temp; ?>" onchange="updateCartInPanel('desktop','<?php echo $product['product_id']; ?>', '<?php echo $key ?>' ,'<?php echo $temp; ?>')" name="quantity[<?php echo $product['product_id']; ?>]" class="qty" value="<?php echo $product['product_unit']; ?>" />
						
						<span class ="" style="padding: 3px 3px 3px 10px;">
							<a class="product-link" href="<?php echo BASE.'index.php?route=cloverAPI/clover/get_single_product&product_key='.$key.'&product_id='.$product['product_id']; ?>&flag=1" id="product-link-key"> <?php echo $product['name']; ?></a>
						</span>
						
						<b class="prce desk_price_m">
<?php
							if( $product['price'] != "$0.0" && $product['price'] != "$ 0.00" && $product['price'] != "0.00" ) {
								echo $product['price'];
							} else {
?>
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
<?php
							}
?>
						</b>
					</p>
<?php
				}
?>
			
				<?php /* if (!$product['stock']) { ?>
				<p><span class="text-danger">***</span></p>
				<?php } */ ?>
				
			<span class="input-group-btn">
					<!--button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="add_to_order_box"><i aria-hidden="true" class="fa fa-refresh"></i></button-->
			</span>
				
				<?php if(!empty($product['option_qty'])){
					foreach($product['option_qty'] as $alloptions =>$options){
?>
						<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
						</div>
						
						<div class="subitems bold"><?php echo $options['name']; ?><br/></div>
<?php
						unset($options['name']);
						foreach($options as $option){
							if($option['name'] == $tempOptionName) {
?>
								<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
									<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>							
								</div>
								
								<div class="subitems"><?php echo $option['value']; ?></div>
								
								<div style="float:right;overflow:hidden;font-size: 13px; color: #505e6a;">
<?php
									if( !empty( $option[ 'price' ] ) && $option[ 'price' ] != '$ 0.00' ) {
										echo $option['price'];
									} else {
?>
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<?php
									}
?>
								</div>
							<br/>
<?php
							} else {
?>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
								
								<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
									<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
								
								<div class="subitems"><?php echo $option['qty']." X ".$option['name']; ?><br/></div>
								
								<div style="float:right;overflow:hidden;font-size: 13px; color: #505e6a;">
<?php
									if( !empty( $option[ 'price' ] ) && $option['price'] != '0.00' ) {
										echo '$ '.$option['price'];
									} else {
?>
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<?php
									}
?>
								</div>
								<br/>
<?php
							}
?>
							<p class=""><span><?php //echo $option['value']; ?></span></p>
				<?php 	
							// $tempOptionName = $option['name'];
						}
					} //end foreach
				} //end if ?>
				</li>
				
				<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
				<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
			<?php  $y++ ; } ?>
		</ul>
		</form>
		<ul>
			<?php if(isset($vouchers)){ 
					foreach($vouchers as $voucher){ ?>
						<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
				<?php } //end foreach ?>	
			<?php } //endif ?>
			<?php 
			// $totals[0]['text']=$total_amount;
			// $totals[0]['title']="Total";
			if(isset($totals) && !empty($totals)){
			foreach($totals as $total){
			?>
			<?php if(isset($totals) && isset($total['title']) && isset($total['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $total['title']; ?></strong><b class="prce grn">$ <?php echo number_format($total['text'], 2, '.', ''); ?></b></p></li>
			<?php }
			}			?>
			
			<li class="no_border"><a href="<?php echo $_SERVER['SCRIPT_NAME'].'?route=cloverAPI/clover/checkout_form'; ?>" ><input type="button" value="PROCEED TO CHECKOUT"  class="chk_bt_custom"/></a></li>
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
					<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/cart_bag_img.png" alt="cart-bag" />
				</figure>
				<h2>Your bag is empty<span>...</span></h2>
				<p class="text-center">and your stomach is sad.</p>
		</div>
<?php } ?>
<script>
function qtyhideshow(){
	$('#qtyinput').show();
}


function qtyhideshow1(id){

	$('#qtyin'+[id]).show();
	
}

</script>