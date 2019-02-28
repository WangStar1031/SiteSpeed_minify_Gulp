<footer>
  <div id="footer" class="container">
     <div class="row">
	 
	 <div class="custom_footer_main column">
	 	  <div class="content_footer_left"><?php echo $footerleft; ?> </div>
	</div>
	 
      <?php /*if ($informations) { ?>
      <div class="column information">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } */?>
	  
    <?php /*?>  <div class="col-sm-3 column">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3 column">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3 column">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div><?php */?>
	  
	  <div class="content_footer_right"><?php echo $footerright; ?> </div>

	  
    </div>
	


  </div>
  <div class="footer_bottom">
  <div class="footer_bottom-inner container">
	<!--
	<div id="bottomfooter">
		<ul>
			<li><a href="<?php //echo $special; ?>"><?php echo $text_special; ?></a></li>
			<li><a href="<?php //echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			<li><a href="<?php //echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			<li><a href="<?php //echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>	   
			<li><a href="<?php //echo $return; ?>"><?php echo $text_return; ?></a></li> 
			<li><a href="<?php //echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
			<li class="login-logout"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
		</ul>
		</div>
		
		<div class="copyright">
		<p><?php // echo $powered; ?></p> 
		</div>
	</div>
	-->
</div>
</footer>
<?php /*
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
*/ ?>
<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<script type="text/javascript" src="upload/catalog/view/javascript/flipclock/compiled/flipclock.min.js"></script>
<script>
// var remainingTimestamp // defined in header_closed.tpl
// var base = '<?php //echo $base; ?>'; // defined in header_closed.tpl
var clock;
		//alert('<?php echo date_default_timezone_get(); ?>');
		$(document).ready(function() {
			//alert(remainingTimestamp);
			clock = $('.clock').FlipClock({
		        clockFace: 'HourlyCounter',
				autoStart: false,
				callbacks: {
		        	stop: function() {
		        		//$('.message').html('The clock has stopped!');
						window.location.href = base;
		        	}
		        }
		    });
			
			//alert(parseInt(remainingTimestamp));
			if(parseInt(remainingTimestamp) < parseInt(86400)){
				//alert('if');
				clock.setTime(parseInt(remainingTimestamp));
				clock.setCountdown(true);
				clock.start();
			}else{
				//alert('else');
				$('#remaining').hide();
			}	
		});
</script>
</body></html>