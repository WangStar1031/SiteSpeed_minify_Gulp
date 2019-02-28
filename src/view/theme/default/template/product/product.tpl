<style>

.qtyBtnDiv{
	   padding-left : 30px !important;
	   border-top	: 0px solid #f4f4f4 !important;
   }
@media screen and (max-width: 521px) {
 
   .QtyInputBox{
	   width: 10.8% !important;
   } 
   .qtyBtnDiv{
	   padding-left : 30px !important;
	   border-top	: 0px solid #f4f4f4 !important;
   }
   
}
 
 
</style>


<?php echo $header; ?>

<section class="ordering_options" id="product">
	<h2 class="top_head mR255">ITEM DETAILS</h2>
    
    <div class="outerContainer">
		<div class="contentSection">
			<div class="clearfix"> 
				<div class="col-md-12 col-sm-12 col-xs-12 pd20">
					<div class="itemDetailBox" >
					   <div class="itemDetail_Content">
							 <div class="itemContentPrice itemContentPricecus">
							<?php if( !empty($thumb) && file_exists(DIR_IMAGE.'product_img/'.$thumb)){?>
								<div class="cust_product_img1 " style=" ">
									<img src="<?php echo $base.'upload/image/product_img/'.$thumb; ?>" alt="" title=" " width="120" class="item_img" />
								</div>	
							<?php } ?>								   
								   <div class="itemContentSection"  style="padding-right: 23px; text-align: justify;">
								   
								   
								   
								   
								   
										<h2 style="display:inline-block;">
											<?php echo $heading_title; ?>
											<span style="display:inline; padding:5px; vertical-align:middle;">
												<?php
													foreach($related_tags as $tags){
												?>		
													<img src="<?php echo $tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
												<?php
													}
												?>
											</span>
										</h2>
										<p><?php echo $description; ?></p></br>
										<!--Display message regaurding product min quantity and global-->
										<p style="color:#8B0000"><?php echo '<b>'.$message.'</b>'; ?></p>
										<!-- <span>Required options below</span> -->
									</div>    

									
								   <div class="itemPriceSection">
								   
										<?php if ($price) { ?>
										
											<?php
												$formatPrice =	explode('.',$price); //to separate dollar and cents to be used in the new UI
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
											
											
											<?php if (!$special) { ?>
											<div class="circleP">
												<?php if($dollars == 0 && $cents == 0){ ?>
												<div class='priceselect' style="line-height: 32px; font-size: 30px; display: block; text-align: center; padding-right: 0px;"><?php $dollars; echo '<font>'.'Select'.'</font>';?> item</div>
												<?php } else{ ?>
											
												<span><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup> </span>
												<?php } ?>
											</div>
											
											<?php } else { ?>
												<?php
												
												
													
													$formatSplPrice =	explode('.',$special); //to separate dollar and cents to be used in the new UI
					
													$splCents = '00';
													if(isset($formatSplPrice[1])){
														$splCents = $formatSplPrice[1];
													}
													if(isset($formatSplPrice[0])){
														$splDollarArr =	str_split($formatSplPrice[0]); // to separate dollar sign and amount to be used in the new UI
														$currencySplSymbol = '$';
														$splDollars = implode('',$splDollarArr);
														if(isset($splDollarArr[0])){
															$currencySymbol = array_shift($splDollarArr);
															$splDollars = implode('',$splDollarArr);
														}
													}
												?>
											
											
												<div class="priceCircle">
													<span style="text-decoration: line-through;"> <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span><br />
													
													<sup><?php echo $currencySplSymbol; ?></sup><?php echo $splDollars; ?><sup><?php echo $splCents; ?></sup>
												</div>	
											<?php } ?>
											
											<?php /* if ($tax) { ?>
											<?php echo $text_tax; ?> <?php echo $tax; ?>
											<?php } */ ?>            

										<?php } //end if price ?>
										
								   </div>
							 </div>   
					   </div>
					   <?php if($disable_qty_update == '1'){?>
							<div class="itemDetail_Quantity" style= "text-align:center;" > 
					   <?php }else{?>
							<div class="itemDetail_Quantity">
					   <?php } ?>
							<h4>Quantity</h4> 

					<?php	if( $is_free ) {
							$disable_qty_update = 1; 
					?>
							<input type="hidden" name="is_free" value="1" />
					<?php
						}

						 if($disable_qty_update == '1'){?>
								
								<div class="QuantityInputBox QuantityInputBoxDisable" style="margin-left: 35%;"> 
							
							<?php }else{?>
								
								<div class="QuantityInputBox" > 
						
							<?php } ?>
							
								<span>
							
							<?php if($disable_qty_update == '1'){?>
									<input type="text" name="quantity" class="test-input" value="<?php echo $minimum; ?>" maxlength="2" id="input-quantity" onkeypress="return isNumberKey(event)" disabled/>
								
							<?php }else{?>
								<input type="text" name="quantity" class="test-input" value="<?php echo $minimum; ?>" maxlength="2" id="input-quantity" onkeypress="return isNumberKey(event)" />
							
							<?php } ?>
									
									<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								</span>
								<span>
								
								<?php if($disable_qty_update == '1'){?>
								
								<?php }else{?>
								
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="plus_qty"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" /></button>
									
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="minus_qty"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" /></button>
								
								<?php } ?>
								</span>
							</div>
					   </div>
					</div>
						
					<div class="subTitle"><h5>OPTIONS & SIDES</h5></div>  

					<div class="optionsInputForm">
						<?php $optionsExist = false; if($options){ $optionsExist = true; ?>
						
						<?php //echo '<pre>'; print_r($options); echo '</pre>'; ?>
						
						<div class="col-md-7 col-sm-7 col-xs-12 leftSide">
							
							<!-- <div class="extraAddons"><h5><img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/optionPlus.png"/>EXTRAS & ADD-ONS</h5></div> -->
							
							
							<?php 
							$productValArr = array();
							$productoptionValArr = array();
							$productKeyArr = array();
							$productIdArr = array();
							$optionDoubleRegular 	= array();
							$optionLeftRightAll 	= array();							
							$productquanty = '';
							$product_id = $_GET['product_id'];
							$key_product = $_GET['key'];
							$edit_product = $_GET['edit_product'];
							$error  = true;
							if($edit_product == '1'){
								$error = false;
							}
							
							// echo '<pre>';
							// print_r($products_Data);
							// echo '</pre>';
							if($error == false){
								foreach($products_Data as $key => $valOption){
									if($valOption['key'] == $key_product){
										if($valOption['product_id'] == $product_id){
											$productquanty = $valOption['quantity'];
										}
										$productKeyArr[$valOption['key']] = true;
										$productIdArr[$valOption['product_id']] = true;
										if(isset($valOption['option'])){
											foreach($valOption['option'] as $keyData => $valOptionData){
												$productValArr[$valOptionData['product_option_value_id']] = true;
												$productoptionValArr[$valOptionData['product_option_value_id']] =  $valOptionData['option_Qty'];
												$optionDoubleRegular[$valOptionData['product_option_value_id']] = $valOptionData['topping_option'];
												$optionLeftRightAll[$valOptionData['product_option_value_id']] = $valOptionData['topping'];
												

											}
										}
										
										$special_instructions = isset( $valOption[ 'special_instructions' ] ) ? $valOption[ 'special_instructions' ] : "";
									}
								}
							
							
						
		foreach($products_Data as $key => $valOption){
			if($valOption['key'] == $key_product){
		if($valOption['product_id'] == $product_id){
			$product_key = $valOption['key'];
			
			?>
			
			<input type="hidden" name="key" id="product_key" value="<?php echo $product_key; ?>" >
			<?php }}}
			}			
			?>	
			<?php foreach ($options as $option) { ?>
			
			
					<?php if ($option['type'] == 'select') { ?>

					  <h4><label class="" id="error_clr<?php echo $option['product_option_id']; ?>" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
					  <div class="item-details-dropdown right-inner-addon" style="margin-bottom: 35px;">
						  <i class="fa fa-chevron-down" id="fa-input-option<?php echo $option['product_option_id']; ?>"></i>
						  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($option['product_option_value'] as $option_value) { ?>
							<option value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']])) echo 'selected'; ?> ><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</option>
							<?php } ?>
						  </select>
					  </div>

					<?php } ?>
			
					<?php if ($option['type'] == 'checkbox') {  $count =0; ?>

					  <h4><label id="error_clr<?php echo $option['product_option_id']; ?>" class="new-design-add-ons-label"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label><span class="shop_font_color" style="font-weight: 700; margin-left:10px;"><?php if(isset($option['max_allowed']) && $option['max_allowed'] != 0) { echo 'MAX '.$option['max_allowed'].''; } ?></span></h4>
					  <div id="input-option<?php echo $option['product_option_id']; ?>" class="productOptionsChecklistParent prodOptSec clearfix">
						
						<?php foreach ($option['product_option_value'] as $option_value) { ?>
						
							<div class="productOptionsChecklist productOptionsChecklistCus">
								<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']])) echo 'checked class="chckThis"'; ?> onclick="limitCheckboxSelection(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" 
								/>
								<label class="priceRateLabel"  id="label_id_<?php echo $option_value['product_option_value_id']; ?>" for="input-field-<?php echo $option_value['product_option_value_id']; ?>"><span style="margin-right:15px;" ></span>
								<div class="option-name"><?php echo $option_value['name']; ?></div>

							<?php if($option['is_pizza'] == 0){   ?>
 							
								 <div class="ProOptValue" id="showHideDiv<?php echo $option_value['product_option_value_id']; ?>" style="display:none; <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']]))  {?>display:block; <?php }?>">
 
									<div class="btn-group" data-toggle="buttons">
									
  									 <label class="btn btn-default custButton1 <?php if( isset($optionDoubleRegular[$option_value['product_option_value_id']]) && $optionDoubleRegular[$option_value['product_option_value_id']] == 1 ){ ?> active <?php }  ?>" onclick="leftRightTopping(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>')" id="lable-regular-<?php echo $option_value['product_option_value_id']; ?>" >
										<input type="radio" class="regular_pizza" id="regular_<?php echo $option_value['product_option_value_id']; ?>" name="topping_option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="1" <?php if( isset($optionDoubleRegular[$option_value['product_option_value_id']]) && $optionDoubleRegular[$option_value['product_option_value_id']] == 1 ){ ?> checked="checked" <?php }  ?> /> Regular
										
										<?php if ($option_value['price']) { ?>
											<?php //echo $option_value['price']; ?>
										<?php } ?>
										
										<input type="hidden" name="regular_price[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="<?php echo $option_value['price']; ?>">	
									 </label>  
									 

									<label style="margin-left: 7px;  width: 125px; text-align: center;"  class="btn btn-default custButton1 <?php if( isset($optionDoubleRegular[$option_value['product_option_value_id']]) && $optionDoubleRegular[$option_value['product_option_value_id']] == 2 ){ ?> active <?php }  ?>" style="margin-left: 7px;" onclick="leftRightTopping(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>')" id="lable-double-<?php echo $option_value['product_option_value_id']; ?>" >
									 
									 
										<input type="radio" class="extra_pizza" id="extra_<?php echo $option_value['product_option_value_id']; ?>" name="topping_option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="2"  <?php if( isset($optionDoubleRegular[$option_value['product_option_value_id']]) && $optionDoubleRegular[$option_value['product_option_value_id']] == 2 ){ ?> checked="checked" <?php }  ?> />Extra
											<?php if ($option_value['extra_price']) { ?>
												<?php echo $option_value['extra_price']; ?>
											<?php } ?>
											<input type="hidden" name="extra_price[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="<?php echo $option_value['extra_price']; ?>">
											
									 </label> 
									 
											  
								
									</div>
								</br> 
									<div class="btn-group" data-toggle="buttons">
   
 
									 <label style="width: 65px; text-align: center" class="btn btn-default custButton <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 1 ){ ?> active <?php }  ?> " onclick="leftRightTopping(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>')" id="lable-left-<?php echo $option_value['product_option_value_id']; ?>" >
									 
										<input type="radio"  class="left_pizza" id="left_<?php echo $option_value['product_option_value_id']; ?>" name="topping[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="1"   <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 1 ){ ?> checked="checked" <?php }  ?> />Left
										
										<input id="input-topping-left-<?php echo $option_value['product_option_value_id']; ?>" type="hidden" name="half_price[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="<?php echo $option_value['half_price']; ?>">
											
									 </label> 
									 
									 
									 <label class="btn btn-default custButton <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 0 ){ ?> active <?php }  ?>" style="margin-left: 7px;width: 64px; text-align: center;" onclick="leftRightTopping(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>')" id="lable-all-<?php echo $option_value['product_option_value_id']; ?>" >
										<input type="radio"  class="all_pizza"  id="all_<?php echo $option_value['product_option_value_id']; ?>" name="topping[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="0"  <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 0 ){ ?> checked="checked" <?php }  ?> /> All 
										
										<input type="hidden" name="topping_all[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="">	
									 </label> 
									 
									 
									 <label class="btn btn-default custButton <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 2 ){ ?> active <?php }  ?>" style="margin-left: 7px;width: 65px; text-align: center;" onclick="leftRightTopping(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>')" id="lable-right-<?php echo $option_value['product_option_value_id']; ?>" >
										<input type="radio"  class="right_pizza" id="right_<?php echo $option_value['product_option_value_id']; ?>" name="topping[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="2" <?php if( isset($optionLeftRightAll[$option_value['product_option_value_id']]) && $optionLeftRightAll[$option_value['product_option_value_id']] == 2 ){ ?> checked="checked" <?php }  ?>/> Right 
										
										<input id="input-topping-right-<?php echo $option_value['product_option_value_id']; ?>" type="hidden" name="half_price[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" value="<?php echo $option_value['half_price']; ?>">										
										
									 </label>
									  
								
									</div>									
									 
							   </div>	 
						<?php }  ?>	
								</label>												
						<input type="hidden" id="option_price_<?php echo $option_value['product_option_value_id']; ?>" value="<?php echo $option_value['price']; ?>" />
						<span class="priceRate" id="option_price_label_<?php echo $option_value['product_option_value_id']; ?>">
								<?php if ($option_value['price']) { ?>
								<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
								<?php } ?>
								</span>
							</div>







											
		<?php if(isset($option['option_qty_status']) && $option['option_qty_status'] == '0'){?>
				
			<div class="productOptionsChecklist qtyBtnDiv" id="showHideDivPlusMinusButton<?php echo $option_value['product_option_value_id']; ?>" <?php if( isset($productoptionValArr[$option_value['product_option_value_id']]) ){ ?> style="display:block;padding-left: 29px;border-top:0px solid #f4f4f4;" <?php }else{ ?> style="display:none;" <?php } ?> >
			
			
						<span class="QuantityInputBox plus_png" style="width: 6%; display: inline-block;">
							<button class= "plus_png_button plus_qty_modifier_<?php echo $option_value['product_option_value_id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px;    padding-left: 5px;" onclick="modiqtyIncDec(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" id="plus_qty_modifier">
								<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" /> 
							</button>
						</span>	
						<!--<div class="QuantityInputBox" style="float: right !important;">  -->
						
						 <span class="QtyInputBox" style="width: 5.8%;display: inline-block;">
							<input class="qty_input_<?php echo $option['product_option_id']; ?>" style="border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 17px !important; width: 35px;text-align: center;height: 32px; float:right;" type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id'];?>]" class="test-input" value="<?php if( isset($productoptionValArr[$option_value['product_option_value_id']]) ){ echo $productoptionValArr[$option_value['product_option_value_id']]; } else { echo $count; } ?>" maxlength="2" id="input-quantity-<?php echo $option_value['product_option_value_id']; ?>" onchange="modiqtyIncDec(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" onkeypress="return isNumberKey(event)" />
						 </span>
						 
						 <span class="QuantityInputBox minus_png" style="width: 6%; display: inline-block;">
							<button class="minus_png_button minus_qty_modifier_<?php echo $option_value['product_option_value_id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px;    padding-left: 5px;" onclick="modiqtyIncDec(this.id,'<?php echo $option_value['product_option_value_id']; ?>','<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" id="minus_qty_modifier">
								<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
							</button>
						</span>
					</div>
				<?php }else{?>
				<div id="showHideDivPlusMinusButton<?php echo $option_value['product_option_value_id']; ?>" style="display:none;"></div>
				<?php } ?>
			<?php } ?>

	  </div>

									<?php } //end if checkbox ?>
									
									
									<?php if ($option['type'] == 'radio') { ?>

									  <h4><label id="error_clr<?php echo $option['product_option_id']; ?>" class="new-design-add-ons-label"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
									  <!--If product is pizza this code will work -->
						<?php if($option['is_pizza'] == 0){   ?>
						
								<?php foreach ($option['product_option_value'] as $option_value) { ?>	  
 
										<span style="margin-left: 40px;">
											<?php if ($option_value['extra_price']) { ?>
											<?php echo $option_value['price_prefix']; ?><?php echo $option_value['extra_price']; ?>
											<?php } ?>
										</span>
									  
								<?php   } ?>
								
								</br> 
									<div class="btn-group" data-toggle="buttons">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>	  
 
									 <label class="btn btn-default">
										<input type="radio" id="input-field-<?php echo $option_value['product_option_value_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']]))echo 'checked class="active"'; ?> /> <?php echo $option_value['name']; ?>
									 </label>
									  
								<?php   } ?>
									</div>
 	 					
									<div class="btn-group">
										<label style="margin-left: 30px;" class="circle_left">
											<input  value="left_side" type="radio" name="topping[<?php echo $option['product_option_id']; ?>]" autocomplete="off" />
										</label>
											 
										 <label style="margin-left: 30px;" class="circle_right">
											<input   value="right_side" type="radio" name="topping[<?php echo $option['product_option_id']; ?>]" autocomplete="off" />
										 </label>
										 
										 <label style="margin-left: 30px;" class="circle_full">
											<input   value="full" type="radio" name="topping[<?php echo $option['product_option_id']; ?>]" autocomplete="off" />
										 </label> 		
									</div>										 
						<?php } else{ ?>		
										<ul class="Itemchecklist">
										<?php foreach ($option['product_option_value'] as $option_value) { 
 
										?>
										
											<li>
												<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']])) echo 'checked class="chckThis"';  ?> />
												<label id="label_id_<?php echo $option_value['product_option_value_id']; ?>" for="input-field-<?php echo $option_value['product_option_value_id']; ?>"><span><span></span></span><?php echo $option_value['name']; ?>
												</label>
												<input type="hidden" id="option_price_<?php echo $option_value['product_option_value_id']; ?>" value="<?php echo $option_value['price']; ?>" />
												<span id="option_price_label_<?php echo $option_value['product_option_value_id']; ?>">
												<?php if ($option_value['price']) { ?>
												<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
												<?php } ?>
												</span>
											</li>
										<?php } ?>
								<?php } //end pizza condition?>
										</ul>
									  </div>

									<?php } //end if radio ?>
							
							<?php } // end foreach $options ?>
							

						</div>
						
						<?php } //end if options ?>
						
						
						<div class="col-md-5 col-sm-5 col-xs-12 <?php if($optionsExist){ ?> RightSide<?php }else{ ?> leftSide <?php } ?> sp-instruction" <?php if($optionsExist){ ?> style="float:right" <?php } ?> >
							<div class="extraAddons"><h5><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/notepad.png"/>SPECIAL INSTRUCTIONS</h5></div>
							<div class="instructionTextarea"><textarea name="special_instructions" placeholder="e.g. No peanuts, no salt..."><?php echo isset( $special_instructions ) ? $special_instructions : '' ?></textarea></div>
						</div>
					</div>
					<?php if ($price) { ?>
										
							<?php
								$formatPrice =	explode('.',$price); //to separate dollar and cents to be used in the new UI
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
								
							if (!$special) { ?>

							<button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block addorder_bt shop_btn" type="button"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/buttonPlus.png" />
							
							<?php if($dollars == 0 && $cents == 0 && empty($productIdArr[$product_id])){ ?>
							
								ADD TO ORDER</span></button>
							
							<?php }elseif($dollars == 0 && $cents == 0 && isset($productIdArr[$product_id])){ ?>
							
								Update Item</span></button>	
							
							<?php }elseif(isset($productIdArr[$product_id]) && !empty($productIdArr[$product_id])){ ?>
							
								Update Item</span></button>
							
							<?php }else{ ?>
							
							ADD TO ORDER</span></button>	
							
							<?php } ?>
							
							<?php } else { ?>
							
								<?php
									$formatSplPrice =	explode('.',$special); //to separate dollar and cents to be used in the new UI
									$splCents = '00';
									if(isset($formatSplPrice[1])){
										$splCents = $formatSplPrice[1];
									}
									if(isset($formatSplPrice[0])){
										$splDollarArr =	str_split($formatSplPrice[0]); // to separate dollar sign and amount to be used in the new UI
										$currencySplSymbol = '$';
										$splDollars = implode('',$splDollarArr);
										if(isset($splDollarArr[0])){
											$currencySymbol = array_shift($splDollarArr);
											$splDollars = implode('',$splDollarArr);
										}	
									}
								?>
								  <button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block addorder_bt shop_btn" type="button"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/buttonPlus.png" />
								  <?php if($dollars == 0 && $cents == 0){ ?>
								  
									ADD TO ORDER  <sup><?php $currencySymbol; ?></sup><?php  $dollars; ?><sup><?php  $cents; ?></sup></span></button>
								  <?php }else{ ?>
									ADD TO ORDER  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	
								<?php } ?>
							<?php } ?>
					<?php } ?>
					
				</div>
			</div>
		</div>        
	</div>
