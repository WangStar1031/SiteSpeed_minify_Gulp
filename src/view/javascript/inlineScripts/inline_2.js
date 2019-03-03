
	//auto complete address form
	function initAutocomplete() {
		
		if ( $( "#full_delivery_address" ).length ) {
			var fullAddress = $('#full_delivery_address').val();
			autocomplete = new google.maps.places.Autocomplete(
			  /** @type {!HTMLInputElement} */
			  (document.getElementById('full_delivery_address')),
			  {types: ['geocode']});
		  
			console.log(autocomplete);
		  // When the user selects an address from the dropdown, populate the address
		  // fields in the form.
		  autocomplete.addListener('place_changed', fillInAddress);
		}  
	}

	// [START region_fillform]
	function fillInAddress() {
		
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();

	  for (var component in componentForm) {
	    document.getElementById(component).value = '';
	    document.getElementById(component).disabled = false;
	  }

	  // Get each component of the address from the place details
	  // and fill the corresponding field on the form.
	  for (var i = 0; i < place.address_components.length; i++) {
	    var addressType = place.address_components[i].types[0];
	    if (componentForm[addressType]) {
	      var val = place.address_components[i][componentForm[addressType]];
	      document.getElementById(addressType).value = val;
	    }
	  }
	}