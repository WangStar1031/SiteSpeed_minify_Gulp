<?php if($delivery_option == '' || $delivery_option == 3){ //for both pikcup and delivery ?>	<?php		// echo "<pre>";			// echo date('d-m-Y H:i', '1484308800');		// // print_r($locationTimingsArr);		// echo "</pre>";		foreach($locationTimingsArr as $key=>$val){	?>	<div  style="margin:20px 0px;">		<table class="pick_date margin-center" id="<?php echo 'table_this_day_'.$key; ?>" style="display:none;">		<?php			if(!empty($val['timeIntervals'])) {				$ot_id = 100;				foreach($val['timeIntervals'] as $tkey => $tVal) {					$unique = $ot_id.$val['day'];		?>			<?php if($tVal['pickup'] != '0' || $tVal['delivery'] !='0'){?>			<tr class="" id="order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'order_time_<?php echo $unique; ?>');" >				<td class=""><?php echo $tkey; ?></td>				<td class="pick green">				<?php if($tVal['pickup'] != '0'){ echo '<i class="fa fa-check-circle"></i> Pickup'; } ?> 				</td>				<td class="pick green">				<?php if($tVal['delivery'] != '0'){ echo '<i class="fa fa-check-circle"></i> Delivery'; } ?>				</td>			</tr>			<tr id="confirm_order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'confirm_order_time_<?php echo $unique; ?>');" style="display:none;">				<td colspan="3">					<div>						<a class="button button-block button-green confirmTime" href="javascript:void(0)" onclick="saveLaterOrderTimings('<?php echo $unique; ?>')" id="button_confirm_order_time_<?php echo $unique; ?>"></a>					</div>					<input type="hidden" value="<?php echo $tkey; ?>" id="later_time_<?php echo $unique; ?>" name="later_time" />					<input type="hidden" value="<?php echo $tVal['timeStamp']; ?>" id="later_timestamp_<?php echo $unique; ?>" name="later_timestamp" />					<input type="hidden" value="<?php if($tVal['pickup'] != '0') echo $tVal['pickup']; ?>" id="pickup_status_<?php echo $unique; ?>" name="pickup_status" />					<input type="hidden" value="<?php if($tVal['delivery'] != '0') echo $tVal['delivery']; ?>" id="delivery_status_<?php echo $unique; ?>" name="delivery_status" />					<input type="hidden" value="<?php echo $key; ?>" id="day_id_<?php echo $unique; ?>" name="day_id" />				</td>			</tr>			<?php  }?>		<?php  			$ot_id++;					}			}else{			?>			<tr>				<td colspan="3"><i class="fa fa-info-circle"></i> We are not taking online orders for this day.</td>			</tr>		<?php 			}		?>				</table>	</div>	<?php		}	?><?php }elseif($delivery_option == 2){ //for delivery only	?>	<?php		foreach($locationTimingsArr as $key=>$val){	?>	<div  style="margin:20px 0px;">		<table class="pick_date margin-center" id="<?php echo 'table_this_day_'.$key; ?>" style="display:none;">		<?php			if(!empty($val['timeIntervals'])){				$ot_id = 100;				foreach($val['timeIntervals'] as $tkey =>  $tVal){					$unique = $ot_id.$val['day'];		?>			<?php if($tVal['delivery'] != ''){ ?>			<tr class="" id="order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'order_time_<?php echo $unique; ?>');" >				<td class=""><?php echo $tkey; ?></td>				<td colspan="2" class="pick green">				<?php if($tVal['delivery'] != ''){ echo '<i class="fa fa-check-circle"></i> Delivery'; } ?>				</td>			</tr>			<tr id="confirm_order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'confirm_order_time_<?php echo $unique; ?>');" style="display:none;">				<td colspan="3">					<div>						<a class="button button-block button-green confirmTime" href="javascript:void(0)" onclick="saveLaterOrderTimings('<?php echo $unique; ?>')" id="button_confirm_order_time_<?php echo $unique; ?>"></a>					</div>					<input type="hidden" value="<?php echo $tkey; ?>" id="later_time_<?php echo $unique; ?>" name="later_time" />					<input type="hidden" value="<?php echo $tVal['timeStamp']; ?>" id="later_timestamp_<?php echo $unique; ?>" name="later_timestamp" />					<input type="hidden" value="0" id="pickup_status_<?php echo $unique; ?>" name="pickup_status" />					<input type="hidden" value="<?php echo $tVal['delivery']; ?>" id="delivery_status_<?php echo $unique; ?>" name="delivery_status" />					<input type="hidden" value="<?php echo $key; ?>" id="day_id_<?php echo $unique; ?>" name="day_id" />				</td>			</tr>			<?php  }?>		<?php  			$ot_id++;					}			}else{			?>			<tr>				<td colspan="3"><i class="fa fa-info-circle"></i> We are not taking online orders for this day.</td>			</tr>		<?php 			}		?>				</table>	</div>	<?php		}	?>		<?php }elseif($delivery_option == 1){ //for pickup only ?>	<?php		foreach($locationTimingsArr as $key=>$val){	?>	<div  style="margin:20px 0px;">		<table class="pick_date margin-center" id="<?php echo 'table_this_day_'.$key; ?>" style="display:none;">		<?php			if(!empty($val['timeIntervals'])){				$ot_id = 100;				foreach($val['timeIntervals'] as $tkey =>  $tVal){					$unique = $ot_id.$val['day'];		?>			<?php if($tVal['pickup'] != ''){ ?>			<tr class="" id="order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'order_time_<?php echo $unique; ?>');" >				<td class=""><?php echo $tkey; ?></td>				<td colspan="2" class="pick green">					<?php if($tVal['pickup'] != ''){ echo '<i class="fa fa-check-circle"></i> Pickup'; } ?> 				</td>			</tr>			<tr id="confirm_order_time_<?php echo $unique; ?>" onclick="show_confirm_button('<?php echo $tkey; ?>', 'confirm_order_time_<?php echo $unique; ?>');" style="display:none;">				<td colspan="3">					<div>						<a class="button button-block button-green confirmTime" href="javascript:void(0)" onclick="saveLaterOrderTimings('<?php echo $unique; ?>')" id="button_confirm_order_time_<?php echo $unique; ?>"></a>					</div>					<input type="hidden" value="<?php echo $tkey; ?>" id="later_time_<?php echo $unique; ?>" name="later_time" />					<input type="hidden" value="<?php echo $tVal['timeStamp']; ?>" id="later_timestamp_<?php echo $unique; ?>" name="later_timestamp" />					<input type="hidden" value="<?php echo $tVal['pickup']; ?>" id="pickup_status_<?php echo $unique; ?>" name="pickup_status" />					<input type="hidden" value="0" id="delivery_status_<?php echo $unique; ?>" name="delivery_status" />					<input type="hidden" value="<?php echo $key; ?>" id="day_id_<?php echo $unique; ?>" name="day_id" />				</td>			</tr>			<?php  }?>		<?php  			$ot_id++;					}			}else{			?>			<tr>				<td colspan="3"><i class="fa fa-info-circle"></i> We are not taking online orders for this dayyyyyyy.</td>			</tr>		<?php 			}		?>				</table>	</div>	<?php		}	?><?php } //end if delivery option ?>