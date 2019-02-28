<?php 
if(isset($redirect) && !empty($redirect)){
?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <a href="<?php echo $redirect; ?>">Location not set. Please <span style="font-weight:bold;">Click Here</span> to go back to Ordering Options.</a>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>	
<?php }else{ ?>
<div id="custom-checkout-form">
	<div id="custom-checkout-form_part_1">
	<div class="row">
		<div id="checkout_payment_part1" class="col-lg-12 col-xs-12 checkout-container checkout_part clearfix">
			<div class="header hidden-xs">
				<div class="numberCircle">1</div>
				<div class="title-area">
					<h2>Order Details</h2>
				</div>
			</div>
			<div class="row content-wrapper">
				<div class="col-sm-12 col-xs-12 col-xs-lg-12 content">
				   <div class="form-box"> 
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-username.png" />
						<input name="firstname" class="form-control" type="text" id="checkout_contact_firstname" value="<?php echo $firstname; ?>" placeholder="First Name" >
				    </div>	
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-username.png" />
						<input name="o_lastname" class="form-control" type="text" id="ocheckout_contact_lastname" value="<?php echo $lastname; ?>" placeholder="Last Name" >

				    </div>						
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img class="cs-email-icon" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-email.png" />				    
				      <!--	<input type="text" name="email" value="" placeholder="Email" id="email" class="form-control" /> -->
						<input name="email" class="form-control" type="email" id="checkout_contact_email" value="<?php echo $email; ?>" placeholder="E-Mail Address">
				    </div>					
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-phone.png" />
						 <!-- <input type="text" name="phone" value="" placeholder="Phone" id="phone" class="form-control" /> -->
					  <input name="telephone" class="form-control" type="text" id="checkout_contact_telephone" value="<?php echo $telephone; ?>" placeholder="Telephone">
					  <input name="fax" class="form-control" type="hidden" id="fax" value="<?php echo $fax; ?>">
					  <input name="customer_id" class="form-control" type="hidden" id="customer_id" value="<?php echo $customer_id; ?>">
				    </div>					
				    <div id="add-note"  class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img class="cs-pencil-icon" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-pencil.png" />
						<textarea name="add_note" placeholder="Add note" class="form-control"></textarea>
				    </div>
			<?php
				$showPickup = false;
				if(isset($_SESSION['pickupStatus']) && !empty($_SESSION['pickupStatus'])){
					$showPickup = true;
				}
				
				$showDelivery = false;
				if(isset($_SESSION['deliveryStatus']) && !empty($_SESSION['deliveryStatus'])){
					$showDelivery = true;
				}
				
			?>
			<?php if($showPickup && $showDelivery){ ?>
				    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding" style="padding-right: 5px !important;">
							<div class="order-btn slct_clr">
								<a id="showPickupSection" onclick="showSelectedMethodSection(this.id,'1')" href="javascript:void(0);"><div class="clr_use"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/pick-icon.png" />
								Pickup</div></a>					
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding" style="padding-left: 5px !important;">
							<div class="order-btn slct_clr">
							<div id="showDeliverySection" class="" onclick="showSelectedMethodSection(this.id,'1')" style="border-radius: 35px;">
								<a href="javascript:void(0);"><div class="clr_use"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/dly-icon.png" />
								Delivery</div></a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="pickup_section">
							<h2>Pickup Location</h2>
							<p>
								<?php echo $pickup_address['title']; ?><br/>
								<?php echo $pickup_address['display_address']; ?>
							</p>
						</div>

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="delivery_address_section">
						<br>
						<?php //print_r($_SESSION)?>
						<?php if($delivery_listings_status == '1'){ ?>
						<input class="form-control input-lg" type="text" id="full_delivery_address" placeholder="Enter your address..." value="<?php echo $full_delivery_address; ?>" name="full_delivery_address" autocomplete="false">
						<?php } ?>
						
						<?php if($delivery_listings_status == '2'){ ?>
						<input type="hidden" name="full_delivery_address" value="<?php echo $full_delivery_address; ?>">
						<b style="color:#535e68; font-size: 15px;">Delivery Listing</b><p class="form-control input-lg"><b><i class="fa fa-map-marker" aria-hidden="true" style="color:#878787;margin:0 5px;font-size: 25px;"></i><?php echo $full_delivery_address; ?></b></p>
						<?php } ?>
						<br> <?php if($delivery_listings_status == '1'){ ?>
							<div class="col-sm-4 margin-top-mobile">
								<a href="javascript:void(0);" onclick="confirm_delivery_address();" id="delivery_address_confirm" class="button button-green button-block hover-white shop_btn">Verify</a>
							</div>
						<?php } ?>
						</div>
						
	
						
				    </div>
					<?php }elseif($showPickup && !$showDelivery){ ?>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="checkout_method">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding" style="padding-right: 5px !important;">
							<div class="order-btn slct_clr" >
								<div class="shop_btn clr_use">
								<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/pick-icon.png" />
								Pickup					
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="pickup_section">
							<h2>Pickup Location</h2>
							<p>
								<?php echo $pickup_address['title']; ?><br/>
								<?php echo $pickup_address['display_address']; ?>
							</p>
						</div>
							    	
				    </div>
					<?php }elseif(!$showPickup && $showDelivery){ ?>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="checkout_method">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding" style="padding-left: 5px !important;">
							<div class="order-btn slct_clr">
							<div class="shop_btn clr_use" >
								<a href="javascript:void(0);"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/dly-icon.png" />
								Delivery</a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="delivery_address_section">
						<br>
						<?php if($delivery_listings_status == '1'){ ?>
						<input class="form-control input-lg" type="text" id="full_delivery_address" placeholder="Enter your address..." value="<?php echo $full_delivery_address; ?>" name="full_delivery_address" autocomplete="false">
						</div>
						<?php } ?>
						
						<?php if($delivery_listings_status == '2'){ ?>
						<input type="hidden" name="full_delivery_address" value="<?php echo $full_delivery_address; ?>">
						<b style="color:#535e68; font-size: 15px;">Delivery Listing</b><p class="form-control input-lg"><b><?php echo $full_delivery_address; ?></b></p>
						<?php } ?>
						
						<?php if($delivery_listings_status == '1'){ ?>
						<div class="col-sm-4 margin-top-mobile">
							<a href="javascript:void(0);" onclick="confirm_delivery_address();" id="delivery_address_confirm" class="button button-green button-block hover-white shop_btn">Verify</a>
						</div>		
						<?php } ?>						
				    </div>
					<?php } ?>			
				
					<?php
										if( isset( $min_delivery_order_amount_note ) ) {
					?>
											<div class="form-group col-xs-12 alert alert-danger alert-dismissible" style="color:red; margin-top: 20px;">
					<!--
											<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4" style="color:red;">
					--->
												<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<?php
												echo $min_delivery_order_amount_note;
					?>
											</div>
					<?php
										}
					?>


					
				</div>
				</div>
			</div>
		</div>
		<div style="width: 100% !important;" id="checkout_payment_part2" class="col-lg-12 col-xs-12 checkout-container checkout_part clearfix">
			<div class="header hidden-xs">
				<div class="numberCircle">2</div>
				<div class="title-area">
					<h2>Review Your order</h2>
				</div>
			</div>
<!-- 			<div class="xs-header hidden-sm hidden-md hidden-lg">
				<span class="label">Order Summary</span>
			</div> -->
			<div class="row content-wrapper">

			
			<?php if($tipInstalled && $tip_enable == 1){ ?>
				<div class="xs-header sub-header col-xs-12 hidden-sm hidden-md hidden-lg">
					<span class="label">Tip</span>
				</div>
			<?php } ?>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 tip-area">
				<?php if($tipInstalled && $tip_enable == 1){ ?>
					<div class="col-sm-12 col-md-12 col-lg-12 tip-banner hidden-xs">
						<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-tip.png">
						<span>TIP</span>
					</div>

					<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6 cs-btn-area">
						<a class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-15 tips1" href="javascript:void(0)" onclick="addTip('15')"><div class="shop_btn tip-boxes">15%</div></a>
						<a class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-18 tips2" href="javascript:void(0)" onclick="addTip('18')"><div class="shop_btn tip-boxes">18%</div></a>
						<a class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-20 tips3" href="javascript:void(0)" onclick="addTip('20')"><div class="shop_btn tip-boxes">20%</div></a>						
						<!-- <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-15"><p>15%</p></div> -->
						<!-- <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-18"><p>18%</p></div> -->				
						<!-- <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4 tip-btn bg-20"><p>20%</p></div> -->
					</div>
					
<!-- 					<div class="col-sm-4 col-xs-12 mobile-mb10" style="margin-bottom:50px;">
						<a class="tips1" href="javascript:void(0)" onclick="addTip('15')"><div class="btn button-green shop_btn tip-boxes">15%</div></a>
						<a class="tips2" href="javascript:void(0)" onclick="addTip('18')"><div class="btn button-green shop_btn tip-boxes">18%</div></a>
						<a class="tips3" href="javascript:void(0)" onclick="addTip('20')"><div class="btn button-green shop_btn tip-boxes">20%</div></a>
					</div>
 -->				    <div class="form-group col-sm-6 col-xs-6 col-md-6 col-lg-6 cs-pl-5">
				      <input type="text" name="tip" id="tip" value="<?php echo $tip; ?>" placeholder="$ other" class="form-control" />
				    </div>
					<?php }// end if tipInstalled ?>
					
				<?php if ($rewardpoints) {				
				?>
					<div style="display:none;" class="col-sm-12 col-xs-12 col-md-12 col-lg-12 loyalty-point">
						<div class="loyal-header" style="padding: 12px;">
							<i class="fa fa-tag" aria-hidden="true"> <p>Use rewardpoints Code</p> </i>
						</div>

						<h2><?php echo $text_next; ?></h2>
						<p><?php echo $text_next_choice; ?></p> 
							
						<div class="panel-group new-design-panel" id="accordion" style="">
							<?php echo $rewardpoints; ?><?php //echo $reward; ?><?php //echo $shipping; ?>
						</div>
					</div>
				<?php } ?>
					
					
					
					
					
					
					<?php if($coupon_enabled_status != '0' && !empty($coupon_enabled_status)){?>
					<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 loyalty-point">
						<div class="loyal-header" style="padding: 12px;">
							<i class="fa fa-tag" aria-hidden="true"> <p>Coupon Code</p> </i>
				    		
				    	</div>
						<?php if ($coupon) { ?>
							<?php if ($text_next) { ?>
								<h2><?php echo $text_next; ?></h2>
							<?php }?>
						  <p><?php echo $text_next_choice; ?></p> 
							
						  <div class="panel-group new-design-panel" id="accordion" style=""><?php echo $coupon; ?><?php //echo $reward; ?><?php //echo $shipping; ?></div>
						<?php } ?>
					</div>
				  <?php } ?>
				  <?php
					if( $reward_spending ) {
				  ?>
				    <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 loyalty-point" id="loyalty-point-box">
				    	<div class="loyal-header">
				    		<img class="hidden-xs" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-loyalty-desktop.png" />
				    		<img class="hidden-sm hidden-md hidden-lg" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-loyalty.png" />
				    		<p>Loyalty points</p>
				    	</div>
				    	<div class="loyal-body">
				    <!-----	<h2>You have <strong>3,600</strong> loyalty points</h2>	---->
				    		<h2>You have <span id="loyalty_points" style="color:#0c743c;"><strong> <?php echo $reward_points;?> </strong></span> loyalty points</h2>
				    		<p>How many points do you want to use?</p> </br>
				    		<input type="number" name="applyRewardInput" onkeyup="NumAndTwoDecimals(event , this);" placeholder="0" class="cs-order-num" value="<?php echo (int)$max_points_allowed;?>"></br>
							<div class="btn-area messg-box-top">
							<p class="messg-box"><?php if($apply_spendingRule_message =='unlimited') echo 'You can use maximum '.(int)$max_points_allowed.' points.'; else echo $apply_spendingRule_message; ?></p>
								<div class="form-group">
									<input type="button" id="applyRewardButton" name="confirm" class="btn m-t-md pad3 top_no_padding" value="Apply points"/>
								</div>
								<div class="rewardPointsMsg">
								</div>
							</div>			    		
				    	</div>
				    </div>
				  <?php
					}
					?>
					
				</div>
				<div class="xs-header sub-header col-xs-12 hidden-sm hidden-md hidden-lg">
					<span class="label">Order summary</span>
				</div>				
				
				<?php if($logged){?>
				
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 content right-0 order-report view_cart" id="custom-checkout-form_part_2">
					
				<?php }else{ ?>
				
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 content right-0 order-report view_cart" id="custom-checkout-form_part_2" style=" height:400px !important ">
				
				<?php } ?>
				
				
				 <div class="form-box">
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list" id="cart_products_list_data">
						<li>
							<strong class="pull-left">QTY</strong>
							<strong class="pull-right">PRICE</strong>
						</li>
						<?php $tempArrOption = array();
						$pcount = 1;

						foreach($products as $product){ ?>
						<li style="border-bottom:1px solid black">

							<?php
								if( $product['is_free_item'] == 1 ) {
							?>
							<p><span style="color:red;">Reward*</span> </p>
							<?php
								}
							?>
							<p style="margin-bottom: 5px;">
								<a onclick="" data-toggle="tooltip" title="" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></i></a>

						<?php /*if( $product['disable_qty_update'] == 1 ){ ?>
								<input type="text" onchange="updateCartInPanel('desktop')" name="quantity[<?php echo $product['key']; ?>]"  class="qty" value="<?php echo $product['quantity']; ?>" disabled />
						<?php } else { ?>
								<input type="text" onchange="updateCartInPanel('desktop')" name="quantity[<?php echo $product['key']; ?>]"  class="qty" value="<?php echo $product['quantity']; ?>" <?php if( $product[ 'is_free_item' ] ) {?> disabled <?php }?> />
						<?php } */?>	 
						
								<span class="desktop-cart-page" style="max-width:80%;margin-left:-14px">
									<a class="product-link" style="font-size:135%;" href="<?php echo $product['href'].'&edit_product=1&key='.$product['key']; ?>"><?php echo $product['name']; ?></a>
								</span>
								<b class="prce"><?php echo $product['price']; ?></b>
							</p>

							
					<!-- PRODUCT QTY PLIUS MINUS BUTTON-->
<!--<div class="productOptionsChecklist checkoutproductqtybutton" style="margin-left: -328px;">-->
<div class="productOptionsChecklist checkoutproductqtybutton custCheckoutPlusMinusDiv" style="margin-left: -328px;">
					
	<span class="QuantityInputBox  " style="width: 6%; ">
				
		<button class= "plus_png_button" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiChkOutCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="plus_qty_modifier">
			<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
		</button>			
	</span>		
	
	 <span class="QuantityInputBox" id="qty_minwidth" style="width: .1%;">
	<?php if( $product['disable_qty_update'] == 1 ) { ?>
	
		<input style=" margin-right: 10px;border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right;" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity1_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>" disabled />			
		
	<?php } else { ?>
	
		<input style=" margin-right: 10px;border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right;" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity1_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />
	
	<?php } ?>
	
	 </span>
			 
	 <span class="QuantityInputBox  QuantityInputBoxMinus" style="width: .4%; ">
		<button class="minus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiChkOutCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="minus_qty_modifier">
		<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
		</button>			
	</span>	 	
</div>


							
							<?php if(!empty($product['option'])){ 
									foreach($product['option'] as $key=>$option){
									if(!$option['simple_option']){ ?>
										<div class="checkout_option_title" style="margin-bottom:5px;">
										<div class="cart-cs-name" style ="margin-top:15px;"><?php echo $key; ?></div>
										<div style="clear:both;"></div>
										
								<?php ksort($option); foreach($option as $type=>$topping_option){ ?>
									<div class="cart-cs-name">
										<div style="height:28px;margin-left: 0px;border-bottom: 1px solid;width: 50px;">
												<?php if( $type == '2' ){?>
													 RIGHT 
													  <input  value="left_side" style="visibility:hidden; height:0px;" name="topping"/>
												<?php } ?>
												
												<?php if( $type == '1' ){?>
													   LEFT 
													  <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>
												<?php } ?>	
												
												<?php if( $type == '0' ){?>
													   ALL 
													   <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>
												<?php } ?>
										</div>
							
									</div><div style="clear:both;"></div>
																				
									<?php foreach($topping_option as $option){ ?>
							
										<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" class="tops_opt">
											<span class="11111" style="text-decoration: line-through;    margin-right: 1px;"></span>
										</div>
										<div class="cs-t-3">
										<?php 
													if( $option['topping_option'] == 2 ){?>
														<label style="margin-right: 2px;">2x</label>
													<?php } 										
										echo $option['value']; 
											
										?>
											
										</div>							
										<div class="cs-t-2" style="">
											<?php
												if(!empty($option['price']) && $option['price'] != '$0.00'){
													//echo $option['price'];
														echo $option['actualOptionPrice'];
												}else{ ?>
												<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
											<?php }?>	
										</div><div style="clear:both;"></div>
										
									<?php } ?>
								<?php } ?>	
									<div style="clear:both;"></div>	

										<?php }else{
									if($option['name'] == $tempOptionName) {
							?>
								<div style="margin-bottom:5px;">
									<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" class="tops_opt">
									<span class="22222" style="text-decoration: line-through;"></span>
								</div>
												
						<?php if(!empty($option['option_Qty'])){ ?>
							<div class="subitems custCheckoutSubitemsDiv" style="width: 10%; text-align: right;margin-left: 0px ; font-family: Conv_Oswald-Light; font-size: 19px;margin-right: -7px;    font-weight: bold;">
						<?php } else{?>
							<div class="subitems custCheckoutSubitemsDiv" style="text-align: right;margin-left: 0px ; font-family: Conv_Oswald-Light; font-size: 19px;width: 0%;margin-right: -7px;    font-weight: bold;">
						<?php }?>
								<?php
									if(!empty($option['option_Qty'])){
										echo $option['option_Qty'].'x';	
									}else{	
								?>	
										<span></span>
								<?php
									} //end if
								?>							
 
							
							</div>	
								<div class="cs-t-3 custCheckout-cs-t-3" style="margin-top: -4px;"><?php echo $option['value']; ?></div>													

												<div class="cs-t-2" style="">
													<?php
													
														if(!empty($option['price']) && $option['price'] != '$0.00'){
															echo $option['actualOptionPrice'];	
														}else{
													?>
														<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
													<?php }?>	
												</div>
												<div style="clear:both;"></div>
											</div>

										<?php }else{ ?>
											<div class="checkout_option_title" style="margin-bottom:5px;">
												<div class="cart-cs-name" style ="margin-top:15px;"><?php echo $option['name']; ?></div>
												<div style="clear:both;"></div>
												<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" class="tops_opt">
													<span class="33333" style="text-decoration: line-through;"></span>
												</div>
						<?php if(!empty($option['option_Qty'])){ ?>						
							<div class="subitems custCheckoutSubitemsDiv" style="width: 10%; text-align: right;margin-left: 0px ;  font-family: Conv_Oswald-Light; font-size: 19px;margin-right: -7px;    font-weight: bold;">
						<?php } else{?>
							<div class="subitems custCheckoutSubitemsDiv" style=" text-align: right;margin-left: 0px ;  font-family: Conv_Oswald-Light; font-size: 19px; width: 0%;margin-right: -7px;    font-weight: bold;">						
						<?php } ?>
								<?php
									if(!empty($option['option_Qty'])){
										echo $option['option_Qty'].'x';	
									}else{	
								?>	
										<span></span>
								<?php
									} //end if
								?>							
 
							
							</div>													
							<div class="cs-t-3 custCheckout-cs-t-3" style="margin-top: -4px;"><?php echo $option['value']; ?></div>	
					<div class="cs-t-2" style="">
						<?php
							if(!empty($option['price']) && $option['price'] != '$0.00'){												
								echo $option['actualOptionPrice'];
							}else{ ?>
							<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
						<?php }?>	
					</div>
												<div style="clear:both;"></div>
											</div>
										<?php $tempOptionName = $option['name']; 	
										} ?>
																				
									 
										<?php }  
										} 
									?>

							<?php							 
									}
							?>	
						</li>
						<?php  $pcount++; }?>
					</ul>
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list">
						<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
							<li id="<?php echo $totals[0]['id']; ?>" data-amount="<?php echo $totals[0]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
							<li id="<?php echo $totals[1]['id']; ?>" data-amount="<?php echo $totals[1]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce grn"><?php echo $totals[1]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])) { ?>
							<li id="<?php echo $totals[2]['id']; ?>" data-amount="<?php echo $totals[2]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce"><?php echo $totals[3]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])) { ?>
							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>
						<?php } ?>
						
						<?php if(isset($totals[5]) && isset($totals[5]['title']) && isset($totals[5]['text'])) { ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[5]['title']; ?></strong><b class="prce grn"><?php echo $totals[5]['text']; ?></b></p></li>
						<?php } ?>
						
						<?php if(isset($totals[6]) && isset($totals[6]['title']) && isset($totals[6]['text'])) { ?>
							<li id="<?php echo $totals[6]['id']; ?>" data-amount="<?php echo $totals[6]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[6]['title']; ?></strong><b class="prce grn"><?php echo $totals[6]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[7]) && isset($totals[7]['title']) && isset($totals[7]['text'])) { ?>
							<li id="<?php echo $totals[7]['id']; ?>" data-amount="<?php echo $totals[7]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[7]['title']; ?></strong><b class="prce grn"><?php echo $totals[7]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[8]) && isset($totals[8]['title']) && isset($totals[8]['text'])) { ?>
							<li id="<?php echo $totals[8]['id']; ?>" data-amount="<?php echo $totals[8]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[8]['title']; ?></strong><b class="prce grn"><?php echo $totals[8]['text']; ?></b></p></li>
						<?php } ?>

					</ul>										
				</div>			
				</div>			
			</div>

		</div>
