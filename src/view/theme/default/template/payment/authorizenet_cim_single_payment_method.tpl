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
 
 /*
  * Custom added features:
  * - Allow registered user to checkout without saving CC
  * - Integrated Pay at store / Pay now
  */

?>
<!-- <h2><?php //echo $text_credit_card; ?></h2> -->

<!-------------------------------- New code ------------------------------------------->

		<form action="" id="cimpayment" class="form-horizontal">
		 <input type="hidden" id="contact_email" value="" name="contact_email" > 
			<div class="header hidden-xs">
				<div class="numberCircle">3</div>
				<div class="title-area">
					<h2 onclick="payment_billing();">Payment method</h2>
				</div>
			</div>
			<div class="xs-header hidden-sm hidden-md hidden-lg">
				<span class="label">Payment</span>
			</div>			
			<!-- <div class="header">
				<span class="label">Payment</span>
			</div> -->

			<div class="row content-wrapper">
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 card-select">
					<?php if (!$isguest && (STORE_PAYMENT_OPTION == 2 && $assign_gateway != 'empty' || STORE_PAYMENT_OPTION == 3 && $assign_gateway != 'empty')) { ?>
					<div class="col-xs-4 col-sm-12 col-md-12 col-lg-12 card" style="padding-left: 0; padding-right: 0; cursor :pointer;" onclick="useSaveCard();">
						<div class="tab" id="saved_seltd">
						<?php if (!$isguest) { ?>
							<a href="javascript:void(0);"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-saved-card.png" />
							<span>Saved Card</span></a>					
						<?php } ?>							
						</div>
					</div>	
					<?php } ?>
					
					<?php if (STORE_PAYMENT_OPTION == 2 && $assign_gateway != 'empty' || STORE_PAYMENT_OPTION == 3 && $assign_gateway != 'empty') { ?>
					<div class="col-xs-4 col-sm-12 col-md-12 col-lg-12 card" style="padding-left: 0; padding-right: 0; cursor :pointer;" onclick="useNewCard();">
						<div class="tab" id="new_crd_seltd">
							<a href="javascript:void(0);"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-new-card.png" />
							<span>New Card</span></a>							
						</div>						
					</div>
					<?php } ?>
					
					<?php if (!$isguest && (STORE_PAYMENT_OPTION == 1 || STORE_PAYMENT_OPTION == 3)) { ?>
					<div class="col-xs-4 col-sm-12 col-md-12 col-lg-12 card no-padding" style="cursor :pointer;" id="pay_at_store" <?php if (!$isguest) { ?>onclick="selectedPaymentMethod(this.id)"<?php } ?>>
						<div class="tab">
								<img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/icon-pay-there.png" />
								<span>Pay There</span>
						</div>						
					</div>	
					<?php } ?>					
				
				</div>

				<div class="col-sm-9 col-xs-12 col-md-9 col-lg-9 content cs-tab-area" id="pay_now_div" style="margin-top:0px;" >
				<div  style="display:none;" id="useSaveCardInfo">
				<?php if (!$cim_customer_profile) {?>
				<h2 style="color:red;" >Card not found</h2>
				<hr>
				<?php }?>
				<?php if ($cim_customer_profile) {?>
				<h2>Use saved card</h2>
					<hr>
					<!--
				    <div class="form-group col-sm-12 col-md-12 col-xs-12">
						<select id="stateSelect" onchange="stateSelected();" class="selector">
							<option value="" selected="selected">Select Saved Card</option>
							<option value="val1">3XXX-XXXX-XXXX-XXXX</option>
							<option value="val2">3XXX-XXXX-XXXX-XXXX</option>
							<option value="val3">3XXX-XXXX-XXXX-XXXX</option>
						</select>				    	
				    </div>	-->
						
						<div  id="cim_accounts" onclick="displayCardFields('usingSavedCard');">				
									<div id="cim_payment_option1" >				
									<select	id="stateSelect" name="customer_payment_profile_id" onchange='hide_new_card();' class="form-control cim_payment_select selector">
									<option	value=""><?php echo $text_select; ?></option>
									<?php foreach($cim_customer_profile as $val){ ?>
										<option	value="<?php echo $val['id']; ?>"><?php echo $val['cc_number']; ?></option>
									<?php } ?>
								  </select>
								 </div>
						</div>
						<?php } ?>
					</div>	
					
					<!--------- pay there tab------------------------------->
					<div id="pay_there_message">
					<h4 style="color:red;">Now that you are paying for your food at the restaurant, confirm your checkout below to complete your order.</h4>
					</div>
					<!--------------- end------------------------------------>
					
					<div id="billing_info">
		
			
					<h2>Billing information</h2>
					<hr>
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
				      <!-- <input type="text" name="firstname" value="" placeholder="First Name" id="firstname" class="form-control" /> -->
					  <input type="text" id= "billing_firstname" name="billing_firstname" class="form-control" placeholder="First Name"  value="<?php echo isset($payment_address['firstname'])? $payment_address['firstname']:''   ?>" />
					  
				    </div>					
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
				    <!--   <input type="text" name="lastname" value="" placeholder="Last Name" id="lastname" class="form-control" /> -->
					  
					  <input type="text" name="lastname" class="form-control" placeholder="Last Name"  value="<?php echo isset($payment_address['lastname'])? $payment_address['lastname']:''   ?>" />
				    </div>
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
				      <!--   <input type="text" name="address" value="" placeholder="Address" id="address" class="form-control" /> -->
					  <input type="text" name="address_1" class="form-control" placeholder="Address" id="addresstext"  value="<?php echo isset($payment_address['address_1'])? $payment_address['address_1'].''.$payment_address['address_2']:''   ?>" />
					  
				    </div>
				    <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-6">
				     <!--    <input type="text" name="city" value="" placeholder="City" id="city" class="form-control" /> -->
					 <input type="text" name="city" class="form-control" placeholder="City"  value="<?php echo isset($payment_address['city'])? $payment_address['city']:''   ?>" />
				    </div>
				    <div class="form-group col-xs-6 col-sm-3 col-md-3 col-lg-6">
				      <!--   <input type="text" name="postcode" value="" placeholder="Post Code" id="postcode" class="form-control" /> -->
					  <input type="text" name="postcode" class="form-control" placeholder="Post Code"  value="<?php echo isset($payment_address['postcode'])? $payment_address['postcode']:''   ?>" />
				    </div>
				    <div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
					
						<select name="country_id"  class="form-control" style ="display:none" >
						<option value=""><?php echo $text_select; ?></option>
						  <option value="223" selected="selected">United States</option>
						</select>
						
					<select name="zone_id"  class="form-control" >
					</select>
					</div>
					<!--<select id="stateSelect" name="zone_id" onchange="stateSelected();" class="form-control selector" >
					<option value="" selected="selected">Region/State</option>
							<option value="stateCalifornia">California</option>
							<option value="stateTexas">Texas</option>
							<option value="stateNewYork">New York</option>
					</select> -->
					<?php if($isguest){ ?>
					<input type="hidden" name="select_payment_account" value="create_new_credit_card" />
					<?php } ?>
			
				
				</div>

				<?php /* if($authorizenet_cim_disable_bank_payment != 'disable_bank_payment') { ?>
						<tr style="display:none;">
							<td><?php echo $entry_customer_type; ?></td>
							<td>								
							<input type="radio" name="ba_payment_customer_type" class="" checked="checked" id="bapayment_customer_type_individual" value="individual" /><label class="radio-inline"	for="bapayment_customer_type_individual"><?php echo $text_individual; ?> </label><br/>
							<input type="radio" name="ba_payment_customer_type" class="" id="bapayment_customer_type_business" value="business" /><label class="radio-inline"	for="bapayment_customer_type_business"><?php echo $text_business; ?> </label>
							</td>
						</tr>
				<?php// } */ ?>

			
			<div id="disable-input-show" >
				<div id="disable-input2" >	
					<!-- <input type="hidden" id="cc_save_option" class="disable-input1" name="cc_save_option" value="1" />
					<input type="hidden" id="select_payment_account" class="disable-input3" name="select_payment_account" value="use_cim_payment_account" />  -->
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div id="custom_credit_card">
				
			</div>
			<div class="clearfix"></div>
			
				
				<div id="crdinfo">
					<div class="col-sm-12 col-xs-12 col-md-12 content-cardinfo" id="cim_payment_option2">
						<h2>Credit card info</h2>
						<hr>
						<?php if($amex_enabled != '1'){ ?>
						<div id="show_error_card" style=" background-color: rgba(204, 204, 204,0.9); min-height: 361px; position: absolute; width: 100%; z-index: 1; border-radius: 17px; left: 0px;">
							<h4 style="text-align: center; margin-top: 20px; color: red; width: 100%; float: left;"><?php echo 'We do not accept American Express'; ?>	
							</h4>
							<input type="button" class="highlight shop_btn" onclick="edit_card_datial();" style="width: 70px;  border-radius: 0; border: none; padding: 10px 0;  position: absolute; z-index: 999; right: 69px; bottom: 30px; font-size: 18px; width: 130px;" value="ok"/>
						</div>
						<?php } ?>
					    <div class="form-group col-sm-12 col-xs-12 col-md-12 credit-card">
					    	<label>Card Number</label>
					    	<div class="row cs-num-area">
					    		<div class="col-sm-12 col-xs-12 col-md-12 credit-cell required">
									<input class="form-control" type="text" id="cc_number_check" name="cc_number" autocomplete="off" value="" />
					    		</div>
					    	</div>

						    <div class="row credit-cell">
						    	<label>Name</label>
						     	<input type="text" name="name" value="" placeholder="" id="name" class="form-control" />
						    </div>				    		
						    <div class="row credit-cell last-cell">
					    		<div class="col-sm-2 col-xs-2 col-md-2 credit-cell">
							    	<label>EXP<br>DATE</label>
					    		</div>
					    		<div class="col-sm-3 col-xs-3 col-md-3 credit-cell expire-date">
					    			<!-- <input type="text" name="cc_expire_date_month" placeholder="MM" id="cc_expire_date_month_check" class="form-control">  -->
									<select name="cc_expire_date_month" id="cc_expire_date_month_check" class="form-control" style=" display: inherit;">
											<?php foreach ($months as $month) { ?>
											<option value="<?php echo $month['value']; ?>">
												<?php echo $month['text']; ?>
											</option>
											<?php } ?>
									</select>
									
					    		</div>
					    		<div class="col-sm-3 col-xs-3 col-md-3 credit-cell expire-date">
					    			<!-- <input type="text" name="cc_expire_date_year" placeholder="YYYY"  id="cc_expire_date_year_check" class="form-control"> -->
									<select name="cc_expire_date_year" class="form-control" id="cc_expire_date_year_check" style=" display: inherit;">
											<?php foreach ($year_expire as $year) { ?>
											<option value="<?php echo $year['value']; ?>">
												<?php echo $year['text']; ?>
											</option>
											<?php } ?>
									</select>
					    		</div>
					    		<div class="col-sm-2 col-xs-2 col-md-2 credit-cell">
							    	<label style="margin-top: 7px !important;text-align:right !important;">CVV</label>
					    		</div>
					    		<div class="col-sm-2 col-xs-2 col-md-2 credit-cell">
					    			<input type="text" name="cc_cvv2" id="cc_cvv2_check" size="3" value="" class="form-control">
								<?php if(!$isguest){ ?>
										<input type="hidden" id="cc_save_option" name="cc_save_option" value="0" />
								<?php } ?>
									<input type="hidden" id="select_payment_account" name="select_payment_account" value="create_new_credit_card" />
					    		</div>
						    </div>	
					    </div>
					</div>
					<div style="">
						<?php if(!$isguest){ ?>
							<div class="credit-cell cs-max-point saveFuture">
								<input id="cc_save_option_checkbox" onclick="setCcSaveOption()" type="checkbox" name="cc_save_option_checkbox" checked />
								<label for="cc_save_option_checkbox"><span><span></span></span>Save For Future </label>
							</div>
						<?php } ?>
					</div>					
				</div>
				
					<div id="custom_credit_save">	
					<!--<input type="hidden" id="cc_save_option" name="cc_save_option" value="1" />
					<input type="hidden" id="select_payment_account" name="select_payment_account" value="use_cim_payment_account" /> -->
					<div class="clearfix"></div>
					</div>
				</div>
					
				<div class="col-sm-12 col-xs-12 col-md-12 btn-area">
					<div class="form-group confirmBtn conferm">
						<!-- <input type="button" name="confirm" class="btn m-t-md pad3" value="Confirm payment"/> -->
						<b style="color: red;" style="display:none;" id="paymnt_not_assogn_box"> Payment gateway not assigned to this location. </b>
						<input type="button" value="Confirm payment" id="button-confirmm" class="btn m-t-md pad3 shop_btn" style="color:black !important;"/>
						
					
					</div>
				</div>
			</div>

			
	
			
						<div id="selected_payment_method_div">
			<input type="hidden" id="selected_payment_method" name="selected_payment_method" value="1" />
