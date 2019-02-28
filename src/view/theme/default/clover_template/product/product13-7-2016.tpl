<?php echo $header; ?>

<section class="ordering_options" id="product">
	<h2 class="top_head mR255">ITEM DETAILS</h2>
    
    <div class="outerContainer">
		<div class="contentSection">
			<div class="row"> 
				<div class="col-md-12 col-sm-12 col-xs-12 pd20">
					<div class="itemDetailBox" >
					   <div class="itemDetail_Content">
							 <div class="itemContentPrice">
								   <div class="itemContentSection">
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
										<p><?php echo $description; ?></p>
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
											<div class="priceCircle">
												<?php if(empty($dollars)){?>
												<div style="line-height: 36px; font-size: 27px; display: block; text-align: center; padding-right: 5px;"><sup><?php $currencySymbol; ?></sup><?php $dollars; echo '<font>'.'Select'.'</font>';?> item<sup><?php $cents; ?></sup>	</div>
												<?php } else{ ?>
											
												<div><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup> </div>
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
					   <div class="itemDetail_Quantity"> 
							<h4>Quantity</h4> 
							<div class="QuantityInputBox"> 
								<span>
									<input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" />
									<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								</span>
								<span>
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="plus_qty"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/plus.png" alt="" /></button>
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="minus_qty"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/minus.png" alt="" /></button>
								</span>
							</div>
					   </div>
					</div>
						
					<div class="subTitle"><h5>OPTIONS & SIDES</h5></div>  

					<div class="optionsInputForm">
						<?php $optionsExist = false; if($options){ $optionsExist = true; ?>
						
						<?php //echo '<pre>'; print_r($options); echo '</pre>'; ?>
						
						<div class="col-md-6 col-sm-6 col-xs-12 leftSide">
							
							<!-- <div class="extraAddons"><h5><img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/optionPlus.png"/>EXTRAS & ADD-ONS</h5></div> -->
							
							<?php foreach ($options as $option) { ?>
							
							
									<?php if ($option['type'] == 'select') { ?>

									  <h4><label for="input-option<?php echo $option['product_option_id']; ?>"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
									  <div class="item-details-dropdown right-inner-addon" style="margin-bottom: 35px;">
										  <i class="fa fa-chevron-down" id="fa-input-option<?php echo $option['product_option_id']; ?>"></i>
										  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected']) echo 'selected'; ?> ><?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
											</option>
											<?php } ?>
										  </select>
									  </div>

									<?php } ?>
							
									<?php if ($option['type'] == 'checkbox') { ?>

									  <h4><label class="control-label new-design-add-ons-label"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label><span class="shop_font_color" style="font-weight: 700; margin-left:10px;"><?php if(isset($option['max_allowed']) && $option['max_allowed'] != 0) { echo 'MAX ('.$option['max_allowed'].')'; } ?></span></h4>
									  <div id="input-option<?php echo $option['product_option_id']; ?>" class="productOptionsChecklistParent">
										
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										
											<div class="productOptionsChecklist">
												<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected']) echo 'checked'; ?> 
												<?php if(isset($option['max_allowed']) && $option['max_allowed'] != 0){ ?> onclick="limitCheckboxSelection(this.id,'<?php echo $option['product_option_id']; ?>', '<?php echo $option['max_allowed']; ?>')" <?php } ?>
												/>
												<label for="input-field-<?php echo $option_value['product_option_value_id']; ?>"><span></span><?php echo $option_value['name']; ?>
												</label>
												<span>
												<?php if ($option_value['price']) { ?>
												<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
												<?php } ?>
												</span>
											</div>
										
										<?php } ?>

									  </div>

									<?php } //end if checkbox ?>
									
									
									<?php if ($option['type'] == 'radio') { ?>

									  <h4><label class="control-label new-design-add-ons-label"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
										<ul class="Itemchecklist">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										
											<li>
												<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected']) echo 'checked'; ?> />
												<label for="input-field-<?php echo $option_value['product_option_value_id']; ?>"><span><span></span></span><?php echo $option_value['name']; ?>
												</label>
												<span>
												<?php if ($option_value['price']) { ?>
												<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
												<?php } ?>
												</span>
											</li>
										
										<?php } ?>
										</ul>
									  </div>

									<?php } //end if radio ?>
							
							<?php } // end foreach $options ?>
							

						</div>
						
						<?php } //end if options ?>
						
						
						<div class="col-md-5 col-sm-5 col-xs-12 <?php if($optionsExist){ ?> RightSide<?php }else{ ?> leftSide <?php } ?> " <?php if($optionsExist){ ?> style="float:right" <?php } ?> >
							<div class="extraAddons"><h5><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/notepad.png"/>SPECIAL INSTRUCTIONS</h5></div>
							<div class="instructionTextarea"><textarea name="special_instructions" placeholder="e.g. No peanuts, no salt..."></textarea></div>
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
							?>
							
							
							<?php if (!$special) { ?>
							
							  <button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-success addorder_bt shop_btn" type="button"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/buttonPlus.png" />ADD TO ORDER  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	

							  
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
								<button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-success addorder_bt shop_btn" type="button">
								<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/buttonPlus.png" />ADD TO ORDER <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>
							<?php } ?>
							
							<?php /* if ($tax) { ?>
							<?php echo $text_tax; ?> <?php echo $tax; ?>
							<?php } */ ?>            

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
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
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
	
	if(qtyVal < minQty){
		bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! The minimum quantity for this order is "+minQty+".</span>", function() {
		  $('input[name=\'quantity\']').val(minQty);
		});
	}else{
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
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

				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));

							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								$('html, body').animate({
									scrollTop: element.offset().top
								}, 1000);
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
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
				}

				if (json['success']) {
					$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#custom-alert-success').html('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#cart > a').html('<i><img src="upload/catalog/view/theme/default/image/cart.png" /></i><span id="cart-total">' + json['total'] + '</span>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					// $('#cart_info_div').load('index.php?route=common/cart/info').show();
					
					$.ajax({
						url: 'index.php?route=common/cart/showHeaderCartPanel',
						type: 'get',
						dataType: 'html',
						success: function(html) {
							$('#cart_info_div').html(html).show('slow');
							//$('#product_cart_info_div').html(html).show('slow');
							//redirect to categories
							location = 'index.php?route=common/home&step_back=categories';
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
				url: 'index.php?route=tool/upload',
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
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
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
		url: 'index.php?route=product/product/dependentoption&parent_id=' +  parent_id + '&value=' + value + '&product_id=<?php echo $product_id; ?>',
		type: 'get',
		dataType: 'json',			
		success: function(json) {
			$('.selection-wait').remove();
			
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
function limitCheckboxSelection(id, product_option_id, max_allowed){
	var numberOfCheckboxesSelected = $('input[name=\'option['+product_option_id+'][]\']:checked').length;
	
	if(numberOfCheckboxesSelected > max_allowed){
		bootbox.alert({ 
			size: 'medium',
			message: "<div style=\"font-size:135%;font-weight:800;clear:both;margin-bottom:10px;\">Oops!</div><div style=\"font-size:130%;\">You've reached the max amount of options allowed. Unselect an item to choose another option.</div>", 
			callback: function(){ 
				$('#'+id).attr('checked', false); // Unchecks the last checked checkbox
			}
		});
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