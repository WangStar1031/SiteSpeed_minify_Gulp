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
			
?>
	<a href="javascript:void(0)" id="selectedLocation_<?php echo $val['id']; ?>" >
		<li class="<?php echo $class; ?>" >
			<p>
				<span><?php echo $val['title']; ?></span>
				<br/>
				<small><?php echo $val['display_address']; ?></small>
			</p>
		</li>
	</a>	
<?php
	 $i++;	}
	}	
?>