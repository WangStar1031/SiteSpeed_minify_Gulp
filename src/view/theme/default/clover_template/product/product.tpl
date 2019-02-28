<?php echo $header;
// echo"<pre>"; 
// print_r($product);?>
<style>
@media
only screen and (-webkit-min-device-pixel-ratio : 1.5),
only screen and (min-device-pixel-ratio : 1.5) {
body {
font-size: 90%;
}
}
[/css]

Here are sample snippets of CSS that you can use to target specific mobile devices:

[css]
/* Smartphones (portrait and landscape) ———– */
@media only screen
and (min-device-width : 320px)
and (max-device-width : 441px) {
span.col-md-4 {
font-size: 50%;
}
}
@media(max-width :424px)
{
span.col-md-4 {
font-size: 125%;
}
}

</style>
<style>
/* .QuantityInputBox button {
    background: #525b62;
    padding: 12px 15px;
    font-family: "Conv_ProximaNova-Regular";
    border: 0px;
    outline: 0px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    margin-right: 5px;
} */


@media(max-width: 3000px){
	.QtyInputBox{
		width: 3.8% !important;
	}
	.minus_png{
		
		    width: 4.5% !important;

	}
	
}


@media (max-width: 1898px){
	.QtyInputBox {
		width: 2.8% !important;
	}
	
	.minus_png {
		width: 3.5% !important;	
	}
}

@media (max-width: 1898px){
	.minus_png {
		width: 3.8% !important;
	}

}

@media (max-width: 1375px){
	.minus_png {
		width: 4.2% !important;
	}

}

@media (max-width: 1263px){
	.minus_png {
		width: 5.1% !important;
	}

}

@media (max-width: 1231px){
	.minus_png {
		width: 4.1% !important;
	}

}


@media (max-width: 1036px){
	.minus_png {
		width: 4.6% !important;
	}

}

@media(max-width: 1024px){
	.itemDetail_Quantity {
		width: 0px !important;
	}
		.minus_png{
		width: 4.6% !important;
	}
}
 
@media(max-width :1024px){
	.priceCircle{
		       padding-top: 0px !important;
			font-size: 38px !important;
	}
	
 .QtyInputBox{
	     width: 3.8% !important;
 }	
}


@media(max-width :1024px){
	.priceCircle sup {
		font-size: 23px !important; 
		top: -.65em;
	}
	
	.currency_Symbol{
			padding-top: 27px !important;
	}
}


@media(max-width :971px){
	.QtyInputBox{
		    width: 3.8% !important;
	}
	
	.minus_png{
		width: 5% !important;
	}
}



@media(max-width :954px){
	.item_price{
		width:9% !important;
	}
	
}

@media(max-width :885px){
	.minus_png {
    width: 5.3% !important;
}
	
}


	
@media(max-width :861px){
	.minus_png{
		width:6% !important;
	}

	.QtyInputBox {
    width: 4.8% !important;
	}	
	
}

@media(max-width :783px){
	.minus_png{
		width:6% !important;
	}
	
	.plus_png{
		width: 7% !important;
	}

}


@media(max-width :773px){
	}		
 
	
.plus_png{
		width: 7% !important;
	}		
}

@media(max-width :768px){
	.minus_png{
		width:5% !important;
	}
	
	.priceCircle{
		font-size: 33.49px !important;
		padding-top: 31px !important;
	}
	
}



@media (max-width: 768px){
	.currency_Symbol {
		padding-top: 1px !important;
	}
	
	.priceCircle sup {
		font-size: 23px !important;
		top: -.5em;
	}

	
	.plus_png{
		width: 7% !important;
	}	
	
	
}



@media(max-width :767px){
	 .priceCircle {
    font-size: 28.49px !important;
	}
	
}






@media(max-width :766px){
	.item_price{
		width:10% !important;
	}
	
}





@media (max-width: 762px){
	.currency_Symbol {
		padding-top: 2px !important;
	}
	
.priceCircle sup {
    font-size: 19px !important;
    top: -.5em;
}

	
}
@media(max-width :761px){
 
	.priceCircle{
		font-size: 29.49px !important;
		padding-top: 10px !important;

	}
	
}


