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
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
<?php if (isset($error) && $error) { ?>
  <div class="alert alert-error"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?></div>
<?php } elseif (isset($text_error_connecting_cim_body)) { 	?>
  <div class="alert alert-error"><i class="fa fa-exclamation-circle"></i> <?php echo $text_error_connecting_cim_body; ?></div>
<?php }	?>
	
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>    
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>      
	<h2><?php echo $text_cim_payment_accounts;  ?></h2>

	
	<h2><?php echo $text_credit_card_entries; ?></h2>
		<table class="table table-bordered table-hover" >
	<?php 
	foreach ($cim_customer_profile->paymentProfiles as $paymentcard) {
		if (isset($paymentcard->payment->creditCard)) {
		?>
	<div class="content" id="payment_account_<?php echo $paymentcard->customerPaymentProfileId;?>">
			<tr>
				<td><?php 

				echo $paymentcard->customerType.'<br>';
				if (isset($paymentcard->payment->creditCard->nameOnAccount)) {
		        	echo ' '.$paymentcard->payment->creditCard->nameOnAccount.'<br>';
		        }
		        echo $paymentcard->payment->creditCard->cardNumber;
		        if (isset($local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]) && ($local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]->cc_type)) {
		        	echo ' - '.$local_payment_profile_list['pid_'.$paymentcard->customerPaymentProfileId]->cc_type;
		        }
		        ?>
				</td>
				<td style="text-align: right;"><?php if($paymentcard->customerPaymentProfileId == $default_payment_profile_id) { ?>				
				<div class="default_cim" style="display: inline-block;margin-right: 12px;"><img src="catalog/view/theme/default/image/check.png" alt="" /></div>				
				 <?php }else{ ?> <a href="#"
					paymentaccountid="<?php echo $paymentcard->customerPaymentProfileId;?>"
					class="btn btn-info setdefault_cim_payment_account shop_btn"><span><?php echo $button_set_default; ?>
				
				</a> <?php } ?> <a href="#"
					paymentaccountid="<?php echo $paymentcard->customerPaymentProfileId;?>"
					class="btn btn-danger deletecimpa"><span><?php echo $button_delete; ?>				
				</a></td>
			</tr>
	</div>
	<?php 
		}
	}
	?>
		</table>
		
	<?php if($authorizenet_cim_disable_bank_payment != 'disable_bank_payment') { ?>
	<h2><?php echo $text_bank_accont_entries; ?></h2>
	
	<table class="table table-bordered table-hover" style="width: 100%;">
	<?php 
	foreach ($cim_customer_profile->paymentProfiles as $paymentcard) {
  		if (isset($paymentcard->payment->bankAccount)) { ?>
				<div class="content" id="payment_account_<?php echo $paymentcard->customerPaymentProfileId;?>">
						<tr>
							<td><?php 
							echo $paymentcard->customerType.'<br>';
							if (isset($paymentcard->payment->bankAccount->nameOnAccount)) {
			        	echo ' '.$paymentcard->payment->bankAccount->nameOnAccount.'<br>';
			        }
			        echo $paymentcard->payment->bankAccount->routingNumber.'<br>'.$paymentcard->payment->bankAccount->accountNumber;
			        ?>
							</td>
							<td style="text-align: right;"><?php if($paymentcard->customerPaymentProfileId == $default_payment_profile_id) { ?>							
							<div class="default_cim" style="display: inline-block;margin-right: 12px;"><img src="catalog/view/theme/default/image/check.png" alt="" /></div>
							 <?php }else{ ?> <a href="#"
								paymentaccountid="<?php echo $paymentcard->customerPaymentProfileId;?>"
								class="btn btn-info setdefault_cim_payment_account"><span><?php echo $button_set_default; ?>
							
							</a> <?php } ?> <a href="#"
								paymentaccountid="<?php echo $paymentcard->customerPaymentProfileId;?>"
								class="btn btn-danger deletecimpa"><span><?php echo $button_delete; ?> </span>
							</a>
							</td>
						</tr>
				</div>
	<?php 
		}
	}
	?>
	</table>
	<?php }  ?>	
	 
	<div class="content" id="add_new_account" style="display: none;">
					
		<form action="" id="newcimpaymentaccount">
				<div> 
				<input type="radio" name="select_payment_account" onchange="$('#t_new_ba').slideUp({complete:function(){$('#t_new_cc').slideDown();}});"
						checked="checked" id="create_new_credit_card"
						value="create_new_credit_card" /><label 
						for="create_new_credit_card" class="radio-inline" ><h4><?php echo $text_create_newcredit_card; ?></h4>
				</label>
				</div>
				
				<?php if($authorizenet_cim_disable_bank_payment != 'disable_bank_payment') { ?>
				<div> 	
				<input type="radio" class="" name="select_payment_account" onchange="$('#t_new_cc').slideUp({complete:function(){$('#t_new_ba').slideDown();}});"
						id="create_new_bank_account" value="create_new_bank_account" /><label
						for="create_new_bank_account" class="radio-inline" style="font-weight: bold;"><h4><?php echo $text_create_bank_account; ?></h4>
				</label>
				</div>
				<?php } ?>

					<div id="addnew_credit_card" valign="top" onclick="$('#create_new_credit_card').click();">
						
						<table class="table table-bordered table-hover" id="t_new_cc">
							<tr>
								<td><span class="required">*</span> <?php echo $entry_cc_number; ?></td>
								<td><input type="text" name="cc_number" autocomplete="off" value="" class="form-control" /></td>
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
								<td><input type="text" name="cc_cvv2" autocomplete="off" value="" size="3" class="form-control" /></td>
							</tr>							
							<tr>
								<td><?php echo $entry_customer_type; ?></td>
								<td>
								<input type="radio" name="cc_payment_customer_type" class="" checked="checked" id="payment_customer_type_individual" value="individual" /><label class="radio-inline"	for="payment_customer_type_individual"><?php echo $text_individual; ?> </label>
								<input type="radio" name="cc_payment_customer_type" class="" id="payment_customer_type_business" value="business" /><label class="radio-inline"	for="payment_customer_type_business"><?php echo $text_business; ?> </label>
								</td>
							</tr>
						</table>					
				</div>
					
					<div id="addnew_bank_account" onclick="$('#create_new_bank_account').click();">
						<table class="table table-bordered table-hover" id="t_new_ba" style="display: none;">
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
								<input type="radio" name="ba_payment_customer_type" class="" checked="checked" id="bapayment_customer_type_individual" value="individual" /><label class="radio-inline"	for="bapayment_customer_type_individual"><?php echo $text_individual; ?> </label>
								<input type="radio" name="ba_payment_customer_type" class="" id="bapayment_customer_type_business" value="business" /><label class="radio-inline"	for="bapayment_customer_type_business"><?php echo $text_business; ?> </label>
								</td>
							</tr>							
						</table>
				</div>
	<?php if( $authorizenet_cim_require_billing_adress == 'forcebillingadress'){ ?>			
	<div id="payment_billing_address">	
	<h3><?php echo $entry_cim_pa_billing_address; ?></h3>
      <table class="table table-bordered table-hover">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" class="form-control" value="" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
          <td><input type="text" name="lastname"  class="form-control" value="" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" class="form-control" name="telephone" value="" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
          <td><input type="text" class="form-control" name="address_1" value="" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_city; ?></td>
          <td><input type="text" class="form-control" name="city" value="" /></td>
        </tr>
        <tr>
          <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
          <td><input type="text" class="form-control" name="postcode" value="" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_country; ?></td>
          <td><select name="country_id" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
          <td><select name="zone_id" class="form-control">
            </select>
		  </td>
        </tr>
      </table>
    </div>
			<?php  } ?>
			
		</form>
		<div class="right" style="text-align: right;">
			<a href="#" onclick="$('#add_new_account').slideUp(); return false;"
				class="btn btn-default"><span><?php echo $button_cancel; ?> </span> </a> 
				<a href="#" id="add_new_account_button" class="btn btn-primary shop_btn"><span><?php echo $button_save; ?>
			</span> </a>
		</div>
	</div>

	
      <div class="buttons clearfix">
	        <div class="pull-right">
	        	<a href="#" onclick="$('#add_new_account').slideDown(); return false;" 	class="btn btn-primary shop_btn"><span><?php echo $button_new_pamet_account; ?></span></a>
			</div>
      </div>
		

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript">
$(".deletecimpa").on('click', function() {
	var node = this;
  var id = $(node).attr('paymentaccountid');
	$.ajax({
		url: '<?php echo $delete; ?>',
		type: 'post',
		data:  { cimpaymentid: id },
		dataType: 'json',		
		beforeSend: function() {
			$(node).button('loading');
		},
		complete: function() {
			// $(node).button('reset');
		},				
		success: function(json) {
			if (json['error']) {
				<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
				json['error'] = json['error'].replace(/\n/g, '<br />');	
				$("<div>"+json['error']+"</div>").dialog({
					modal: true,
					buttons: {
						'<?php echo $text_close; ?>': function() {
						$( this ).dialog( "close" );
						}
					}
					});
			<?php }else {?>
			alert(json['error']);
		  <?php } ?>	
			$(node).button('reset');			
			}
			if (json['success']) {
				<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
				json['success'] = json['success'].replace(/\n/g, '<br />');	
				$("<div>"+json['success']+"</div>").dialog({
					modal: true,
					buttons: {
						'<?php echo $text_close; ?>': function() {
						$( this ).dialog( "close" );
						$('#payment_account_'+id).slideUp();
						location = json['success_url'];
						}
					}
					});
			<?php }else {?>
			alert(json['success']);
		  <?php } ?>
				$('#payment_account_'+id).slideUp();
				location = json['success_url'];
			}
		}
	}); 
  return false;
});