</section>





<?php /* //old code
<div class="container">
	<div id="product_cart_info_div"></div>
	<div id="custom-alert-success" class="wrapper margin-auto">
		<!-- Created to fill Succes message when the product is added. See JS on the bottom of the page for details -->
	</div>
	
  <div class="row">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		
	  <?php echo $content_top; ?>
      <div class="food_sec"  id="product">
		<div class="wrapper margin-auto">
		  <div class="burger_food">
			<h1 class="new-design-product-heading"><?php echo $heading_title; ?></h1>
			<div  class="fooodie_sec">
			  <div class="bug_icon">
			   <?php if ($thumb || $images) { ?>
			  
				<?php if ($thumb) { ?>
				<a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
				<?php } ?>
				<?php if ($images) { ?>
				<ul>
				<?php foreach ($images as $image) { ?>
				<li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
				<?php } ?> </ul>
				<?php } ?>
			 
			  <?php } ?>
			  
			  </div>
			  <div class="cont_food">
				<!--<p><?php echo $text_model; ?> <?php echo $model; ?></p>
				<p><?php echo $text_stock; ?> <?php echo $stock; ?></p>-->
					   
				<h4>Price :<strong>
				<?php if ($price) { ?>
					<?php if (!$special) { ?>
					  <?php echo $price; ?>
					<?php } else { ?>
						<span style="text-decoration: line-through;"><?php echo $price; ?></span><br />
					<?php echo $special; ?>
					<?php } ?>
					
					<?php if ($tax) { ?>
					<?php echo $text_tax; ?> <?php echo $tax; ?>
					<?php } ?>            

				<?php } ?></strong></h4>
				
				
				<div class="rate custom-rate">
					<div class="wrapper margin-auto">      
					  <!-- <div class="rating purchase new-design-text">-->
					  <div class="new-design-text">
						<!-- <h5 class="new-design-heading custom-new-design-heading">Description</h5> -->
						  <p><?php echo $description; ?></p>
					  </div>
					</div>
				</div>
				
			 
				<?php if ($options) { ?>
				<hr>
				<h3 class="new-design-heading"><?php echo $text_option; ?></h3>
				<?php foreach ($options as $option) { ?>
				<?php if ($option['type'] == 'select') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label new-design-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control new-design-select-box">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
					<?php if ($option_value['price']) { ?>
					(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
					<?php } ?>
					</option>
					<?php } ?>
				  </select>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'radio') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label style="border:none; margin:0; padding:0;" class="control-label new-design-heading"><?php echo $option['name']; ?></label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="radio">
					  <samp class="new-design-samp">
						<label for="input-field-<?php echo $option_value['product_option_value_id']; ?>">
							<p><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</p>
						</label>	
						<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					  </samp>
					</div>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'checkbox') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label new-design-add-ons-label"><span style="border:none;" class="new-design-heading"><?php echo $option['name']; ?></span></label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="checkbox">
						<samp class="new-design-samp">
							<label for="input-field-<?php echo $option_value['product_option_value_id']; ?>"><p><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?></p></label>
							<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" 
							<?php if(isset($option['max_allowed']) && $option['max_allowed'] != 0){ ?> onclick="limitCheckboxSelection(this.id,'<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" <?php } ?>
							/>
						</samp>
					</div>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'image') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label"><?php echo $option['name']; ?></label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<div class="radio">
					  <label>
						<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
						<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
						<?php if ($option_value['price']) { ?>
						(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						<?php } ?>
					  </label>
					</div>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'text') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'textarea') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'file') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label"><?php echo $option['name']; ?></label>
				  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'date') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group date">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="MM-DD-YYYY" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'datetime') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group datetime">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="MM-DD-YYYY HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'time') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <div class="input-group time">
					<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
					<span class="input-group-btn">
					<button type="button" class="btn btn-default add_to_order_box"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				<?php if ($minimum > 1) { ?>
				<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
				<?php } ?>
			  
			  </div>
			</div>
		  </div>
		</div>
		<div class="rate">
			<div class="wrapper margin-auto">      
			  <div class="rating purchase new-design-text">
					<div class="sp_ist_textarea">	
						<h5 class="new-design-heading custom-new-design-heading">Special Instructions</h5>
						<textarea name="special_instructions" class="form-control sp_ist_textarea"></textarea>
					</div>	
					<samp>
						<label class="control-label new-design-text" for="input-quantity"><?php echo $entry_qty; ?>:</label>&nbsp;&nbsp;<input class="new-design-input" type="text" name="quantity" value="<?php echo $minimum; ?>" size="6" id="input-quantity" />
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
					</samp>
					  <span><button type="button" id="button-cart"  class="btn btn_larg new-design-add-order-button add_to_order_box" data-loading-text="<?php echo $text_loading; ?>" >Add to Order</button></span>
			  </div>
			</div>
		</div>
	 </div>
  
  
  
		<?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
*/ ?>
<script type="text/javascript"><!--