</div>
		
	<?php //} ?>

<!-------------------------------- End code ------------------------------------------->

<!-------------------------------- old code ------------------------------------------->



<!-- The below html will be loaded when the user is registered but selects not to save the cc info -->
<div id="without_saving_cc_html" style="display:none;">
	<div id="without_saving_payment_option" style="<?php //if(isset($cim_customer_profile->paymentProfiles)) echo "display: none;" ?>display:none;">	
		<?PHP /*<table class="table table-bordered table-hover">
			<tr>
				<td style="width:auto"><span class="required">*</span> <?php echo $entry_cc_number; ?></td>
				<td></td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_cc_expire_date; ?></td>
				<td><div class="col-sm-5 col-md-5 col-lg-5 padding-remove-all"><select name="cc_expire_date_month" id="cc_expire_date_month_check" class="form-control" style=" display: inherit;">
						<?php foreach ($months as $month) { ?>
						<option value="<?php echo $month['value']; ?>">
							<?php echo $month['text']; ?>
						</option>
						<?php } ?>
				</select></div><div class="col-sm-2 col-md-2 col-lg-2" style="font-size:175%;"> / </div><div class="col-sm-5 col-md-5 col-lg-5 padding-remove-all"><select name="cc_expire_date_year" id="cc_expire_date_year_check" class="form-control" style=" display: inherit;">
						<?php foreach ($year_expire as $year) { ?>
						<option value="<?php echo $year['value']; ?>">
							<?php echo $year['text']; ?>
						</option>
						<?php } ?>
				</select></div></td>
			</tr>
			<tr>
				<td><?php echo $entry_cc_cvv2; ?></td>
				<td><input class="form-control" type="text" name="cc_cvv2" id="cc_cvv2_check" autocomplete="off" value="" size="3" /></td>
			</tr>
		</table>
		*/ ?>
	</div>