$(".setdefault_cim_payment_account").on('click', function() {
	var node = this;
	var id = $(node).attr('paymentaccountid');
		$.ajax({
			url: '<?php echo $setdefaultpayment; ?>',
			type: 'post',
			data:  { default_paymentid: id },
			dataType: 'json',		
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				// $(node).button('reset');
			},				
			success: function(json) {
				if (json['error']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['error'] = json['error'].replace(/\n/g, '<br />');	
					$("<div>"+json['error']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
							$( this ).dialog( "close" );
							}
						}
						});
				<?php }else {?>
				alert(json['error']);
			  <?php } ?>	
				$(node).button('reset');			
				}
				if (json['success']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['success'] = json['success'].replace(/\n/g, '<br />');	
					$("<div>"+json['success']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
							$( this ).dialog( "close" );
							location = json['success_url'];
							}
						}
						});
				<?php }else {?>
				alert(json['success']);
			  <?php } ?>
			  location = json['success_url'];
				}
			}
		}); 
	  return false;
	});

$(".setdefault_cim_payment_adress").on('click', function() {
	var node = this;
	  var id = $(node).attr('paymentaddressid');
		$.ajax({
			url: '<?php echo $setdefaultaddress; ?>',
			type: 'post',
			data:  { default_payment_addressid: id },
			dataType: 'json',		
			beforeSend: function() {	
				$(node).button('loading');
			},
			complete: function() {
				// $(node).button('reset');
			},				
			success: function(json) {
				if (json['error']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['error'] = json['error'].replace(/\n/g, '<br />');	
					$("<div>"+json['error']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
							$( this ).dialog( "close" );
							}
						}
						});
				<?php }else {?>
				alert(json['error']);
			  <?php } ?>	
				$(node).button('reset');			
				}
				if (json['success']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['success'] = json['success'].replace(/\n/g, '<br />');	
					$("<div>"+json['success']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
								$( this ).dialog( "close" );
								 location = json['success_url'];
								}
							}
						});
				<?php }else {?>
				alert(json['success']);
			  <?php } ?>
			  location = json['success_url'];
				}
			}
		}); 
	  return false;
	});

$("#add_new_account_button").on('click', function() {
	var node = this;
		$.ajax({
			url: '<?php echo $insert; ?>',
			type: 'post',
			data:  $('#newcimpaymentaccount').serialize(),
			dataType: 'json',		
			beforeSend: function() {	
				$(node).button('loading');
			},
			complete: function() {
				// $(node).button('reset');
			},				
			success: function(json) {
				if (json['error']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['error'] = json['error'].replace(/\n/g, '<br />');	
					$("<div>"+json['error']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
							$( this ).dialog("close");
							}						
						}
						});
				<?php }else {?>
				alert(json['error']);
			  <?php } ?>
				$(node).button('reset');				
				}
				if (json['success']) {
					<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?> 
					json['success'] = json['success'].replace(/\n/g, '<br />');	
					$("<div>"+json['success']+"</div>").dialog({
						modal: true,
						buttons: {
							'<?php echo $text_close; ?>': function() {
							$( this ).dialog( "close");
							location = json['success_url'];
							}
						}
						});
				<?php }else {?>
				alert(json['success']);
			  <?php } ?>
			  location = json['success_url'];
				}
			}
		}); 
	  return false;
	});

</script>

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
<?php echo $footer; ?>
