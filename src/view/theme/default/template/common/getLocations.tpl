<?php 
	$class = '';
	$i = 1;

	if($locationsArr){
		foreach($locationsArr as $val){
			

			if($i%2 == 0){
				$class = 'gray';
			}else{
				$class = 'white';
			}
			
			$locationStatus = $val['status'];
			$clover_enabled = $val['is_clover_enabled'];
			
?>
<?php if($locationStatus == 1){ ?>
	<a href="javascript:void(0)" id="selectedLocation_<?php echo $val['id']; ?>" >
	<?php if($clover_enabled == 1){ ?>
	<input type="hidden" id="clover_enabled_<?php echo $val['id']; ?>" value="<?php echo $clover_enabled; ?>" />
<?php } ?>
		<li class="<?php echo $class; ?>" >
			<p>
				<span><?php echo $val['title']; ?></span>
				<br/>
				<small><?php echo $val['display_address']; ?></small>
			</p>
		</li>
	</a>
<?php }?>	
<?php
	 $i++;	}
	}	
?>