@media (max-width: 751px){
	.currency_Symbol {
		padding-top: 9px !important;
	}
	
	.priceCircle sup {
		font-size: 20px !important;
		top: -0.3em;
	}

	.currency_Symbol {
		padding-top: 6.5px !important;
	}
	
	.minus_png {
		width: 6.3% !important;
	}	
}

@media(max-width :754px){
	.priceCircle{
		    height: 69px !important;
			width: 71px !important;
	}
	
}



@media(max-width :721px){
	.minus_png{	 
		width: 6.7% !important;
	}
}

	
@media(max-width :698px){
	.plus_png{
		width:12% !important;
	}
	.minus_png{
	    width: 6% !important;
	}
	.item_price{
		width:10% !important;
		font-size: 13px !important;
	}	
	.product_title{
		font-size: 13px !important;
		line-height: 21px !important;
		 
	}	
	
	
.plus_png_button{
    padding-top: 4px !important;
    padding-right: 1px !important;
    padding-bottom: 5px !important;
    padding-left: 1px !important;
}
.minus_png_button{
    padding-top: 4px !important;
    padding-right: 1px !important;
    padding-bottom: 5px !important;
    padding-left: 1px !important;
}
.qty_input{
	border-radius: 5px !important;
    border: 0px solid red !important;
    padding: 4px !important;
    font-size: 14px !important;
    width: 28px !important;
    text-align: center;
    height: 25px !important;
    float: right !important;
	
}

}






@media(max-width :682px){
	.item_price{
		width:11% !important;
	}	
}
@media(max-width :627px){
	.item_price{
		width:12% !important;
	}	
}


@media (max-width: 619px){
	.minus_png {
		width: 6.6% !important;
	}
}

@media(max-width :585px){
	.item_price{
		width:13% !important;
	}	
}

@media(max-width :537px){
	.item_price{
		width:14% !important;
	}
	.minus_png{
		width:8% !important;
	}	
}

@media(max-width:522px){
	.currency_Symbol{
		
		padding-top:6.5px !important;
	}
	
}

@media(max-width :507px){
	.item_price{
		width:15% !important;
	}
 
}

@media(max-width :497px){
.minus_png{
		width:9% !important;
	}	
 
}
@media(max-width :485px){
	.item_price{
		width:14.5% !important;
		font-size: 13px !important;
	}
	.minus_png{
		width:10% !important;
	}	
	.product_title{
		font-size: 13px !important;
		 
	}	
}

@media(max-width :469px){
	.product_title{
		font-size: 13px !important;
		line-height: 21px !important;
		 
	}
	.item_price{
		font-size: 13px !important;
	}	
}

@media(max-width :400px){
.minus_png{
		width:12% !important;
	}	
 
} 

@media(max-width :383px){
.item_price{
		width:15% !important;
	}	
 
} 


@media (max-width: 376px){
	.priceCircle {
		font-size: 27.49px !important;
		padding-top: 10px !important;
	}
	
	.currency_Symbol {
    padding-top: 6.5px !important;
	}	
	
	.priceCircle sup {
		font-size: 19px !important;
		top: -0.3em;
	}	
	
}



@media (max-width: 375px){
	.minus_png {
    width: 11.4% !important;
}	
	
}


	
@media (max-width: 373px){
	.priceCircle sup {
		font-size: 20px !important;
		top: -0.3em;
	}
	
	.priceCircle {
		font-size: 26.49px !important;
		padding-top: 10px !important;
	}
	
	.currency_Symbol {
    padding-top: 8.5px !important;
	}
}


@media(max-width :363px){
.item_price{
		width:16% !important;
	}	
 
} 


@media(max-width :344px){
.minus_png{
		width:12% !important;
	}	
 
} 

@media(max-width :325px){
.item_price{
		width:17% !important;
	}	
 
} 


