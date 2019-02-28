
<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Your Website</title>
</head>

<body>
		 <div class="order_outer" style=" max-width: 480px;background:#778b8b;margin:0 auto;padding: 5px; overflow: hidden;">
				<div class="order_inner" style="padding: 0.8%;width: 97.4%;float:left;border: 3px solid grey;background:#8faaaa url('<?php echo $base; ?>upload/catalog/view/theme/default/image/register_email_templ_bg.png') no-repeat scroll 0 0">
				
						<p style="margin:0;width:100%;text-align:center;"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/commerce.png" width="30" height="" /></p>
					<p style="margin:0;width:100%;text-align:center;"><?php echo $text_greeting; ?> </p>
						
						<p style="margin:0;"><?php echo $text_link; ?></p>
						
						<p style="margin:0;width:100%;text-align:center;"><a href="<?php echo $link; ?>" style="color:#15c;font-weight:bold;">BiteHeist Order Info</a> </p>
						
						<p style="margin:0;width:100%;text-align:center;color:#fff;"> ------------------------------</p>
							
							<div class="order_content_outer" style="float:left;width:98%;background:#fff;padding: 1%;">
							<p style="margin:0;font-weight:bold;"><?php echo $text_order_detail; ?></p>
							<p style="margin:0;"><?php echo $text_order_id; ?> <?php echo $order_id; ?></p>
							<p style="margin:0;"><?php echo $text_email; ?><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></p>
							<p style="margin:0;"><?php echo $text_telephone; ?> <span style="font-style:italic; font-weight: 600;"><?php echo $telephone; ?> </span></p>
							<p style="margin:8px 0 0 0;font-weight:bold;">Payment Details</p>
							<p style="margin:0;font-style:italic;color:grey;"><?php echo $payment_card_details; ?></p>
							
							<p style="margin:0;float:left;width:100%;text-align:center;">------------------------------------------------</p>
							
								 <ul style="float:left;width:100%;padding:0;list-style:none; border-bottom: 2px solid #8d8d8d; padding-bottom: 15px;">
										<li style="float:left;width:100%;padding:0;list-style:none;margin-bottom:5px;margin-left:0px;">
											<span style="float:left;width:auto;color: #505e6a;font-size: 18px;  font-weight: bold;margin-left:0;"><?php echo $text_product; ?></span>
											
											<span  style="font-size:18px;color:#505e6a;float:right;margin-left: 10px;  font-weight: bold;"><?php echo $text_price; ?></span>
											<span  style="font-size:20px;color:#505e6a;float:right;  font-weight: bold;"><?php echo $text_quantity; ?></span>
										</li>
														<?php foreach ($products as $product) { ?>
	  
														<?php
															$product_name	=	trim($product['name']);
														if(strlen($product_name) < 1)continue;
														$optionCount = count($product['option']); 
														?>
										<li style="float:left;width:100%;padding:0;list-style:none;margin-bottom:5px;margin-left:0;">
											<span style="float:left;width:auto;color: #505e6a;font-size: 18px;"><?php echo $product['name']; ?></span>
											
											<span  style="font-size:18px;color:#505e6a;float:right;margin-left: 10px;"><?php echo $product['uncalculatedPrice']; ?></span>
											<span  style="font-size:18px;color:#505e6a;float:right;"><?php echo $product['quantity']; ?></span>
										</li>
										<?php $i = 1; foreach ($product['option'] as $option) { ?>
										<li style="float:left;width:100%;padding:0;list-style:none;margin-bottom:5px;margin-left:0;">
											<div style="margin-bottom: 5px;  width: 100%;">
												<div style=";width:auto;color: #505e6a;font-size: 18px;  font-weight: bold;"><?php echo $option['name']; ?>: </div>
											
												<div style="float:left"> - <?php echo $option['value']; ?>	</div>
												<div style="float:right">
													<?php echo $option['price']; ?>	
												</div>
												
											</div>
										</li>

								  <?php $i++; } ?>
							  
							<?php } //end foreach $products ?>
								 
								 </ul>
								 
								 <ul style="float:left;width:100%;padding:0;list-style:none;  margin: 0;" >
								    <?php foreach ($totals as $total) { ?>
										<li><p style=" margin: 5px 0;"><strong style="color:#505e6a;font-size:18px; "><?php echo $total['title']; ?>:</strong><b style="float:right;color:#505e6a;font-size:18px;"><?php echo $total['text']; ?></b></p></li>
									 <?php } ?>

						
					</ul>
							</div>
				
				
				</div>
				
		 
		 </div>
		 
		 
		 
		 

</body>

</html>

