<?php 

/**
 * Contains part of the Opencart Authorize.Net CIM Payment Module code.
 *
 * PHP version 5
 *
 * LICENSE: This source file is subject to memiiso license.
 * Please see the LICENSE.txt file for more information.
 * All other rights reserved.
 *
 * @author     memiiso <gel.yine.gel@hotmail.com>
 * @copyright  2013-~ memiiso
 * @license    Commercial License. Please see the LICENSE.txt file
 */

?>
<!-- <h2><?php //echo $text_credit_card; ?></h2> -->
<?php if (isset($error) && $error): ?>
  <div class="alert alert-error"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?></div>
<?php else : ?>

<div class="" id="payment">
<form action="" id="cimpayment" class="form-horizontal">
  <fieldset>
	<div class="form">
		<?php if ($isguest) {
			/* Start Quest Form  */
		?>
		<div id="guest_payment_option" >	
			<table class="table table-bordered table-hover">
				<tr>
					<td style="width: 200px;"><span class="required">*</span> <?php echo $entry_cc_number; ?></td>
					<td><input class="form-control" type="text" name="cc_number" autocomplete="off" value="" /></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_cc_expire_date; ?></td>
					<td><select name="cc_expire_date_month" class="form-control" style="width: inherit; display: inherit;">
							<?php foreach ($months as $month) { ?>
							<option value="<?php echo $month['value']; ?>">
								<?php echo $month['text']; ?>
							</option>
							<?php } ?>
					</select> / <select name="cc_expire_date_year" class="form-control" style="width: inherit; display: inherit;">
							<?php foreach ($year_expire as $year) { ?>
							<option value="<?php echo $year['value']; ?>">
								<?php echo $year['text']; ?>
							</option>
							<?php } ?>
					</select></td>
				</tr>
				<tr>
					<td><?php echo $entry_cc_cvv2; ?></td>
					<td><input class="form-control" type="text" name="cc_cvv2" autocomplete="off" value="" size="3" /></td>
				</tr>
			</table>
			</div>
<?php } else { 
	/* Start Cim Form  */
	?>
	<?php if (isset($cim_customer_profile->paymentProfiles)) {?>
		<div style="width: inherit;"><input type="radio" name="select_payment_account" onchange="bypass_method_radio(this.id);"	id="use_cim_payment_account" value="use_cim_payment_account"
			checked="checked"><label for="use_cim_payment_account" style="font-weight: bold;"><h4><?php echo $text_select_paymentaccount; ?></h4>
		</label>
		</div>
		<div id="cim_accounts"
			onclick="$('#use_cim_payment_account').click();">				
					<div id="cim_payment_option1">				
					<select	name="customer_payment_profile_id" class="form-control" style="width: inherit; min-width: 255px;">
					<option	value=""><?php echo $text_select; ?></option>
					
						<?php foreach ($cim_customer_profile->paymentProfiles as $paymentcard) { ?>
						<?php if ( isset($paymentcard->payment->creditCard) ) : ?>
						<option <?php echo ($paymentcard->customerPaymentProfileId == $default_payment_profile_id) ? 'selected="selected"' : '' ;  ?>
							value="<?php echo $paymentcard->customerPaymentProfileId; ?>">
							<?php echo $text_select_prfx_credit_card.': '.$paymentcard->payment->creditCard->cardNumber; /* .' '.$paymentcard->payment->creditCard->expirationDate; */ 
					        if (isset($local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]) && ($local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]->cc_type)) {
					        	echo ' - '.$local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]->cc_type;
					        }if (isset($paymentcard->payment->creditCard->nameOnAccount)) {
								echo ' '.$paymentcard->payment->creditCard->nameOnAccount;
							}
							?> 
						</option>
						<?php  else :  ?>
						<option <?php echo ($paymentcard->customerPaymentProfileId == $default_payment_profile_id) ? 'selected="selected"' : '' ;  ?>
							value="<?php echo $paymentcard->customerPaymentProfileId; ?>">
							<?php echo $text_select_prfx_bank_account.': '.$paymentcard->payment->bankAccount->accountNumber ; 
							if (isset($paymentcard->payment->bankAccount->nameOnAccount)) {
								echo ' '.$paymentcard->payment->bankAccount->nameOnAccount;
							}
							?> 
						</option>
						<?php endif; }?>
				  </select>
				 </div>
		</div>
	<?php } ?>	
		<div><input type="radio" name="select_payment_account" onchange="bypass_method_radio(this.id);"
			id="create_new_credit_card" <?php if(! isset($cim_customer_profile->paymentProfiles)) echo 'checked="checked"'; ?> value="create_new_credit_card" /><label
			for="create_new_credit_card"style="font-weight: bold;"><h4><?php echo $text_wanttouse_newcredit_card; ?></h4>
		</label>
		</div>
		<?php if($authorizenet_cim_disable_bank_payment != 'disable_bank_payment') { ?>
		<div><input type="radio" name="select_payment_account" onchange="$('#cim_payment_option2').slideUp();$('#cim_payment_option3').slideDown();$('#payment_billing_address').slideDown();"
			id="create_new_bank_account" value="create_new_bank_account" /><label
			for="create_new_bank_account" style="font-weight: bold;"><h4><?php echo $text_wanttouse_bank_account; ?></h4>
		</label>
		</div>
	<?php } ?>	
		<div id="custom_credit_card" onclick="$('#create_new_credit_card').click();">
		<div id="cim_payment_option2" style="<?php if(isset($cim_customer_profile->paymentProfiles)) echo "display: none;" ?>">	
			<table class="table table-bordered table-hover" >
			<!-- 
				<tr>
					<td><?php echo $entry_cc_owner; ?></td>
					<td><input type="text" name="cc_owner" value="" /></td>
				</tr>
			 -->
				<tr>
					<td style="width: 200px;"><span class="required">*</span> <?php echo $entry_cc_number; ?></td>
					<td><input class="form-control" type="text" name="cc_number" autocomplete="off" value="" /></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_cc_expire_date; ?></td>
					<td><select name="cc_expire_date_month" class="form-control" style="width: inherit; display: inherit;">
							<?php foreach ($months as $month) { ?>
							<option value="<?php echo $month['value']; ?>">
								<?php echo $month['text']; ?>
							</option>
							<?php } ?>
					</select> / <select name="cc_expire_date_year" class="form-control" style="width: inherit; display: inherit;">
							<?php foreach ($year_expire as $year) { ?>
							<option value="<?php echo $year['value']; ?>">
								<?php echo $year['text']; ?>
							</option>
							<?php } ?>
					</select></td>
				</tr>
				<tr>
					<td><?php echo $entry_cc_cvv2; ?></td>
					<td><input class="form-control" type="text" name="cc_cvv2" autocomplete="off" value="" size="3" /></td>
				</tr>												
				<tr>
					<td><?php echo $entry_customer_type; ?></td>
					<td>
						<input type="radio" name="cc_payment_customer_type" checked="checked" id="payment_customer_type_individual" value="individual" /><label	for="payment_customer_type_individual"><?php echo $text_individual; ?> </label> <br/>
						<input type="radio" name="cc_payment_customer_type" id="payment_customer_type_business" value="business" /><label	for="payment_customer_type_business"><?php echo $text_business; ?> </label>
					</td>
				</tr>
			</table>
			</div>
		</div>
	<?php if($authorizenet_cim_disable_bank_payment != 'disable_bank_payment') { ?>
		
	<div id="custom_bank_account" onclick="$('#create_new_bank_account').click();">
		<div id="cim_payment_option3" style="display: none;">	
		<table class="table table-bordered table-hover" id="t_new_ba" style="">
			<tr>
				<td><span class="required">*</span> <?php echo $entry_ba_routingnumber; ?></td>
				<td><input type="text" name="ba_routingnumber" class="form-control" autocomplete="off" value="" /></td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_ba_accountnumber; ?></td>
				<td><input type="text" name="ba_accountnumber" class="form-control" autocomplete="off" value="" /></td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_ba_nameonaccount; ?></td>
				<td><input type="text" name="ba_nameonaccount"  class="form-control" autocomplete="off" value="" /></td>
			</tr>
			<tr>
				<td><?php echo $entry_ba_bankname; ?></td>
				<td><input type="text" name="ba_bankname" class="form-control" autocomplete="off" value="" /></td>
			</tr>
			<tr>
				<td><?php echo $entry_customer_type; ?></td>
				<td>								
				<input type="radio" name="ba_payment_customer_type" class="" checked="checked" id="bapayment_customer_type_individual" value="individual" /><label class="radio-inline"	for="bapayment_customer_type_individual"><?php echo $text_individual; ?> </label><br/>
				<input type="radio" name="ba_payment_customer_type" class="" id="bapayment_customer_type_business" value="business" /><label class="radio-inline"	for="bapayment_customer_type_business"><?php echo $text_business; ?> </label>
				</td>
			</tr>							
		</table>
</div>
</div>
		<?php } ?>
	