</div>
</form>

<!-- The above html will be loaded when the user is registered and selects to save the cc info -->

<!-- This input filed is used to determin if the logged in user has selected pay now or pay at store -->
<div id="selected_payment_method_div">
	<input type="hidden" id="selected_payment_method1" name="selected_payment_method1" value="1" />
</div>			
</div>
<script src="upload/catalog/view/javascript/jquery.blockUI.js" type="text/javascript"></script>
<script type="text/javascript"><!--

function edit_card_datial(){
			$("#show_error_card").css({display: "none"});
			$('#cc_number_check').removeAttr('disabled');
			$('#cc_expire_date_month_check').removeAttr('disabled');
			$('#cc_expire_date_year_check').removeAttr('disabled');
			$('#cc_cvv2_check').removeAttr('disabled');
	
}
//console.log($.now());

$('#button-confirmm').on('click', function() {
 // alert(123);
	 var email = '';
     var contact_email = '';
     var email = $('#checkout_contact_email').val();
	 var contact_email = $('#contact_email').val(email);
	// alert(contact_email); return;
			$('#cc_number_check').validateCreditCard(function(result)
			{
				// alert('CC type: ' + result.card_type.name
				  // + '\nLength validation: ' + result.length_valid
				  // + '\nLuhn validation: ' + result.luhn_valid);
			});
 
 
		var cardno = /^(?:3[47][0-9]{13})$/;
		var cc_number_check = $("#cc_number_check").val();
		<?php if($amex_enabled != '1'){ ?>
			if(cardno.test(cc_number_check)){
				//alert('We do not accept American Express');
				$("#show_error_card").css({display: "block"});
				$('#cc_number_check').attr('disabled', '');
				$('#cc_expire_date_month_check').attr('disabled', '');
				$('#cc_expire_date_year_check').attr('disabled', '');
				$('#cc_cvv2_check').attr('disabled', '');
				return false;
			}else{
				true;
			}
		<?php } ?>
		
		 $.blockUI({ 
			css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
			}
		}); 
		
		// var firstname = $('#custom-checkout-form_part_1 input[type=text]');
		// console.log(firstname);
	$.ajax({
        url: '<?php echo BASE; ?>index.php?route=checkout/confirm/single_page_checkout_save_order',
        type: 'post',
        data: $('#billing_firstname input[type=text],#custom-checkout-form_part_1 input[type=text], #custom-checkout-form_part_1 input[type=\'email\'], #custom-checkout-form_part_1 input[type=\'date\'], #custom-checkout-form_part_1 input[type=\'datetime-local\'], #custom-checkout-form_part_1 input[type=\'time\'], #custom-checkout-form_part_1 input[type=\'password\'], #custom-checkout-form_part_1 input[type=\'hidden\'], #custom-checkout-form_part_1 input[type=\'checkbox\']:checked, #custom-checkout-form_part_1 input[type=\'radio\']:checked, #custom-checkout-form_part_1 textarea, #custom-checkout-form_part_1 select, #selected_payment_method_div input[type=\'text\'], #selected_payment_method_div input[type=\'hidden\']'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},
        complete: function() {
            $('#button-register').button('reset');
			
        },
        success: function(json) {
				// Show bootbox popup message
			if( json[ 'show_popup' ] && json[ 'show_popup' ] == true ) {
				bootbox.dialog({
				  title: "ERROR: ",
				  message: json[ 'show_popup_msg' ],
				  buttons: {
						success: {
							label: "Ok",
							className: "btn-success"
						}
					}
				});
			}
		
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
//console.log(json);
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
				setTimeout($.unblockUI, 100);
                if (json['error']['warning']) {
                    $('#checkout_contact').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
                }

				for (i in json['error']) {
					var element = $('#checkout_contact_' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
						
					}
				}
				//console.log(json['error']['postcode']);
				// if(json['error']['full_delivery_address']){
					// $('#full_delivery_address').after('<div class="text-danger">' + json['error'][i] + '</div>');
				// }	

			 

				if(json['error']['billing_firstname']){
					$('#billing_firstname').after('<div class="text-danger">' + json['error']['billing_firstname'] + '</div>');
				}	

				if(json['error']['lastname']){
					$('input[name=\'lastname\']').after('<div class="text-danger">' + json['error']['lastname'] + '</div>');
				}

				if(json['error']['postcode']){
					$('input[name=\'postcode\']').after('<div class="text-danger">' + json['error']['postcode'] + '</div>');
				}	

				if(json['error']['city']){
					$('input[name=\'city\']').after('<div class="text-danger">' + json['error']['city'] + '</div>');
				}		

				if(json['error']['address_1']){
					$('input[name=\'address_1\']').after('<div class="text-danger">' + json['error']['address_1'] + '</div>');
				}	
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
            } else {
				
				if($('#selected_payment_method').val() == '1'){
					var node = this;
					$.ajax({
						url: '<?php echo BASE; ?>index.php?route=payment/authorizenet_cim/send_single',
						type: 'post',
						data: $('#cimpayment').serialize(),
						dataType: 'json',		
						beforeSend: function() {
							$('#button-confirmm').button('loading');
						},
						complete: function() {
							// $('#button-confirmm').button('reset');
						},				
						success: function(json) {
							if (json['error']) {
								$('#button-confirmm').button('reset');	
								setTimeout($.unblockUI, 100);								
								<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
								json['error'] = json['error'].replace(/\n/g, '<br />'); 
								$("<div>"+json['error']+"</div>").dialog({
									modal: true,
									buttons: {
										<?php echo $text_close; ?>: function() {
										$( this ).dialog( "close" );
										$('.attention').remove();
										}
									}
									});
							<?php }else {?>
							alert(json['error']);
							setTimeout($.unblockUI, 100);
						  <?php } ?>					
							}
						   if (json['success_held']) {					
								<?php if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
								json['success_held'] = json['success_held'].replace(/\n/g, '<br />'); 
								$("<div>"+json['success_held']+"</div>").dialog({
									modal: true,
									buttons: {
										<?php echo $text_close; ?>: function() {
										$( this ).dialog( "close" );
										location = json['checkout_success_url'];
										}
									}
									});
								<?php }else {?>
								alert(json['success_held']);
								 location = json['checkout_success_url'];
							  <?php } ?>
								 location = json['checkout_success_url'];
							   }else if (json['checkout_success_url']) {
									location = json['checkout_success_url'];
								}
						},
						error: function(xhr, ajaxOptions, thrownError) {
								$('#button-confirmm').button('reset');
								alert(thrownError);
								setTimeout($.unblockUI, 100);
							}
					});
				}else{
					// alert('here'); return;
					$.ajax({
						type: 'get',
						url: '<?php echo BASE; ?>index.php?route=payment/free_checkout/custom_pay_at_store_confirm',
						cache: false,
						beforeSend: function() {
							$('#button-confirmm').button('loading');
						},
						complete: function() {
							$('#button-confirmm').button('reset');
						},
						success: function() {
							location = '<?php echo BASE; ?>index.php?route=checkout/success';
						},
					});
				}	
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			setTimeout($.unblockUI, 100);
        }
    });
	
	
});


