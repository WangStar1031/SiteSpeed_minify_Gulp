<?php $html_content = '';

$html_content .= '<div style="width: 2.9in;">';
 /* if($logo && $logo != ''){ */ 
$html_content .=		'<center><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/printer_logo.png" alt="'.$store_name.'" style="margin-bottom: 20px; border: none; max-height:80px; width:auto;" /></center>';
	 /* }  */	
	 
if($OrderTypeId == 'order_for_later'){	 
	$html_content .= '<br/>';
	$html_content .=	'<center><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/orderforlater.png" alt="'.$store_name.'" style="margin-top: -36px; border: none; max-height:80px; width:auto;" height="20px" width="20px"/></center> </br>';
	$html_content .= '<center><b>'.$combinedOrderTime_monthDate .' @ '. $combinedOrderTime_time.'</b></center>';	
}
$html_content .=	'<div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div>';	
$html_content .=	'<div style="text-align:center;">';
$html_content .=	'<strong>'.$locationName.'</strong>';
$html_content .=	'</div>';
$html_content .=	'<div style="text-align:center; font-size:12px;">';
$html_content .=	'<strong>Order ID: '.$order_id.'</strong>';
$html_content .=	'</div>';
$html_content .=	'<div style="text-align:center; font-size:12px;">';
$html_content .=	'Ordered at '.$date_added.'';
$html_content .=	'<!-- <br/> Paid - -->';
$html_content .=	'</div>';	
	
$html_content .=	'<div style="height:3px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div>';

$html_content .=	'<div style="font-weight:600; text-align:center; font-size: 145%;">';
 
$html_content .=	'<p style="margin:5px 0px">';
		
				if(!empty($customerFirstName)){ 
$html_content .=	''.$customerFirstName.'<br/>'.$customerLastName.'';
					}else{
$html_content .=	'Customer';	
					}	
$html_content .=	'</p>';
$html_content .=	'</div>';
					if(isset($number) && !empty($number)){
					if($number!=''){
	
$html_content .=	'<div style="margin:8px 5px; text-align:center">';
$html_content .=	'Credit Card: '.$number.' </br>';
$html_content .=	'</div>'; 
						}
					}

		
$html_content .=	'<div style="margin:8px 5px; text-align:center">';
$html_content .=	'Phone: '.$telephone.'';
$html_content .=	'</div>';
	
				if(isset($delivery_address) && !empty($delivery_address)){
				if($delivery_address !=''){
$html_content .=	'<div style="text-align:center;">';	
$html_content .=	'<!-- DELIVERY # order_id -->';
$html_content .=	'ADDRESS: '.$delivery_address.'';
$html_content .=	'</div>';
						}
					}
	
				if($add_note){
$html_content .=	'<div style="text-align:center;">	
		<!-- DELIVERY# order_id -->
		NOTE: '.wordwrap($add_note,30,"<br>\n",TRUE).'
	</div>';
				}