<?php } /* END Cim Form  */  ?>	

<?php if( $authorizenet_cim_require_billing_adress == 'forcebillingadress'){ ?>			
	<div id="payment_billing_address" style="<?php if(!$isguest) echo "display: none;"; ?>">	
		<h3 onclick="$('#payment_billing_address_tbl').slideToggle();" style="cursor: pointer;" ><?php echo $text_validate_billing_adress; ?></h3>
		<div id="payment_billing_address_tbl" style="<?php if(!$isguest && false) echo "display: none;"; ?>">
	      <table >
	        <tr>
	          <td  style="width: 200px;"><span class="required">*</span> <?php echo $entry_firstname; ?></td>
	          <td><input type="text" name="firstname" class="form-control"  value="<?php echo $payment_address['firstname']; ?>" /></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
	          <td><input type="text" name="lastname" class="form-control"  value="<?php echo $payment_address['lastname']; ?>" /></td>
	        </tr>
	        <!-- 
	        <tr>
	          <td><?php echo $entry_company; ?></td>
	          <td><input type="text" name="company" class="form-control"  value="<?php echo $payment_address['company']; ?>" /></td>
	        </tr>
	         -->
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
	          <td><input type="text" name="telephone" class="form-control"  value="<?php echo $payment_address['telephone']; ?>" /></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
	          <td><input type="text" name="address_1" class="form-control"  value="<?php echo $payment_address['address_1'].' '.$payment_address['address_2']; ?>" /></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_city; ?></td>
	          <td><input type="text" name="city" class="form-control"  value="<?php echo $payment_address['city']; ?>" /></td>
	        </tr>
	        <tr>
	          <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
	          <td><input type="text" name="postcode" class="form-control"  value="<?php echo $payment_address['postcode']; ?>" /></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_country; ?></td>
	          <td><select name="country_id"  class="form-control" >
	              <option value=""><?php echo $text_select; ?></option>
	              <?php foreach ($countries as $country) { ?>
	              <?php if ($country['country_id'] == $payment_address['country_id']) { ?>
	              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
	              <?php } else { ?>
	              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
	              <?php } ?>
	              <?php } ?>
	            </select></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
	          <td><select name="zone_id"  class="form-control" >
	            </select>
	            <?php if($isguest){ ?>
	            <input type="hidden" name="select_payment_account" value="create_new_credit_card" />
	            <?php } ?>
			  </td>
	        </tr>
	      </table>
	    </div>
	    </div>	
			<?php  } ?>
	</div>
	</fieldset>	
</form> 

</div>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.fa-spin').remove();
	
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
	
			html = '<option value=""><?php echo $text_select; ?></option>';
	
			if (json['zone']) {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
			  		}
	
			  		html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
	
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>

<?php endif; ?>