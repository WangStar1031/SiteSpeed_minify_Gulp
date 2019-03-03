
	function showLoginForm(){
		var baseURL = $BASE;
		bootbox.dialog({
		  title: "Sign In",
		  message:  '<div id="display-error" style="font-size:130%; color:red; margin:5px 0px; display:none;"></div>'+
		  '<div class="load"></div>'+
					'<div id="loginData" class="container-override">' +
					'<div class="row">' +
					'<div class="col-md-12">' +
					'<div class="login-box well">' +
					'<div class="form-group control-group">' +
					'<div class="inner-addon"><i class="fa fa-user u-name shop_font_color" aria-hidden="true"></i>' +
					'<input name="email" value="" id="username-email" placeholder="E-Mail Address" type="text" class="form-control" /></div>' +
					'</div>' +
					'<div class="form-group">' +
					'<div class="inner-addon"><i class="fa fa-lock pass shop_font_color" aria-hidden="true"></i>' +
					'<input name="password" id="password" value="" placeholder="Password" type="password" class="form-control" /></div>' +
					'</div>' +
					'<div class="input-group">' +
					'<div class="checkbox">' +
					'<label class="control control--checkbox ">' +
					'<input name="remember_me" id="login-remember" type="checkbox" name="remember" value="1" style="opacity:1"><label for="login-remember"> Remember me </label>' +
					'<div class="control__indicator"></div>'+
					'</label>'+
					'</div>'+
					'</div>'+
					'<span class="custom-span"><a href="'+baseURL+'index.php?route=account/forgotten" class="text-sm t-30">Forgot Password?</a></span>' +
					'<div class="form-group">'+
					'<input id="login-button" onclick="validateLogin()" type="submit" class="btn btn-default btn-login-submit btn-block m-t-md shop_btn" value="Login" />'+
					'</div>'+
					'<div class="form-group sign-up">'+
					'<p class="text-center m-t-xs text-sm">Do not have an account?</p>' + 
					'<a href="javascript:void(0)" onclick="showRegistrationForm()" class="btn button-green btn-block m-t-md shop_btn">Create an account</a>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'</div>'
		});
	}


	function validateLogin() {
		var current_url = window.location.href;
		var logout_page = 0;
		var srch = current_url.search("account/logout");
		if(srch > 0)
			logout_page = 1;
		$.ajax({
				url: $BASE + 'index.php?route=account/login/validateAjaxLogin',
				type: 'post',
				data: $('#loginData input[type=\'text\'], #loginData input[type=\'password\'], #loginData input[type=\'hidden\'], #loginData input[type=\'radio\']:checked, #loginData input[type=\'checkbox\']:checked, #loginData select, #loginData textarea'),
				dataType: 'json',
				beforeSend: function() {
					$('#login-button').val( 'Signing In...' );
				},
				complete: function() {
					$('#login-button').val( 'Login' );
				},
				success: function(json) {
					$('#display-error').html('').hide();

					if (json['warning']) {
						$('#display-error').html(json['warning']).show();
					}

					if (json['success']) {
						if( logout_page )
							location = $BASE + 'index.php?route=common/home&step_back=categories';
						else
							location.reload();
					}
				},
				error: function(json) {
					alert();
				},
				fail: function(json) {
					console.log('failed '+json);
					bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
						location.reload();
					});
				}	
			});
	}