$(document).ready(function(){
	var qty = '<?php echo $productquanty; ?>';
	if(qty != ''){
		$('#input-quantity').val(qty);
	}
	

	$('.custButton').each(function () {
		if($(this).hasClass('active')){
			$(this).trigger('click')
		}
	});
  
	console.log($(''));
	
});

$('.test-input').unbind('keyup change input paste').bind('keyup change input paste',function(e){
	
    var $this = $(this);
    var val = $this.val();
    var valLength = val.length; 
    var maxCount = $this.attr('maxlength'); 
    if(valLength>maxCount){
        $this.val($this.val().substring(0,maxCount));
    }
}); 


function qty_Inc_Dec(id,product_option_value_id, product_option_id){
 
	var qty = $('#input-field-'+product_option_value_id).val();
	var checkboxVal = '#'+'input-field-'+qty;
	if($(checkboxVal).prop('checked') == true){ 
		$('.plus_qty_modifier_'+product_option_value_id).trigger('click'); 
		
			var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+product_option_value_id);	

			var numberOfCheckboxesSelected 	= $('input[name=\'option['+product_option_id+'][]\']:checked').length;

			
			if(plus_minus_button_show_hide != null){   
			
				plus_minus_button_show_hide.style.display  = "block" ;
			 }		
		
	}else{ 
		$('#input-quantity-'+product_option_value_id).val(0);
	} 
}