@media (max-width: 321px){
	.priceCircle sup {
		font-size: 18px !important;
		top: -0.3em;
	}
}





 @media(max-width :320px){
.product_title{
		    font-size: 10px !important;
			padding-right: 5px !important;
		}
		.item_price{
			 font-size: 10px !important;
		}
		
.itemPriceSection {
		width: 73px !important;		
		
	}	

.minus_png {
    width: 13.8% !important;
}	
 }

	
	
	
@media(max-width :300px){
	.minus_png {
			width: 14% !important;
		}	
 
	}


	
}   




.qtyBtnDiv{
	   padding-left : 30px !important;
	   border-top	: 0px solid #f4f4f4 !important;
   }
@media screen and (max-width: 521px) {
 
   .QtyInputBox{
	   width: 8.8% !important;
   } 
   
   .qtyInputField{
	   width: 28px !important;
	   height: 25px !important;
	   
   }
   
   .qtyBtnDiv{
	   padding-left : 30px !important;
	   border-top	: 0px solid #f4f4f4 !important;
   }
   
}
</style>
<section class="ordering_options cloverProducts" id="product">
	<h2 class="top_head mR255">ITEM DETAILS</h2>
    
    <div class="outerContainer">
		<div class="contentSection">
			<div class="clearfix"> 
				<div class="col-md-12 col-sm-12 col-xs-12 pd20">
					<div class="itemDetailBox" >
					   <div class="itemDetail_Content">
							 <div class="itemContentPrice">
								   <div class="itemContentSection">
										<h2 style="display:inline-block;">
											<?php echo $product['name']; ?>
											<span style="display:inline; padding:0px; vertical-align:middle;">
												<?php
													foreach($related_tags as $tags){
												?>		
													<img src="<?php echo $tags['image']; ?>" alt="" title="<?php echo $tags['title']; ?>" width="20" />
												<?php
													}
												?>
											</span>
										</h2>
										<!--<p style="font-weight: bold; font-style: italic; letter-spacing: 1px; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 16px;">-->
										
										<p><?php echo $product['alternateName']; ?></p></br>
										<!--Display message regaurding product min quantity and global-->
										<p style="color:#8B0000"><?php echo '<b>'.$message.'</b>'; ?></p>
										<!-- <span>Required options below</span> -->
									</div>                                                  
								   <div class="itemPriceSection">
								   
										<?php if ($product['price']) { ?>
										
											<?php
												$product['price']=substr_replace($product['price'],".",-2,0) ;
												$product['price']="$".$product['price'];
												$formatPrice =	explode('.',$product['price']); //to separate dollar and cents to be used in the new UI
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
												<?php if($dollars == 0 && $cents == 0){ ?>
												<div class='priceselect' style="line-height: 32px; font-size: 30px; display: block; text-align: center; padding-right: 0px;"><?php $dollars; echo '<font>'.'Select'.'</font>';?> item</div>
												<?php } else{ 
												if(!$dollars){
													$dollars=0;
												}
												?>
											
												<div class="currency_Symbol" ><sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup> </div>
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
					   <?php if(!isset($product_count)){
						   $product_count=1;
					   } ?>
					   <div class="itemDetail_Quantity"> 
							<h4>Quantity</h4> 
							<div class="QuantityInputBox"> 
								<span>
									<input type="text" name="quantity" class="test-input" value="<?php echo $product_count; ?>" maxlength="2" id="input-quantity" onkeypress="return isNumberKey(event)" />
									<input type="hidden" name="product_id" value="<?php echo $product_count; ?>" />
								</span>
								<span>
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="plus_qty"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" /></button>
									<button onclick="qtyIncDec(this.id,'<?php echo $minimum; ?>')" id="minus_qty"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" /></button>
								</span>
							</div>
					   </div>
					</div>
					<?php $optionsExist = false; if($options){ $optionsExist = true; ?>
					<div class="subTitle"><h5>OPTIONS & SIDES</h5></div>  

					<div class="optionsInputForm">

						
						<?php //echo '<pre>'; print_r($options); echo '</pre>'; ?>
						
						<!--<div class="col-md-12 col-sm-12 col-xs-12 leftSide">-->
						<div style="margin-top:-56px;" class="col-md-12 col-sm-12 col-xs-12">
							
							<!-- <div class="extraAddons"><h5><img src="<?php //echo $base; ?>upload/catalog/view/theme/default/image/optionPlus.png"/>EXTRAS & ADD-ONS</h5></div> -->
							
							
							<?php 
							$productValArr = array();
							$productKeyArr = array();
							$productIdArr = array();
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
							<?php foreach ($options as $option) { 
									$option['type'] = 'checkbox';
							?>
							
									<?php if ($option['type'] == 'select') { ?>

									  <h4><label class="" id="error_clr<?php echo $option['id']; ?>" for="input-option<?php echo $option['id']; ?>"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
									  <div class="item-details-dropdown right-inner-addon" style="margin-bottom: 35px;">
										  <i class="fa fa-chevron-down" id="fa-input-option<?php echo $option['id']; ?>"></i>
										  <select name="option[<?php echo $option['id']; ?>]" id="input-option<?php echo $option['id']; ?>">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['elements'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']])) echo 'selected'; ?> ><?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
											</option>
											<?php } ?>
										  </select>
									  </div>

									<?php } ?>
							
									<?php if ($option['type'] == 'checkbox') { 
											if(isset($option['maxAllowed'])){
												$valid_option_arry[$option['id']]['max']= $option['maxAllowed'];
												$valid_option_arry[$option['id']]['max_ori']= $option['maxAllowed'];
											}else{
												$valid_option_arry[$option['id']]['max'] = 10000;
												$valid_option_arry[$option['id']]['max_ori']= 10000;
											}
											if(isset($option['minRequired'])){
												$valid_option_arry[$option['id']]['min'] = $option['minRequired'];
												$valid_option_arry[$option['id']]['min_ori'] = $option['minRequired'];
											} ?>
									  <h4><label id="error_clr<?php echo $option['id']; ?>" class="new-design-add-ons-label"><?php echo ($option['minRequired'] ? ' *' : ''); ?><?php echo $option['name']; ?></label><span class="shop_font_color" style="font-weight: 700; margin-left:10px;"><?php if(isset($option['minRequired']) && $option['minRequired'] != 0) { echo '<span style="font-weight: 700; margin-left:10px;" id="min_option_'.$option['id'].'">MIN ('.$option['minRequired'].') </span>'; } ?> <?php if(isset($option['maxAllowed']) && $option['maxAllowed'] != 0 ) { echo '<span style="font-weight: 700; margin-left:10px;" id="max_option_'.$option['id'].'">MAX ('.$option['maxAllowed'].')</span>'; } ?></span></h4>
									  <div id="input-option<?php echo $option['id']; ?>" class="productOptionsChecklistParent prodOptSec clearfix">
										
										<?php foreach ($option['modifiers']['elements'] as $optionz =>$option_value) {
											$valid_option_arry[$option['id']][$option_value['id']]=0;											
										if(isset($modifier_count)){
											foreach($modifier_count as $modi_count=>$m){ 
											// echo $option['name'];
											// echo $modi_count;
												if($modi_count == trim($option['id']) && isset($m[$option_value['id']]) ){
													
													$count = $m[$option_value['id']]['qty']; 
													$valid_option_arry[$option['id']][$option_value['id']]=$count;
													break;
												}else{
													
													$count =0;
													$valid_option_arry[$option['id']][$option_value['id']]=$count;
												}
											} 
										}else{
											$count =0;
										}	?>
										
											<div class="productOptionsChecklist productOptionsChecklistCus">
												<input onclick="qty_Inc_Dec(this.id,'<?php echo $option_value['id']; ?>')" id="input-field-<?php echo $option_value['id']; ?>" type="checkbox" name="<?php echo $option['id']; ?>" value="<?php echo $option_value['id']; ?>"	<?php if($count){ echo "checked"; }?>/>
												<label id="label_id_<?php echo $option_value['id']; ?>" class="product_title" style="text-align: justify;" for="input-field-<?php echo $option_value['id']; ?>"><span></span>
												<!--<div class="product_title" style="float: right;">-->
												<div class="option-name"><?php echo $option_value['name']; ?></div>
												<!--</div>-->
												</label>
												<span style="display:none;" id="option_name_<?php echo $option_value['id']; ?>"><?php echo $option_value['name']; ?></span>

												 
												<span class="priceRate">
												<?php if ($option_value['price']) { ?>
												<?php echo "$"; ?><?php echo number_format($option_value['price']/100, 2, '.', ''); ?>
												<?php } ?>
												</span>
												<span style="display:none;" id="option_price_<?php echo $option_value['id']; ?>"><?php echo number_format($option_value['price']/100, 2, '.', ''); ?></span>
											</div>



<div class="productOptionsChecklist qtyBtnDiv" id="showHideDivPlusMinusButton<?php echo $option_value['id']; ?>" <?php if($count){ ?> style="display:block;padding-left: 29px;border-top:0px solid #f4f4f4;" <?php }else{ ?> style="display:none;" <?php } ?> >
								<span class="QuantityInputBox plus_png"  style="width: 6%; display: inline-block;">
									<button class= "plus_png_button plus_qty_modifier_<?php echo $option_value['id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px;    padding-left: 5px;" onclick="modiqtyIncDec(this.id,'<?php echo $option_value['id']; ?>','<?php echo $option['id']; ?>', '<?php echo $option['maxAllowed']; ?>')" id="plus_qty_modifier">
										<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/plus.png" alt="" />
									</button>
								</span>	
								<!--<div class="QuantityInputBox" style="float: right !important;"> -->
								
								 <span class="QtyInputBox" style="width: 5.8%;display: inline-block;">
									<input onpaste="return false;" onCopy="return false" onCut="return false" onDrag="return false" onDrop="return false"  class="qtyInputField qty_input_<?php echo $option['id']; ?>" onchange="modiqtyIncDec(this.id,'<?php echo $option_value['id']; ?>','<?php echo $option['id']; ?>', '<?php echo $option['maxAllowed']; ?>')" style="border-radius: 5px; border: 0px solid red; padding: 6px;font-size: 15px !important; width: 35px;text-align: center;height: 32px; float:right; font-family: Conv_ProximaNova-Regular; font-weight: bold;color: #424242;" type="text" name="<?php echo $option_value['id']; ?>" class="test-input" value="<?php echo $count; ?>" maxlength="2" id="input-quantity-<?php echo $option_value['id']; ?>" onkeypress="return isNumberKey(event)" />
								 </span>
								 
								 <span class="QuantityInputBox minus_png" style="width: 6%; display: inline-block;">
									<button class="minus_png_button minus_qty_modifier_<?php echo $option_value['id']; ?>" style="background: #525b62; padding-top: 9px; padding-right: 5px; padding-bottom: 9px;    padding-left: 5px;" onclick="modiqtyIncDec(this.id,'<?php echo $option_value['id']; ?>','<?php echo $option['id']; ?>', '<?php echo $option['maxAllowed']; ?>')" id="minus_qty_modifier">
										<img style =" max-width: 56% !important;" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/minus.png" alt="" />
									</button>
								</span>

</div>




											
										<?php 
										}?>

									  </div>

									<?php } //end if checkbox ?>
									
									
									<?php if ($option['type'] == 'radio') { ?>

									  <h4><label id="error_clr<?php echo $option['product_option_id']; ?>" class="new-design-add-ons-label"><?php echo ($option['required'] ? ' *' : ''); ?><?php echo $option['name']; ?></label></h4>
									  <div id="input-option<?php echo $option['product_option_id']; ?>">
										<ul class="Itemchecklist">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										
											<li>
												<input id="input-field-<?php echo $option_value['product_option_value_id']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($option_value['selected'] || isset($productValArr[$option_value['product_option_value_id']])) echo 'class="chckThis"'; ?> />
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

<!--<div class="container">
  <h1>Hello World!</h1>
  <p>Resize the browser window to see the effect.</p>
  <p>The columns will automatically stack on top of each other when the screen is less than 768px wide.</p>
  <div class="row">
    <div class="col-sm-3" style="background-color:lavender;">.col-sm-4</div>
    <div class="col-sm-3" style="background-color:lavenderblush;">.col-sm-4</div>
    <div class="col-sm-3" style="background-color:lavender;">.col-sm-4</div>
  </div>
</div>-->


						
						<?php } //end if options ?>
						
						
						<!--<div class="col-md-5 col-sm-5 col-xs-12 <?php if($optionsExist){ ?> RightSide<?php }else{ ?> leftSide <?php } ?> sp-instruction" <?php if($optionsExist){ ?> style="float:right" <?php } ?> >
							<div class="extraAddons"><h5><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/notepad.png"/>SPECIAL INSTRUCTIONS</h5></div>
							<div class="instructionTextarea"><textarea id="special_instructions" name="special_instructions" placeholder="e.g. No peanuts, no salt..."><?php echo isset( $special_instructions ) ? $special_instructions : '' ?></textarea></div>
						</div> -->
					</div>
					<?php if ($product['price'] || !$product['price']) { ?>
										
							<?php
								$product['price']=substr_replace($product['price'],".",-2,0) ;
								$product['price']="$".$product['price'];
								$formatPrice =	explode('.',$product['price']); //to separate dollar and cents to be used in the new UI
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
							<?php /*  
							<button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block addorder_bt shop_btn" type="button"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/buttonPlus.png" /><?php if($dollars == 0 && $cents == 0 && empty($productIdArr[$product_id])){ ?>ADD TO ORDER<span class="btn-space"></span>  <sup><?php $currencySymbol; ?></sup><?php  $dollars; ?><sup><?php  $cents; ?></sup></span></button>
							<?php }elseif($dollars == 0 && $cents == 0 && isset($productIdArr[$product_id])){ ?>Update Item<span class="btn-space"></span>  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	
							<?php }elseif(isset($productIdArr[$product_id]) && !empty($productIdArr[$product_id])){ ?>Update Item<span class="btn-space"></span>  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	
							<?php }else{ ?>ADD TO ORDER<span class="btn-space"></span>  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	
							<?php } ?> */?>
							<button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block addorder_bt shop_btn" type="button"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/buttonPlus.png" /><?php if(!isset($_GET['flag'])){ ?>ADD TO ORDER</span></button>
							<?php }elseif(isset($_GET['flag'])){ ?>Update Item</span></button>	
							<?php }elseif(isset($productIdArr[$product_id]) && !empty($productIdArr[$product_id])){ ?>Update Item</span></button>	
							<?php }else{ ?>ADD TO ORDER</span></button>	
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
								  <button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block addorder_bt shop_btn" type="button"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/buttonPlus.png" /><?php if($dollars == 0 && $cents == 0){ ?>ADD TO ORDER  <sup><?php $currencySymbol; ?></sup><?php  $dollars; ?><sup><?php  $cents; ?></sup></span></button>
								<?php }else{ ?>ADD TO ORDER  <sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup></span></button>	
								<?php } ?>
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
							<?php if(isset($option['maxAllowed']) && $option['maxAllowed'] != 0){ ?> onclick="limitCheckboxSelection(this.id,'<?php echo $option['product_option_id']; ?>', '<?php echo $option['maxAllowed']; ?>')" <?php } ?>
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


function qty_Inc_Dec(id,product_option_value_id){
 
 
	var plus_minus_button_show_hide 	= document.getElementById("showHideDivPlusMinusButton"+product_option_value_id);	


	if(plus_minus_button_show_hide != null){   
		if($('#input-field-'+product_option_value_id).is(":checked") ){
			 
			plus_minus_button_show_hide.style.display  = "block" ;
		}else{
				plus_minus_button_show_hide.style.display  = "none" ;
			
		}		
		
	} 
 
 
 
 
 
 
	var qty = $('#input-field-'+product_option_value_id).val();
	var checkboxVal = '#'+'input-field-'+qty;
	if($(checkboxVal).prop('checked') == true){ 
		$('.plus_qty_modifier_'+product_option_value_id).trigger('click'); 
	}else{ 
		$('#input-quantity-'+product_option_value_id).val(0);
	} 
}


function modiqtyIncDec(id, p_id, product_option_id, maxAllowed){
 
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
			
			

		console.log('maxAllowed: ' + maxAllowed);
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
			if( qty > maxAllowed && maxAllowed > 0 ){  
					var CurrentQty = parseInt($('#input-quantity-'+p_id).val());
					
				bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! You Cannot Select More Quantity.</span>", function() {
				  $('#input-quantity-'+id).val(qty);
				});
				
				if(plus > 0){
					 
						var tempvar 		= plus;
						var currentQtyvar 	= CurrentQty;
						var minusvar 		= plus - CurrentQty;
						qty 				= maxAllowed - minusvar ;  
						if( qty == 0 ){
							console.log('last-qty:'+ qty);
							$( '#input-field-'+p_id ).prop('checked', false); 
							
								var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+p_id);	

								if(plus_minus_button_show_hide != null){   
													
								
									plus_minus_button_show_hide.style.display  = "none" ;
												
								} 							
						}else{
							console.log('last-qty:'+ qty);
							$( '#input-field-'+p_id ).prop('checked', true);
						}
					}
				
			}else if (plus > maxAllowed && maxAllowed > 0 ) {
					var CurrentQty = parseInt($('#input-quantity-'+p_id).val());
					 
				bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! You Cannot Select More Quantity.</span>", function() {
				  $('#input-quantity-'+id).val(qty);
				});

				$('#input-field-'+p_id).removeAttr("checked");
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
							qty = maxAllowed - minusvar ;
							
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
					
					qty = 0;
					$('#input-field-'+p_id).removeAttr("checked");
					
					
					var plus_minus_button_show_hide = document.getElementById("showHideDivPlusMinusButton"+p_id);	

					if(plus_minus_button_show_hide != null){   
					 					
					
						plus_minus_button_show_hide.style.display  = "none" ;
									
					} 					
					
					
					
					
					//$('#input-field-'+p_id).prop('checked', false);
				}
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
	var product_price = '<?php echo $product['price']; ?>';
	var checked_boxes = $(":checkbox:checked").length;
	if(product_price == "$.0" && checked_boxes == 0 ){
		bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! Please Select Option.</span>", function() {
		  
		});
		return;
	}
	// $('#product input[type=\'checkbox\']').click(function() {
        // if ($(this).is(':checked')) {
			// $("set_qty_modifier").show();
			// $("set_qty_modifier1").show();
			
        // }
    // });
	var minQty = '<?php echo $minimum; ?>';
	var line_item_id = '<?php if($line_item_id){ echo $line_item_id; }else{ echo 0; } ?>';
	var qtyVal = $('input[name=\'quantity\']').val();
	var special_instructions = $('#special_instructions').val();
	// var option=$('#product input[type=\'checkbox\']:checked');
	var option='';
	var option_qty={};
	$('#product input[type=\'checkbox\']:checked').each(function(index, element) {
		var id = element.value;

			option+=id+",";
			var qty = $('#input-quantity-'+id).val();
			var option_name = $('#option_name_'+id).html();
			var group_id = $('#input-field-'+id).attr("name");
			var group_name = $('#error_clr'+group_id).html();
			var option_price = $('#option_price_'+id).html();
			console.log(group_name);
			if(typeof(option_qty[group_id]) == "undefined"){
				option_qty[group_id]={};
			}
			if(qty=="0"){
				bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! You Cannot Select More Quantity.</span>", function() {
				  $('#input-quantity-'+id).val(qty);
				});

			}else{
				if(typeof(option_qty[group_id][id]) == "undefined"){
					option_qty[group_id][id]={};
				}
				option_qty[group_id]['name']=group_name;
				option_qty[group_id][id]['id']=id;
				option_qty[group_id][id]['qty']=qty;
				option_qty[group_id][id]['name']=option_name;
				option_qty[group_id][id]['price']=option_price;
				option_qty[group_id][id]['group_id']=group_id;
			}
		});	
