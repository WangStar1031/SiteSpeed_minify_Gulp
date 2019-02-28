<li class="gray custom_pad_gray">
	<div class="full-width text-center">
		<a href="javascript:void(0);" onclick="goBackToChooseTime()" class="back_bt shop_font_color" style="position: static;background:none;"><span style="font-size:150%; vertical-align:middle; font-weight:bolder;"><i class="fa fa-angle-left"></i></span> BACK</a>
	</div>
	<div class="clear"></div>
	<div class="date_calender">
		<div class="col-sm-12">
			<div class="chose_date chose_date_custom">
	<?php	if(!empty($dayDateArr)) {	?>
				<p class="text-center">Choose a date and time</p>
	<?php	} ?>
				<div class="mobile-align-center">
					<center>
						<ul class="day-date-list">
						<?php 
							if(!empty($dayDateArr)){									
								$thisDayId = 0;
								$showOnly = 0;
								foreach($dayDateArr as $dayDate){
									// if(empty($dayDate['storeOpenStatus'])) continue;
									if($showOnly >= 4)break; //to display ony 4 dates from today, including today;
									// $this_day_id = date('N', strtotime('+'.$thisDayId.' days'));
									$this_day_id = $dayDate['dayId'];
						?>
						
							<li id="<?php echo 'li_'.$dayDate['full_date']; ?>">
								<a href="javascript:void(0);" id="<?php echo 'this_day_'.$this_day_id; ?>" ><?php echo $dayDate['day']; ?><span class="shop_font_color"><?php echo $dayDate['date']; ?></span></a>
							</li>
							
						<?php 
								$thisDayId++;
								$showOnly++;
								}
							}
						?>
						<div class="clear"></div>
						</ul>
					</center>	
				</div>

		<?php	if(!empty($dayDateArr)) {
		?>
				<p id="pick_day_date" class="text-center pick_day">Pick a day to see available times.</p>
				<div id="allLocationsTiming" class="bottom_contant bottom_content_custom">
				</div>
		<?php
				} else {
					echo '<i class="fa fa-info-circle"></i> We are not taking online orders for this time.';
				}
		?>
			</div>
		</div>
	</div>
</li>