<div id="checkout-login-panel">
	<div style="color:#cc0000;" class="show_error_message"></div>
	<div class="form-group">
	  <!-- <label class="control-label" for="input-email"><?php echo $entry_email; ?></label> -->
	  <input type="text" name="email" value="" placeholder="E-Mail Address" id="input-email" class="form-control" />
	</div>
	<div class="form-group">
	  <!-- <label class="control-label" for="input-password"><?php echo $entry_password; ?></label> -->
	  <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
	  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
	</div>
	  <div class="input-group">
		  <div class="checkbox">
				<label class="control control--checkbox ">
					<input name="remember_me" id="login-remember" type="checkbox" name="remember" value="1" style="opacity:1"><label for="login-remember"> Remember me </label>
					<div class="control__indicator"></div>
				</label>
		   </div>
	  </div>
	
	<input type="button " value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn button-green btn-block m-t-md pad3 shop_btn" />
</div>