//--></script>
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
<script type="text/javascript"><!--
/*
$( document ).ready(function() {
	// setTimeout(function(){ var id = $('input[name=\'select_payment_account\']:checked').attr('id');
	// alert(id); }, 3000);
	var id = $('input[name=\'select_payment_account\']:checked').attr('id');
	// alert(id);
	allow_cc_save(id);
    
});

function allow_cc_save(id){
	
	if(id == 'create_new_credit_card_without_save'){
		
		$('#create_new_credit_card_without_save').val('create_new_credit_card');
		
		
		$('#cc_save_option').val('0');
		$('#custom_credit_card').find('div#cim_payment_option2').remove();
		
		setTimeout(function(){ 
			var load_ws_html =  $('#without_saving_cc_html').html();
		
			$('#custom_credit_card_widthout_save').html(load_ws_html);

		}, 400);
		
		
	}else if(id == 'create_new_credit_card'){

		$('#cc_save_option').val('1');
		$('#custom_credit_card_widthout_save').find('div#without_saving_payment_option').remove();
		
		
		setTimeout(function(){ 
			var load_s_html =  $('#saving_cc_html').html();
		
			$('#custom_credit_card').html(load_s_html);

		}, 400);		
	}	
	
} */

$( document ).ready(function() {
	
	var chk_payment_profiles = '<?php echo ($cim_customer_profile ? true : false)?>';

	if(chk_payment_profiles == '' || chk_payment_profiles == 'undefined'){
		displayCardFields('cardDetails');
		$('#cardDetails').addClass('greyThisBtn');
	}else{
		$('#cardDetails').removeClass('greyThisBtn');
	}	
	setCcSaveOption();
	
});	

