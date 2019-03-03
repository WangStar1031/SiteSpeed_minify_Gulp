
	function showRegistrationForm(){
		bootbox.hideAll();
		
		var baseURL = $BASE;
		bootbox.dialog({
		  title: "Sign Up",
		  message:  '<div id="display-error" style="font-size:130%; color:red; margin:5px 0px; display:none;"></div>'+
					'<div id="registrationData" class="container-override">' +
					'<div class="row">' +
					'<div class="col-md-12">' +
					'<div class="registration-box well col-md-12">' +
					'<div class="col-md-12">'+
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="firstname" value="" id="input-registration-firstname" placeholder="First Name" type="text" class="form-control" />' +
					'</div>' +
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="lastname" value="" id="input-registration-lastname" placeholder="Last Name" type="text" class="form-control" />' +
					'</div></div><div class="col-md-12">' +
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="email" value="" id="input-registration-email" placeholder="E-Mail Address" type="text" class="form-control" />' +
					'</div>' +
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="telephone" value="" id="input-registration-telephone" placeholder="Telephone" type="text" class="form-control" onkeypress="return isNumberKey(event)" />' +
					'</div></div><div class="col-md-12">' +
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="password" id="input-registration-password" placeholder="Password" value="" type="password" class="form-control" />' +
					'</div>' +
					'<div class="form-group col-md-6 required">' +
					'' +
					'<input name="confirm" id="input-registration-confirm" placeholder="Confirm Password" value="" type="password" class="form-control" />' +
					'</div></div>' +
					'<div class="input-group">' +
					'<div class="checkbox">' +
					'' +
					'<input name="Terms" id="Terms" type="checkbox" value="" style="opacity:1" required><label for="Terms"> I accept the <u><a href="https://biteheist.com/terms/" target="_blank">Terms and Conditions</a></u> </label>' +
					'</div>'+
					'<div class="show_error_message" style="color:#cc0000;">' +
					'</div>'+
					'</div>'+
					'<div class="form-group col-md-12">'+
					'<input id="registration-button" onclick="customRegister()" type="submit" class="btn btn-primary btn-registration-submit btn-block m-t-md shop_btn" value="CONTINUE" />'+
					'</div>'+
					'<input name="social_type" value="0" type="hidden" />'+

					'</div>'+
					'</div>'+
					'</div>'+
					'</div>'
		});
	}

	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}

	function validateAjaxRegistration(){
		$.ajax({
				url: $BASE + 'index.php?route=account/login/validateAjaxRegistration',
				type: 'post',
				data: $('#registrationData input[type=\'text\'], #registrationData input[type=\'password\'], #registrationData input[type=\'hidden\'], #registrationData input[type=\'radio\']:checked, #registrationData input[type=\'checkbox\']:checked, #registrationData select, #loginData textarea'),
				dataType: 'json',
				beforeSend: function() {
					$('#login-button').button('Signing In...');
				},
				complete: function() {
					$('#login-button').button('reset');
				},
				success: function(json) {
					//console.log(json);
					// $('.alert, .text-danger').remove();
					// $('.form-group').removeClass('has-error');
					$('#display-error').html('').hide();

					if (json['warning']) {
						$('#display-error').html(json['warning']).show();
					}

					if (json['success']) {
						location = $BASE + 'index.php?route=common/home&step_back=categories';
					}
				},
				fail: function(json) {
					console.log('failed '+json);
					bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
						location.reload();
					});
				}	
			});
	}
	// Register
	function customRegister() {
			var error = 0;
			if (!($('#Terms').is(':checked'))) {
				error = 1
				$('.show_error_message').text("You must agree with the terms and conditions");
			}
			
			if (error) {
				return false;
			} else {
				 true;
			}
		
	    $.ajax({
	        url: $BASE + 'index.php?route=checkout/register/customSave',
	        type: 'post',
	        data: $('#registrationData input[type=\'text\'], #registrationData input[type=\'date\'], #registrationData input[type=\'datetime-local\'], #registrationData input[type=\'time\'], #registrationData input[type=\'password\'], #registrationData input[type=\'hidden\'], #registrationData input[type=\'checkbox\']:checked, #registrationData input[type=\'radio\']:checked, #registrationData textarea, #registrationData select'),
	        dataType: 'json',
	        beforeSend: function() {
				$('#button-register').button('loading');
			},
	        complete: function() {
	            $('#button-register').button('reset');
	        },
	        success: function(json) {
	            $('.alert, .text-danger').remove();
	            $('.form-group').removeClass('has-error');

	            if (json['redirect']) {
	                location = json['redirect'];
	            } else if (json['error']) {
	                if (json['error']['warning']) {
	                    $('#registrationData').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
	                }

					for (i in json['error']) {
						var element = $('#input-registration-' + i.replace('_', '-'));

						if ($(element).parent().hasClass('input-group')) {
							$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
						} else {
							$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
						}
					}

					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
	            } else {
					$('.alert, .text-danger').remove();
					location.reload();
	            }
	        },
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
	    });
	}