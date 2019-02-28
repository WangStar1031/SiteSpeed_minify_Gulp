<div>
<input name="select_payment_account" onchange="bypass_method_radio(this.id);" id="create_new_credit_card_aim" value="create_new_credit_card" type="radio"><label for="create_new_credit_card_aim" style="font-weight: bold;"><h4>I want to use new credit card</h4>
</label>
</div>
<div id="aim_payment_option1">
	<form id="payment_aim" class="form-horizontal">
	  <fieldset>
		<legend><?php //echo $text_credit_card; ?></legend>
		<div class="form-group required">
		  <label class="col-sm-2 control-label" for="input-cc-owner"><?php echo $entry_cc_owner; ?></label>
		  <div class="col-sm-10">
			<input type="text" name="cc_owner" value="" placeholder="<?php echo $entry_cc_owner; ?>" id="input-cc-owner" class="form-control" />
		  </div>
		</div>
		<div class="form-group required">
		  <label class="col-sm-2 control-label" for="input-cc-number"><?php echo $entry_cc_number; ?></label>
		  <div class="col-sm-10">
			<input type="text" name="cc_number" value="" placeholder="<?php echo $entry_cc_number; ?>" id="input-cc-number" class="form-control" />
		  </div>
		</div>
		<div class="form-group required">
		  <label class="col-sm-2 control-label" for="input-cc-expire-date"><?php echo $entry_cc_expire_date; ?></label>
		  <div class="col-sm-3 mobile-padding-bottom">
			<select name="cc_expire_date_month" id="input-cc-expire-date" class="form-control">
			  <?php foreach ($months as $month) { ?>
			  <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
			  <?php } ?>
			</select>
		   </div>
		   <div class="col-sm-3">
			<select name="cc_expire_date_year" class="form-control">
			  <?php foreach ($year_expire as $year) { ?>
			  <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
			  <?php } ?>
			</select>
		  </div>
		</div>
		<div class="form-group required">
		  <label class="col-sm-2 control-label" for="input-cc-cvv2"><?php echo $entry_cc_cvv2; ?></label>
		  <div class="col-sm-10">
			<input type="text" name="cc_cvv2" value="" placeholder="<?php echo $entry_cc_cvv2; ?>" id="input-cc-cvv2" class="form-control" />
		  </div>
		</div>
	  </fieldset>
	</form>
</div>