<?php 
	$p_option = ''; 
	if(isset($payment_option) && !empty($payment_option)){ 
		$p_option = $payment_option; 
	} 
?>
var payment_option = '<?php echo $p_option; ?>';
//1 for pay at store, 2 for pay now, 3 for both, empty for not set(will work as 3)

if(payment_option == '1'){
	//console.log(payment_option);
	//When only pay at store option is given for this shop
	$('#pay_at_store').trigger('click');
}else if(payment_option == '2'){
	//console.log(payment_option);
	//When only pay now option is given for this shop
	$('#pay_now').trigger('click');
}else{
	//console.log(payment_option);
	//When both options is given for this shop
	$('#pay_now').trigger('click');
}


function displayCardFields(id){
	
	
	
	if(id == 'cardDetails'){
		$('#cardDetails').addClass('greyThisBtn');
		$('#payment_billing_address_tbl').slideToggle();
		setTimeout(function(){ 
				var load_s_html =  $('#saving_cc_html').html();
				$('#custom_credit_card').html(load_s_html);
				if(payment_option == '1'){
					$('#payment_billing_address').hide();
				}else{	
					$('#payment_billing_address').slideDown();
				}	
				$("#cc_save_option_checkbox").prop('checked', true);
				$('#select_payment_account').val('create_new_credit_card');

		}, 400);
	}else{
		$('#cardDetails').removeClass('greyThisBtn');
		$('#custom_credit_card').find('div#cim_payment_option2').remove();
		$('#select_payment_account').val('use_cim_payment_account');
		$('#payment_billing_address').slideDown();
	}	
}	

