<?php echo $header; ?><div class="container">    <div class="row"><?php echo $column_left; ?>    <?php if ($column_left && $column_right) { ?>    <?php $class = 'col-sm-6'; ?>    <?php } elseif ($column_left || $column_right) { ?>    <?php $class = 'col-sm-9'; ?>    <?php } else { ?>    <?php $class = 'col-sm-12'; ?>    <?php } ?>    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>      <div class="food_sec">    <div class="wrapper">    <div class="burger_food">        <h1 class="new-design-cart-heading"><?php echo $heading_title; ?></h1>              </div>      <div class="">        <?php if ($products) { ?>       <ul>        <?php foreach ($products as $product) { ?>		<a href="<?php echo $product['href']; ?>">        <li class="tender_text">           <?php /* <!--<div class="cat_img"><a href="<?php //echo $product['href']; ?>"><img src="<?php //echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>-->            <div class="cat_cont"><h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>            <p><a href="<?php echo $product['href']; ?>"><?php echo $product['description']; ?></a></p></div>            <div class="cat_add">              <span class="price_box"> <?php if ($product['price']) { ?>                  <?php if (!$product['special']) { ?>                  <?php echo $product['price']; ?>                  <?php } else { ?>                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>                  <?php } ?>                  <?php if ($product['tax']) { ?>                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>                  <?php } ?>                <?php } ?></span><br /><br />              <a href="javascript:;" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="btn btn_smal btn_add_pad add_to_order_box">Add to Order</a>            </div>                        <!--<div class="rating_cat"><img src="images/ct.png" /></div>-->			*/ ?>			<?php /*			<div class="tender_left"> 				<span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></span>				<p><a href="<?php echo $product['href']; ?>"><?php echo $product['description']; ?></a></p>			</div>			<a href="javascript:;" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" >				<div class="tender_right add_to_order_box">					<span> <?php if ($product['price']) { ?>					  <?php if (!$product['special']) { ?>					  <?php echo $product['price']; ?>					  <?php } else { ?>					  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>					  <?php } ?>					  <?php if ($product['tax']) { ?>					  <span><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>					  <?php } ?>					<?php } ?></span>					<strong>Add to Order</strong>				</div>			</a>			*/ ?>			<!-- Above code Modified for locations setup and commented out -->							<div class="tender_left"> 					<span><?php echo $product['name']; ?></span>					<p><?php echo $product['description']; ?></p>				</div>				<div class="tender_right add_to_order_box">						<span> <?php if ($product['price']) { ?>						  <?php if (!$product['special']) { ?>						  <?php echo $product['price']; ?>						  <?php } else { ?>						  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>						  <?php } ?>						  <?php if ($product['tax']) { ?>						  <span><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>						  <?php } ?>						<?php } ?></span>						<strong>Add to Order</strong>				</div>						<!-- Modified code for locations setup end -->        </li>		</a>       <?php } ?>        </ul>       <?php } ?>       		<?php if(!empty($pagination)){ ?>		  <div class="row">			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>			<div class="col-sm-6 text-right"><?php echo $results; ?></div>		  </div>		<?php } ?>  	  	  	  </div>	  	  	  <?php if (!$categories && !$products) { ?>      <p><?php echo $text_empty; ?></p>      <div class="buttons">        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary shop_btn"><?php echo $button_continue; ?></a></div>      </div>      <?php } ?>    </div>  </div>    <?php echo $content_bottom; ?></div>    <?php echo $column_right; ?></div></div><?php 	$locationSet = false;	if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){		$locationSet = true;		}	$step_back_url	= false;	if(isset($breadcrumbs) && !empty($breadcrumbs)){		$step_back_url 	= $breadcrumbs[0]['href'].'&step_back=categories';	}?><script>	var locationSet 	= '<?php echo $locationSet; ?>';	var step_back_url	= '<?php echo $step_back_url; ?>';	if(locationSet && step_back_url){		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> Categories').show();	}	</script>	<?php //echo '<pre>'; print_r($_SESSION); print_r($breadcrumbs); die(); ?><?php echo $footer; ?>