if(isset($number) && !empty($number) ){
			if($number != ''){	
		$html_content .=	'<div style="height:1px;background-color:#000; margin:3px 0 6px 0; position:relative; width:100%; "><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/paid_stamp.png" alt="'.$store_name.'" title="'.$store_name.'" style="margin-bottom: 20px; border: none; max-height:80px; width:auto;position: absolute;top: 15px;z-index: 999999;left: 85px;transform: rotate(9deg);" width="50px;" height="50px"></div>';
	}
}	
$html_content .=	'<div style="text-align:center;">';	
$html_content .=	'<!-- Pick Up# order_id -->';
$html_content .=	''.$order_delivery_method.' @ '.$combinedOrderTime.'';
$html_content .=	'</div>';
	
	
$html_content .=	'<table style="border-collapse: collapse; width: 100%;  margin-bottom: 20px;">
		<tbody>
		  <tr>
			<td colspan="3" style="font-size: 14px; font-weight: bold; text-align: left; padding: 2px 0 0 5px;"># Items</td>
		  </tr>	
		  <tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div></td>
		  </tr>';	
			$prepTimeArr = array();
			$tempArrOption = array();
		
			foreach($products as $product){
				$product_name	=	trim($product['name']);
				if(strlen($product_name) < 1)continue;
				$tempArrOption = array();
					$i  =	1;
					$j =	0;	
			 
$html_content .=	'<tr>
			<td colspan="3" style="padding: 2px 0 0 5px;">
				<table style="width: 275px;">';
$html_content .=	'<tr>
						<td style="font-size: 14px; text-align: right; padding: 2px 0 0 0; width:5%; vertical-align:top">'.$product['quantity'].'</td>
						<td style="font-size: 14px; text-align: left; padding: 2px;width:75%; vertical-align:top">';
			
							$prepTimeArr[] = $product['prep_time'];
$html_content .=			''.$product['name'].'';

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
							
					
$html_content .=		'</td>
						<td style="font-size: 14px;	text-align: right; padding: 2px; vertical-align:top; width:20%;">';
						if($netProdcutPrice != 0.00) {
// $html_content .=		 '$'.$netProdcutPrice * $product['quantity']; 
// $html_content .=		 $product['uncalculatedPrice'];
						if( $product['uncalculatedPrice'] != '$0.00'){
$html_content .=		 $product['uncalculatedPrice'];
							
						}
							}
$html_content .=			'</td>
					</tr>';
	if( $option['simple_option'] == 0 ){				
			foreach($product['option'] as $key=>$options){
			ksort($options) ;
					foreach($options as $type=>$topping_option){
						
					foreach($topping_option as $option1){
								if(!in_array($option1['name'],$tempArrOption)){
$html_content .=	'<tr>
					<td style="font-size: 14px; text-align: right; width:5%; vertical-align:top"></td>
					<td style="font-size: 14px; text-align: left; width:65%; vertical-align:top">';										
$html_content .=				'<div style="font-size: 13px; clear:both;">'.'- '.$option1['name'].': </div>';
$html_content .=	'</td>';
$html_content .=	'<td style="font-size: 14px; text-align: right; vertical-align:bottom; width:20%;">';

$html_content .=	'</td></tr>';
										$tempArrOption[] = $option1['name'] ;
										$j 	=	1;
										$i 	=   0;		
									}						
						
						
					}
$html_content .=	'<tr>
					<td style="font-size: 14px; text-align: right; width:5%; vertical-align:top"></td>
					<td style="font-size: 14px; text-align: left; width:65%; vertical-align:top ">';				
		//$html_content .= '<div class="subitems bold" style="margin-top: 1px;"></div>';
		$html_content .= '<div style="font-size: 13px;  border-bottom: 1px solid;width:43px;">';
							  if( $type == '2' ){ 
								$html_content .='RIGHT';  
							  }  
							  if(  $type == '1' ){ 
								$html_content .= 'LEFT '; 
							  }  
							  if(  $type == '0' ){ 
								$html_content .= 'ALL '; 
							  } 
		$html_content .= '</div>';							
$html_content .=	'</td>';
$html_content .=	'<td style="font-size: 14px; text-align: right; vertical-align:bottom; width:30%;">';

$html_content .=	'</td></tr>';			
						
						

					foreach($topping_option as $option){
					
$html_content .=	'<tr>
						<td style="font-size: 14px; text-align: right; width:5%; vertical-align:top"></td>
						<td style="font-size: 14px; text-align: left; width:65%; vertical-align:top">';
							
							    

									
				        if (trim($option['value'])!=''){
						
							
							
 						if ($option['option_qty']!=0){	
$html_content .=			'&nbsp;<small><span style="padding-left:8px; font-size:13px; clear:both;">'.$option['option_qty'].' x</span></small>';
						}						
$html_content .=			'&nbsp;<small><span style="padding-left:8px; font-size:13px; clear:both;">'.$option['value'].'</span></small>';
 
						   }else{
$html_content .=			'<div style="clear:both;"></div>';
						}									
									
									
									


$html_content .=			'</td>';
$html_content .=		'<td style="font-size: 14px; text-align: right; vertical-align:bottom; width:30%;">';
								if(!in_array($option['name'],$tempArrOption)){
										// echo '<div style="clear:both;"></div>';
										// $tempArrOption[] = $option['name'] ;
										// $j 	=	1;
										// $i 	=   0;	
										// echo '<br/>';
									}
									
									if($option['price'] != '$0.00') {
									$option_price =	'';
									$option_price =	str_replace('$', '', $option['price']) * $product['quantity'];
									if($option_price == 0){
$html_content .=					'--'; 
									}else{
											if( $option['topping_option'] == 2 ){
$html_content .=			 '<small><span style="font-size:11px; clear:both;">2x</span></small>&nbsp;&nbsp;';
											}										
$html_content .=					'$'.sprintf("%.2f",$option_price).''; 
									}
}
							
$html_content .=		'</td>
					</tr>';
					 }
			}
			}	
			}	else{
				 foreach ($product['option'] as $option) { 
$html_content .=	'<tr>
						<td style="font-size: 14px; text-align: right; width:5%; vertical-align:top"></td>
						<td style="font-size: 14px; text-align: left; width:70%; vertical-align:top">';
							
							    
								if(!in_array($option['name'],$tempArrOption)){
$html_content .=				'<div style="font-size: 13px; clear:both;">'.'- '.$option['name'].': </div>';
										$tempArrOption[] = $option['name'] ;
										$j 	=	1;
										$i 	=   0;		
									}
									
				        if (trim($option['value'])!=''){
 
						if ($option['option_qty']!=0){	
$html_content .=			'&nbsp;<small><span style="padding-left:8px; font-size:13px; clear:both;">'.$option['option_qty'].' x</span></small>';
						}						
$html_content .=			'&nbsp;<small><span style="padding-left:8px; font-size:13px; clear:both;">'.$option['value'].'</span></small>';
						if( $option['topping'] > 0 && $option['topping_option'] == 2 ){
$html_content .=			 '&nbsp;<small><span style="padding-left:8px; font-size:11px; clear:both;">2x</span></small> ';
							 }
						   }else{
$html_content .=			'<div style="clear:both;"></div>';
						}									
									
									
									


$html_content .=			'</td>';
$html_content .=		'<td style="font-size: 14px; text-align: right; vertical-align:bottom; width:20%;">';
								if(!in_array($option['name'],$tempArrOption)){
										// echo '<div style="clear:both;"></div>';
										// $tempArrOption[] = $option['name'] ;
										// $j 	=	1;
										// $i 	=   0;	
										// echo '<br/>';
									}
									
									if($option['price'] != '$0.00') {
									$option_price =	'';
									$option_price =	str_replace('$', '', $option['price']) * $product['quantity'];
									if($option_price == 0){
$html_content .=					'--'; 
									}else{
										
$html_content .=					'$'.sprintf("%.2f",$option_price).''; 
									}
}
							
$html_content .=		'</td>
					</tr>';			
				 }
			} //end foreach
$html_content .=		 '</table>
			</td>
		  </tr>';
						if(isset($product['special_instructions']) && $product['special_instructions'] != ''){
$html_content .=	  '<tr>
						<td colspan="3" style="font-size: 14px; text-align: left; padding: 2px 0 8px 5px;">
							<span style="font-weight:500;">Special Instructions:</span><br/>
							<small><span style="padding-left:8px; font-size:10px;">'.$product['special_instructions'].'</span></small>
						</td>
					  </tr>';	
					}
				}