function leftRightTopping( id, p_id, product_option_id){
	
	if(id == 'lable-left-'+p_id){
		 

 
 	}
		
	if(id == 'lable-right-'+p_id){

	} 
		
	if(id == 'lable-double-'+p_id){
		if($('#left_'+p_id).parent().hasClass('active')){
			$("#lable-left_-"+p_id).trigger("click");
			var price = $('#input-topping-left-'+p_id).val();
			
			price = parseFloat(price.match(/-?(?:\d+(?:\.\d*)?|\.\d+)/)[0]);

			price = price*2;
			$('#option_price_label_'+p_id).html('+$'+price.toFixed(2));	
		}	
		if($('#right_'+p_id).parent().hasClass('active')){
			$("#lable-right_-"+p_id).trigger("click");
			var price = $('#input-topping-right-'+p_id).val();
			
			price = parseFloat(price.match(/-?(?:\d+(?:\.\d*)?|\.\d+)/)[0]);

			price = price*2;
			$('#option_price_label_'+p_id).html('+$'+price.toFixed(2));	
		}	
		if($('#all_'+p_id).parent().hasClass('active')){
			$("#lable-all-"+p_id).trigger("click");	
			var price = $('#extra_'+p_id).next().val();
			$('#option_price_label_'+p_id).html('+'+price);	
		}
		
		
	} 
		
	if(id == 'lable-regular-'+p_id){

		if($('#left_'+p_id).parent().hasClass('active')){
			$("#lable-right_-"+p_id).trigger("click");
			var price = $('#left_'+p_id).next().val();	
			$('#option_price_label_'+p_id).html('+'+price);	
		}	
		if($('#right_'+p_id).parent().hasClass('active')){
			$("#lable-right_-"+p_id).trigger("click");
			var price = $('#right_'+p_id).next().val();	
			$('#option_price_label_'+p_id).html('+'+price);	
		}	
		if($('#all_'+p_id).parent().hasClass('active')){
			$("#lable-all-"+p_id).trigger("click");
			var price = $('#regular_'+p_id).next().val();	
			$('#option_price_label_'+p_id).html('+'+price);	
		}

	} 
	
console.log(p_id);
console.log(product_option_id);
set_pricing(p_id,id,product_option_id);

/* 	if(id == 'all_'+p_id){
		$('#regular_'+p_id).parent().addClass('active');
		$('#extra_'+p_id).parent().removeClass('active');
	}  */
 
}


