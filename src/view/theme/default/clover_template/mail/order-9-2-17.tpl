<html xmlns="http://www.w3.org/1999/xhtml"><head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title><?php echo $title; ?></title>
     

      
   </head>
<body>

   <!-- Start of preheader -->
   <table width="100%" bgcolor="#ffffff" cellpadding="10" cellspacing="10" border="0" id="backgroundTable" st-sortable="preheader">
      <tbody>
         <tr>
            <td width="100%">
   <!-- End of preheader -->

   <!-- image + text -->
  <table width="100%" bgcolor="#ffffff" cellpadding="2" cellspacing="4" border="0" id="backgroundTable" st-sortable="bigimage">
      <tbody>
         <tr>
            <td>
              <table bgcolor="#778b8b" style="max-width:580px;" align="center" cellspacing="4" cellpadding="2" border="0" class="devicewidth" modulebg="edit">
			 
			  <tr>
			  <td>
				<table  width="100%" height="" align="center" cellspacing="10" cellpadding="10" class="devicewidth" modulebg="edit" style="background:url('<?php echo $base; ?>upload/catalog/view/theme/default/image/register_email_templ_bg.png');background-color:#8faaaa;background-repeat:no-repeat;border:3px solid grey;">
                   <tbody>
                   <tr>
                        <td width="100%" height="" align="left" style="padding-bottom:0;padding-top:0;">
							<?php echo $text_greeting; ?>                         
                        <br>
						<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/commerce.png" width="30" height="" />
						 
                      <?php echo $text_link; ?>
                                <br>            
                        <a href="<?php echo $link; ?>">BiteHeist Order Info</a>
						<br>
                       
                     -------------------------------------- </td>
                    </tr> 
                  
                   <tr>
						<td  align="center"  bgcolor="#8faaaa" background="<?php echo $base; ?>upload/catalog/view/theme/default/image/back.png" style="background-repeat: no-repeat; background-position: top; font-family: 'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif; ">
						
							<table style="max-width:430px;" width="100%"   border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
												  
							  <tr>
								<td width="182"></td>
							  </tr>
							  <tr>
								<td class="BoldH" colspan="4"><span class="Gray"><?php echo $text_order_detail; ?></span></td>
							  </tr>
							  <tr>
								<td colspan="4">
								<div class="fifty"><?php echo $text_order_id; ?> <?php echo $order_id; ?></div>
								<div class="fifty1">
								<p style="word-break: break-word; white-space: normal; text-align:left;margin:0;"><?php echo $text_email; ?><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></p>
								 <p style="color:#000000; text-align:left;margin:0;"><?php echo $text_telephone; ?><span class="contact" style="color:#000000 !important;"><?php echo $telephone; ?> </span></p>
								</div>
								</td>
							  </tr>
							  <tr>
								<td  height="10" colspan="4"></td>
							  </tr>
							  <tr>
								<td class="BoldH" colspan="4"><span class="Gray">Payment Details</span></td>
							  </tr>
							  <tr>
								<td class="contact" colspan="4"><?php echo $payment_card_details; ?></td>
							 </tr>
							  <tr>
								<td colspan="4" align="center" class="Lins" height="30">------------------------------------------------</td>
							  </tr>
							  <tr>
								<td height="6"></td>
							  </tr>
							  <tr class="Gray">
								<td class="BoldH"><span class="Gray" style="font-size: 17px;color: #505e6a;padding: 5px 0;font-weight:bold;  "><?php echo $text_product; ?></span></td>
								<td width="129" align="right" class="BoldH"><span class="Gray" style="font-size: 17px;color: #505e6a;padding: 5px 0;font-weight:bold; "><?php echo $text_quantity; ?></span></td>
								<td width="58" align="right" class="BoldH"> <span class="Gray" style="font-size: 17px;color: #505e6a;padding: 5px 0;font-weight:bold; "><?php echo $text_price; ?></span></td>
								<td width="61" align="right" class="BoldH"><span class="Gray" style="font-size: 17px;color: #505e6a;padding: 5px 0;font-weight:bold; "><?php echo $text_total; ?></span></td>
							  </tr>
							  
							<?php foreach ($products as $product) { ?>
	  
							  <?php
							  	$product_name	=	trim($product['name']);
								if(strlen($product_name) < 1)continue;
							  $optionCount = count($product['option']); 
							  
							  ?>	
							  <tr>
								<td width="129" class="font11" style="font-size: 17px;color: #505e6a;padding: 5px 0;<?php if(empty($optionCount)){ ?>border-bottom: 1px solid #DDDDDD;<?php } ?>" ><span style="font-size:16px;margin-left:10px; margin-bottom:5px;"><?php echo $product['name']; ?></span></td>
								<td width="129" rowspan="<?php echo $optionCount+1; ?>" style="text-align:right; vertical-align:top;font-size: 17px;color: #505e6a;padding: 5px 0; <?php if(!empty(count($products))){ ?>border-bottom: 1px solid #DDDDDD;<?php } ?>"><?php echo $product['quantity']; ?></td>
								<td width="58" class="contact" style="text-align:right;font-size: 17px;color: #505e6a;padding: 5px 0;"><?php echo $product['uncalculatedPrice']; ?></td>
								<td width="61" rowspan="<?php echo $optionCount+1; ?>" style="text-align:right;vertical-align:top;font-size: 17px;color: #505e6a;padding: 5px 0; <?php if(!empty(count($products))){ ?>border-bottom: 1px solid #DDDDDD;<?php } ?>" class="contact"><?php echo $product['total']; ?></td>
							  </tr>
							  
								<?php $i = 1; foreach ($product['option'] as $option) { ?>
							  <tr>
								<td class="font1" style="<?php if($i == $optionCount){ ?> border-bottom: 1px solid #DDDDDD;font-size: 17px;color: #505e6a;padding: 5px 0; <?php } ?>"><span class="font11" style="color:#505e6a;padding: 5px 0;font-size:17px;font-weight:bold;">- <?php echo $option['name']; ?>: <br> <span style="font-size:16px;margin-left:10px;margin-bottom:5px; font-weight:normal;"><?php echo $option['value']; ?></span></span></td>
								<td width="58" class="contact" style="text-align:right;font-size: 17px;color: #505e6a;padding: 5px 0; <?php if($i == $optionCount){ ?>border-bottom: 1px solid #DDDDDD;<?php } ?>"><?php echo $option['price']; ?></td>
							  </tr>
							  
							  <?php $i++; } ?>
							  
							<?php } //end foreach $products ?>
						  
							<?php foreach ($vouchers as $voucher) { ?>
							  <tr>
								<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
								<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;">1</td>
								<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
								<td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
							  </tr>
						    <?php } ?>
							  
							  
							  <?php foreach ($totals as $total) { ?>
							   <tr style="margin">
								<td colspan="3" align="right" style="font-size:17px;color:#505e6a;height: 30px;width: 90px; font-weight:bold;text-align: left;"><?php echo $total['title']; ?>:</td>
								<td colspan="3" align="right" class="contact" style="font-size:17px;color:#505e6a;height: 30px;width: 90px;font-weight:bold;"><?php echo $total['text']; ?></td>
							  </tr>
							  
							  <?php } ?>
							  							  
							
							</table>
						</td>
                     </tr>
                  
				</table>
               </td>
			 </tr>
			 <tr><td></td></tr>
			   			   
			   </table>
            </td>  
         </tr>
      </tbody>
  </table>
</div>





<div class="block">
   <!-- Start of preheader -->
   <table width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0" id="backgroundTable" st-sortable="postfooter">
      <tbody>
         <tr>
            <td width="100%">
               <table style="max-width:580px;" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                  <tbody>
                   
                     <tr>
                        <td align="center" valign="middle" style="font-family: Helvetica, arial, sans-serif; font-size: 14px;color: #999999" st-content="preheader"><blockquote type="cite">
                          <div>
                            <div>
							<br>
                             <?php echo $text_footer; ?>
                            </div>
                          </div>
                        </blockquote></td>
                     </tr>
                     <!-- Spacing -->
                     <tr>
                        <td width="100%" height="" align="center"><img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/printer_logo.png" width="120" height="" /></td>
                     </tr>
                    
                     <!-- Spacing -->
                  </tbody>
               </table>
            </td>
         </tr>
      </tbody>
   </table>
   <!-- End of preheader -->
</div>

</body></html>