console.log(option_qty);
	// var option_qty={};
	// $('#product input[type=\'text\']').each(function(index, element) {
			// if(element.name!="quantity"){
				// var id = element.value;
				// var name = element.name;
				// option_qty[name]=id;
			// }
		// });
	var product_id = '<?php echo $_GET['product_id'] ; ?>';
	var product_key = '<?php echo $_GET['product_key'] ; ?>';
	var flag = '<?php if(isset($_GET['flag'])){ echo $_GET['flag'] ; }else{ echo 0; } ?>';
	// if(product_key){
		// var urlData = '<?php echo BASE; ?>index.php?route=checkout/cart/remove';
	// }else{
		var urlData = '<?php echo BASE; ?>index.php?route=cloverAPI/clover/make_order_with_items';
	// }
	
	if(qtyVal < minQty){
		bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! The minimum quantity for this order is "+minQty+".</span>", function() {
		  $('input[name=\'quantity\']').val(minQty);
		});
	}else{
		// if(qtyVal==0){ alert('Please Select Quantity'); return; }
		$.ajax({
			url: urlData,
			type: 'post',
			data: {product_id : product_id,product_key : product_key,product_unit : qtyVal,special_instructions : special_instructions,option : option,option_qty : option_qty,flag : flag},
			dataType: 'json',
			beforeSend: function() {
				$('#button-cart').html('Loading....');
			},
			complete: function() {
				$('#button-cart').button('reset');
			},
			success: function(json) {
				
				$('#button-cart').html('<span><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/buttonPlus.png" /> ADD TO ORDER</span>');
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
					
				// if(json['success_cart'] == 'success'){
					// $('#product_key').attr('value','');
					// $('#button-cart').trigger('click');
					
				// }
				
				if (json['error']) {
					// alert(json['error']);
					// return;
				    // var elmnt = document.getElementById('#error_clr' + group_id);
					// elmnt.scrollIntoView();					
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							$('#error_clr' + i.replace('_', '-')).css("color","red");
							var elements = $('#error_clr' + i.replace('_', '-'));
							var $scrollTo = $('#error_clr' + i.replace('_', '-'));
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								var desiredHeight = $(window).height() - 900;
								$('html, body').animate({
									scrollTop: $scrollTo.offset().top - desiredHeight}, 1000);
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								elements.addClass('control-label');
								var desiredHeight = $(window).height() - 900;
								$('html, body').animate({
									scrollTop: $scrollTo.offset().top - desiredHeight}, 1000);
							}
						}
					}

					if (json['error']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']+ '</div>');
					}

					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
					// $('#error_clr').addClass('control-label');
				}
				

				console.log(json);
				if (json['error'] == false) {
					window.location.href = '<?php echo BASE;?>index.php?route=common/home&step_back=categories';
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
	// var locationSet 		= '<?php echo $locationSet; ?>';
	// var step_back_url_text	= '<?php echo ucfirst($step_back_url_text); ?>';
	var step_back_url		= '<?php echo $_SERVER['SCRIPT_NAME']."?route=common/home&step_back=categories"; ?>';
		// step_back_url		= step_back_url.replace(/&amp;/g, '&');

	// if(locationSet && step_back_url){
		// $('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> '+step_back_url_text).show();
		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> Categories').show();
	// }
//-->	
</script>
<script>
<!--
function limitCheckboxSelection(id, product_option_value_id, product_option_id, maxAllowed){
	var numberOfCheckboxesSelected = $('input[name=\'option['+product_option_id+'][]\']:checked').length;
	
	if(numberOfCheckboxesSelected > maxAllowed && maxAllowed != 0 ){
		bootbox.alert("<span class='custom_bootbox_error'>Oh-oh! You Cannot Select More Quantity.</span>", function() {
		  $('#input-quantity-'+id).val(qty);
		});

	}else{
		 
		 qty_Inc_Dec(id, product_option_value_id);
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