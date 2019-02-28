<!-- Footer Start -->
<style>
@media(max-width :1249px){
	.powerby{
		        margin-left: 24px !important;
	}
	
}
</style>
<footer>
  <div class="footer">
	<div class="wrapper new-design-wrapper">
		<div class="foot_text">
			<!--<div class="copy_rght">
				<p>© <?php //echo date('Y'); ?>  -  All Rights Reserved.</p> 
			</div>-->
			<?php if ($logo) { ?>
			<div class="powerby">
				<a href="<?php echo $rootBase; ?>" class="footer_logo" target="_blank">
					<span class="powerby_text">POWERED BY</span><img src="<?php echo $base; ?>upload/image/catalog/BiteHeist_Logo.png" title="<?php echo $rootName; ?>" alt="<?php echo $rootName; ?>" class="img-responsive powerby_logo" />
				</a>
				&nbsp;

				<ul class="list-unstyled" style="display:inline-block;">
					| <li style="display:inline-block;"><a href="https://biteheist.com/terms/" target="_blank">Terms</a></li>
					| <li style="display:inline-block;"><a href="https://biteheist.com/privacy-policy/" target="_blank">Privacy Policy</a></li>
				</ul>
				
			</div>
			<?php } ?>
			
			
			
		</div>
	</div>
  </div>  
</footer>  
</div>
 <?php
$url_c = $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
if (strpos($url_c,'GoodEatsDEV') !== false){?>
<script>
	// addToHomescreen.removeSession();// use this to remove the localStorage variable
//	if (/Android|webOS|iPhone|iPad|BlackBerry|Windows Phone|Opera Mini|IEMobile|Mobile/i.test(navigator.userAgent))
//	{
//		var ath = addToHomescreen();
//	}
	// ath.clearSession();      // reset the user session
</script>
<?php }?>
</body></html>