function set_pricing(p_id,id,product_option_id){

	if(id.includes("all")){
		if($('#lable-double-'+p_id).hasClass( "active" )){
			var price = $('#extra_'+p_id).next().val();
			$('#option_price_label_'+p_id).html('+'+price);
			
		}else if($('#lable-regular-'+p_id).hasClass( "active" )){
			var price = $('#regular_'+p_id).next().val();	
			$('#option_price_label_'+p_id).html('+'+price);
		}
	}

	if(id.includes("left")){
		var price = $('#input-topping-left-'+p_id).val();

		$('#option_price_label_'+p_id).html('+'+price);
		
			
		if($('#lable-double-'+p_id).hasClass( "active" )){
			var price = $('#input-topping-left-'+p_id).val();
			
			price = parseFloat(price.match(/-?(?:\d+(?:\.\d*)?|\.\d+)/)[0]);

			price = price*2;
			$('#option_price_label_'+p_id).html('+$'+price.toFixed(2));
		}
	}

	if(id.includes("right")){
		var price = $('#input-topping-right-'+p_id).val();

		$('#option_price_label_'+p_id).html('+'+price);

			
		if($('#lable-double-'+p_id).hasClass( "active" )){
			var price = $('#input-topping-left-'+p_id).val();
			
			price = parseFloat(price.match(/-?(?:\d+(?:\.\d*)?|\.\d+)/)[0]);

			price = price*2;
			$('#option_price_label_'+p_id).html('+$'+price.toFixed(2));
		}
	}

}


