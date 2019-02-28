<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">

<head profile="http://gmpg.org/xfn/11">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>FAX</title> 
</head>

<body style="font-family: 'Open Sans', sans-serif;">
    <div style="display:block;max-width:1158px;	width:100%;margin:0px auto 0px;">
        <div style="display:block; max-width:1027px; width:100%; margin:0px auto 0px;">
            <div style="float:left;">
                <div><img style="width:350px;" src="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/image/logo1.png" />
                </div>
				<br>
                <div style="font-size: 18px;font-weight: 600;margin-top: 16px;margin-left: 12px;line-height: 26px;"><?php echo $store_name; ?></div>
				 <?php if(isset($delivery_address) && !empty($delivery_address)){
					if($delivery_address !=''){ ?>
                <div style="font-size: 15px;font-weight: 600;margin-top: 16px;margin-left: 12px;line-height: 15px;">Deliver to:</div>
                <div style="font-size: 15px;font-weight: 100;margin-top: 2px;margin-left: 12px;line-height: 15px;"><?php echo $delivery_address; ?></div>
				 <?php  } }?> 
            </div>
            <div style="float:right; text-align: right;">
			   <?php if(!empty($customerFirstName)){
						$full_name = $customerFirstName.' '.$customerLastName;
					}else{
						$full_name = 'Customer';
					}
				?>
                <div style="font-size: 25px;font-weight:600;margin-top: 30px;"><?php echo $full_name; ?></div>
				
                <div style="font-size: 15px;margin-top: 20px;margin-left: 12px;line-height: 15px;"><b>Order ID:</b> <?php echo $order_id; ?></div>
				<?php
				if(isset($number) && !empty($number)){
					if($number!=''){
				?>
                <div style="font-size: 15px;margin-top:5px;margin-left: 12px;line-height: 15px;"><b>Credit Card:</b> <?php echo $number; ?></div>
				<?php } } ?>
                <div style="font-size: 15px;margin-top:5px;margin-left: 12px;line-height: 15px;"><b>Phone:</b> <?php echo $telephone; ?></div>
                <div style="font-size: 15px;margin-top: 20px;margin-left: 12px;line-height: 15px;"><b>Ordered at</b> <?php echo $date_added; ?>
                </div>
                <div style="font-size: 15px;margin-top:5px;margin-left: 12px;line-height: 15px;"><b><?php if(!empty($order_delivery_method)){ echo $order_delivery_method; }else{ ?>PICK UP<?php } ?></b> @ <?php echo $combinedOrderTime; ?> </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<?php if(isset($delivery_address) && !empty($delivery_address)){
			if($delivery_address !=''){ ?>
        <br>
        <br>
		<?php } }?>
		<?php 
		if($add_note){ ?>
			
		 <div style="font-size: 14px;margin-left: 12px; margin-top:10px;"><b>NOTE:</b><?php echo wordwrap($add_note,30,"<br>\n",TRUE); ?></div> 
		<?php } ?>
        <div style="border-top: 2px dashed #000;width: 100%;display: block;margin-top:10px;"></div><br>

        <div style="display:block;margin-top:10px;">
            <div style="font-size: 11px;"><b>#Items</b>
            </div>
			
			<table style="border-collapse: collapse; width: 1285px;">
				 <?php 
				$prepTimeArr = array();
				$tempArrOption = array();
					foreach($products as $product){
						$product_name	=	trim($product['name']);
						if(strlen($product_name) < 1)continue;
						$tempArrOption = array();
							$i  =	1;
							$j =	0;
						$prepTimeArr[] = $product['prep_time'];							
					?>
		
				<tr>
				  <td style="font-size: 12px; text-align: left; padding: 2px 0 0 0; width:10px; vertical-align:top">1</td>
				  <td style="font-size: 12px;"><b><?php echo $product['name']; ?></b></td>
				  	<?php
						$netOptionPriceArr = array();
							foreach ($product['option'] as $option) { 
								$netOptionPriceArr[] = $option['price_prefix'].str_ireplace('$', '', $option['price']);
			
							}
							$netOptionPrice = array_sum($netOptionPriceArr);
							
							// if($netOptionPrice > 0){
								$netProdcutPrice = str_ireplace('$', '', $product['price'])-$netOptionPrice;
								$netProdcutPrice = floor($netProdcutPrice*100)/100; 
								$netProdcutPrice = sprintf("%.2f",$netProdcutPrice); // to make it to 2 decimal places	
							// }else{ 
								
						// };
						?>	
				  <td style="font-size: 12px;"><?php echo '$'.$netProdcutPrice * $product['quantity']; ?></td>
				</tr>
			
			  <?php foreach ($product['option'] as $option) { ?>
				<tr>
				<td></td>
				<?php if(!in_array($option['name'],$tempArrOption)){  ?>
				  <td style="font-size: 12px;"><?php echo $option['name']. ':'; ?></td>
				    <?php 	$tempArrOption[] = $option['name'] ;
										$j 	=	1;
										$i 	=   0;	
										}
							?>
                  <td>--</td>
				 <?php if (trim($option['value'])!=''){ ?>
					  <tr>
					  <td></td>
						<td style="font-size: 12px;">&nbsp;&nbsp; <?php echo $option['value']; ?></td>
						<?php 
						if($option['price'] != '$0.00') {
							$option_price =	'';
							$option_price =	str_replace('$', '', $option['price']) * $product['quantity'];
							if($option_price == 0){ 
						?>
						<td style="font-size: 12px;">--</td>
							<?php } else{?>
						<td style="font-size: 12px;"><?php echo '$'.sprintf("%.2f",$option_price); ?></td>
						<?php } }?>
					  </tr>
				 <?php }else{ ?>  
						<tr>
						<td></td>
						<td></td>
						<td></td>
						</tr>
				 <?php } ?>
				</tr>
			  <?php } ?>
			  	<?php if(isset($product['special_instructions']) && $product['special_instructions'] != ''){ ?>
						<tr>
						<td></td>
						<td style="font-size: 12px;"><b>Special Instructions</b></td>
						<td></td>
						</tr>
						 <tr>
						<td></td>
						<td style="font-size: 10px;">&nbsp;&nbsp; <?php echo $product['special_instructions']; ?></td>
						<td></td>
						</tr>
				 <?php }  ?>
			  
			  <?php } ?>
			</table>
            <div style="clear:both;"></div>
			<br> 

            <!--<div style="font-size:14px; margin-top:2px;margin-left:10px;line-height:15px;">Special Instructions for the individual item</div>-->
