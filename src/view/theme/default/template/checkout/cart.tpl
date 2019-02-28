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
  <div class="row row_mobile_cart cart-page">
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
					<a href="<?php echo $continue.$stepback; ?>" class="back_bt"><i class="fa fa-mail-reply" aria-hidden="true"></i> &nbsp; BACK TO MENU</a>
					
					<ul class="cart_products_data_list" id="cart_products_list_data_mobile_view">
						<!--<li><strong class="pull-left cart-qty-text">QTY</strong><strong class="pull-right">PRICE</strong></li>-->
						<?php $tempArrOption = array();
						$pcount = 1;
						foreach($products as $product){ ?>
							<li>
						<?php
							if( $product['is_free_item'] ) {
						?>
								<p><span style="color:red;">Reward*</span></p>
						<?php
							}
						?>
							<p>
								
								<a onclick="updateCartInPanel('mobile')" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box check-icon"></a>
								
								<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
								<!--<input type="text" onchange="updateCartInPanel('mobile')" name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity" value="<?php echo $product['quantity']; ?>" 	<?php if( $product['is_free_item'] ) { ?> disabled <?php } ?>/>-->
								
								<span style="padding:0 !important">
									<a class="product-link" href="<?php echo $product['href'].'&key='.$product['key']; ?>"><?php echo $product['name']; ?></a>
								</span>
								<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
							</p>
							
 <!-- PRODUCT QTY PLIUS MINUS BUTTON-->
<div class="productOptionsChecklist productOptionsChecklistMobileView" style="margin-left: -287px; border-top: 0px !important;">
					
	<span class="QuantityInputBox ChecklistMobileViewPlus 111" style="width: 6%; ">
				
		<button class= "plus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiMobcCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>')" id="plus_qty_modifier">
			<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
		</button>			
	</span>		
	
	 <span class="QuantityInputBox inputBoxQty" style="width: .1%;">
	
		<input style="margin-right: 2px; border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right; line-height:0px !important" type="text" onchange="updateCartInPanel('mobile')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />

	 </span>
			 
	 <span class="QuantityInputBox ChecklistMobileViewMinus" style="width: .7% ; ">
		<button class="minus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiMobcCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>')" id="minus_qty_modifier">
		<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
		</button>			
	</span>	 	
</div>
							
							
							
							
							
							<?php /* if (!$product['stock']) { ?>
							<p><span class="text-danger">***</span></p>
							<?php } */ ?>
							
							<!--<span class="input-group-btn">
							
								<button onclick="updateCartInPanel()" type="button" data-toggle="tooltip" title="<?php //echo $button_update; ?>" class="btn btn-primary new-design-primary-btn add_to_order_box"><i class="fa fa-refresh"></i></button>
							
								<button type="button" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" class="btn btn-danger new-design-danger-btn add_to_order_box hide-mobile" onclick="cart.remove('<?php //echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button>
							
							</span> -->
							
							<?php if(!empty($product['option'])){ 
									foreach($product['option'] as $key=>$option){
										
									   if(!$option['simple_option']){ ?>
									<div class="pb-5">
										<div  class="m-t60 f-30 m-t31 ml-option-name addon_title" style ="margin-left: 2px;"><?php echo $key; ?></div>
										<div style="clear:both;"></div>
										
										<?php ksort($option); foreach($option as $type=>$topping_option){ ?>
										
										
										<div class="m-t60 f-30 m-t31 ml-option-name" style ="height:auto;margin-left: 2px;border-bottom: 1px solid;width: auto;">
												<?php if( $type == '2' ){?>
													 RIGHT 
													  <input  value="left_side" type="hidden" class="left_side" style="visibility:hidden; height:0px;" name="topping"/>
												<?php } ?>
												<?php if( $type == '1' ){?>
													   LEFT 
													  <input  value="left_side" type="hidden"  class="left_side" style="visibility:hidden;height:0px;" name="topping"/>
												<?php } ?>	
												<?php if( $type == '0' ){?>
													   ALL 
													   <input  value="left_side" type="hidden" class="left_side" style="visibility:hidden;height:0px;" name="topping"/>
												<?php } ?>
										</div>
										
										<div style="clear:both;"></div>
										<?php foreach($topping_option as $option){ ?>
										<div style="float:left;overflow:hidden;color:#7F8184;margin-left:16px;" class="m-t60">
											<!--<span class="m-l10" style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
										</div>
                                        
                                        <div class="m-t60 f-30 m-t31 ml-option-name ml-option-qty " style="width:17px;text-align: right;margin-left: 3px !important; font-size: 14px; font-family: Conv_Oswald-Light;">
												
												<?php
													if(!empty($option['option_Qty'])){
														echo $option['option_Qty'].' x';	
													}else{	
												?>	
														<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>-->
												<?php
													} //end if
												?>
												
											</div>
                                        
										<div class="m-t60 f-30 m-t31 cart-cust-m-t60" style="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 8px;font-family:'Conv_Oswald-Light'; max-width:68%; text-align:left;">
											<?php
											if( $option['topping_option'] == 2 ){ ?>
												<label style="margin-right: 2px;">2x</label>
											<?php	}											
												echo  $option['value'];

											?>
										
										</div>
                                        
											

											
											<div class="m-t40 ex-price">
												<?php

													if(!empty($option['price'])){
														//echo $option['price'];
														echo $option['actualOptionPrice'];
													}else{	
												?>	
														<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
												<?php
													} //end if
												?>
											</div>
											<div style="clear:both;"></div>
										<?php 
											}
										}
										   ?>
									   <?php 
										}else{
											if($option['name'] == $tempOptionName) { ?>
									<div class="pb-5">
										<div style="float:left;overflow:hidden;color:#7F8184;margin-left:16px;" class="m-t60">
											<!--<span class="m-l10" style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
										</div>
										<div class="m-t60 f-30 m-t31 ml-option-name ml-option-qty " style="width:43px;text-align: right;margin-left: 3px !important; font-size: 14px; font-family: Conv_Oswald-Light;">
											
											<?php
												if(!empty($option['option_Qty'])){
													echo $option['option_Qty'].' x';	
												}else{	
											?>	
													<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>-->
											<?php
												} //end if
											?>
											
										</div>
										<!--<div  class="m-t60 f-30 m-t31" style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 8px;font-family:Conv_Oswald-Light; max-width:68%; text-align:left;">-->
										<div  class="m-t60 f-30 m-t31" style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: -2px;font-family:Conv_Oswald-Light; max-width:68%; text-align:left;">
										<?php echo $option['value']; ?>
										</div>
 
										
										<div class="m-t40 ex-price">
											<?php
												if(!empty($option['price'])){
													//echo $option['price'];
													echo $option['actualOptionPrice'];
												}else{	
											?>	
													<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
											<?php
												} //end if
											?>
										</div>
										<div style="clear:both;"></div>
									</div>
							<?php }else{ ?>
									<div class="pb-5">
										<div  class="m-t60 f-30 m-t31 ml-option-name addon_title" style ="margin-left: 2px;"><?php echo $option['name']; ?></div>
										<div style="clear:both;"></div>
										<div style="float:left;overflow:hidden;color:#7F8184;margin-left:16px;" class="m-t60">
											<!--<span class="m-l10" style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
										</div>
										
									<div class="m-t60 f-30 m-t31 ml-option-name ml-option-qty" style="width:43px;text-align: right;margin-left: 3px !important; font-size: 14px; font-family: Conv_Oswald-Light;">
									
										<?php
											if(!empty($option['option_Qty'])){
												echo $option['option_Qty'].' x';	
											}else{	
										?>	
												<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>-->
										<?php
											} //end if
										?>							
		 
									
									</div>										
										<div  class="m-t60 f-30 m-t31" style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: -2px;font-family:'Conv_Oswald-Light'; max-width:68%; text-align:left;">
										<?php echo $option['value']; ?>
										</div>

 											

										<div class="m-t40 ex-price">
											<?php
											if(!empty($option['price'])){
													// echo $option['price'];
													echo $option['actualOptionPrice'];
												}else{	
											?>	
													<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
											<?php
												} //end if
											?>
										</div>
										<div style="clear:both;"></div>
									</div>
							<?php } ?>
										
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
								
							<?php 	
										$tempOptionName = $option['name'];
										} //end else
									} //end foreach
								  } //end if ?>
							</li>
							
							<!-- <li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
							<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li> -->
						<?php  $pcount++; } ?>
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
						?>
						<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce"><?php echo $totals[1]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn"><?php echo $totals[3]['text']; ?></b></p></li>
						<?php } ?>
						<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>
						<?php } ?>
						<li style="border:none;"></li>
						<div style="clear:both;"></div>
					
					</ul>
							<a href="<?php echo /*$cart*/$checkout; ?>" ><button class="chk_bt_custom">PROCEED TO CHECKOUT <i style="color:#fff;" class="fa fa-check" aria-hidden="true"></i></button>  </a>
					<?php 
							} //end if
						?>
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
				<a href="<?php echo $continue.$stepback; ?>" class="back_bt back_bt_custom" style="background:none;"><i class="fa fa-mail-reply" aria-hidden="true"></i> BACK TO MENU</a>
				<div class="clearfix"></div>
				<ul class="cart_products_data_list" id="cart_products_list_data">
					<!--<li><strong class="pull-left" style="margin-left:45px;">QTY</strong><strong class="pull-right">PRICE</strong></li>-->
					<?php $pcount1= 1 ;?>
					<?php foreach($products as $product){ ?>
						
						<li class="product-details-row">
						<?php
							if( $product['is_free_item'] ) {
						?>
								<p><span style="color:red;">Reward*</span></p>
						<?php
							}
						?>
							<p>
								<a onchange="updateCartInPanel('desktop')" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></a>
								<!--<img onclick="cart.remove('<?php //echo $product['key']; ?>');" data-toggle="tooltip" title="<?php //echo $button_remove; ?>" src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" />-->
								
<?php
								//if( $product['is_free_item'] ) {
?>
									<!--<input type="text" disabled name="quantity[<?php //echo $product['key']; ?>]" class="qty" value="<?php //echo $product['quantity']; ?>" />-->
<?php
								//} else {
?>
									<!--<input type="text" onchange="updateCartInPanel('desktop')" name="quantity[<?php //echo $product['key']; ?>]" class="qty" value="<?php //echo $product['quantity']; ?>" />-->
<?php
							//	}
?>
 
								<span class="desktop-cart-page" style="max-width:100%;">
<?php
								if( $product['is_free_item'] ) {
?>
									<a class="product-link" style="font-size:135%;"> <?php echo $product['name']; ?></a>
<?php
								} else {
?>
									<a class="product-link" style="font-size:135%;" href="<?php echo $product['href'].'&key='.$product['key']; ?>"><?php echo $product['name']; ?></a>
<?php
								}
?>
								</span>
								<b class="prce"><?php echo $product['uncalculatedPrice']; ?></b>
							</p>

<div id="QuantityInputBoxId" ></div>
				 <!-- PRODUCT QTY PLIUS MINUS BUTTON-->
				<div class="productOptionsChecklist productOptionsChecklistDesk productOptionsChecklistDeskCart" style="border-top: 0px !important;">
									
					<span class="QuantityInputBox QuantityInputBox2 plusButtonDiv 2222">
								
						<button class= "plus_png_button ChecklistDeskPlus" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiDeskCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount1; ?>'); return false;" id="plus_qty_modifier">
							<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
						</button>			
					</span>		
					
					 <span class="QuantityInputBox QuantityInputBox2 inputQuantity">
					 
						<input style="border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right; line-height:0px !important" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity_<?php echo $pcount1; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />					
						
						<!--<input style="margin-right:8px; color: #439c05; border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px; text-align: center; height: 32px; float:right; line-height:0px !important" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity_<?php echo $pcount1; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />-->

					 </span>
							 
					 <span class="QuantityInputBox QuantityInputBox2 ChecklistDeskMinus">
						<button class="minus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiDeskCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount1; ?>'); return false" id="minus_qty_modifier">
						<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
						</button>			
					</span>	 	
				</div>

 
							
							<?php if(!empty($product['option'])){ 
									foreach($product['option'] as $key=>$option){
									if(!$option['simple_option']){
									?>
										<div class="cart-cs-name cust-cart-cs-name" style =""><?php echo $key; ?></div>
										<div style="clear:both;"></div>
										<div class="cart-cust-op-name cart-cust-op-name-cart clearfix">
										
										<?php ksort($option); foreach($option as $type=>$topping_option){ ?>
											<div class="cart-cs-name cart-cust-name cart-cust-name-cart-op">
													<?php if( $type == '2' ){?>
														 <span>RIGHT</span> 
														  <input  value="left_side" type="hidden" class="left_side" style="visibility:hidden; height:0px;" name="topping"/>
													<?php } ?>
													
													<?php if(  $type == '1' ){?>
														   <span>LEFT</span> 
														  <input  value="left_side" type="hidden" class="left_side" style="visibility:hidden;height:0px;" name="topping"/>
													<?php } ?>	
													
													<?php if(  $type == '0' ){?>
														   <span>ALL</span> 
														   <input  value="left_side" type="hidden" class="left_side" style="visibility:hidden;height:0px;" name="topping"/>
													<?php } ?>
											</div><div style="clear:both;"></div>
								
									<?php foreach($topping_option as $option){ ?>
										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:31px;" >
											<!--<span style="text-decoration: line-through;">&nbsp;</span>-->
										</div>
										
										<div class="opt-x" style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 6px; font-family:Conv_Oswald-Light; max-width:90%; text-align:left; font-size:135%;">
										
											<?php
												if(!empty($option['option_Qty'])){
													echo $option['option_Qty'].' x';	
												}else{	
											?>	
													<span> </span>
											<?php
												} //end if
											?>							
			 
										
										</div>
								<div class="subitems cart-cust-subitems cart-cust-subitems-op" style="margin-left: 30px !important;float: left;overflow: hidden;color: #7B7B7B;color: #505e6a;margin-left: 6px;font-family: Conv_Oswald-Light;max-width: 90%;text-align: left;font-size: 135%;">
								
								<?php
										if( $option['topping'] > 0 && $option['topping_option'] == 2 ){?>
											<label style="margin-right: 2px;">2x</label>
										<?php }								
									echo $option['value']; 
								?>
								
								</div>
	 
								
								<div style="float: right;overflow: hidden;color: #7F8184;font-size: 135%;">
									<?php
 
										if(!empty($option['price'])){
										// echo ''.$option['price'];
											// echo 'test1'.$option['actualOptionPrice'];										
											echo $option['actualOptionPrice'];										
										}else{	
									?>	
											<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;</span>-->
									<?php
										} //end if
									?>	
								</div>
								<br/>
								<p class=""><span><?php //echo $option['value']; ?></span></p>
										<?php } ?>
										<div style="clear:both;"></div>
									<?php	} ?>
									</div>
									<?php
									}else{
										
										if($option['name'] == $tempOptionName ) {

								?>
									<div class="cart-cust-op-name cart-cust-op-name-cart">

										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:31px;" >
											<!--<span style="text-decoration: line-through;">&nbsp;</span>-->
										</div>
										<div class="subitems subitemsCus wsubitemsQty">
										
											<?php
												if(!empty($option['option_Qty'])){
													echo $option['option_Qty'].' x';	
												}else{	
											?>	
													<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<?php
												} //end if
											?>							
			 
										
										</div>										
										<div class="subitems subitemsCus"><?php echo $option['value']; ?></div>
						
										<div class="subitems subitemsCus wsubitemsQty wsubitemsPrc">
											<?php
												if(!empty($option['price'])){
													//echo $option['price'];	
													echo $option['actualOptionPrice'];
												}else{	
											?>	
													<span style="text-decoration: line-through;"></span>
											<?php
												} //end if
											?>
										</div>
										<div style="clear:both;"></div>
									</div>	
								<?php }else{ ?>
									<div class="cart-page-pro-opt">
										<div class="cart-cs-name cart-cust-name cart-cust-name-cart-op" style =""><?php echo $option['name']; ?></div>
										<div style="clear:both;"></div>

										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:31px;" >
											<!--<span style="text-decoration: line-through;">&nbsp;</span>-->
										</div>
										<div class="subitems subitemsCus wsubitemsQty">
										
											<?php
												if(!empty($option['option_Qty'])){
													echo $option['option_Qty'].' x';	
												}else{	
											?>	
													<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<?php
												} //end if
											?>							
			 
										
										</div>										
										<div class="subitems subitemsCus"><?php echo $option['value']; ?></div>
						
										<div class="subitems subitemsCus wsubitemsQty wsubitemsPrc">
											<?php
												if(!empty($option['price'])){
													//echo $option['price'];	
													echo $option['actualOptionPrice'];
												}else{	
											?>	
													<span style="text-decoration: line-through;"></span>
											<?php
												} //end if
											?>
										</div>
										<div style="clear:both;"></div>
									</div>	
								<?php } 
									}?>
<!-- 									<div style="margin-bottom:10px;">
										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:7px;" >
											<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</div>
										<div style ="float:left;overflow:hidden; /*color:#7B7B7B;*/ color:#505e6a; margin-left: 75px; font-family:Conv_Oswald-Light; max-width:90%; text-align:left; font-size:135%;"><?php echo $option['name'].' : '.$option['value']; ?></div>
										<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
											<?php
												if(!empty($option['price'])){
													echo $option['price'];	
												}else{	
											?>	
													<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<?php
												} //end if
											?>
										</div>
										<div style="clear:both;"></div>
									</div> -->	
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
								
							<?php 	
										$tempOptionName = $option['name'];
									} //end foreach
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
				
				<ul class="cart-page-total-wrap">
					<?php /*if(isset($vouchers)){ 
							foreach($vouchers as $voucher){ ?>
								<li class="no_border"><input type="text" name="vouchers" class="coupan" /></li>
						<?php } //end foreach ?>	
					<?php } //endif */ ?>
					<?php 
						if(isset($totals) && !empty($totals)){
					?>
					<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce"><?php echo $totals[1]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn black"><?php echo $totals[3]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>
					<?php } ?>
					<?php if(isset($totals[5]) && isset($totals[5]['title']) && isset($totals[5]['text'])){ ?>
						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[5]['title']; ?></strong><b class="prce grn"><?php echo $totals[5]['text']; ?></b></p></li>
					<?php } ?>
					
					<li class="no_border"><a href="<?php echo /*$cart*/$checkout; ?>" ><button class="chk_bt_custom" style="font-size: 22px; padding: 24px 0; ">PROCEED TO CHECKOUT <i style="color:#fff;" class="fa fa-check" aria-hidden="true"></i></button></a></li>
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
 
	// $('#QuantityInputBoxId').text('Height::'+windowHeight+' width::'+windowWidth);
	//$('#QuantityInputBoxId').text(' width::'+(windowWidth * 1.4 )/1920);
	var inputwidth = (windowWidth * 1.4 )/1920 ;
	var minuswidth = (windowWidth * 1 )/1920 ;
	var plusmarginright = (windowWidth * .4 )/1920 ;
	var cartcustsubitemsWidth = (windowWidth * 2.6 )/1920 ;
	var cartcustopname = (windowWidth * 1.6 )/1920 ;

	// switch to sampleResponsiveBase.css if window width > or = 845
	// if (windowWidth >= 1920 && windowWidth <= 1254)
 
	 
	if ( windowWidth >= 1250 )
	{
		$(".inputQuantity").css("width", inputwidth+'%');
		$(".ChecklistDeskMinus").css("margin-left", '-'+minuswidth+'%');		
		$(".2222").css("margin-right", plusmarginright+'%');		
		$(".cart-cust-subitems").css("margin-left", cartcustsubitemsWidth+'%');		
		//$(".cart-cust-op-name").css("margin-left", cartcustopname+'%');		
		
	}
	
	if ( windowWidth >= 769 && windowWidth <= 1249)
	{
			var cartcustsubitemsWidth = (windowWidth * 7 )/1920 ;
			var cartcustopname 		  = (windowWidth * 7 )/1920 ;
			$(".cart-cust-m-t60").css("margin-left", cartcustsubitemsWidth+'%');					
			//$(".cart-cust-op-name").css("margin-left", cartcustsubitemsWidth+'%');					
		
	}	
	// switch to adaptive if window width < 845
 
	
}


	var locationSet 	= '<?php echo $locationSet; ?>';
	var step_back_url	= '<?php echo $step_back_url; ?>';

	if(locationSet && step_back_url){
		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> Categories').show();
	}	
</script>

<script>

function modiDeskCartQtyIncDec(id, p_id, p_count){ 
 
var qtyVal = $('.desk_quantity_'+p_count).val();
 console.log('qty= '+qtyVal);
 console.log('id_1= '+id); 
 	
	
	if(id == 'plus_qty_modifier'){
		var newQtyVal = parseInt(qtyVal) + 1;
		 console.log('Updatedqty= '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		 updateCartInPanel('mobile');
		 
	}

	if(id == 'minus_qty_modifier'){
 		var newQtyVal = parseInt(qtyVal) - 1;
		 console.log('Updatedqty= '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		   updateCartInPanel('mobile');
	}
	 
}

function modiMobcCartQtyIncDec(id, p_id, p_count){ 
 
var qtyVal = $('.desk_quantity_'+p_count).val();
 console.log('qty= '+qtyVal);
 console.log('id_1= '+id); 
 	
	
	if(id == 'plus_qty_modifier'){
		var newQtyVal = parseInt(qtyVal) + 1;
		 console.log('Updatedqty= '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		 updateCartInPanel('mobile');
		 
	}

	if(id == 'minus_qty_modifier'){
 		var newQtyVal = parseInt(qtyVal) - 1;
		 console.log('Updatedqty= '+newQtyVal);
		  $('.desk_quantity_'+p_count).val(newQtyVal);
		   updateCartInPanel('mobile');
	}
	 
}
</script>

<?php echo $footer; ?>