
var googleSignInTriggered = false;
function callSignIn() { 
 $(".load").addClass("pageloader");	
	googleSignInTriggered = true;
	$("#gSignInn div").trigger("click");
	setTimeout(function() {
	$(".load").removeClass("pageloader"); 
	}, 5000);
}
function onSignIn(googleUser) {
	if( !googleSignInTriggered ) {
		return false;
	}
	console.log(googleUser);	
	googleSignInTriggered = false;
	
	var profile = googleUser.getBasicProfile();
	console.log(profile);
	var str = profile.getName(); 
	var res = str.split(" ");
 

	var gFirstname = res[0];
	var gLastname  = res[1]; 
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

	var formData = {
		'id': profile.getId(),  
		'firstname'	: gFirstname,  
		'lastname'	: gLastname,  
		'email'		: profile.getEmail(),  
		'password'	: profile.getId(),   //using for password 
		'confirm'	: profile.getId(),   //using for password 
		'telephone'	: '0000000000',
		'social_type': '2',
		'social_id': profile.getId(),
	};
	if (!$logged) {
/* register user  */
				
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=checkout/register/customSave',
			type: 'post',
			data: formData,
			dataType: 'json',
			success: function(json) { 
				// if(json['error']['warning'] == 'Warning: E-Mail Address is already registered!'){

						var userData = {
							'email'		: profile.getEmail(),
							'password'	: profile.getId(),
							'social_type'	: '2',
						};
						socialLogin(userData);
						
				// }else{
					// alert(json['error']['warning']);
					
				// }
			}
		});

	}
}
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
		console.log('User signed out.');
	});
	$('.main_logout').click(); 
}