<?php echo $header; ?>

	<section class="ordering_options">
		<h2 class="top_head m0"><?php echo $heading_title; ?></h2>
			<div class="outerContainer">

				<div class="contentSection FullWidth">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
						    <div class="backPage">
							  	<span>
									<a class="back_bt Disblock" href="<?php echo $continue; ?>">BACK TO HOME<?php //echo $breadcrumbs[0]['text']; ?></a>
							  	</span>
						    </div>
							<div class="settingListing wd100P bk-success">
								<div class="CommonInputForm loginInputForm success-form">
									<?php echo $text_message; ?>
									<!--<a href="<?php echo $continue; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" ><?php echo $button_order_history; ?></a>-->
									<!--<a href="<?php echo $continue; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" ><?php echo $button_my_account; ?></a>-->
									<!--<a href="<?php echo $continue; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" ><?php echo $button_order_again; ?></a>-->
<?php
									if( !isset( $logged_out) ) {
?>
										<a href="<?php echo $order_history_url; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" >Order history</a>
										<a href="<?php echo $my_account_url; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" >My account</a>
										<a href="<?php echo $continue; ?>"  style="text-transform: uppercase;" class="btn btn-block mT10 btn-success-order" >Order again</a>
<?php
									}
?>
								</div>
							</div>
						</div>
					</div>
				</div>        
			</div>
	</section>
		
<?php echo $footer; ?>
 