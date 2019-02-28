<?php

	if($shop_token){

 ?> 
   
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>Current Orders</title>

    <!-- Add custom CSS here -->

    <link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/bootstrap_admin.css" rel="stylesheet">
    <link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/new_page_style.css" rel="stylesheet">

	<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js" type="text/javascript"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootbox/bootbox.js" type="text/javascript"></script>
	
	

    <!-- JavaScript -->
   

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- new page css links-->
	<style>
	.full {
		background: rgba(0, 0, 0, 0.4) none repeat scroll 0 0;
		height: 100%;
		position: absolute;
		width: 100%;
		z-index: 9999;
	}

	.loader {
		-moz-border-bottom-colors: none;
		-moz-border-left-colors: none;
		-moz-border-right-colors: none;
		-moz-border-top-colors: none;
		animation: 2s linear 0s normal none infinite running spin;
		border-top: 16px solid gray;
		border-image: none;
		border-radius: 50%;
		border-style: solid;
		border-width: 16px;
		height: 80px;
		left: 50%;
		position: fixed;
		top: 50%;
		width: 80px;
		z-index: 999;
	}

	@-webkit-keyframes spin {
	  0% { -webkit-transform: rotate(0deg); }
	  100% { -webkit-transform: rotate(360deg); }
	}

	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}
	</style>
	
	<script type="text/javascript">
	
	var orders_notification = false;
	var shop_token = '<?php echo $shop_token; ?>';
	var pickup_id = '<?php echo $pickup_id; ?>';
	

	
	function new_order_check(order_status){
		// alert(order_status);
		  $.ajax({
			  type: "POST",
			  url: '<?php echo BASE; ?>index.php?route=common/admin_dasboard/checkOrder&shop_token='+shop_token+'&id='+pickup_id,
			  dataType: 'json',
			  success: function(data){
				 var order_value =  $( "#check_value" ).val();
				 // var  new_order = '';
				  if(data.count_order > order_value){
					  
							$('#total_order').load(document.URL +  ' #total_order');
					  
					  var  new_order = data.count_order - order_value;
						$('#abc').html(' New Orders');
						$( "#check_value" ).val(data.count_order); 
						// no need to show pop up at first visit
						if( orders_notification == false ) {
							orders_notification = true;
						} else {
							if( $('#myModal').is(':hidden')=== true ){
								$('#myModal1').trigger('click');
								$( "#check_value" ).val(data.count_order);
							}
						}
						
					 
					  // old_order = $( "#check_value" ).val(); 
						
				  }
			 }
		  });
	}

	
	function order_listing( order_status_check ){
		if( typeof order_status_check == 'undefined' )
			order_status_check = '';

		// alert(order_status_check);
		
		if(order_status_check != '' || order_status_check == '0'){
			$( "#checbox-status" ).val('');
		}
		var status_checkbox_chk = $( "#checbox-status" ).val();
		
		if(status_checkbox_chk == '1'){
			// alert('test');
			return;
		}
		

		
		
		
		if(order_status_check == '0'){
			// btn_active
			var unCheck_value = $("#unCheck_value").val();
		
			if(unCheck_value == ''){
				unCheck_value = $( "#unCheck_value" ).val('1');
			}else{
				unCheck_value = $( "#unCheck_value" ).val('');
			}
			
			var unCheck_value = $("#unCheck_value").val();
			
		
			if(unCheck_value == '1'){
				var pending_status = order_status_check;
				
				$( "#status" ).val('0');
				$('#cancel-status').hide();
				$('.footer_items').hide();
				$('#edit-status').show();
				$( "#pending_box" ).addClass( "btn_active" );
				// $( "#ready_box" ).removeClass( "btn_active" );
				// $( "#delivered_box" ).removeClass( "btn_active" );
			}else{
				var pending_status = '';
				$( "#status" ).val('');
				$( "#pending_box" ).removeClass( "btn_active" );
				// $( "#ready_box" ).removeClass( "btn_active" );
				// $( "#delivered_box" ).removeClass( "btn_active" );
				$('#edit-status').hide();
				$('#cancel-status').hide();
				$('.footer_items').hide();
			}
		}else{
			if( $( "#status" ).val() == '0' ){
				var pending_status = $( "#status" ).val();
			}else{
				var pending_status = '';
			}
		}
		
		if(order_status_check == '1'){
			
			
			
			var unCheck_prepared = $("#unCheck_prepared").val();
		
			if(unCheck_prepared == ''){
				unCheck_prepared = $( "#unCheck_prepared" ).val('1');
			}else{
				unCheck_prepared = $( "#unCheck_prepared" ).val('');
			}
			
			var unCheck_prepared = $("#unCheck_prepared").val();

			if(unCheck_prepared == '1'){
				prepared_status = order_status_check;
				
				$( "#prepared_status" ).val('1');
				$('#cancel-status').hide();
				$('.footer_items').hide();
				$('#edit-status').show();
				// $( "#pending_box" ).removeClass( "btn_active" );
				$( "#ready_box" ).addClass( "btn_active" );
				// $( "#delivered_box" ).removeClass( "btn_active" );
			}else{
				prepared_status = '';
				$( "#prepared_status" ).val('');
				// $( "#pending_box" ).removeClass( "btn_active" );
				$( "#ready_box" ).removeClass( "btn_active" );
				// $( "#delivered_box" ).removeClass( "btn_active" );
				$('#edit-status').hide();
				$('#cancel-status').hide();
				$('.footer_items').hide();
			}
			
		}else{
			if( $( "#prepared_status" ).val() == '1' ){
				var prepared_status = $( "#prepared_status" ).val();
			}else{
				var prepared_status = '';
			}
		}
		
		if(order_status_check == '2'){
			
			var unCheck_deliverd = $("#unCheck_deliverd").val();
		
			if(unCheck_deliverd == ''){
				unCheck_deliverd = $( "#unCheck_deliverd" ).val('1');
			}else{
				unCheck_deliverd = $( "#unCheck_deliverd" ).val('');
			}
			
			var unCheck_deliverd = $("#unCheck_deliverd").val();
			
			if(unCheck_deliverd == '1'){
				
				delivered_status = order_status_check;
				
				$( "#delivered_status" ).val('2');
				$('#cancel-status').hide();
				$('.footer_items').hide();
				$('#edit-status').show();
				// $( "#pending_box" ).removeClass( "btn_active" );
				// $( "#ready_box" ).removeClass( "btn_active" );
				$( "#delivered_box" ).addClass( "btn_active" );
			}else{
				delivered_status = '';
				$( "#delivered_status" ).val('');
				// $( "#pending_box" ).removeClass( "btn_active" );
				// $( "#ready_box" ).removeClass( "btn_active" );
				$( "#delivered_box" ).removeClass( "btn_active" );
				$('#edit-status').hide();
				$('#cancel-status').hide();
				$('.footer_items').hide();
			}
		}else{
			if( $( "#delivered_status" ).val() == '2' ){
				var delivered_status = $( "#delivered_status" ).val();
			}else{
				var delivered_status = '';
			}
		}
		
		
		

		
		
		
		if(order_status_check == ''){
			var status_check = $( "#status" ).val();
			var prepared_status_check = $( "#prepared_status" ).val();
			var delivered_check = $( "#delivered_status" ).val();
			
			if(status_check){
				var pending_status = $( "#status" ).val();
			}else{
				var pending_status = '';
			}

			if(prepared_status_check){
				prepared_status = $( "#prepared_status" ).val();
			}else{
				prepared_status = '';
			}

			if(delivered_check){
				delivered_status = $( "#delivered_status" ).val();
			}else{
				delivered_status = '';
			}
			
		}

		
		$.ajax({
		  type: "GET",
		  url: '<?php echo BASE; ?>index.php?route=common/admin_dasboard/getOrderListing&shop_token='+shop_token+'&id='+pickup_id+'&order_status_check='+pending_status+'&prepared_status='+prepared_status+'&delivered_status='+delivered_status,
		  // data: myDataVar.toString(),
		  dataType: 'json',
		  success: function(data){
			  
			  // data.msg = '';
			  // console.log(data.msg);
			  // if(data.msg = 'invalid order!!!' && data.msg != 'undefined'){
				  // alert('error order');
				  // return;
			  // }
			  // console.log(data.order_status.pending);
			  // alert("Save Complete");
			  // var edit_listing =	'<p>show</p>'+	
								
									// '<button type="button" class="btn btn-default custom_btn pull-right" style="float:right;">Edit</button>';
									
									// $('#edit_listing_box').html(edit_listing);
			  if(data){
				
				  var orderdata = '';
				   $.each(data.order, function(key, val){
						var color_class = "";
						if(val.order_status_type=="pending"){
							color_class = "delivery";	
						}else if(val.order_status_type=="ready"){
							color_class = "unpaid";
						}else if(val.order_status_type=="delivered"){
							color_class = "paid";
						}
						var  fa_times="fa fa-times-circle";
						// var is_paid = "UNPAID";
						if( val.is_paid == "PAID" ) {
							// is_paid = "PAID";
						 fa_times="fa fa-check-circle";
						}
						
						var order_method = "PICK UP";
						if( val.MethodChosenId == "2" ) {
							order_method = "Delivery";
						}
						
						if( typeof val.order_id != 'undefined'){
							
						
					   // alert("Save Complete");
						// $('#stars').append('<input type="text" id="star" value="'+star+'" />');
						 console.log(val);
						orderdata  += 	'<div class="row new_row '+color_class+'">'+
												'<div class="checkbox checkbox-info checkbox-circle" id="list_checkbox">'+
													'<input class="get-status" id="'+ val.order_id +'"  type="checkbox" name="change_status[]" value="'+ val.order_id +'" onclick=checkedSubmitValue(this.id); />'+
													'<label for="'+ val.order_id +'">'+
													'</label>'+
												'</div>'+
												'<a href="<?php echo BASE; ?>index.php?route=common/admin_dasboard/order_info&shop_token='+shop_token+'&id='+pickup_id+'&order_id='+ val.order_id +'">'+
													'<div class="col-xs-12 col-sm-2 col-md-2 a_pick_up">'+
														'<span><i aria-hidden="true" class="fa fa-shopping-bag"></i><br>'+
														// ''+ val.order_method +'</span><br>'+
														''+ order_method +'</span><br>'+
														'<hr>'+
														'<span><i class="'+fa_times+'" aria-hidden="true"></i><br>'+
														// ''+ val.is_paid +'<span><br></span></span>'+
														''+ val.is_paid +'<span><br></span></span>'+
													'</div>'+
													'<div class=" col-xs-12 col-sm-3 col-md-3 a_user_name" >'+
														'<p>'+ val.customer_type +'</p>'+
														'<h2>'+ val.fullname +'</h2><label>phone:&nbsp;'+ val.telephone +'</label>'+
													'</div>'+
													'<div class="col-xs-12 col-sm-3 col-md-3 a_user_name" >'+
														'<p>submited</p>'+
														'<h2>'+ val.submit_date +'</h2><label>amount:&nbsp;'+ val.total +'</label>'+
													'</div>'+
													'<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">'+
														'<p>'+ val.order_status_type +'</p>'+
														'<h2>'+ val.order_type +'</h2>'+
														'<p>'+val.date_per_order+'</p>'+
													'</div>'+
												'</a>'+
												'<a href="wow"></a>'+
												'<div class=" col-xs-12 col-sm-1 col-md-1 a_printer" style="padding-top:10px;">'+
													'<a href="javascript:void(0);" onclick="get_print('+ val.order_id +');"><i aria-hidden="true" class="fa fa-print"></i></a>'+
												'</div>'+
											'</div>';
							}				
					}); // end each
					
					$('#order_listing_box').html(orderdata);
		     }else{
				 alert('error');
			 } 
		  } // success
		  
		});
		
	}
	
	$( document ).ready(function() {
		
		var status_checkbox_chk = $( "#check_value" ).val('0');
		// if(status_checkbox_chk != '1'){
			// alert('test');
			setInterval('order_listing()',2000);
			
			setInterval('new_order_check()',2000);
		// }
	});
	
	function get_print(order_id){
		
		$(".full").show();
		
		  $.ajax({
		  type: "POST",
		  url: '<?php echo BASE; ?>index.php?route=common/admin_dasboard/sendPrintRequest&shop_token='+shop_token,
		  data: {order_id: order_id},
		  dataType: 'json',
		  success: function(data){
			  
						if(data.error){
							$(".full").hide();
							alert(data.error);
						}else{
							// alert('success');
							if(data.success){
								$(".full").hide();
								// $( "#print_success" ).trigger( "click" );
								// $('#print_success').data("target");
								alert('success');
								
							}
						} 
					}
		  });
		
	}
	
	
	</script>
	<script>
	function status_delivery(id){
	 //alert(id);
	
		var status = $('#'+id).val();
	
	
	  if(status == 0){
			$('#'+id).val('1');
		var data = 1;
		// console.log(delivery_status);
	  }
	  
	  if(status == 1){
		$('#'+id).val('0');
		var data = 0;
		// console.log(delivery_status);
	  }
	  
	 $.ajax({ 
		url: '<?php echo BASE; ?>index.php?route=common/admin_dasboard/status_on_off_toggle',
        type: 'POST',
        data: {online_ordering_status:data,title_status:'<?php echo $data['title'];?>'},
		dataType: 'text',
        success: function(data) {
			if(data==1){
				 $("#myonoffswitch").attr("checked","checked");
				
			}else{
				$("#myonoffswitch").removeAttr("checked","checked");
			}
			}
		});
	 
}
	</script>
	<script>
	$( document ).ready(function() {
		// footer_items
		$('#edit-status').click(function(){
			$('.footer_items').toggle();
			$('#cancel-status').show();
			$('#edit-status').hide();

			//checkbox add style
			$('.new_row').css({"position":"relative","right":"-30px"});
			$( "#checbox-status" ).val('1');
			$('#list_checkbox').show();
		});

		$('#cancel-status').click(function(){
			$('.footer_items').hide();
			$('#edit-status').show();
			$('#cancel-status').hide();
			$('#list_checkbox').hide();
			
			/// check box
			$( "#checbox-status" ).val('');
			$('.new_row').css({"position":"","right":""});
		});	
		
		// position: relative; 
     // right: -30px; 
	 
	 
	 
		
	});
	
	function checkedSubmitValue(id){
		
			if($("#"+id).is(':checked')){
				// console.log(id);
				// $("#"+id).val(id);
			}else{
				$("#"+id).val('');  // 
     		}
	}
	
	function changeStatusOrder(data_status){
		
		var shop_token =  '<?php echo $shop_token; ?>';
		var pickup_id =   '<?php echo $pickup_id; ?>';
		var result_data = new Array();
		// var error = true;
		 $('.get-status').each(function(key, val ){
			 // $(this).val();
			 
			 if($(this).is(':checked')){
					
					// var result_data = this.value;
					result_data.push(this.value); 
					// var error = false;
			 }
		});
					
					$.ajax({
						  type: "POST",
						  url: '<?php echo BASE; ?>index.php?route=common/admin_dasboard/orderStatusSave&shop_token='+shop_token+'&id='+pickup_id,
						  data: {order_status_type : data_status, order_status_data : result_data},
						  dataType: 'json',
						  success: function(data){
							  alert( 'success' );
							  window.location.reload();
						  }
					});
		
	}
	


 // This will run on page load

	
	</script>
	
	<style>
	