<!-- 		<div id="checkout_payment_part3" class="col-lg-12 col-xs-12 checkout-container checkout_part clearfix">
			<div class="row content-wrapper">
				<div class="col-sm-12 content">
				</div>			
			</div>
		</div>	 -->	
		<div id="checkout_payment" class="col-lg-12 col-xs-12 checkout-container checkout_part clearfix">
			<?php echo $payment; ?>
		</div>
	</div>
 <table id="address" hidden>
      <tr>
        <td class="label">Street address</td>
        <td class="slimField"><input class="field" id="street_number"
              disabled="true"></input></td>
        <td class="wideField" colspan="2"><input class="field" id="route"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">City</td>
        <!-- Note: Selection of address components in this example is typical.
             You may need to adjust it for the locations relevant to your app. See
             https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
        -->
        <td class="wideField" colspan="3"><input class="field" id="locality"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">State</td>
        <td class="slimField"><input class="field"
              id="administrative_area_level_1" disabled="true"></input></td>
        <td class="label">Zip code</td>
        <td class="wideField"><input class="field" id="postal_code"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">Country</td>
        <td class="wideField" colspan="3"><input class="field"
              id="country" disabled="true"></input></td>
      </tr>
    </table>		
	 
</div>

<!-- id="map" used for google maps api to verify address in fence or not Do not remove -->
<div id="map" style="display:none;"></div>
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8A1it5vpYf-L9LKgFK3lnrykdRnbR6QE&signed_in=false&libraries=places&callback=initAutocomplete"
        async defer></script>-->
		
		
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8A1it5vpYf-L9LKgFK3lnrykdRnbR6QE&libraries=places&callback=initAutocomplete"
        async defer></script>		


