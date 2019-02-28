<?php if(!empty($products)){ ?>
	<!-- This input field is to update total number of cart items when changed from edit panel -->
		<input type="hidden" id="input_text_items" value="<?php if(isset($text_items) && !empty($text_items)){ echo $text_items; }  ?>" />
	<!-- This input field is to update total number of cart items when changed from edit panel -->
	<div class="view_cart">
		<a href="<?php echo $base.'index.php?route=common/home&step_back=categories'; ?>" class="back_bt showHeaderCartPanel_back_bt">BACK TO MENU</a>
		<form method = "post" action="<?php echo $product['href']; ?>" id="submit_form">
		<ul class="cart_products_data_list" id="cart_products_list_data">
			<!--<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>-->
			<li><span class="cart-title">Shoping Bag</span></br></br></li>
			<?php $tempArrOption = array();
			$y= 1;
			$pcount = 1;
			foreach( $products as $product ) { 

				  
				$tempArrOption = array();
?>
				<li>
<?php
				if( $y == 1 ) {
?>
<?php
							if( $product[ 'is_free_item' ] ) {
?>
							<p><span style="color:red;padding: 3px 3px 3px 10px;font-weight: 800;" class="desktop_cart_product_link">Reward*</span> </p>
<?php
							}
?>	
					<p>
		
					
 						<span class ="desktop_cart_product_link">
<?php
							if( $product[ 'is_free_item' ] ) {
?>
								<a class="product-link" id="product-link-key"><?php echo ucwords( $product['name'] ); ?></a>
<?php
							} else {
?>
								<a class="product-link" href="<?php echo $product['href'].'&key='.$product['key']; ?>" id="product-link-key"><?php echo $product['name']; ?></a>
<?php
							}
?>
						</span>
						<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
						<!--<b class="prce"><?php //echo $product['price']; ?></b>-->
						
						
						
					</p>
					
					<!-- PRODUCT QTY PLIUS MINUS BUTTONq-->
<div class="productOptionsChecklist">
					
	<span class="QuantityInputBox QuantityInputBoxcus">
				
		<button class= "plus_png_button" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modifyCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="plus_qty_modifier">
			<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
		</button>			
	</span>		
	
	 <span class="QuantityInputBox QuantityInputBoxcus">
	<?php if( $product['disable_qty_update'] == 1 ) { ?>
	
		<input type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>" disabled />			
		
	<?php } else { ?>
	
		<input type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />
	
	<?php } ?>
	
	 </span>
			 
	 <span class="QuantityInputBox  QuantityInputBoxcus">
		<button class="minus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modifyCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="minus_qty_modifier">
		<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
		</button>			
	</span>	 	
</div>
 
					
				
<?php
					}else{ 
				?>
<?php
							if( $product[ 'is_free_item' ] ) {
?>
							<p><span style="color:red;padding: 3px 3px 3px 10px;font-weight: 800;" class="desktop_cart_product_link">Reward*</span> </p>
<?php
							}
?>	
				<p>
					<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
					<a onclick="updateCartInPanel('desktop')" id="qtyin<?php echo $y; ?>" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; padding:0px 3px 0 0; font-size: 23px;"></a>

						<span>
<?php
							if( $product[ 'is_free_item' ] ) {
?>
							<a class="product-link" id="product-link-key"><?php echo ucwords( $product['name'] ); ?></a>
<?php
							} else {
?>
								<a class="product-link" href="<?php echo $product['href'].'&key='.$product['key']; ?>" id="product-link-key"><?php echo $product['name']; ?></a>
<?php
							}
?>
						</span>
						<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
						<!--<b class="prce"><?php //echo $product['price']; ?></b>-->
					</p>


					
					
					<!-- PRODUCT QTY PLIUS MINUS BUTTON-->
			<div class="productOptionsChecklist">
								
				<span class="QuantityInputBox QuantityInputBoxcus">
							
					<button class= "plus_png_button plus_qty_modifier_<?php echo $option_value['product_option_value_id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modifyCartQtyIncDec1(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="plus_qty_modifier">
						<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
					</button> 
				</span>		
				
				 <span class="QuantityInputBox QuantityInputBoxcus">
				<?php if( $product['disable_qty_update'] == 1 ) { ?>
				
					<input type="text" id="<?php echo $y; ?>" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty cartqty_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>" disabled />	
				
				<?php } else { ?>
				
					<input type="text" id="<?php echo $y; ?>" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty cartqty_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>" />	
				
				<?php } ?>
				
				 </span>
						 
				 <span class="QuantityInputBox QuantityInputBoxcus">
					<button class="minus_png_button minus_qty_modifier_<?php echo $option_value['product_option_value_id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modifyCartQtyIncDec1(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="minus_qty_modifier">
					<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
					</button>	
			  </span>	 	
			</div>	
				<?php }?>
			
				<?php /* if (!$product['stock']) { ?>
				<p><span class="text-danger">***</span></p>
				<?php } */ ?>
				
			<span class="input-group-btn">
					<!--button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="add_to_order_box"><i aria-hidden="true" class="fa fa-refresh"></i></button-->
			</span>
				
				<?php if(!empty($product['option'])){
					foreach($product['option'] as $key=>$option){ 

							if(!$option['simple_option']){
							//print_r();
							?>
															
								
								<div class="subitems bold"><?php echo $key; ?></div>
								
							
										<?php
										$option2 = array(); 										
										ksort($option) ;	
										foreach($option as $type=>$topping_option){										
										?>		
												
								
								<div class="toppingStatus clearfix toppingStatus2">
										<?php if( $type == '2' ){?>
											 <span>RIGHT</span>
											  <input  value="left_side" style="visibility:hidden; height:0px;" name="topping"/>
										<?php } ?>
										
										<?php if(  $type == '1' ){?>
											   <span>LEFT</span>
											  <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>
										<?php } ?>	
										
										<?php if(  $type == '0' ){?>
											    <span>ALL</span>
											   <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>
										<?php } ?>
								</div>
								<?php
								
								foreach($topping_option as $option){ 
								?>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
								
					
								
								<div style="float:left;overflow:hidden;color:#7F8184;margin-left:20px;" >
									<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
								</div>
								<!--<div class="subitems22222" style="width: 0% !important; text-align: right; margin-left: 0px !important; font-family: 'Conv_ProximaNova-regular'; font-size: 13px;">-->
								<div class="subitems subitemsCus wwsubitemsQty">
									<div class="subitemsQty">
											<?php
											if(!empty($option['option_Qty'])){
												echo $option['option_Qty'].'x';	
											}else{	
										?>	
												
										<?php
											} //end if
										?>
									</div>
								</div>


								
						<div class="subitems subitemsCus">
						<div class="subitemsOpt">
								<?php if( $option['topping_option'] == 2 ){?>
									<label>2  x</label>
								<?php }?>
								<div class="subitemsValue">
								<?php echo $option['value']; ?>
						</div>	
						</div>
						
												
					</div>
	 
								
								<div style="float:right;overflow:hidden;font-size: 13px; color: #505e6a;">
									<?php
										//if( $option['topping'] > 0 && $option['topping_option'] == 2 ){?>
											<!--<label style="margin-right: 16px;">2x</label>-->
										<?php //} 
										if(!empty($option['price'])){
										// echo ''.$option['price'];
											// echo 'test1'.$option['actualOptionPrice'];										
											echo $option['actualOptionPrice'];										
										}else{	
									?>	
											<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>
									<?php
										} //end if
									?>	
								</div>
								<br/>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
					<?php 	
									}
								}
							}else{
								
							if($option['name'] == $tempOptionName) {
					?>	
					
 					

							<!--<div class="subitems33333333333" style="width: 0% !important; text-align: right;margin-left: 0px !important; font-family: 'Conv_ProximaNova-regular'; font-size: 13px;">-->
							<div class="subitems subitemsCus wsubitemsQty">
								<div class="subitemsQty">
										<?php
										if(!empty($option['option_Qty'])){
	
											echo $option['option_Qty'].'  x';	
										}else{	
									?>	
									<?php
									} //end if
								?>
								</div>										
							</div>	
	<div class="subitems subitemsCus">
		<div style="subitemsValue"><?php echo $option['value']; ?></div>
	</div>

	
							<div style="float:right;overflow:hidden;font-size: 13px; color: #505e6a;">
								<?php
									if(empty($option['extra_price']) && !empty($option['price'])){
									//echo $option['price'];										
										echo $option['actualOptionPrice'];	
									}else{	
								?>	
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>
								<?php
									} //end if
								?>	
							</div>
							<br/>
						<?php			
						}	else {
						?>
							<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
							</div>
							<div class="subitems bold"><?php echo $option['name']; ?>
							<br/>						
							</div>
							
							<p class=""><span><?php //echo $option['value']; ?></span></p>
							
 				
							
							<div style="float:left;overflow:hidden;color:#7F8184;margin-left:20px;" >
								<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
							</div>
							<!--<div class="subitems11111" style="width: 0% !important; text-align: right; margin-left: 0px !important; font-family: 'Conv_ProximaNova-regular'; font-size: 13px;">-->
							<div class="subitems subitemsCus wsubitemsQty">
								<div class="subitemsQty">
										<?php
										if(!empty($option['option_Qty'])){
											echo $option['option_Qty'].'  x';	
										}else{	
									?>											
									<?php
										} //end if
									?>	
								</div>
							</div>
					<div class="subitems subitemsCus"><?php echo $option['value']; ?>				
				</div>
						<div style="float:right;overflow:hidden;font-size: 13px; color: #505e6a;">
								<?php
									if(!empty($option['price'])){
									// echo ''.$option['price'];
										// echo 'test1'.$option['actualOptionPrice'];										
										echo $option['actualOptionPrice'];										
									}else{	
								?>	
										<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>
								<?php
									} //end if
								?>	
							</div>
							<?php } ?>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
							<?php 	
							$tempOptionName = $option['name'];
							}
						} //die;  //end foreach 
					  } //end if ?>
				</li>
			<?php  $y++ ; $pcount++;}?>
		</ul>
		</form>
		<ul class="sub-total-section">
			<?php if(isset($vouchers)){ 
					foreach($vouchers as $voucher){ ?>
						<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
				<?php } //end foreach ?>	
			<?php } //endif ?>
			<?php 
				if(isset($totals) && !empty($totals)){
			?>
			<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
			<?php } ?>
			<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce"><?php echo $totals[1]['text']; ?></b></p></li>
			<?php } ?>
			<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
			<?php } ?>
			<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn"><?php echo $totals[3]['text']; ?></b></p></li>
			<?php } ?>
			<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>
			<?php } ?>
			<?php if(isset($totals[5]) && isset($totals[5]['title']) && isset($totals[5]['text'])){ ?>
				<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[5]['title']; ?></strong><b class="prce grn"><?php echo $totals[5]['text']; ?></b></p></li>
			<?php } ?>
			
			<li class="no_border check-btn">
				<a href="<?php echo /*$cart*/ $checkout; ?>" class="">
					<input type="button" value="PROCEED TO CHECKOUT"  class="chk_bt_custom"/>
				</a>
			</li>
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



