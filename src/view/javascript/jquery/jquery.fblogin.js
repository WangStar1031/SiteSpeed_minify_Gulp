// added in version 1.2 -> "stay on same page"
var  fb_login_stay_here = false; 

$(document).ready(function() { 
	// for case multiple buttons - add uid
	$('.ocx-fb-login-trigger').each(function(index) {
		$(this).attr('fb-login-uid', index).addClass('fb-login-uid-' + index);
	});
	
	// FB Login button click functions
    $('body').on('click', '.ocx-fb-login-trigger', function() {	
		fb_login_button_uid = $(this).attr('fb-login-uid');
		
		if ($(this).hasClass("ocx-stay-here")) {
			fb_login_stay_here = true;
		} else {
			fb_login_stay_here = false;  // to avoid case when value is set from previous call
		}
		
		FB.getLoginStatus( function(response){
			if (response.status !== 'connected') {
				FB.login(function(response) {
					if (response.authResponse) {
						$('.ocx-fb-login-trigger.fb-login-uid-' + fb_login_button_uid).trigger('click');
					}	
				}, { scope: 'email'});
			
			} else {  // LOGGED ON FACEBOOK
				
				FB.api('/me?fields=id,name,email,first_name,last_name', function(response) {
					
					$.ajax({
						type: 'POST',
						url: 'index.php?route=module/fb_login/checkuser',
						data: response,
						dataType: 'json',
						beforeSend: function () {
							$('#fb-login-modal').remove();
							$('#fb-login-loading-overlay').remove();
								
							$('body').prepend('<div id="fb-login-loading-overlay" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"><i class="fb-login-loading fa fa-5x fa-spinner fa-spin"></i></div>');	
							
							$('#fb-login-loading-overlay').modal('show');
						},
						success: function(json) {
							if (json['redirect']) {
								
								if (fb_login_stay_here) {
									location.reload();
								} else {
									location = json['redirect'];
								}	
							}
							
							if (json['output']) {
								$('#fb-login-loading-overlay').modal('hide');
								
								$('body').prepend(json['output']);
								$('#fb-login-modal').modal('show');
							}
						}
					});
				});
			}
		});
    });
	
	// function for "more info required"
	$('body').on('click', '#fb-login-register-now', function() { 
		$.ajax({
			type: 'POST',
			url: 'index.php?route=module/fb_login/accountExtraInfo',
			data: $('#fb-login-form').serialize(),
			dataType: 'json',
			beforeSend: function () {
				$('#fb-login-form').before('<div class="fb-login-loading-inside"><i class="fa fa-5x fa-spinner fa-spin"></div></i>');
				$('#fb-login-form').hide();
				
			},
			success: function(json) {
				$('#fb-login-modal .modal-body .fb-login-loading-inside').remove();
				$('#fb-login-form .alert').remove();
				
				if (json['error']) {
					if (json['error']['warning']) {
						$('#fb-login-form').show();
						$('#fb-login-form').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '</div>');
					}
				}
				
				if (json['redirect']) {
					$('#fb-login-modal').modal('hide');
					
					if (fb_login_stay_here) {
						location.reload();
					} else {
						location = json['redirect'];
					}
				}
			}
		});
	});
});