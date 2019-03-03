
	var urlStepBack = getURLVar('step_back');
	var checkRoute = getURLVar('route');

	var isSafari = navigator.vendor && navigator.vendor.indexOf('Apple') > -1 && navigator.userAgent && !navigator.userAgent.match('CriOS');
	$( document ).ready(function() {
		if(isSafari){
			if((checkRoute == '' || checkRoute == 'common/home' || typeof checkRoute == 'undefined' || typeof checkRoute == 'null') && (urlStepBack != 'categories' || typeof urlStepBack == 'undefined') ){
				if(checkLocationId != false){
					bootbox.dialog({
					  message: "Are you sure you want to cancel this order?",
					  buttons: {
						danger: {
						  label: "YES",
						  className: "btn-danger",
						  callback: function() {
							  
							  $.ajax({
								url: $BASE + 'index.php?route=common/home/unsetCurrentOrder',
								type: 'post',
								data: {unset : 'unset'},
								beforeSend: function() {
								},
								complete: function() {
								},
								success: function() {
									$('#sidebarCart').hide();
									$('#mobile_cart_hide_first_screen').hide();
									$('#accordion').show();
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});
							
						  }
						},
						main: {
						  label: "NO, DON'T CANCEL.",
						  className: "btn-primary",
						  callback: function() {
							 location = $BASE + 'index.php?route=common/home&step_back=categories';
						  }
						}
					  }
					});
				}	
			}
		}
	});
	window.onload = function () {
		if($.type(urlStepBack) != 'undefined' && urlStepBack != '' && !isSafari){
				history.pushState(null, document.title, location.href);
				window.addEventListener('popstate', function (event)
				{
				  history.pushState(null, document.title, location.href);
				  $('#step_back_menu').trigger('click');
				});
		}
	}