
function showAlert(){
			swal({
				title: "We are redirecting you to the starting page to select your location and time!",
				// text: "Please Select Location !!!",
				type: "success"
			}).then(function() {
				window.location = "<?php echo BASE; ?>";
			});		
}