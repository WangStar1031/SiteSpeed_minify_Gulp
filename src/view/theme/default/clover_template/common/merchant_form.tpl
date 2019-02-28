<!DOCTYPE html>
<html lang="en">
<head>
  <title>BiteHeist</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

  <body class="bg-light">

    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="http://ec2-34-210-139-20.us-west-2.compute.amazonaws.com/ordering/common/upload/catalog/view/theme/default/image/add_to_home.png" alt="" width="72" height="72">
        <h2>BiteHeist Merchant form</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your Merchant</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Merchant</h6>
                <small class="text-muted"><?php echo $merchant_name; ?></small>
              </div>
              <span class="text-muted"><?php echo $merchant_id; ?></span>

            </li>            
			<li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Employee</h6>
                <small class="text-muted"><?php echo $employee_name; ?></small>
              </div>
              <span class="text-muted"><?php echo $employee_id; ?></span>
            </li>
          </ul>
		  <p style="color:red;font-size:10px">* Note: Do not refresh this page</p>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Personal Information</h4>
          <form id="formid" class="needs-validation"  action="index.php?route=cloverAPI/clover/merchant_form_submit" method="POST" novalidate>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="Name">Name</label>
                <input type="text" name="name" class="form-control" id="Name" placeholder="" value="" required/>

              </div>
				<div class="col-md-6 mb-3">
				  <label for="email">Email <span class="text-muted"></span></label>
				  <input type="email" name="email" class="form-control" id="email" placeholder="you@example.com" required/>

				</div>
            </div>  
 		<br>
			<h4 class="mb-3">Restaurant Information</h4>	
			<div class="row">
              <div class="col-md-6 mb-3">
                <label for="shop_name">Shop Name</label>
                <input type="text" name="shop_name" class="form-control" id="shop_name" placeholder="" value="" required/>

              </div>
              <div class="col-md-6 mb-3">
                <label for="phone_number">Phone Number</label>
                <input type="text" name="phone_number" class="form-control" id="phone_number" placeholder="" value="" required/>

              </div>
            </div>	
						  <div class="mb-3">
              <label for="address">Address</label>
              <input type="text" name="address" class="form-control" id="address" placeholder="1234 Main St" required/>

            </div>
			<br>
			<h4 class="mb-3">Set Up</h4>			
			<div class="row">
 			  <div class="col-md-6 mb-3">
				  <label for="email_notification">Email For Order</label>
				  <input type="text" name="email_notification" class="form-control" id="email_notification" placeholder="" value="" required/>
				  *Send Each Order To This Email*
              </div>      			  
			  <div class="col-md-6 mb-3">
				  <label for="sms_phone">SMS Order</label>
				  <select name="sms_enable">
					  <option  value="1">Yes</option>
					  <option  value="0">No</option>
					</select> <input type="text" name="sms_phone" class="form-control" id="sms_phone" placeholder="" value="" required/>
				  *Send Each Order To This Phone*
              </div>
            </div>			
					
			
			<div class="row">
              <div class="col-md-4 mb-3"><br>
                <label for="payment_option">Payment Options</label>
				  <select name="payment_option">
						<option value="Both">Both</option>
						<option value="Pay Now Only">Pay Now Only</option>	
						<option value="Pay At Store Only">Pay At Store Only</option>
					</select> 

              </div>
				<div class="col-md-4 mb-3"><br>
                <label for="delivery_option">Delivery Options</label>
				  <select name="delivery_option">
					<option value="Both">Both</option>
					<option value="Delivery Only">Delivery Only</option>
					<option value="Pickup Only">Pickup Only</option>
					</select> 

              </div> 				
			  <div class="col-md-4 mb-3"><br>
                <label for="guest_option">Allow Guest Ordering</label>
				  <select name="guest_option">
					<option value="Both">Both</option>
					<option value="Registered Only">Registered Only</option>
					<option value="Guest Only">Guest Only</option>
					</select> 

              </div>            
            </div>          


			  <input type="hidden" name="employee_id" value="<?php echo $employee_id; ?>">
			  <input type="hidden" name="merchant_id" value="<?php echo $merchant_id; ?>">
			  <input type="hidden" name="shop_token" value="<?php echo $_GET['code']; ?>">
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" id="submit" type="submit">Submit</button>
          </form>
        </div>
      </div>

      <!-- <footer class="my-5 pt-5 text-muted text-center text-small"> -->
        <!-- <p class="mb-1">&copy; 2017-2018 Company Name</p> -->
        <!-- <ul class="list-inline"> -->
          <!-- <li class="list-inline-item"><a href="#">Privacy</a></li> -->
          <!-- <li class="list-inline-item"><a href="#">Terms</a></li> -->
          <!-- <li class="list-inline-item"><a href="#">Support</a></li> -->
        <!-- </ul> -->
      <!-- </footer> -->
    </div>
  </body>
  <script>
     
       
 $("form").submit(function(e){
		  $("form#formid :input").each(function(){
				// This is the jquery object of the input, do what you will
				var input = this.value;
				var name=this.name;
				name=name.toUpperCase();
				name=name.replace("_", " ");

					if(input==""){
						if(name){
							alert(name+" Field Is Required");
							 e.preventDefault();
						 }
						if(typeof(this.value) && typeof(this.name)){
						  return;
						  }
					}else{
						if(name=="EMAIL" || name=="EMAIL NOTIFICATION"){
							var VAL = this.value;

							var email = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

							if (email.test(VAL)) {
								return;
							}else{
								alert("This "+name+" is Incorrect");
								e.preventDefault();
							}
						}
						if(name=="PHONE NUMBER" || name=="SMS PHONE"){
							var numberRegex = /^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/;
							var str = input;
							if(numberRegex.test(str)) {
							   return;
							}else{
								alert("This "+name+" is Incorrect");
								e.preventDefault();
							}
						
						}
					}
			
		});
		});
  </script>
</html>