function setCcSaveOption(){
		
	if ( $('#cc_save_option_checkbox').is(':checked') ) {
		$('#cc_save_option').val('1');
		// alert(123);
		// $('.disable-input1').attr('disabled','disabled');
		// $('#disable-input2').remove();
		// $('.disable-input3').attr('disabled','disabled');
		//$('#select_payment_account').val('create_new_credit_card');
	}else {
		$('#cc_save_option').val('0');
		//$('#select_payment_account').val('use_cim_payment_account');
		
		// var adddata = '<div id="disable-input2" >'+	
					// '<input type="hidden" id="cc_save_option" class="disable-input1" name="cc_save_option" value="1" />'+
					// '<input type="hidden" id="select_payment_account" class="disable-input3" name="select_payment_account" value="use_cim_payment_account" />'+ 
				// '</div>';

		// $('#disable-input-show').html(adddata);
		
	}
	
}



function selectedPaymentMethod(id){
	// alert(id);
	 
		$('#new_crd_seltd').removeClass('highlight');
		$('#saved_seltd').removeClass('highlight');
	if(id == 'pay_at_store'){
		$('#selected_payment_method').val('0');
		$('#pay_at_store div').addClass('highlight');
		// $('#pay_at_store div').addClass('shop_btn');
		//$('#pay_now div').removeClass('highlight');
		$('#pay_now div').removeClass('shop_btn');
		$('#pay_now_div').show('slow');
		$('#useSaveCardInfo').slideUp();
		 $('#crdinfo').hide();
		 $('#paymnt_not_assogn_box').hide();
		 $('#billing_info').hide();
		 $('#pay_there_message').show();
		$('#payment_billing_address').hide('slow');
	}else{
		var error = "<?php echo isset($error)?trim($error):'';?>";
		if(error == '')
		{
			//$('#pay_at_store div').removeClass('highlight');
			$('#pay_at_store div').removeClass('shop_btn');
			$('#pay_now div').addClass('highlight');
			$('#pay_at_store div').addClass('highlight');
			$('#pay_now div').addClass('shop_btn');
			$('#selected_payment_method').val('1');
			$('#pay_now_div').show('slow');
			$('#payment_billing_address').show('slow');
		}
		else{
			alert('Payment Gateway is not available at this time, please pay at store.');
			selectedPaymentMethod('pay_at_store');
			$('#pay_now div').addClass('highlight');
		}
	}	
}	

