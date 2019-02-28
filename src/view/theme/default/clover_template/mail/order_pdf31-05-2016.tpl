<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
@page{ margin:0px; margin-left:5px; }
body{ margin:0px, margin-left:5px; }
</style>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #000000; width:2.9in;">
<div style="width: 2.9in;">
	<?php /* if($logo && $logo != ''){ */ ?>
		<center><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/printer_logo.png" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none; max-height:80px; width:auto;" /></center>
	<?php /* }  */?>			<div style="height:1px;background-color:#000; margin:3px 0 6px 0;"></div>		<div style="text-align:center;">		<strong><?php echo $locationName; ?></strong>	</div>
	<div style="text-align:center; font-size:12px;">
		<strong>Order ID: <?php echo $order_id; ?></strong>
	</div>	<div style="text-align:center; font-size:12px;">			Ordered at <?php echo $date_added; ?>		<!-- <br/> Paid - -->	</div>	
		<div style="height:3px;background-color:#000; margin:3px 0 6px 0;"></div>	<div style="font-weight:600; text-align:center; font-size: 145%;">		<p style="margin:5px 0px">		<?php 			if(!empty($customerFirstName)){ 				echo $customerFirstName.'<br/>'.$customerLastName;			}else{				echo 'Customer';				}			?>		</p>	</div>	<div style="margin:8px 5px; text-align:center">		Phone: <?php echo $telephone; ?>	</div>		<div style="height:1px;background-color:#000; margin:3px 0 6px 0;"></div>		<div style="text-align:center;">			<!-- Pick Up# <?php //echo $order_id; ?> -->
		<?php echo $order_delivery_method.' @ '.$combinedOrderTime; ?>	</div>	
	
	<table style="border-collapse: collapse; width: 95%;  margin-bottom: 20px;">
		<tbody>
		  <tr>
			<td colspan="3" style="font-size: 14px; font-weight: bold; text-align: left; padding: 2px 0 0 5px;"># Items</td>
		  </tr>	
		  <tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:100%;"></div></td>
		  </tr>	
		
		  <?php 
			
			$prepTimeArr = array();
			$tempArrOption = array();
			foreach ($products as $product) {
				$tempArrOption = array();
					$i 		=	1;	
					$j 		=	0;	
			?>
		  <tr>
			<td colspan="3" style="padding: 2px 0 0 5px;">
				<table style="width: 100%;">
					<tr>
						<td style="font-size: 14px; text-align: right; padding: 2px 0 0 0; width:5%; vertical-align:top"><?php echo $product['quantity']; ?></td>
						<td style="font-size: 14px; text-align: left; padding: 2px;width:75%; vertical-align:top">
						<?php 
							$prepTimeArr[] = $product['prep_time'];
							echo $product['name'];
						?>
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
								// $netProdcutPrice = $product['price']+$netOptionPrice;	
							// }	
							
							
						?>
						</td>
						<td style="font-size: 14px;	text-align: right; padding: 2px; vertical-align:top; width:20%;"><?php if($netProdcutPrice != 0.00) { echo '$'.$netProdcutPrice; } ?></td>
					</tr>
					<?php foreach ($product['option'] as $option) { ?>
					<tr>
						<td style="font-size: 14px; text-align: right; width:5%; vertical-align:top"></td>
						<td style="font-size: 14px; text-align: left; width:70%; vertical-align:top">
							
							   <?php  
									if(!in_array($option['name'],$tempArrOption)){
										echo '<div style="font-size: 12px; clear:both;">'.'- '.$option['name'].': </div>';
										$tempArrOption[] = $option['name'] ;
										$j 	=	1;
										$i 	=   0;		
									}
									
										if (trim($option['value'])!=''){
								?>	
											&nbsp;<small><span style="padding-left:8px; font-size:10px; clear:both;"><?php echo $option['value']; ?></span></small>
								<?php 	
										}else{
											echo '<div style="clear:both;"></div>';
										}
								?>
						</td>
						<td style="font-size: 14px; text-align: right; vertical-align:bottom; width:20%;">
							<?php 
									if(!in_array($option['name'],$tempArrOption)){
										// echo '<div style="clear:both;"></div>';
										// $tempArrOption[] = $option['name'] ;
										// $j 	=	1;
										// $i 	=   0;	
										// echo '<br/>';
									}
									if($option['price'] != '$0.00') { echo $option['price']; }
							?>
						</td>
					</tr>
					<?php } //end foreach ?>
				</table>
			</td>
		  </tr>
		  <?php 
					if(isset($product['special_instructions']) && $product['special_instructions'] != ''){ ?>
					  <tr>
						<td colspan="3" style="font-size: 14px; text-align: left; padding: 2px 0 8px 5px;">
							<span style="font-weight:500;">Special Instructions:</span><br/>
							<small><span style="padding-left:8px; font-size:10px;"><?php echo $product['special_instructions']; ?></span></small>
						</td>
					  </tr>	
		  <?php 	} ?>
		  <?php } ?>
		  <tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:100%;"></div></td>
		  </tr>
		  <?php
			$totalPrepTime = array_sum($prepTimeArr);
			
			if($totalPrepTime != '0.00' || !empty($min_order_prep_time)){
			
		  ?>	
		  <tr>
			<td colspan="2">Preparation Time(approx):</td>
			<td style="text-align:right;">
				<?php
					if($totalPrepTime < $min_order_prep_time){
						echo $min_order_prep_time.' min';
					}else{
						echo $totalPrepTime.' min';
					}	
				?>
			</td>
		  </tr>
		  <tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:100%;"></div></td>
		  </tr>
			<?php } //end if ?>
		  <?php foreach ($vouchers as $voucher) { ?>
		  <tr>
			 <?php /* <td style="font-size: 14px;	 text-align: left; padding: 2px;"></td> */ ?>
			<td style="font-size: 14px;	 text-align: right; padding: 2px 0 0 5px;">1</td>
			<td style="font-size: 14px;	 text-align: left; padding: 2px; width:75%"><?php echo $voucher['description']; ?></td>
			<td style="font-size: 14px;	 text-align: right; padding: 2px;"><?php echo $voucher['amount']; ?></td>
		  </tr>
		  <?php } ?>
		</tbody>

		<tfoot style="page-break-before: auto;">
		  <?php foreach ($totals as $total) { ?>
		  
		  <?php if($total['title'] == 'Total'){ ?>
		  <tr>
			<td colspan="3"><div style="height:2px;background-color:#000; margin:3px 0 6px 0;"></div></td>
		  </tr>	
		  <?php } ?>
		  <tr>
			<td colspan="2" style="font-size: 14px;	 text-align: left; padding: 2px 0 0 5px;" ><b><?php echo $total['title']; ?>:</b></td>
			<td style="font-size: 14px;	 text-align: right; padding: 2px;"><?php if($total['text'] != '$0.00'){ echo $total['text']; } ?></td>
		  </tr>
		  <?php } ?>
		</tfoot>
		
	</table>
	
</div>
</body>
</html>
