<div class="contant_area usual">  <ul><?php	if($success == 1) {		foreach($data as $k => $value) {			if($k == 'totalProducts') {				foreach($value as $k_in => $value_in) {				?>					<li>					  <a href="<?php echo $_SERVER['SCRIPT_NAME']."?route=cloverAPI/clover/get_single_product&product_id=".$value_in['product_id']; ?>" id="add_to_order" data-product-link="<?php echo $_SERVER['SCRIPT_NAME']."?route=cloverAPI/clover/get_single_product&product_id=".$value_in['product_id']; ?>">						<div class="text_col top_spacing">						  <span><?php echo $value_in['name']?></span><?php echo $value_in['description']?>						</div>						<div class="p-call">						  <div class="price_col">							<p>							<?php							$value_in['price']=substr_replace($value_in['price'],".",-2,0) ;							$value_in['price']="$".$value_in['price'];							$formatPrice =	explode('.',$value_in['price']); //to separate dollar and cents to be used in the new UI														$cents = '00';							if(isset($formatPrice[1])) {								$cents = $formatPrice[1];							}														if(isset($formatPrice[0])) {								$dollarArr =	str_split($formatPrice[0]); // to separate dollar sign and amount to be used in the new UI								$currencySymbol = '$';								$dollars = implode('',$dollarArr);								if(isset($dollarArr[0])) {									$currencySymbol = array_shift($dollarArr);									$dollars = implode('',$dollarArr);								}							}														if($dollars == 0 && $cents == 0) {							?>								<sup><?php echo $currencySymbol; ?></sup><?php echo $dollars; ?><sup><?php echo $cents; ?></sup>							<?php							} else {								echo '<sup>'. $value_in['price'] . '</sup>';							}							?>							</p>							<div class="add_to_order_button">Order</div>						  </div>							<div class="clear"></div>						</div>					  </a>					</li>				<?php				}			}		}	}		?>  </ul></div>