function modiqtyIncDec(id, p_id, product_option_id, max_allowed){
 
	// var checkBox = document.getElementById("myCheck");
	   // if (checkBox.checked == true){
        // qty=parseInt(qty) + 1;
    // } else {
       // qty=parseInt(qty) - 1;
    // }
	
	
 var inputQtyVar = id;
 var inputQtyVal =  inputQtyVar.split("-");
//Then read the values from the array where 0 is the first
 var qtyVar = inputQtyVal[0] + "-" + inputQtyVal[1];
 var temp = 1;
 
 
 
 //alert(document.querySelectorAll('input[name=\'option['+product_option_id+'][]\']:checked').length);
//	alert(numOfCheckboxesSelected);
	var qty = parseInt($('#input-quantity-'+p_id).val());
			console.log('Qty_top: ' + qty);
			if( isNaN(qty) ){
				var qty = 0 ;
		console.log('temp_nan: ' + temp);
			}	
	var qty_input = document.getElementsByClassName("qty_input_"+product_option_id);
 	
 


 
	if(qtyVar == "input-quantity"){
		
		
/* 		if(qty == 0 ){
			alert('qty 0 aa rhi hai ');
			alert('#input-field-'+p_id);
			//$('#input-field-'+p_id).removeAttr("checked");
			$('#input-field-'+p_id).prop('checked', false); 
		} */
		
		var id 		= "plus_qty_modifier";
		var temp	= 0;
	}
 
		
		if(id == "plus_qty_modifier"){
		
			console.log('Qty_one: ' + temp);
			console.log(qty_input);
			console.log('qty length= '+qty_input.length);
			//var temp = 1;
			
			for( var i = 0; i< qty_input.length; i++){
				temp += parseInt(qty_input[i].value);
				console.log('temp_inside'+qty_input[i].value);
				//console.log(item.value);
			}
			
			

		console.log('max_allowed: ' + max_allowed);
		console.log('Qty: ' + qty);
			
			 
				// var qty_input = qty_input[0].value;
				// var count = 1;
				// var plus = +qty_input + +count;
				var plus = temp;
				
				
/* 			if( qtyVar == 'input-quantity' && qty == 0){
				 alert(qtyVar); 
 $('#input-field-'+p_id).removeAttr("checked");
			}	 */			
				//alert(plus);
			if( qty > max_allowed && max_allowed > 0 ){  
					var CurrentQty = parseInt($('#input-quantity-'+p_id).val());
					
					bootbox.alert({ 
					size: 'medium',
					message: "<div style=\"font-size:135%;font-weight:800;clear:both;margin-bottom:10px;\">Oops!</div><div style=\"font-size:130%;\">You've reached the max amount of options allowed. Unselect an item to choose another option.</div>", 
 
				}); 
				
				if(plus > 0){
					 
						var tempvar 		= plus;
						var currentQtyvar 	= CurrentQty;
						var minusvar 		= plus - CurrentQty;
						qty 				= max_allowed - minusvar ;  
						if( qty == 0 ){
							console.log('last-qty:'+ qty);
							$( '#input-field-'+p_id ).prop('checked', false); 
						}else{
							console.log('last-qty:'+ qty);
							$( '#input-field-'+p_id ).prop('checked', true);
						}
					}
				
			}else if (plus > max_allowed && max_allowed > 0 ) {
					var CurrentQty = parseInt($('#input-quantity-'+p_id).val());
					 
					bootbox.alert({ 
					size: 'medium',
					message: "<div style=\"font-size:135%;font-weight:800;clear:both;margin-bottom:10px;\">Oops!</div><div style=\"font-size:130%;\">You've reached the max amount of options allowed. Unselect an item to choose another option.</div>", 
					
				}); 
				$('#input-field-'+p_id).removeAttr("checked");
				console.log('testiong'+qty);
				if(qty == 0){
					var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+p_id);	

					if(plus_minus_button_show_hide != null){   
					 					
					
						plus_minus_button_show_hide.style.display  = "none" ;
									
					}  					
				}
					if(plus > 0){
 
						var tempvar 		= plus;
						var currentQtyvar 	= CurrentQty;
						
						if(qtyVar == "input-quantity"){
							
							var minusvar 	= plus - CurrentQty;
							
						}else{
							
							var minusvar 	= plus - CurrentQty - 1;
						}
							qty = max_allowed - minusvar ;
							
						 if(qty>0){
							 
							$( '#input-field-'+p_id ).prop('checked', true); 
							
						 }
					} 
				
			} else{  
			
					if(qtyVar == "input-quantity"){
						
						qty = parseInt(qty) + 0;
						
					}else{
						
						qty = parseInt(qty) + 1;
						
					}
					if(qtyVar == 'input-quantity' && qty == 0){
						$( '#input-field-'+p_id ).prop('checked', false); 
						
						
						var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+p_id);	

						var numberOfCheckboxesSelected 	= $('input[name=\'option['+product_option_id+'][]\']:checked').length;
						
						
						if(plus_minus_button_show_hide != null){   
						
							plus_minus_button_show_hide.style.display  = "none" ;
										
						}						
						
						 
						
					}else{
						$( '#input-field-'+p_id ).prop('checked', true); 
					}
					var numOfCheckboxesSelected = $('input[name=\'option['+product_option_id+'][]\']:checked').length;	
					 
					
			}
		}else{
				/* alert('yahaa ghatae '); */
				qty = parseInt(qty) - 1;
				if(qty < 0 || qty==0){
					/* in this block we are hiding Plus Minus Div if qty equal to 0 */					
					qty = 0;
					$('#input-field-'+p_id).removeAttr("checked");


					var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+p_id);	

					var numberOfCheckboxesSelected 	= $('input[name=\'option['+product_option_id+'][]\']:checked').length;

					
					if(plus_minus_button_show_hide != null){   
					
						plus_minus_button_show_hide.style.display  = "none" ;
									
					}

					
					//$('#input-field-'+p_id).prop('checked', false);
				}
		}
		
		var actual_price_a = $('#option_price_'+p_id).val();
		actual_price_a = actual_price_a.match(/\d+/);
		actual_price_a = parseInt(actual_price_a);
		if(qty > 0){
			var new_price_a = actual_price_a*qty;

			$('#option_price_label_'+p_id).html('+$'+new_price_a.toFixed(2));
		}else{
			$('#option_price_label_'+p_id).html('+$'+actual_price_a.toFixed(2));
		}		
		
		$('#input-quantity-'+p_id).val(qty);
	 
}