$html_content .=  '<tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div></td>
		  </tr>';
		  
			$totalPrepTime = array_sum($prepTimeArr);			
			$locationDeliveryReadyTime = $deliveryReadyTime;
		$displayReadyTime = $display_ready_time;
		if($displayReadyTime == 0){		
			if($totalPrepTime != '0.00' || !empty($min_order_prep_time)){
				
$html_content .=  '<tr>

			<td colspan="2">Preparation Time(approx):</td>
			<td style="text-align:right;">';

/*
*	1. if locaton wise delivery time is greater than 0 and greater than totalpreptime ( which is particular item time) and greater than min_order_prep_time then location time will print. 
*	2. if totalPrepTime is less than min_order_prep_time ( which is ordering time) then min_order_prep_time will print.  
*	3. if 1st and 2nd not meet the condition then totalpreptime will print.   
*/
if( $order_delivery_method =='PICKUP' ){
	if($min_order_prep_time > 0 && $min_order_prep_time > $totalPrepTime){
		//$pre_time = 'PICKUP-IF-IF';
$html_content .= ''.$min_order_prep_time.' min';
	}else{
		//$pre_time = 'PICKUP-IF-ELSE';
$html_content .= ''.$totalPrepTime;
	}
}else{
	if($locationDeliveryReadyTime > 0 && $locationDeliveryReadyTime > $totalPrepTime ){
		//$pre_time = 'DELIEVERY-IF-IF';
$html_content .= $locationDeliveryReadyTime.' min';				
	}else{
		//$pre_time = 'DELIEVERY-IF-ELSE';
$html_content .= $totalPrepTime.' min';
	}
}

			
/* 					if($locationDeliveryReadyTime > 0 && $locationDeliveryReadyTime > $totalPrepTime && $locationDeliveryReadyTime > $min_order_prep_time){
$html_content .=	''.$locationDeliveryReadyTime.' min';				
					}
					elseif($totalPrepTime < $min_order_prep_time){
$html_content .=	''.$min_order_prep_time.' min';
					}else{
$html_content .=	''.$totalPrepTime.' min';
					} */	
$html_content .=	'</td>
		  </tr>
		  <tr>
			<td colspan="3"><div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div></td>
		  </tr>';
			 } //end if 
			}//end display ready time IF 