<!--/*

1. If locaton wise delivery time is greater than 0 and greater than totalpreptime ( which is particular item time) and greater than min_order_prep_time then location time will print. 
2. If totalPrepTime is less than min_order_prep_time ( which is ordering time) then min_order_prep_time will print.  
3. If 1st and 2nd not meet the condition then totalpreptime will print.   

*/-->
      
			<?php  
					$totalPrepTime = array_sum($prepTimeArr);
					$locationDeliveryReadyTime = $deliveryReadyTime;
					if($totalPrepTime != '0.00' || !empty($min_order_prep_time)){
						
						
						if( $order_delivery_method =='PICKUP' ){
							if($min_order_prep_time > 0 && $min_order_prep_time > $totalPrepTime){
								//$pre_time = 'PICKUP-IF-IF';
								$pre_time = $min_order_prep_time.' min';
							}else{
								//$pre_time = 'PICKUP-IF-ELSE';
								$pre_time = $totalPrepTime;
							}
						}else{
							
							if($locationDeliveryReadyTime > 0 && $locationDeliveryReadyTime > $totalPrepTime ){
								//$pre_time = 'DELIEVERY-IF-IF';
								$pre_time = $locationDeliveryReadyTime.' min';				
								}else{
									//$pre_time = 'DELIEVERY-IF-ELSE';
									$pre_time = $totalPrepTime.' min';
								}
								
						} 
		
					}
							/*OLD
							if($locationDeliveryReadyTime > 0 && $locationDeliveryReadyTime > $totalPrepTime && $locationDeliveryReadyTime > 	$min_order_prep_time){
								$pre_time = $locationDeliveryReadyTime.' min';				
								}elseif($totalPrepTime < $min_order_prep_time){
									$pre_time = $min_order_prep_time.' min';
								}else{
									$pre_time = $totalPrepTime.' min';
								} */					
				?>
		<?php		
		$displayReadyTime = $display_ready_time;
		if($displayReadyTime == 0){ ?>					
            <div style="font-size:14px;line-height:15px; border-top: 2px dashed #000; border-bottom:1px solid #000; padding:5px 0px; text-align:center;">PREPARATION TIME (approx): <?php echo $pre_time; ?></div>
		<?php }else{ ?>
		
		<div style="font-size:14px;line-height:15px;  border-bottom:1px solid #000; padding:5px 0px; text-align:center;"></div>
		
		<?php } ?>
 							<?php
				if(isset($number) && !empty($number)){
					if($number!=''){
				?>
			<div style="background-image:url('http://ec2-34-210-139-20.us-west-2.compute.amazonaws.com/ordering/common/upload/catalog/view/theme/default/image/1paid.png'); margin-top:10px; height: 240px; width: 90%; background-repeat: no-repeat;overflow:hidden;background-position:center;">
				<?php }}
				?>
			<?php
				foreach ($totals as $total) { 
							if($total['title'] == 'Total'){ 
		
							}
				
			?>
            <div style="display:block; font-size:14px; margin-top:25px;">
                <div style="float:left;"><b><?php echo $total['title']; ?></b>
                </div>
				<?php if($total['text'] != '$0.00' || $total['title'] == 'Revised Sub-Total'){ ?>
                <div style="float:right;text-align:right"><?php echo $total['text']; ?></div>
                <div style="clear:both;"></div>
				<?php }  ?>
            </div><br><br>
			<?php } ?>
			<!--
            <div style="display:block; font-size:15px; margin-top:20px;">
                <div style="float:left;"><b>Tax:</b>
                </div>
                <div style="float:right;text-align:right">$1.08</div>
                <div style="clear:both;"></div>
            </div><br><br>

            <div style="display:block; font-size:15px; margin-top:20px;">
                <div style="float:left;"><b>Tlp:</b>
                </div>
                <div style="float:right;text-align:right">$6.00</div>
                <div style="clear:both;"></div>
            </div><br><br>

            <div style="display:block; font-size:15px; margin-top:20px;">
                <div style="float:left;"><b>Online Ordering:</b>
                </div>
                <div style="float:right;text-align:right">$0.75</div>
                <div style="clear:both;"></div>
            </div><br><br>

            <div style="display:block; font-size:16px; margin-top:25px;">
                <div style="float:left;"><b>Total:</b>
                </div>
                <div style="float:right;text-align:right"><b>$37.08</b>
                </div>
                <div style="clear:both;"></div>
            </div>
			-->
        </div>
    </div>
</div>
    <div style="clear:both;"></div>

</body>

</html>