$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	
	var minQty = '<?php echo $minimum; ?>';
	var qtyVal = $('input[name=\'quantity\']').val();
	var product_key = $('#product_key').val();
	
	if(product_key){
		var urlData = '<?php echo BASE; ?>index.php?route=checkout/cart/remove';
	}else{
		var urlData = '<?php echo BASE; ?>index.php?route=checkout/cart/add';
	}
	
	if(qtyVal < minQty){
		bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! The minimum quantity for this order is "+minQty+".</span>", function() {
		  $('input[name=\'quantity\']').val(minQty);
		});
	}else{
		$.ajax({
			url: urlData,
			type: 'post',
			data: $('#product input[type=\'text\'], #product_key input[type=\'hidden\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#button-cart').button('loading');
			},
			complete: function() {
				$('#button-cart').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
					
				if(json['success_cart'] == 'success'){
					$('#product_key').attr('value','');
					$('#button-cart').trigger('click');
					
				}
				
				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							var elements = $('#error_clr' + i.replace('_', '-'));
				
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								alert('test');
								$('html, body').animate({
									scrollTop: element.offset().top
								}, 1000);
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								elements.addClass('control-label');
								$('html, body').animate({
									scrollTop: element.offset().top
								}, 1000);
							}
						}
					}

					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}

					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
					// $('#error_clr').addClass('control-label');
				}
				

				
				if (json['success']) {
					$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#custom-alert-success').html('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#cart > a').html('<i><img src="upload/catalog/view/theme/default/image/cart.png" /></i><span id="cart-total">' + json['total'] + '</span>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					// $('#cart_info_div').load('index.php?route=common/cart/info').show();
					
					$.ajax({
						url: '<?php echo BASE; ?>index.php?route=common/cart/showHeaderCartPanel',
						type: 'get',
						dataType: 'html',
						success: function(html) {
							$('#cart_info_div').html(html).show('slow');
							//$('#product_cart_info_div').html(html).show('slow');
							//redirect to categories
							location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
						}	
					});	
				}
			}
		});	
	}	
	
	
	
	
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
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
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
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
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('select[name^=\'option\']').trigger('change');
});