function modifyCartQtyIncDec(id, p_id, p_count){ 
 
var qtyVal = $('.desk_quantity_'+p_count).val();
 // console.log('qty= '+qtyVal);
 // console.log('id_1= '+id); 
 	
	
	if(id == 'plus_qty_modifier'){
		var newQtyVal = parseInt(qtyVal) + 1;
		 console.log('Updatedqty= '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		 updateCartInPanel('desktop');
		 
	}

	if(id == 'minus_qty_modifier'){
 		var newQtyVal = parseInt(qtyVal) - 1;
		 console.log('Updatedqty== '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		   updateCartInPanel('desktop');
	}
	 
}

function modifyCartQtyIncDec1(id, p_id, p_count){
 
var qtyVal = $(".cartqty_"+p_count).val();
 // console.log('qty= '+qtyVal);
 // console.log('id_2= '+id); 
 	
	
	if(id == 'plus_qty_modifier'){
		var newQtyVal = parseInt(qtyVal) + 1;
		 console.log('Updatedqty=== '+newQtyVal);
		 $('.cartqty_'+p_count).val(newQtyVal);
		 updateCartInPanel('desktop');
		 
	}

	if(id == 'minus_qty_modifier'){
 		var newQtyVal = parseInt(qtyVal) - 1;
		 console.log('Updatedqty==== '+newQtyVal);
		   $('.cartqty_'+p_count).val(newQtyVal);
		   updateCartInPanel('desktop');
	}
	 
}

</script>