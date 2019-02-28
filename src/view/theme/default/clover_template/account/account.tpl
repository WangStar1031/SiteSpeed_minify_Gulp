<?php echo $header; ?>

<section class="ordering_options">
	<h2 class="top_head m0 text-uppercase"><?php echo $text_my_account; ?></h2>
		<div class="outerContainer">
			<div class="contentSection FullWidth">
				<div class="row"> 
					<div class="col-md-12 col-sm-12 col-xs-12 account-background">
						<div class="backPage">
							<span>
								<?php 
									if($orderingOptionsSet){
								?>		
										<a class="back_bt Disblock" href="<?php echo $breadcrumbs['menuOptionsUrl']['href'] ?>">BACK TO MENU ITEMS</a>
								<?php	
									}else{
								?>		
										<a class="back_bt Disblock" href="<?php echo $breadcrumbs[0]['href'] ?>">BACK TO ORDERING OPTIONS</a>
								<?php	
									}
								?>	
							</span>
						</div>
						<div class="settingListing">
							<ul>
								<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
								<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
								<!-- <li><a href="<?php //echo $address; ?>"><?php //echo $text_address; ?></a></li> -->
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>      
		</div>
</section>

<?php /*
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?> 
	
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_my_account; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <?php // <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li> ?>
		<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		<?php // <li><a href="<?php echo $usual; ?>"><?php echo $text_usual; ?></a></li> ?>
      </ul>
	  <?php
      // <h2><?php echo $text_my_orders; ?></h2>
      // <ul class="list-unstyled">
        // <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        // <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        // <?php if ($reward) { ?>
        // <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        // <?php } ?>
        // <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        // <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        // <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      // </ul>
      // <h2><?php echo $text_my_newsletter; ?></h2>
      // <ul class="list-unstyled">
        // <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      // </ul>
	  ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
*/ ?>

<?php echo $footer; ?>