<script>

function check_firstname(){  
	var check = function(string) {
		return string.indexOf(' ') === -1;
	};
}

function modiChkOutCartQtyIncDec(id, p_id, p_count){ 
 

var qtyVal = $('.desk_quantity1_'+p_count).val();
 console.log('qty= '+qtyVal);
 console.log('id_1= '+id); 
 	
	
	if(id == 'plus_qty_modifier'){
		var newQtyVal = parseInt(qtyVal) + 1;
		 console.log('Updatedqty=== '+newQtyVal);
		  $('.desk_quantity1_'+p_count).val(newQtyVal);
		 updateCartInPanel('desktop');
		 
	}

	if(id == 'minus_qty_modifier'){
 		var newQtyVal = parseInt(qtyVal) - 1;
		 console.log('Updatedqty==== '+newQtyVal);
		  $('.desk_quantity1_'+p_count).val(newQtyVal);
		   updateCartInPanel('desktop');
	}
	 
}
</script>


		
<script type="text/javascript"><!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

	$('#applyRewardButton').click( function() {
		// console.log(  );
		var value = $('Input[name="applyRewardInput"]').val();
		
		if(value >= 0) {
			$.ajax({
				url: '<?php echo BASE; ?>index.php?route=rewardpoints/index/applyPoints',
				type: 'post',
				data: {points: value},
				beforeSend: function() {
					$('.rewardPointsMsg').html( '' );
				},
				success: function(json) {
					if(json.success) {
						$.ajax({
						  url: '<?php echo BASE; ?>index.php?route=checkout/checkout/loadOrderSummary',
						  success: function(orderData) {
							$('#custom-checkout-form_part_2').html(orderData);

							$('.rewardPointsMsg').html( json.msg );
							$('#loyalty_points').html( json.points_available );
						  }
						});

						// console.log( json );

					} else {
						$('.rewardPointsMsg').html( json.error );
					}
				},
			});
		}
	});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('#checkout-registration-panel input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=checkout/checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#checkout-registration-panel .custom-field').hide();
			$('#checkout-registration-panel .custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#payment-custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#payment-custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#checkout-registration-panel input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('#checkout-registration-panel button[id^=\'button-payment-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: '<?php echo BASE; ?>index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input[name^=\'custom_field\']').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('#checkout-registration-panel select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#checkout-registration-panel select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#checkout-registration-panel input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#checkout-registration-panel input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php //echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php //echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php //echo $text_none; ?></option>';
			}

			$('#checkout-registration-panel select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

//$('#checkout-registration-panel select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript"><!--

var methodChosenId = '<?php echo $_SESSION['MethodChosenId']?>';

if(methodChosenId == 'method_chosen_delivery'){
	showSelectedMethodSection('showDeliverySection','0');
	$('#showDeliverySection').addClass('shop_btn');
}else{
	showSelectedMethodSection('showPickupSection','0');
	$('#showPickupSection div').addClass('shop_btn');
}	

function showSelectedMethodSection(id,reload_page){

	if(id == 'showPickupSection'){
		// $('#showDeliverySection div').removeClass('highlight');
		$('#showDeliverySection').removeClass('shop_btn');
		$('#delivery_address_section').hide();
		// $('#showPickupSection div').addClass('highlight');
		$('#showPickupSection div').addClass('shop_btn');
		$('#pickup_section').show();
		
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=checkout/checkout/updateMethodChosenId',
			type: 'post',
			data: { method: id },
			beforeSend: function() {
				// $('#button-register').button('loading');
			},
			complete: function() {
				// $('#button-register').button('reset');
			},
			success: function() {
				$('#pickup_section').show();
				if(reload_page == '1') location.reload();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
	}else if(id == 'showDeliverySection'){
		$('#showPickupSection').removeClass('highlight');
		$('#showPickupSection').removeClass('shop_btn');
		$('#pickup_section').hide();
		$('#showDeliverySection').addClass('highlight');
		$('#showDeliverySection').addClass('shop_btn');
				
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=checkout/checkout/updateMethodChosenId',
			type: 'post',
			data: { method: id },
			beforeSend: function() {
				// $('#button-register').button('loading');
			},
			complete: function() {
				// $('#button-register').button('reset');
			},
			success: function() {
				$('#delivery_address_section').show();
				if(reload_page == '1') location.reload();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
		
	}	
	
}


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

//--></script>
<script type="text/javascript"><!--

function addTip(tipAmt){
	// alert('tip');
	var tipPercent = parseInt(tipAmt)/100;
	
	var subTotalAmt = $('#sub_total').attr('data-amount');
	var subTotal = 	subTotalAmt.replace('$', '' );
	// alert('tipdddd');
	// console.log('tipPercent '+tipPercent);
	 // console.log('subTotalAmt '+subTotalAmt);
	 // console.log('subTotal '+subTotal);
	
	
	var totalTipAmt = subTotal * tipPercent;
	if(parseFloat(totalTipAmt) != 0){
		totalTipAmt = totalTipAmt.toFixed(2);
		$('#tip').val(totalTipAmt);
		addTipToSession(totalTipAmt);
		
	}else{
		$('#tip').val('0.00');
	}	
	
}	
$(document).delegate('#tip', 'change', function() {
	
	var tipVal = parseFloat(this.value);
	tipVal = tipVal.toFixed(2);
	if(tipVal >= 0){
		$('#tip').val(tipVal);
		addTipToSession(tipVal);
	}else{
		$('#tip').val('0.00');	
	}	
});	

function addTipToSession(totalTipAmt){
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=checkout/checkout/addTipToSession',
		type: 'post',
		data: { tip: totalTipAmt },
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
		
		},
		success: function(json) {
			if (json['success']) {
				console.log('success');
				loadOrderSummary();
			} else {
				console.log('Fail: Tip was not added to session!');
			}

			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
}

function loadOrderSummary(){
	$.ajax({
			url: '<?php echo BASE; ?>index.php?route=checkout/checkout/loadOrderSummary',
			dataType: 'html',
			beforeSend: function() {
				//$('#button-account').button('loading');
			},
			complete: function() {
				//$('#button-account').button('reset');
			},
			success: function(html) {
				$('#custom-checkout-form_part_2').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});	
}	

	
//--></script>
<script type="text/javascript"><!--
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
	var fullAddress = '';
	if ( $( "#full_delivery_address" ).length ) {
		fullAddress = $('#full_delivery_address').val();
	}	
	
	
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
		console.log(street_number);
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
								   console.log(response);
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


function NumAndTwoDecimals(e , field) {
    var val = field.value;
    var re = /^([0-9]+[\]?[0-9]?[0-9]?|[0-9]+)$/g;
    var re1 = /^([0-9]+[\]?[0-9]?[0-9]?|[0-9]+)/g;
    if (re.test(val)) {
        //do something here

    } else {
        val = re1.exec(val);
        if (val) {
            field.value = val[0];
        } else {
            field.value = "";
        }
    }
}

function success_function(response){
	if(response == 1){
		// $('#confirm_view_menu').trigger('click');
		bootbox.alert("Success! Your address is within our delivery range.", function() {
			//location.reload();
		});
		console.log('Hurrah');
	}else{
		bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
			location.reload();
		});
		console.log('Alas');	
		//location.reload();
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
	
	if ( $( "#full_delivery_address" ).length ) {
		var fullAddress = $('#full_delivery_address').val();
		autocomplete = new google.maps.places.Autocomplete(
		  /** @type {!HTMLInputElement} */
		  (document.getElementById('full_delivery_address')),
		  {types: ['geocode']});
	  
		console.log(autocomplete);
	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}  
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


//-->
</script>

<?php } //end if redirect ?>