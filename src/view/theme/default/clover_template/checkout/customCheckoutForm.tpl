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
						<input name="firstname" class="form-control" type="text" id="checkout_contact_firstname" value="<?php echo $firstname; ?>" placeholder="Enter Full Name" >
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
					  <input name="telephone" class="form-control" type="text" id="checkout_contact_telephone" value="<?php echo $telephone; ?>" placeholder="Cell Phone">
					  <input name="fax" class="form-control" type="hidden" id="fax" value="<?php echo $fax; ?>">
					  <input name="customer_id" class="form-control" type="hidden" id="customer_id" value="<?php if($customer_id){
						  echo $customer_id;
						  }else{
						  echo "0"; 
					  }  ?>">
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
				</div>
				</div>
			</div>
		</div>
		<div id="checkout_payment_part2" class="col-lg-12 col-xs-12 checkout-container checkout_part clearfix">
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
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 content right-0 order-report view_cart" id="custom-checkout-form_part_2" style="width: 100% !important; height: 100% !important;">
				 <div class="form-box">
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list" id="cart_products_list_data">
						<li>
							<strong class="pull-left">QTY</strong>
							<strong class="pull-right">PRICE</strong>
						</li>
						<?php $tempArrOption = array();
						// echo"<pre>"; print_r($products);
						$products = $clover_cart['products'];
						$totals = $clover_cart['totals'];
						$temp=0;
						foreach($products as $key => $product){
						$temp++;
				?>
						<li>
							<p style="margin-bottom: 5px;">
								<a onclick="" data-toggle="tooltip" title="" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></i></a>

								<input type="text" id="input_cart_<?php echo $product['product_id']; ?>_<?php echo $temp; ?>" onchange="updateCartInPanel( 'desktop', '<?php echo $product['product_id']; ?>', '<?php echo $key ?>','<?php echo $temp; ?>' )" name="quantity[<?php echo $product['product_id']; ?>]"  class="qty" value="<?php echo $product['product_unit']; ?>" />
						
								<span class="desktop-cart-page" style="max-width:80%;">
									<a class="product-link" style="font-size:135%;" href="<?php echo BASE.'index.php?route=cloverAPI/clover/get_single_product&product_id='.$product['product_id'].'&product_key='.$key.'&flag=1'; ?>"><?php echo $product['name']; ?></a>
								</span>
						<b class="prce">	
						<?php if($product['price'] != "0"){ ?> 
								<?php echo "$".number_format($product['price'], 2, '.', ''); ?>
						<?php }else{ ?>
							<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
						<?php } ?>
						</b>
							</p>

			<?php if(!empty($product['option_qty'])){
					foreach($product['option_qty'] as $alloptions =>$options){
						?>
						<div style="margin-bottom:5px;">
						<div class="cart-cs-name" style =""><?php echo $options['name']; ?></div>
						<?php
							unset($options['name']);
							foreach($options as $option){
							if($option['name'] == $tempOptionName) {
					?>	
							<div style="float:left;overflow:hidden;color:#7F8184;margin-left:7px;" >
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>							
							</div>
							<div class="subitems" style="font-family: Conv_Oswald-Light; !important;"><?php echo $option['value']; ?></div>
							<div style="float:right;overflow:hidden;font-size: 20px; color: #7F8184;">
								<?php
									if(!empty($option['price'])){
										echo '$'.number_format($option['price'], 2, '.', '');		
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
							<div class="cs-t-3"><?php echo $option['qty']." X ".$option['name']; ?></div>
<!-- 												<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
								<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</div> -->
							<div class="cs-t-2" style="">
<?php
									if( !empty( $option[ 'price' ] ) && $option[ 'price' ] != '0.00' ) {
										echo '$ '.number_format($option['price'],2);	
									} else {
?>
										<span style="text-decoration: line-through; color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
<?php
									}
?>
							</div>
							<div style="clear:both;"></div>
<?php
						}
?>
						<p class=""><span><?php //echo $option['value']; ?></span></p>
<?php
						// $tempOptionName = $option['name'];
						} //end foreach
?>
				</div>	
<?php
					}
?>

<?php
				}
?>


						</li>
						<?php }?>
					</ul>
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list">
						<?php foreach($totals as $total){
						if(isset($total) && isset($total['title']) && isset($total['text'])){ ?>
							<li id="<?php echo $total['id']; ?>" data-amount="<?php echo $total['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $total['title']; ?></strong><b class="prce grn">$<?php echo number_format($total['text'], 2, '.', ''); ?></b></p></li>
						<?php } 
						}					
						?>
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
	
	<!------------------------old code-------------------------------------------------------->
	<?php /*
		<div id="checkout-form-contact" class="col-sm-6 col-sm-offset-3 checkout-container clearfix" style="display:none;">
			<div class="checkout-container-header full-width">
				<h4>Contact</h4>
			</div>
			<div id="checkout_contact" class="checkout-container-content">
			  <div class="row form-group required">
				<label class="col-sm-2 control-label" for="firstname">Name</label>
				<div class="col-sm-5 mobile-mb10">
				  <input name="firstname" class="form-control" type="text" id="checkout_contact_firstname" value="<?php echo $firstname; ?>" placeholder="First Name" >
				</div>
				<div class="col-sm-5">
				  <input name="lastname" class="form-control last-name" type="text" id="checkout_contact_lastname" value="<?php echo $lastname; ?>" placeholder="Last Name">
				</div>
			  </div>
			  <div class="row form-group required">
				<label class="col-sm-2 control-label" for="email">Email</label>
				<div class="col-sm-10 mob">
				  <input name="email" class="form-control" type="email" id="checkout_contact_email" value="<?php echo $email; ?>" placeholder="E-Mail Address">
				</div>
			  </div>
			  <div class="row form-group required">
				<label class="col-sm-2 control-label" for="phone">Phone</label>
				<div class="col-sm-10 mob">
				  <input name="telephone" class="form-control" type="text" id="checkout_contact_telephone" value="<?php echo $telephone; ?>" placeholder="Telephone">
				  <input name="fax" class="form-control" type="hidden" id="fax" value="<?php echo $fax; ?>">
				  <input name="customer_id" class="form-control" type="hidden" id="customer_id" value="<?php echo $customer_id; ?>">
				</div>
			  </div>
			</div>
		</div>
		
		<div id="add-note" class="col-sm-6 col-sm-offset-3 checkout-container clearfix" style="display:none;">
			<div class="checkout-container-header full-width">
				<h4>ADD NOTE</h4>
			</div>
			<i class="fa fa-caret-down ar-d" aria-hidden="true"></i>
			<div class="checkout-container-content" style="min-height:100px; padding: 20px 10px !important;">
			  <p><textarea name="add_note" style="width: 100%; height: 80px; padding:8px;"><?php ?></textarea></p>
			</div>
		</div>
		
		<div id="checkout-form-method" class="col-sm-6 col-sm-offset-3 checkout-container clearfix" style="display:none;">
			<div class="checkout-container-header full-width">
				<h4>Order Details</h4>
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
			<div id="checkout_method" class="checkout-container-content pd">
			  <div class="row form-group pd">
				<div class="col-sm-6 text-center mobile-mb10">
				  <a id="showPickupSection" onclick="showSelectedMethodSection(this.id,'1')" href="javascript:void(0);"><div class="full-width pick-up"><img class="pick-icon" src="upload/catalog/view/theme/default/image/pick-icon.png" /> Pickup</div></a>
				</div>
				<div id="showDeliverySection" onclick="showSelectedMethodSection(this.id,'1')" class="col-sm-6 text-center mobile-mb10">
				  <a href="javascript:void(0);"><div class="full-width dly"><img class="pick-icon" src="upload/catalog/view/theme/default/image/dly-icon.png" /> Delivery</div></a>
				</div>
			  </div>
			  
			  <div id="pickup_section" class="row form-group">
				<div class="col-sm-12 text-left">
				  <h4>Pickup Location</h4>
				  <p>
					<?php echo $pickup_address['title']; ?><br/>
					<?php echo $pickup_address['display_address']; ?>
				  </p>
				</div>
			  </div>
			  
			  <div id="delivery_address_section" class="row form-group">
				<div class="col-sm-6 col-md-6 col-lg-8 dya">
								
					<input class="form-control input-lg" type="text" id="full_delivery_address" placeholder="Enter your address..." value="<?php echo $full_delivery_address; ?>" name="full_delivery_address" autocomplete="false">
					
					<!-- The table below is used by Google Maps API to post the address as individual value
						for street number, city, state, zip code and country -->
					<table id="address" style="display:none">
					  <tr>
						<td class="label">Street address</td>
						<td class="slimField">
							<input class="field" value="<?php echo $street_number; ?>" id="street_number"	disabled="true"></input>
						</td>
					  </tr>
					  <tr>
						<td class="label">Route/Address 2</td>	
						<td class="wideField" colspan="2">
							<input class="field" value="<?php echo $route; ?>" id="route" disabled="true"></input>
						</td>
					  </tr>
					  <tr>
						<td class="label">City</td>
						<td class="wideField" colspan="3"><input value="<?php echo $locality; ?>" class="field" id="locality" disabled="true"></input></td>
					  </tr>
					  <tr>
						<td class="label">State</td>
						<td class="slimField"><input class="field" id="administrative_area_level_1" value="<?php echo $administrative_area_level_1; ?>" disabled="true"></input></td>
					<tr>		  
					</tr>		  
						<td class="label">Zip code</td>
						<td class="wideField"><input value="<?php echo $postal_code; ?>" class="field" id="postal_code"
							  disabled="true"></input></td>
					  </tr>
					  <tr>
						<td class="label">Country</td>
						<td class="wideField" colspan="3"><input value="<?php echo $country; ?>" class="field"  id="country" disabled="true"></input></td>
					  </tr>
					</table>
				</div>
				
				<div class="col-sm-4 margin-top-mobile">
					<a href="javascript:void(0);" onclick="confirm_delivery_address();" id="delivery_address_confirm" class="button button-green button-block hover-white shop_btn">Verify</a>
				</div>	
			  </div>
			  
			</div>
			
			<?php }elseif($showPickup && !$showDelivery){ ?>
			
			<div id="checkout_method" class="checkout-container-content pd">
			  <div class="row form-group pd">
				<div class="col-sm-12 text-center mobile-mb10">
				  <div class="full-width highlight pick-up shop_btn" style="padding:3%;border:1px solid #ddd;">
				   <img class="pick-icon" src="upload/catalog/view/theme/default/image/pick-icon.png" /> Pickup</div>
				</div>
			  </div>
			  
			  <div id="pickup_section" class="row form-group">
				<div class="col-sm-12 text-left">
				  <h4>Pickup Location</h4>
				  <p>
					<?php echo $pickup_address['title']; ?><br/>
					<?php echo $pickup_address['display_address']; ?>
				  </p>
				</div>
			  </div>
			</div>
				
			<?php }elseif(!$showPickup && $showDelivery){ ?>
				
			<div id="checkout_method" class="checkout-container-content pd">
			  <div class="row form-group pd">
				<div class="col-sm-12 text-center">
					<div class="full-width highlight dly shop_btn" style="padding:3%; border:1px solid #ddd;"><img class="pick-icon" src="upload/catalog/view/theme/default/image/dly-icon.png" /> Delivery</div>
				</div>
			  </div>
			  
			  <div id="delivery_address_section" class="row form-group">
				<div class="col-sm-6 col-md-6 col-lg-12">
								
					<input class="form-control input-lg" type="text" id="full_delivery_address" placeholder="Enter your address..." value="<?php echo $full_delivery_address; ?>" name="full_delivery_address" autocomplete="false">
					
					<!-- The table below is used by Google Maps API to post the address as individual value
						for street number, city, state, zip code and country -->
					<table id="address" style="display:none">
					  <tr>
						<td class="label">Street address</td>
						<td class="slimField">
							<input class="field" value="<?php echo $street_number; ?>" id="street_number" name="street_number"	disabled="true"></input>
						</td>
					  </tr>
					  <tr>
						<td class="label">Route/Address 2</td>	
						<td class="wideField" colspan="2">
							<input class="field" value="<?php echo $route; ?>" id="route" name="route" disabled="true"></input>
						</td>
					  </tr>
					  <tr>
						<td class="label">City</td>
						<td class="wideField" colspan="3"><input value="<?php echo $locality; ?>" class="field" id="locality" name="locality" disabled="true"></input></td>
					  </tr>
					  <tr>
						<td class="label">State</td>
						<td class="slimField"><input class="field" id="administrative_area_level_1" name="administrative_area_level_1" value="<?php echo $administrative_area_level_1; ?>" disabled="true"></input></td>
					<tr>		  
					</tr>		  
						<td class="label">Zip code</td>
						<td class="wideField"><input value="<?php echo $postal_code; ?>" class="field" id="postal_code" name="postal_code" disabled="true"></input></td>
					  </tr>
					  <tr>
						<td class="label">Country</td>
						<td class="wideField" colspan="3"><input value="<?php echo $country; ?>" class="field" name="country"  id="country" disabled="true"></input></td>
					  </tr>
					</table>
				</div>
				
				<div class="col-sm-4 margin-top-mobile">
					<a href="javascript:void(0);" onclick="confirm_delivery_address();" id="delivery_address_confirm" class="button button-green button-block hover-white shop_btn">Verify</a>
				</div>	
			  </div>
			  
			</div>
			
			<?php } ?>
			
			
			
		</div>
		
		<div id="checkout-form-voucher" class="col-sm-6 col-sm-offset-3 checkout-container clearfix always-hide" style="display:none;">
			<div class="checkout-container-header full-width">
				<h4>Promo Code</h4>
			</div>
			<div id="checkout_voucher" class="checkout-container-content">
			  <div class="row form-group">
				<div class="col-sm-8">
				  <input name="voucher" class="form-control" type="text" id="voucher">
				</div>
				<div class="col-sm-4">
					<a href="javascript:void(0)" class="button button-blue button-block" style="padding:6px;">Apply</a>
				</div>	
			  </div>
			</div>
		</div>
		
		
		<?php if($tipInstalled && $tip_enable == 1){ ?>
			<div id="checkout-form-voucher" class="col-sm-6 col-sm-offset-3 checkout-container clearfix tip" style="display:none;">
				<div class="checkout-container-header full-width">
					<h4 class="tip-left">Tip <img class="dolar-icon" /></h4>
				</div>
				<div id="checkout_voucher" class="checkout-container-content">
				  <div class="row form-group">
					<div class="col-sm-4 col-xs-12 mobile-mb10">
						<!-- <a href="javascript:void(0)" onclick="addTip('10')" ><div class="btn button-green shop_btn tip-boxes">10%</div></a> -->
						<a class="tips1" href="javascript:void(0)" onclick="addTip('15')"><div class="btn button-green shop_btn tip-boxes">15%</div></a>
						<a class="tips2" href="javascript:void(0)" onclick="addTip('18')"><div class="btn button-green shop_btn tip-boxes">18%</div></a>
						<a class="tips3" href="javascript:void(0)" onclick="addTip('20')"><div class="btn button-green shop_btn tip-boxes">20%</div></a>
					</div>
					<div class="col-sm-8 col-xs-12 left-inner-addon">
					  <i class="fa fa-usd"></i><input name="tip" class="form-control" type="text" id="tip" value="<?php echo $tip; ?>" placeholder="Other.." >
					 <!-- <input class="form-control input-lg" type="hidden" id="" placeholder="Enter your address..." value="<?php //echo $full_delivery_address; ?>" name="full_delivery_address">-->
					</div>
				  </div>
				</div>
			</div>
		<?php }// end if tipInstalled ?>
	</div>
	

	<div id="custom-checkout-form_part_2" style="display:none;">
		<div id="checkout-form-method" class="col-sm-6 col-sm-offset-3 checkout-container clearfix">
			<div class="checkout-container-header full-width">
				<h4 class="tip-left">Order Summary <!--<img class="dolar-icon" src="upload/catalog/view/theme/default/image/order-icon.png" />--></h4>
			</div>
			<div id="checkout_method" class="checkout-container-content">
			  <div class="row form-group">
				<div class="col-sm-12">
				  <div class="table-responsive white-bg">
					  <table class="table table-bordered table-hover">
						<thead>
						  <tr>
							<td width="50%" class="text-left"><?php echo $column_name; ?></td>
							<td width="5%" class="text-left always-hide"><?php echo $column_model; ?></td>
							<td width="15%" class="text-right"><?php echo $column_quantity; ?></td>
							<td width="15%" class="text-right"><?php echo $column_price; ?></td>
							<td width="15%" class="text-right"><?php echo $column_total; ?></td>
						  </tr>
						</thead>
						<tbody>
						  <?php foreach ($products as $product) { ?>
						  <tr>
							<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							  <?php foreach ($product['option'] as $option) { ?>
							  <br />
							  &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
							  <?php } ?>
							  <?php if($product['recurring']) { ?>
							  <br />
							  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
							  <?php } ?></td>
							<td class="text-left always-hide"><?php echo $product['model']; ?></td>
							<td class="text-right"><?php echo $product['quantity']; ?></td>
							<td class="text-right"><?php echo $product['price']; ?></td>
							<td class="text-right"><?php echo $product['total']; ?></td>
						  </tr>
						  <?php } ?>
						  <?php foreach ($vouchers as $voucher) { ?>
						  <tr>
							<td class="text-left"><?php echo $voucher['description']; ?></td>
							<td class="text-left"></td>
							<td class="text-right">1</td>
							<td class="text-right"><?php echo $voucher['amount']; ?></td>
							<td class="text-right"><?php echo $voucher['amount']; ?></td>
						  </tr>
						  <?php } ?>
						</tbody>
						<tfoot>
						  <?php foreach ($totals as $total) { ?>
						  <tr>
							<td colspan="3" class="text-right t-fut" ><strong><?php echo $total['title']; ?>:</strong></td>
							<td id="<?php echo $total['id']; ?>" data-amount="<?php echo $total['text']; ?>" class="text-right"><?php echo $total['text']; ?></td>
						  </tr>
						  <?php } ?>
						</tfoot>
					  </table>
					</div>
					<?php echo $payment; ?>
				</div>
			  </div>
			</div>
		</div>
	</div>
	
	*/?>
	
	
</div>

<!-- id="map" used for google maps api to verify address in fence or not Do not remove -->
<div id="map" style="display:none;"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8A1it5vpYf-L9LKgFK3lnrykdRnbR6QE&signed_in=false&libraries=places&callback=initAutocomplete"
        async defer></script>
<script type="text/javascript"><!--
// Sort the custom fields


$(document).ready(function() {
    $('#new_crd_seltd a').trigger('click');
});


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