function payment_billing(){
	$('#payment_billing_address_tbl').slideToggle();
}

function hide_new_card(){
	var a = $('.cim_payment_select').val();
	//console.log(a);
	//shop_btn
	if(a){
		$('.new_card').slideUp();
	}
}
	
$(document).ready(function() {
	<?php if (STORE_PAYMENT_OPTION == 1 || (STORE_PAYMENT_OPTION == 2 && $assign_gateway == 'empty' || STORE_PAYMENT_OPTION == 3 && $assign_gateway == 'empty')) { ?>
		
		setTimeout(function(){ $('#pay_at_store').trigger('click'); }, 100);
	<?php } ?>
	<?php if ($cim_customer_profile && (STORE_PAYMENT_OPTION == 2 && $assign_gateway != 'empty' || STORE_PAYMENT_OPTION == 3 && $assign_gateway != 'empty')) { ?>
	$('#saved_seltd').addClass('highlight');
	$('#new_crd_seltd').removeClass('highlight');
	$('#pay_at_store div').removeClass('highlight');
	
	$('#pay_there_message').hide();
	 //console.log('1053--useSaveCard');
	 // $('#cim_payment_option2').slideDown();
	 $('#crdinfo').hide();
	 
		 $('#billing_info').show();
	 
	 $('#pay_now_div').show( "slow" );
	$('#useSaveCardInfo').show( "slow" );
	$('#select_payment_account').val('use_cim_payment_account');
	
		var adddata = '';
		// 
		var adddata = '<input type="hidden" id="cc_save_option" name="cc_save_option" value="1" />'+
					  '<input type="hidden" id="select_payment_account" name="select_payment_account" value="use_cim_payment_account" />';

		$('#custom_credit_save').html(adddata);
		
	// hide save for future card when clicking saved card 
	 $('.saveFuture').hide();
	 $('#paymnt_not_assogn_box').hide();
	 <?php } ?>
	
});

