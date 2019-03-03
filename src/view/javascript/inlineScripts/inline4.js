
window.fbAsyncInit = function() {
    // FB JavaScript SDK configuration and setup
    FB.init({
      // appId      : '476895882798472', // FB App ID
      appId      : '1793493744249020', // FB App ID
      cookie     : true,  // enable cookies to allow the server to access the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });
    
    // Check whether the user already logged in
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            //display user data
           /* getFbUserData(); */
		   var userData = {
						'email'		: response.email,
						'password'	: response.id,
			};
			socialLogin(userData);  
        }
    });
};

// Load the JavaScript SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Facebook login with JavaScript SDK



function fbLogin() {
	 $(".load").addClass("pageloader");
    FB.login(function (response) {
        if (response.authResponse) {
            // Get and display the user profile data
            getFbUserData();
        } else {
            //document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
			$(".load").removeClass("pageloader");
        }
    }, {scope: 'email'});
}

// Fetch the user profile data from facebook
function getFbUserData(){
    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
    function (response) { 
	var error1 = response.error;
			if(error1 ==''){
				
				alert("Error: E-Mail address does not appear to be valid!");
			   return;

			}
        // document.getElementById('fbLink').innerHTML = 'Logout from Facebook';
        // document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.first_name + '!';
        // document.getElementById('userData').innerHTML = '<p><b>FB ID:</b> '+response.id+'</p><p><b>Name:</b> '+response.first_name+' '+response.last_name+'</p><p><b>Email:</b> '+response.email+'</p><p><b>Gender:</b> '+response.gender+'</p><p><b>Locale:</b> '+response.locale+'</p><p><b>Picture:</b> <img src="'+response.picture.data.url+'"/></p><p><b>FB Profile:</b> <a target="_blank" href="'+response.link+'">click to view profile</a></p>';
		
           var formData = {
                'id': response.id,  
                'firstname'	: response.first_name,  
                'lastname'	: response.last_name,  
                'email'		: response.email,  
                'password'	: response.id,   //using for password 
                'confirm'	: response.id,   //using for password 
				'telephone'	: '0000000000',
				'social_type': '1',
				'social_id': response.id,
            };
			// var myarr = mystr.split(":");
/* register user  */
console.log(formData);

// return;
    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=checkout/register/customSave',
        type: 'post',
        data: formData,
        dataType: 'json',
        success: function(json) { 
		console.log(json);
 
			// if( json['error']['warning'] == 'Warning: E-Mail Address is already registered!'){
 
  					var userData = {
						'email'		: response.email,
						'password'	: response.id,
						'social_type'	: '1',
					};
					socialLogin(userData);    
			// }else{
				// alert(json['error']['warning']);
				
			// }
        }

    });		
		
 });
}


function socialLogin(userData) {
	 
	var current_url = window.location.href;
	var logout_page = 0;
	var srch = current_url.search("account/logout");
	if(srch > 0)
		logout_page = 1;
	$.ajax({
			url: '<?php echo BASE; ?>index.php?route=account/login/validateAjaxLogin',
			type: 'post',
			data: userData,
			dataType: 'json',
			beforeSend: function() {
				$('#login-button').val( 'Signing In...' );
				// $('#login-button').button('Signing In...');
			},
			complete: function() {
				$('#login-button').val( 'Login' );
				// $('#login-button').button('reset');
			},
			success: function(json) {
				// console.log(json);
				// $('.alert, .text-danger').remove();
				// $('.form-group').removeClass('has-error');
				$('#display-error').html('').hide();

				if (json['warning']) {
					$('#display-error').html(json['warning']).show();
				}

				if (json['success']) {
					if( logout_page ){
						location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
					}else{
						//location.reload();
					
					}
				}
			},
			error: function(json) {
				alert();
			},
			fail: function(json) {
				console.log('failed '+json);
				bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
					//location.reload();
				});
			}	
		});
		
		
$(document).ready(function () {
		$(".load").removeClass("pageloader"); 
});		
}


// Logout from facebook
function fbLogout() { 
    FB.logout(function() {
        // document.getElementById('fbLink').setAttribute("onclick","fbLogin()"); 
		// document.getElementById('fbLink').innerHTML = '<i class="fa fa-facebook fa-fw" style="color:white"></i>Login with Facebook';
        // document.getElementById('userData').innerHTML = '';
        // document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
    });
	location = '<?php echo BASE; ?>index.php?route=account/logout'; 
	location.reload(); 
}