.custom_bt {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    display: block;
    width: 100%;
    text-transform: uppercase;
    font-size: 25px;
}
.outer_width.col-md-6.col-md-offset-1 > img {
left: 5px;
opacity: 0.5;
position: absolute;
top: 11px;
z-index: 11;
}
.outer_width.col-md-6.col-md-offset-1 {
position: relative;
}
.image {
background: rgba(0, 0, 0, 0) url("http://ec2-34-210-139-20.us-west-2.compute.amazonaws.com/ordering/common/upload/catalog/view/theme/default/image/coming-soon-300x160.jpg") no-repeat scroll center center / 300px 160px;
height: 160px;
left: 0;
margin:0px -104px auto;
opacity: 0.5;
position: absolute;
top: 13px;
width: 100%;
z-index: 5;
}



</style>

</head>

<body>
<div class="full" style="display: none;" ><div class="loader"></div></div>
<div class="container-fluid">

   <div id="page-wrapper">
   
   
   <input type= "hidden" name="check_value" value="" id="check_value">
   <input type= "hidden" name="unCheck_value" value="" id="unCheck_value">
   <input type= "hidden" name="unCheck_prepared" value="" id="unCheck_prepared">
   <input type= "hidden" name="unCheck_deliverd" value="" id="unCheck_deliverd">

		<button type="hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="myModal1" style="display:none;" >Open Modal</button>
		
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="background: #9c0a0e; ">
			  <div class="modal-header">
				<!--button type="button" class="close" data-dismiss="modal">&times;</button-->
			  </div>
			  <div class="modal-body">
				<center><p id="abc" style="font-size:36px; color:#fff"></p></center>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default custom_bt" data-dismiss="modal">ok</button>
			  </div>
			</div>

		  </div>
		</div>
        <div class="row">
          <div class="col-md-3  col-sm-3 col-xs-6">
            <!-- <h1>Dashboard <small>Statistics Overview</small></h1> -->
            <div class="header-logo">
						<a href="https://biteheist.com"><img src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/admin_dashboard_logo.png" alt=""></a>
					</div>
            
          </div>
          
          <div class="col-md-3  col-sm-3 col-xs-6 hidden-xs shop_name">
            <h1 style="text-transform: capitalize;"><?php echo SHOP_NAME;?></h1>
            
          </div>
          
          <div class="col-md-4  col-sm-5 col-xs-6 hidden-xs shop_name">
            <h1 style="text-transform: capitalize;"><?php echo $data['title'];?></h1>
            
            
          </div>
		         
		            <div class=" col-md-2    col-sm-1 col-xs-4  pull-right  ">
            <!-- <h1>Dashboard <small>Statistics Overview</small></h1> -->
            <ol class="breadcrumb ol_list">
				<li class="pull-right">
					<div class="onoffswitch ">		
						
						<!-- Rounded switch -->
						<label class="switch">
						  <input name="delivery_status" onclick="status_delivery(this.id);" class="onoffswitch-checkbox" id="myonoffswitch" value="<?php if($status==1){echo "1";}else{echo "0";}?>" <?php if($status==1){echo "checked";}?> type="checkbox">
						  <div class="slider round"></div>
						</label>
					</div>
				</li>
            </ol>
            
          </div>
        </div> <!-- /.row -->
	
	
        <div class="row">
	 		
				          <div class="col-xs-12 col-sm-4 col-md-4 first_box_top">
            <div class="panel panel-warning first_box">
              <div class="panel-heading">
                <div class="row">
					<center style="margin-top: 5px;"><i style="margin-right:10px;" class="fa fa-shopping-basket fa-1x"></i><font size="5">Orders</font></center>
            
                 
				<center>
				
                    <p id="total_order" class="announcement-heading"><b style="font-size:65px;"><?php echo $current_date; ?></b></p>
				
					<legend style="width:90px; color:black;"></legend>
                    <p class="announcement-text">CURRENT</p>
				</center>
              
                </div>
              </div>
              <!--<a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                      <a href="http://indian2/ci_bitehiest/Users">Users
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>-->
            </div>
          </div>
		  

        <div class="col-XS-12 col-sm-8 col-md-8" style="padding-left: 0px; border-top: 5px solid rgb(202, 206, 216);">
            <div class="panel panel-danger second_box">
              <div class="panel-heading">
                <div class="row">
					<div><center style="margin-top:5px;"><i style="margin-right:10px;" class="fa fa-clock-o fa-1x"></i><font class="first_box_font" size="5">Pickup Time</font></center></div>
                  <div class="col-xs-12 col-sm-4 col-md-5 first_minute">
					  <center>
					 
					<?php if(isset($data['delivery_ready_time']) && $data['delivery_ready_time'] > 0 && $data['delivery_ready_time'] > $min_prep_time){ $min_prep_time = $data['delivery_ready_time']; ?>
						<p class="announcement-heading"><b style="font-size:65px;"><?php echo $min_prep_time; ?></b></p>
					<?php }else{ ?>
						<p class="announcement-heading"><b style="font-size:65px;"><?php echo $min_prep_time; ?></b></p>
                    <?php } ?>
					<input type="hidden" name="checbox_status" value="" id="checbox-status" >
					<legend style="width:90px; color:black;"></legend>
                    <p class="text">MINUTES</p>
					
					  <!--<button href="#" type="button" class="btn btn-primary btn-xs dsble_btn">Pause Ordering</button>-->
					<!--<p class="text" style="background:#80808099; width:90px; height:25px; margin-top:10px;" ><font color="white" size="1" style="margin-left:9px;">Pause Ordering</font></p> -->
					</center>	  
                  </div>
				  <div class="outer_width col-md-6 col-sm-8 col-xs-12 col-md-offset-1">
				  <div class="image">
				  </div>
				  <img class="display_block" src="<?php echo IMG_URL; ?>upload/catalog/view/theme/default/image/coming-soon-300x160.jpg" alt="">
                  <div class="col-xs-12 col-sm-12 col-md-12 cont_center" style="margin-top:16px;">
					 
					<div style="background:"></div>  
		
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '10'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">10</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>								
					  
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '20'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">20</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>
					  
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '30'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">30</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>					  
				  </div>
					
					
                  <div class="col-xs-12 col-sm-12 col-md-12 cont_center">
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '40'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">40</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>	
					  
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '50'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">50</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>	
					  
					<div class="col-xs-4 time_gap" <?php if($min_prep_time == '60'){ ?> style="background:#9daebe;" <?php }?> >
						<center>
                    	<p class="announcement-heading">60</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>						  
					  
                  </div>
				  </div>
                </div>
              </div>
            <!--  <a href="#">
                <div class="panel-footer announcement-bottom">
                  <div class="row">
                    <div class="col-xs-6">
                      View Orders
                    </div>
                    <div class="col-xs-6 text-right">
                      <i class="fa fa-arrow-circle-right"></i>
                    </div>
                  </div>
                </div>
              </a>-->
            </div>
          </div>
        </div><!-- /.row -->
		
		<center>
					<div class="panel-danger" id="external_page_content_displayer">
						<div align="center" class="blog_wrapper">
							<div class="blog-header" style="margin-top:10px;margin-bottom: 10px;" id="edit_listing_box">
								<p>show</p>
								<input type="hidden" name="pending" value="" id="status" >
								<input type="hidden" name="prepared_status" value="" id="prepared_status" >
								<input type="hidden" name="delivered_status" value="" id="delivered_status" >
								<button type="button" class="btn btn-default custom_btn" onclick="order_listing(0);" id="pending_box">Pending:<?php echo $pending; ?></button>
				
								<button type="button" class="btn btn-default custom_btn " onclick="order_listing(1);" id="ready_box">Prepared: <?php echo $ready; ?></button>
					
								<button type="button" class="btn btn-default custom_btn" onclick="order_listing(2);" id="delivered_box">Delivered:<?php echo $delivered; ?></button>
								<button type="button" id="edit-status" class="btn btn-default custom_btn pull-right" style="float:right;">Edit</button>
								<button type="button" id="cancel-status" class="btn btn-default custom_btn pull-right" style="float:right; display:none;" >Cancel</button>
							</div>
						
							<div align="center" class="" id="order_listing_box">
								
							</div>
						</div>
					</div>
		</center>
		</div><!-- External Page Content Displayer -->
</div><!-- External Page container-fluid Displayer -->

	<footer>
	<div class="container-fluid">
	
	
		<ul class="footer_items" style="display:none;">
		  <li>Change Status</li>
		  <li><a href="javaScript:void(0);" onclick="changeStatusOrder(0);">Pending</a></li>
		  <li><a href="javaScript:void(0);" onclick="changeStatusOrder(1);">Prepared</a></li>
		  <li><a href="javaScript:void(0);" onclick="changeStatusOrder(2);">Delivered</a></li>
		  
		</ul>
		
	</div>
	</footer>
<?php
	}else{
		
		echo 'invalid token!!!';
		
	}

	die();  ?>


	</body>

</html>