foreach($vouchers as $voucher){
	$html_content .=  '<tr>
				 <!-- <td style="font-size: 14px;	 text-align: left; padding: 2px;"></td> -->
				<td style="font-size: 14px;	 text-align: right; padding: 2px 0 0 5px;">1</td>
				<td style="font-size: 14px;	 text-align: left; padding: 2px; width:75%">'.$voucher['description'].'</td>
				<td style="font-size: 14px;	 text-align: right; padding: 2px;">'.$voucher['amount'].'</td>
			  </tr>';
}
$html_content .= '</tbody>';
		
//$html_content .=	'<div style="height:1px;background-color:#000; margin:3px 0 6px 0; z-index:2;">';
$html_content .=	'<div style="height:1px;background-color:#000; margin:3px 0 6px 0; width:275px;">';
/*
if(isset($number) && !empty($number) ){
	if($number != ''){
					
		$html_content .=	'<center><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/paid_stamp.png" alt="'.$store_name.'" style="margin-bottom: 20px; border: none; max-height:80px; width:auto;" height="50px" width="50px"/></center> </br>';
		
	}
}
	*/
/*	
if($OrderTypeId == 'order_for_later'){

	$html_content .= '<br/>';
	$html_content .=	'<center><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/orderforlater.png" alt="'.$store_name.'" style="margin-bottom: 20px; border: none; max-height:80px; width:auto;" height="50px" width="50px"/></center> </br>';
	
	$html_content .= '<center><b>'.$combinedOrderTime_monthDate .' @ '. $combinedOrderTime_time.'</b></center>';

}
*/

$html_content .=	'</div>';
	
$html_content .= '<tfoot style=" background-image:url(\'/ordering/common/upload/catalog/view/theme/default/image/paid_stamp.png\'); page-break-before: auto;">';
 
			foreach ($totals as $total) { 
		  
			if($total['title'] == 'Total'){

if(isset($number) && !empty($number) ){
		if($number != ''){
					 
	$html_content .=  '<tr>
			<td colspan="3"><div style="height:2px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div></td>
		  </tr>';
	  
		}
		
	} else {
		$html_content .=  '<tr>
			<td colspan="3"><div style="height:2px;background-color:#000; margin:3px 0 6px 0; width:275px;"></div></td>
		  </tr>';	
	}
			}
$html_content .=  '<tr>
			<td colspan="2" style="font-size: 14px;	 text-align: left; padding: 2px 0 0 5px;" ><b>'.$total['title'].': </b></td>';
$html_content .=	'<td style="font-size: 14px; text-align: right; padding: 2px;">'; 


			if($total['text'] != '$0.00' || $total['title'] == 'Revised Sub-Total'){
$html_content .=	''.$total['text'].'';
				}
$html_content .=	'</td>
		  </tr>';
			}

$html_content .=	'</tfoot>';
		
$html_content .=	'</table>';
	if(isset($number) && !empty($number) ){
			if($number != ''){
	$html_content .=	'<div><img src="'.BASE_URL.'upload/catalog/view/theme/default/image/paid_stamp.png" alt="'.$store_name.'" title="'.$store_name.'" style=" margin-top: -132px; border: none; max-height:80px; width:auto;position: absolute; z-index: 999999;left: 98px;" width="50px;" height="50px"></div>';
		}
	}		
$html_content .= '</div>';

?>

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
<?php
if(isset($no_of_prints) && !empty($no_of_prints)){
}else{
	$no_of_prints = 1;
}
$html_tmp	=	'';
for($i = 1;$i <= $no_of_prints;$i++){
$html_tmp	.=	$html_content;
}
echo $html_tmp;
?>
</body>
</html>