$(document).on('change', 'select[name^=\'option\']', function() {
	$(this).after('<i class="fa fa-spinner selection-wait"></i>');
	
	var value = $(this).val();
	var parent_id = $(this).attr('name').replace (/[^\d.]/g, '');

	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=product/product/dependentoption&parent_id=' +  parent_id + '&value=' + value + '&product_id=<?php echo $product_id; ?>',
		type: 'get',
		dataType: 'json',			
		success: function(json) {
			$('.selection-wait').remove();
			var product_key = $('#product_key').val();
		
			if (json['option']) {
				for (i = 0; i < json['option'].length; i++) {
					if (json['option'][i]['type'] == 'select') {
						$('#input-option' + json['option'][i]['product_option_id']).stop().fadeOut('medium');
						
						$('#fa-input-option' + json['option'][i]['product_option_id']).stop().fadeOut('medium'); //for font awesome icon
						
						$('#input-option' + json['option'][i]['product_option_id']).siblings('.control-label').stop().fadeOut('medium');
						
						var html = '';
						

						html += '<option value=""><?php echo $text_select; ?></option>';
							
						for (j = 0; j < json['option'][i]['option_value'].length; j++) {

							$('#input-option' + json['option'][i]['product_option_id']).fadeIn('medium');
							
							$('#fa-input-option' + json['option'][i]['product_option_id']).fadeIn('medium'); //for font awesome icon
							
							$('#input-option' + json['option'][i]['product_option_id']).siblings('.control-label').fadeIn('medium');
							
							html += '<option value="' + json['option'][i]['option_value'][j]['product_option_value_id'] + '">' + json['option'][i]['option_value'][j]['name'];
							
							
							
							if (json['option'][i]['option_value'][j]['price']) {
								html += ' (' + json['option'][i]['option_value'][j]['price_prefix'] + json['option'][i]['option_value'][j]['price'] + ')';
							}
							
							html += '</option>';
						}
						
						$('select[name=\'option[' + json['option'][i]['product_option_id'] + ']\']').html(html);
					} else if (json['option'][i]['type'] == 'radio' || json['option'][i]['type'] == 'checkbox' || json['option'][i]['type'] == 'image') {
						
						$('#input-option' + json['option'][i]['product_option_id']).stop().fadeOut('medium');
						
						$('#input-option' + json['option'][i]['product_option_id']).siblings('.control-label').stop().fadeOut('medium');
						
						$('#input-option' + json['option'][i]['product_option_id']).children().hide();
						
						$('#input-option' + json['option'][i]['product_option_id']).find('input').prop('checked', false);
					
						for (j = 0; j < json['option'][i]['option_value'].length; j++) {
							$('#input-option' + json['option'][i]['product_option_id']).fadeIn('medium');
							
							$('#input-option' + json['option'][i]['product_option_id']).siblings('.control-label').fadeIn('medium');
																		
							$('#input-option' + json['option'][i]['product_option_id']).find('input[value=\'' + json['option'][i]['option_value'][j]['product_option_value_id'] + '\']').parent().show();
							
							$('#input-quantity-' + json['option'][i]['option_value'][j]['product_option_value_id']).val(0);
						// $('#input-option' + json['option'][i]['product_option_id']).find('input[value=\'' + json['option'][i]['option_value'][j]['product_option_value_id'] + '\']');

							console.log( "===" );
							console.log( json['option'][i]['option_value'][j]['product_option_value_id'] );
							console.log( "===" );

							if( $('#input-field-' + json['option'][i]['option_value'][j]['product_option_value_id']).hasClass('chckThis') ) {
								$('#input-field-' + json['option'][i]['option_value'][j]['product_option_value_id']).prop('checked', true);
							}
							
							$('#input-option' + json['option'][i]['product_option_id']).find('input[value=\'' + json['option'][i]['option_value'][j]['product_option_value_id'] + '\']').parent().parent().show();
							
							//Custom aded to add botrder to the last product option
							$('#input-option' + json['option'][i]['product_option_id']).find('input[value=\'' + json['option'][i]['option_value'][j]['product_option_value_id'] + '\']').last().parent().removeClass( "borderBottom" );
							
							if(json['option'][i]['option_value'].length == parseInt(j)+1){
								$('#input-option' + json['option'][i]['product_option_id']).find('input[value=\'' + json['option'][i]['option_value'][j]['product_option_value_id'] + '\']').last().parent().addClass( "borderBottom" );	
							}
							
						}
						
						
						
						
					} else {
						// File, text, textarea, date, datetime
						if (json['option'][i]['option_value']) {
							$('#input-option' + json['option'][i]['product_option_id']).parents('.form-group').stop().fadeIn('medium');
						} else {
							$('#input-option' + json['option'][i]['product_option_id']).parents('.form-group').stop().fadeOut('medium');
						}
					}
				}
		}
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
//--></script>
			

<?php 
	$locationSet = false;
	if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){
		$locationSet = true;	
	}
	
	$step_back_url_text	= false;
	$step_back_url	= false;
	if(isset($breadcrumbs) && !empty($breadcrumbs)){
		// $step_back_url_text	= $breadcrumbs[1]['text'];
		// $step_back_url 	= $breadcrumbs[1]['href'].'&step_back='.$step_back_url_text;
		$step_back_url_text	= 'categories';
		$step_back_url 	= $breadcrumbs[0]['href'].'&step_back='.$step_back_url_text;
	}
?>
<script>
<!--
	var locationSet 		= '<?php echo $locationSet; ?>';
	var step_back_url_text	= '<?php echo ucfirst($step_back_url_text); ?>';
	var step_back_url		= '<?php echo $step_back_url; ?>';
		step_back_url		= step_back_url.replace(/&amp;/g, '&');

	if(locationSet && step_back_url){
		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> '+step_back_url_text).show();
	}
//-->	
</script>
<script>
<!--
function limitCheckboxSelection(id, product_option_value_id, product_option_id, max_allowed){
	
	var input_pizza_status 	= document.getElementById("showHideDiv"+product_option_value_id);	 
	
	var plus_minus_button_show_hide 	= document.getElementById("showHideDivPlusMinusButton"+product_option_value_id);	
	var numberOfCheckboxesSelected = $('input[name=\'option['+product_option_id+'][]\']:checked').length;

	if(input_pizza_status != null){
		// console.log(product_option_value_id);
		if($('#input-field-'+product_option_value_id).is(":checked") ){
			input_pizza_status.style.display  = "block" ;
			$("#lable-regular-"+product_option_value_id).trigger("click");	
			$("#lable-all-"+product_option_value_id).trigger("click");				
/* 			$('.regular_pizza').parent().addClass('active');
			$('.all_pizza').parent().addClass('active');
			$('.left_pizza').parent().removeClass('active');
			$('.right_pizza').parent().removeClass('active');
			$('.extra_pizza').parent().removeClass('active'); */
		}else{
			// console.log('#right_'+product_option_value_id);
			input_pizza_status.style.display  = "none" ;
			$('#left_'+product_option_value_id).parent().removeClass('active'); 
			$('#right_'+product_option_value_id).parent().removeClass('active'); 
			$('#all_'+product_option_value_id).parent().removeClass('active'); 
			$('#extra_'+product_option_value_id).parent().removeClass('active'); 
			$('#regular_'+product_option_value_id).parent().removeClass('active'); 
			$('#left_'+product_option_value_id).prop('checked', false);
			$('#right_'+product_option_value_id).prop('checked', false);
			$('#all_'+product_option_value_id).prop('checked', false);
			$('#extra_'+product_option_value_id).prop('checked', false);
			$('#regular_'+product_option_value_id).prop('checked', false);
			
		}
	 
	}
	
	if(plus_minus_button_show_hide != null){   
		if($('#input-field-'+product_option_value_id).is(":checked") ){
			 
			plus_minus_button_show_hide.style.display  = "block" ;
		}else{
				plus_minus_button_show_hide.style.display  = "none" ;
			
		}		
		
	}



	
	if(numberOfCheckboxesSelected > max_allowed && max_allowed != 0 ){
		bootbox.alert({ 
			size: 'medium',
			message: "<div style=\"font-size:135%;font-weight:800;clear:both;margin-bottom:10px;\">Oops!</div><div style=\"font-size:130%;\">You've reached the max amount of options allowed. Unselect an item to choose another option.</div>", 
			callback: function(){ 
				$('#'+id).attr('checked', false); // Unchecks the last checked checkbox
				if(plus_minus_button_show_hide != null){ 
					plus_minus_button_show_hide.style.display  = "none" ;
				}
			}
		});
	}else{
		 
		 qty_Inc_Dec(id, product_option_value_id, product_option_id);
	}	
}


function qtyIncDec(id, minimum){
	
	var qtyVal = $('input[name=\'quantity\']').val();
	
	var min = 1;
	if(minimum != ''){
		min = minimum;
	}

	if(id == 'plus_qty'){
		var newQtyVal = parseInt(qtyVal) + 1;
		$('input[name=\'quantity\']').val(newQtyVal);
	}else if(minus_qty){
		var newQtyVal = parseInt(qtyVal) - 1;
		if(newQtyVal >= min){
			$('input[name=\'quantity\']').val(newQtyVal);
		}else{
			$('input[name=\'quantity\']').val(min);
		}
	}	
	// alert(id);
	// alert(min);
}	
//-->	
</script>
<?php echo $footer; ?>