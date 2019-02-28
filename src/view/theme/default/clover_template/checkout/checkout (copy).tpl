<?php echo $header; ?><section class="ordering_options">	<h2 class="top_head"><span class="top_head_text">CHECKOUT</span></h2></section>		<div class="container">	<div  class="col-lg-6 col-lg-offset-3 clearfix cs-breadcrumb">		<a href="javascript:history.back(1);" class="back_bt"><i class="fa fa-chevron-left" aria-hidden="true"></i> &nbsp; BACK TO CART</a>	</div>  <?php if ($error_warning) { ?>  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>    <button type="button" class="close" data-dismiss="alert">&times;</button>  </div>  <?php } ?>  <div class="row">    <div id="content" class="col-sm-12">							<div id="checkout_options" class="col-lg-6 col-lg-offset-3 checkout-container clearfix">								<div class="checkout-container-header full-width">					<h4>Checkout Options</h4>				</div>				<div id="checkout_checkboxes" class="checkout-container-content shop_font_color">					<?php if(isset($checkoutOption) && $checkoutOption == 1){ //registered only checkout allowed ?>						<div class="col-sm-6 col-xs-6">							<input id="co_sign_in" type="radio" name="checkout_options" value="sign_in" id="co_sign_in"/>							<label for="co_sign_in"><span><span></span></span>Sign In</label>						</div>						<div class="col-sm-6 col-xs-6">							<input id="co_register" type="radio" name="checkout_options" value="register" id="co_register"/>							<label for="co_register"><span><span></span></span>Register</label>						</div>					<?php }elseif(isset($checkoutOption) && $checkoutOption == 2){ ?>							<!-- Checkout option is 2, so only guest checkout is allowed, in which case								 the customer always need to go through thr whole checkout form and nothing should be shown here -->						<?php }else{ //both registered and guest checkout allowed ?>						<div class="col-sm-3 col-xs-3 xs-p0">							<input id="co_sign_in" type="radio" name="checkout_options" value="sign_in" id="co_sign_in"/>							<label for="co_sign_in"><span><span></span></span>Sign In</label>						</div>						<div class="col-sm-5 col-xs-5 xs-p0">							<input id="co_register" type="radio" name="checkout_options" value="register" id="co_register"/>							<label for="co_register"><span><span></span></span>Register</label>						</div>						<div class="col-sm-4 col-xs-4 xs-p0">							<input id="co_guest" type="radio" name="checkout_options" value="guest" id="co_guest"/>							<label for="co_guest"><span><span></span></span>Guest</label>						</div>					<?php } //end if checkoutOption	?>				</div>				</div>				<div id="selected_checkbox_content" class="col-lg-6 col-lg-offset-3 checkout-content-panel bg-white clearfix"></div>				<div id="checkout_form_content" class="col-lg-6 col-lg-offset-3 checkout-content-panel clearfix" style="display:none;"></div>					</div>  </div><script type="text/javascript"><!--$(document).ready(function() {	var checkoutOption = '<?php if(isset($checkoutOption)){ echo $checkoutOption; } ?>'; 	var logged = '<?php echo $logged; ?>';		if(logged || checkoutOption == 2){		$('#checkout_options').hide();		$.ajax({			url: 'index.php?route=checkout/checkout/loadCustomCheckoutForm',			dataType: 'html',			beforeSend: function() {				$('#button-account').button('loading');			},			complete: function() {				$('#button-account').button('reset');			},			success: function(html) {				$('.alert, .text-danger').remove();				$('#selected_checkbox_content').hide();				//$('#checkout_form_content').html(html).show();				$('#content').html(html);							},			error: function(xhr, ajaxOptions, thrownError) {				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);			}		});	}else{		$('#checkout_options').show();		$('input[name=\'checkout_options\'][value=\'sign_in\']').prop('checked', true).trigger('click');	}	});$(document).delegate('input[name=\'checkout_options\']', 'click', function() {	var value = $('input[name=\'checkout_options\']:checked').val();		if(value == 'sign_in'){		$.ajax({				url: 'index.php?route=checkout/checkout/loadSignInform',				dataType: 'html',				success: function(html) {					$('#custom-checkout-form').remove();					$('#selected_checkbox_content').html(html).show();				},				error: function(xhr, ajaxOptions, thrownError) {					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);				}			});	}else if(value == 'register'){		$.ajax({			url: 'index.php?route=checkout/checkout/loadRegisterationForm',			dataType: 'html',			beforeSend: function() {				$('#button-register').button('loading');			},			complete: function() {				$('#button-register').button('reset');			},			success: function(html) {				$('.alert, .text-danger').remove();				$('#custom-checkout-form').remove();				$('#selected_checkbox_content').html(html).show();			},			error: function(xhr, ajaxOptions, thrownError) {				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);			}		});			}else{		$.ajax({			url: 'index.php?route=checkout/checkout/loadCustomCheckoutForm',			dataType: 'html',			beforeSend: function() {				$('#button-account').button('loading');			},			complete: function() {				$('#button-account').button('reset');			},			success: function(html) {				$('.alert, .text-danger').remove();				$('#selected_checkbox_content').hide();				//$('#checkout_form_content').html(html).show();				$('#content').append(html);							},			error: function(xhr, ajaxOptions, thrownError) {				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);			}		});					}});// $(document).ready(function() {	// //$('input[name=\'checkout_options\'][value=\'sign_in\']').prop('checked', true).trigger('click');// });//login$(document).delegate('#button-login', 'click', function() {	$.ajax({			url: 'index.php?route=checkout/login/save',			type: 'post',			data: $('#checkout-login-panel :input'),			dataType: 'json',			beforeSend: function() {				$('#button-login').button('loading');			},			complete: function() {				$('#button-login').button('reset');			},			success: function(json) {				$('.alert, .text-danger').remove();				$('.form-group').removeClass('has-error');				if (json['redirect']) {					location = 'index.php?route=checkout/checkout';				} else if (json['error']) {					$('#checkout-login-panel').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');					// Highlight any found errors					$('input[name=\'email\']').parent().addClass('has-error');					$('input[name=\'password\']').parent().addClass('has-error');			   }			},			error: function(xhr, ajaxOptions, thrownError) {				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);			}		});});// Register$(document).delegate('#button-register', 'click', function() {    $.ajax({        url: 'index.php?route=checkout/register/save',        type: 'post',        data: $('#checkout-registration-panel input[type=\'text\'], #checkout-registration-panel input[type=\'date\'], #checkout-registration-panel input[type=\'datetime-local\'], #checkout-registration-panel input[type=\'time\'], #checkout-registration-panel input[type=\'password\'], #checkout-registration-panel input[type=\'hidden\'], #checkout-registration-panel input[type=\'checkbox\']:checked, #checkout-registration-panel input[type=\'radio\']:checked, #checkout-registration-panel textarea, #checkout-registration-panel select'),        dataType: 'json',        beforeSend: function() {			$('#button-register').button('loading');		},        complete: function() {            $('#button-register').button('reset');        },        success: function(json) {            $('.alert, .text-danger').remove();            $('.form-group').removeClass('has-error');            if (json['redirect']) {                location = json['redirect'];            } else if (json['error']) {                if (json['error']['warning']) {                    $('#checkout-registration-panel').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');                }				for (i in json['error']) {					var element = $('#input-payment-' + i.replace('_', '-'));					if ($(element).parent().hasClass('input-group')) {						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');					} else {						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');					}				}				// Highlight any found errors				$('.text-danger').parent().addClass('has-error');            } else {				$('.alert, .text-danger').remove();				location = 'index.php?route=checkout/checkout';            }        },        error: function(xhr, ajaxOptions, thrownError) {            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);        }    });});--></script><script>	function bypass_method_radio(id){		//alert(id);		if(id == 'use_cim_payment_account'){			$('#create_new_credit_card, #create_new_credit_card_aim').prop('checked', false);			$('#cim_payment_option2').slideUp();			$('#cim_payment_option3').slideUp();			$('#payment_billing_address').slideUp();			$('#aim_payment_option1').slideUp();		}else if(id == 'create_new_credit_card'){			$('#use_cim_payment_account, #create_new_credit_card_aim').prop('checked', false);			$('#cim_payment_option3').slideUp();			$('#cim_payment_option2').slideDown();			$('#payment_billing_address').slideDown();			$('#aim_payment_option1').slideUp();		}else if(id == 'create_new_credit_card_aim'){			$('#use_cim_payment_account, #create_new_credit_card').prop('checked', false);			$('#cim_payment_option3').slideUp();			$('#cim_payment_option2').slideUp();			$('#payment_billing_address').slideUp();			$('#aim_payment_option1').slideDown();		}		}</script><?php 	$locationSet = false;	if(isset($_SESSION['locationId']) && !empty($_SESSION['locationId'])){		$locationSet = true;		}		$step_back_url_text	= false;	$step_back_url	= false;	if(isset($breadcrumbs) && !empty($breadcrumbs)){		// $step_back_url_text	= $breadcrumbs[1]['text'];		// $step_back_url 	= $breadcrumbs[1]['href'].'&step_back='.$step_back_url_text;		$step_back_url_text	= 'categories';		$step_back_url 	= $breadcrumbs[0]['href'].'&step_back='.$step_back_url_text;	}?><script><!--	var locationSet 		= '<?php echo $locationSet; ?>';	var step_back_url_text	= '<?php echo ucfirst($step_back_url_text); ?>';	var step_back_url		= '<?php echo $step_back_url; ?>';		step_back_url		= step_back_url.replace(/&amp;/g, '&');	if(locationSet && step_back_url){		$('#step_back_menu').attr('href', step_back_url).html('<i class="fa fa-angle-left"></i> '+step_back_url_text).show();	}//-->	</script>  </div><?php echo $footer; ?>