					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list" id="cart_products_list_data">						 <li>							<strong class="pull-left">QTY</strong>							<strong class="pull-right">PRICE</strong>						</li> 						<?php $tempArrOption = array();						$pcount = 1;						foreach($products as $product){?>						<li style="border-bottom:1px solid black">						<?php							if( $product[ 'is_free_item' ] ) {?>							<p><span style="color:red;padding: 3px 3px 3px 10px;font-weight: 800;" class="desktop_cart_product_link">Reward*</span> </p><?php							}?>																				<p style="margin-bottom: 5px;">								<a onclick="" data-toggle="tooltip" title="" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></i></a> 																										<span class="desktop-cart-page" style="max-width:80%;margin-left: -14px;">									<a class="product-link" style="font-size:135%;" href="<?php echo $product['href'].'&edit_product=1&key='.$product['key']; ?>"><?php echo $product['name']; ?></a>								</span>								<b class="prce"><?php echo $product['price']; ?></b>							</p>   					<!-- PRODUCT QTY PLIUS MINUS BUTTON--><div class="productOptionsChecklist checkoutproductqtybutton custCheckoutPlusMinusDiv" style="margin-left: -328px;">						<span class="QuantityInputBox  " style="width: 6%; ">						<button class= "plus_png_button" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiChkOutCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="plus_qty_modifier">			<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />		</button>				</span>				 <span class="QuantityInputBox" style="width: .1% !important;">	<?php if( $product['disable_qty_update'] == 1 ) { ?>			<input style="margin-right: 8px;border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right;" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity1_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>" disabled />						<?php } else { ?>			<input style="margin-right: 8px; border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right;" type="text" onchange="updateCartInPanel('desktop')"  name="quantity[<?php echo $product['key']; ?>]" class="qty desk_quantity1_<?php echo $pcount; ?> add_to_order_box" value="<?php echo $product['quantity']; ?>"  />		<?php } ?>		 </span>			 	 <span class="QuantityInputBox  QuantityInputBoxMinus" style="width: .4%; ">		<button class="minus_png_button " style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px; padding-left: 5px;" onclick="modiChkOutCartQtyIncDec(this.id,'<?php echo $product['key']; ?>','<?php echo $pcount; ?>'); return false;" id="minus_qty_modifier">		<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />		</button>				</span>	 	</div>							<?php if(!empty($product['option'])){ 									foreach($product['option'] as $key=>$option){									if(!$option['simple_option']){ ?>										<div class="checkout_option_title" style="margin-bottom:5px;">										<div class="cart-cs-name" style ="margin-top:15px;"><?php echo $key; ?></div>										<div style="clear:both;"></div>																		<?php ksort($option); foreach($option as $type=>$topping_option){ ?>									<div class="cart-cs-name">										<div style="height:27px;margin-left: 0px;border-bottom: 1px solid;width: 50px;">												<?php if( $type == '2' ){?>													 RIGHT 													  <input  value="left_side" style="visibility:hidden; height:0px;" name="topping"/>												<?php } ?>																								<?php if( $type == '1' ){?>													   LEFT 													  <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>												<?php } ?>																									<?php if( $type == '0' ){?>													   ALL 													   <input  value="left_side" style="visibility:hidden;height:0px;" name="topping"/>												<?php } ?>										</div>																</div><div style="clear:both;"></div>																													<?php foreach($topping_option as $option){ ?>																	<div class="1111" style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" >											<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;</span>-->										</div>										<div class="cs-t-3 loadSummary-cs-t-3">										<?php 												if( $option['topping_option'] == 2 ){?>														<label style="margin-right: 2px;">2x</label>													<?php }  											echo $option['value']; 																				?>										</div>																	<div class="cs-t-2" style="">											<?php												if(!empty($option['price']) && $option['price'] != '$0.00'){													//echo $option['price'];																												echo $option['actualOptionPrice'];												}else{ ?>												<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>											<?php }?>											</div><div style="clear:both;"></div>																			<?php } ?>								<?php } ?>										<div style="clear:both;"></div>															<?php }else{									if($option['name'] == $tempOptionName) {							?>								<div style="margin-bottom:5px;">									<div class="2222" style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" >									<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;</span>-->								</div>																		<?php if(!empty($option['option_Qty'])){ ?>							<div class="subitems custloadSummarySubitemsDiv" style="margin-top:3px; width: 10% !important; text-align: right;margin-left: 0px ; font-family: Conv_Oswald-Light; font-size: 19px; margin-right: -7px;    font-weight: bold;">						<?php } else{?>							<div class="subitems custloadSummarySubitemsDiv" style="text-align: right;margin-left: 0px ; font-family: Conv_Oswald-Light; font-size: 20px;width: 0%;">						<?php }?>								<?php									if(!empty($option['option_Qty'])){										echo $option['option_Qty'].'x';										}else{									?>											<span>&nbsp;&nbsp;&nbsp;</span>								<?php									} //end if								?>							 														</div>									<div class="cs-t-3 custloadSummary-cs-t-3"><?php echo $option['value']; ?></div>																									<div class="cs-t-2" style="">													<?php																											if(!empty($option['price']) && $option['price'] != '$0.00'){															echo $option['actualOptionPrice'];															}else{													?>														<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>													<?php }?>													</div>												<div style="clear:both;"></div>											</div>										<?php }else{ ?>											<div class="checkout_option_title" style="margin-bottom:5px;">												<div class="cart-cs-name" style ="margin-top:15px;"><?php echo $option['name']; ?></div>												<div style="clear:both;"></div>												<div class="3333" style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:20px;" >													<!--<span style="text-decoration: line-through;">&nbsp;&nbsp;</span>-->												</div>						<?php if(!empty($option['option_Qty'])){ ?>													<div class="subitems custloadSummarySubitemsDiv" style="margin-top:3px; width: 10% !important; text-align: right;margin-left: 0px ;  font-family: Conv_Oswald-Light; font-size: 19px;margin-right: -7px;    font-weight: bold;">						<?php } else{?>							<div class="subitems custloadSummarySubitemsDiv" style=" text-align: right;margin-left: 0px ;  font-family: Conv_Oswald-Light; font-size: 20px; width: 0%;">												<?php } ?>								<?php									if(!empty($option['option_Qty'])){										echo $option['option_Qty'].'x';										}else{									?>											<span>&nbsp;&nbsp;&nbsp;</span>								<?php									} //end if								?>							 														</div>																				<div class="cs-t-3 custloadSummary-cs-t-3"><?php echo $option['value']; ?></div>						<div class="cs-t-2" style="">						<?php							if(!empty($option['price']) && $option['price'] != '$0.00'){																				echo $option['actualOptionPrice'];							}else{ ?>							<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>						<?php }?>						</div>												<div style="clear:both;"></div>											</div>										<?php $tempOptionName = $option['name']; 											} ?>																													<?php 										}									}  									?>							<?php							 									}							?>							</li>						<?php  $pcount++;}?>					</ul>					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list">						<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])) { ?>							<li id="<?php echo $totals[0]['id']; ?>" data-amount="<?php echo $totals[0]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce grn"><?php echo $totals[1]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce"><?php echo $totals[2]['text']; ?></b></p></li>						<?php } ?>												<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])) { ?>						<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce grn"><?php echo $totals[3]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])){ ?>							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[5]) && isset($totals[5]['title']) && isset($totals[5]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[5]['title']; ?></strong><b class="prce grn"><?php echo $totals[5]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[6]) && isset($totals[6]['title']) && isset($totals[6]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[6]['title']; ?></strong><b class="prce grn"><?php echo $totals[6]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[7]) && isset($totals[7]['title']) && isset($totals[7]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[7]['title']; ?></strong><b class="prce grn"><?php echo $totals[7]['text']; ?></b></p></li>						<?php } ?>						<?php if(isset($totals[8]) && isset($totals[8]['title']) && isset($totals[8]['text'])) { ?>							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[8]['title']; ?></strong><b class="prce grn"><?php echo $totals[8]['text']; ?></b></p></li>						<?php } ?>					</ul>									</div>							</div>						</div>					