function useSaveCard(){
	$('#selected_payment_method').val('1');
	$('#saved_seltd').addClass('highlight');
	$('#new_crd_seltd').removeClass('highlight');
	$('#pay_at_store div').removeClass('highlight');
	
	
	 //console.log('1053--useSaveCard');
	 // $('#cim_payment_option2').slideDown();
	 $('#crdinfo').hide();
	 
$('#pay_there_message').hide();
$('#paymnt_not_assogn_box').hide();
	  $('#billing_info').show();
	 $('#pay_now_div').show( "slow" );
	$('#useSaveCardInfo').show( "slow" );
	$('#select_payment_account').val('use_cim_payment_account');
	
		var adddata = '';
		// 
		var adddata = '<input type="hidden" id="cc_save_option" name="cc_save_option" value="1" />'+
					  '<input type="hidden" id="select_payment_account" name="select_payment_account" value="use_cim_payment_account" />';

		$('#custom_credit_save').html(adddata);
		
	// hide save for future card when clicking saved card 
	 $('.saveFuture').hide();
	
}

<?php if (!$cim_customer_profile && $assign_gateway != 'empty') { ?>
 useNewCard();
<?php } ?>


<?php if (STORE_PAYMENT_OPTION == 2  && $assign_gateway == 'empty') { ?>
 pickupOnly();
<?php } ?>

function pickupOnly(){
		 $('#crdinfo').hide();
		 $('#confirmBtn ').hide();
		 $('#button-confirmm ').hide();
		 $('#pay_now_div').hide();
		 $('#paymnt_not_assogn_box').show();
	 
		$('#pay_there_message').hide();
		 $('#billing_info').hide();
}

function useNewCard(){
	// alert('useNewCard');
	$('#selected_payment_method').val('1');
	$('#saved_seltd').removeClass('highlight');
	$('#pay_at_store div').removeClass('highlight');
	$('#new_crd_seltd').addClass('highlight');
	
	$('#useSaveCardInfo').slideUp();
	 $('#pay_now_div').show( "slow" );
	$('#crdinfo').show( );
 $('#billing_info').show();
	$('#cim_payment_option2').show( );
	$('#select_payment_account').val('create_new_credit_card');
	
	$('#custom_credit_save').html('');
	$('#pay_there_message').hide();
	$('#paymnt_not_assogn_box').hide();
	// hide save for future card when clicking New card 
	 $('.saveFuture').show();

}

function stateSelected()
{
	//console.log('stateSelected()--1048');
}
//--></script>
