<!DOCTYPE html>
<?php
  if($shop_token){
	  // echo '<pre>';
	// print_r($data);
	// echo '</pre>';
}else{
	// die('test');
}

  ?>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>

<!-- Custom Theme Style Options -->

	<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/style-admin.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/arkadmin-admin.css" rel="stylesheet" type="text/css" />

	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
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
	<style>
.a_user_name,.no_round{
    background: none;
}
.a_pick_up {

    padding-bottom: 6px;
    padding-top: 6px;
}
.no_round {
    border-bottom-right-radius: 0;
}
.border_no{
border-radius:5px 0 0 0;
}
.product-link{
    color: #3e5d7a;
    font-size: 20px !important;
}
.view_cart p .qty  {
    border: medium none !important;
    color: #3e5d7a !important; 
    font-size: 21px !important;
    height: 25px !important;
    width: 24px !important;
}
/***7 -9-2017 css for  order_info***/
#checkout_payment_part2 . {
    background: none;
    box-shadow: none;
    padding: 0 15px 15px;
        padding-top: 0px;
        padding-right: 15px;
        padding-left: 15px;
    position: static;
    width: 50%;
    z-index: 999;
    max-height: 570px;
    overflow: auto;
    overflow-x: hidden;
    padding-left: 60px;
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
	// alert(id);
	
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
		$(".href0,.href1,.href2").removeClass("active_li");
		$(".href"+data_status).addClass("active_li");
		
		var shop_token =  '<?php echo $shop_token; ?>';
		var pickup_id =   '<?php echo $pickup_id; ?>';
		var result_data = new Array();
 
		result_data.push('<?php echo $_GET['order_id']; ?>'); 
		
		// console.log('yrtytry---------5645654645');
				//console.log(result_data);	
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
</head>

		<body>
		<div class="full" style="display: none;" ><div class="loader"></div></div>
			<div class="blog_wrapper_outer" >

			<div class="blog_wrapper" style="padding-bottom:0;" >
 
				<div class="" align="center" >
									<a href="&lt;?php echo base_url();?&gt;admin/orderInfoDetail">
										</a>
											<?php $tempArrOption = array();
												$order_status_type = $products[0]['order_status_type'];
												
												
												$color_class = "";
												if($order_status_type=="pending"){
													$color_class = "delivery";	
												}else if($order_status_type=="ready"){
													$color_class = "unpaid";
												}else if($order_status_type=="delivered"){
													$color_class = "paid";
												}
										
										
										?>
										<div class="row new_row <?php echo $color_class; ?> " style="margin-bottom:0;border-radius: 5px 5px 0 0;"><!--<a href="&lt;?php echo base_url();?&gt;admin/orderInfoDetail">-->
										 

										<div class=" col-xs-12 col-sm-4 col-md-4 a_user_name border_no" >
											<p><?php echo $order['customer_type']; ?></p>
											<!--<p>CUSTOMER</p>-->
											<h2><?php echo $order['fullname']; ?></h2>
												
											</div>

											<div  class="col-xs-12 col-sm-3 col-md-3 a_user_name">
													<p>submited</p>
													<h2><?php echo $order['submit_date']; ?></h2>
													
											</div>

											<div class="col-xs-12 col-sm-4 col-md-4 a_user_name">
													<p><?php echo $order['order_status_type']; ?></p>
													<h2><?php echo $order['order_type']; ?></h2>
													<h2></h2>
											</div>
											<!--</a>
											<a href="<?php //echo BASE; ?>index.php?route=common/admin_dasboard/sendPrintRequest&shop_token=<?php //echo $_GET['shop_token']; ?>"><div  class=" col-xs-12 col-sm-1 col-md-1 a_printer_order no_round">
												<i class="fa fa-print" aria-hidden="true"></i>
											</div></a>-->
											
	 
	<a href="javascript:void(0);" onclick="get_print('<?php echo $_GET['order_id']; ?>');"><div class=" col-xs-12 col-sm-1 col-md-1 a_printer_order no_round"><i aria-hidden="true" class="fa fa-print"></i></div></a> 
											
											
											<hr>
											<div class="bottom_col">
											 <div class=" col-xs-12 col-sm-2 col-md-2 a_pick_up">
											<span><i class="fa fa-shopping-bag " aria-hidden="true "></i><br><?php echo $order['order_method']; ?></span>
											<!--<span><i class="fa fa-car" aria-hidden="true"></i><br>DELIVERY</span><br>-->
											
											  
										</div>
										 <div class=" col-xs-12 col-sm-2 col-md-2 a_pick_up">
											
											
											   <span><i class="fa fa-check-circle" aria-hidden="true"></i><br><?php echo $order['is_paid']; ?></span><br>
												<!--<span><i class="fa fa-times-circle-o" aria-hidden="true"></i><br>UNPAID<span><br>-->
										</div>
										
										
										 <div class=" col-xs-12 col-sm-3 col-md-3 a_pick_tel">
											
											
											  <label>phone: <b><?php echo $order['telephone']; ?></b> </label>
										</div>
										
										<div class=" col-xs-12 col-sm-3 col-md-3 a_pick_tel">
											
											
											  <label>Amount: <b><?php echo $order['total']; ?> </b></label>
										</div>
										</div>

										</div>
										
										</div>
										
										<div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 content right-0 order-report view_cart order_info" id="custom-checkout-form_part_2" style="position:unset">
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list" id="cart_products_list_data">
					<div class="inner_ul">

					<?php 
					if(!empty($products[0]['add_note'])){
						?>
						<p class="note_note">NOTE:<?php echo $products[0]['add_note'];?></p>
					<?php 
					}else{
						
					}
					?>
						<!--<li>
							<strong class="pull-left">QTY</strong>
							<strong class="pull-right">PRICE</strong>
						</li>-->
					<?php $tempArrOption = array();
 
						foreach($products as $product){?>
						<li>
							<p style="margin-bottom: 5px;">
								<a onclick="" data-toggle="tooltip" title="" class="add_to_order_box" style = "float:left; margin-left:0px; border: 0 none; cursor:pointer; color:#fff; font-size: 26px; padding: 0 10px 0 3px;"></i></a>

								<input type="text" onchange="updateCartInPanel('desktop')" name="quantity[<?php echo $product['key']; ?>]"  class="qty" value="<?php echo $product['quantity']; ?>" />
						
								<span class="desktop-cart-page" style="max-width:80%;">
									<a class="product-link" style="font-size:135%;"  ><?php echo $product['name']; ?></a>
								</span>
								<b class="prce"><?php echo $product['price']; ?></b>
							</p>

							<?php if(!empty($product['option'])){ //echo "<pre>"; print_r($product['option']); die; 
									foreach($product['option'] as $option){  
										if($option['name'] == $tempOptionName) {
							?>
											<div style="margin-bottom:5px;" class="List_margin">
 
												<div class="cs-t-3"><?php echo $option['value']; ?></div>
<!-- 												<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
													<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</div> -->
												<div class="cs-t-2" style="">
													<?php
													
														if(!empty($option['price']) && $option['price'] != '$0.00'){
															echo $option['price'];	
														}else{
													?>
														<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
													<?php }?>	
												</div>
												
												<div style="clear:both;"></div>
											</div>

										<?php }else{ ?>
											<div style="margin-bottom:5px; " class="List_margin">
												<div class="cart-cs-name" style ="margin-top:5px;"><?php echo $option['name']; ?></div>
												<div style="clear:both;"></div>
												<!--<div style="float:left;overflow:hidden;color:#7F8184; font-size:135%;margin-left:40px;" >
													<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</div>-->
												<div class="cs-t-3"><?php echo $option['value']; ?></div>
<!-- 												<div style="float:right;overflow:hidden;color:#7F8184; font-size:135%;">
													<span style="text-decoration: line-through;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</div> -->
												<div class="cs-t-2" style="">
													<?php
													
														if(!empty($option['price']) && $option['price'] != '$0.00'){
															echo $option['price'];	
														}else{
													?>
														<span style="text-decoration: line-through;    color: #505e6a;">&nbsp;&nbsp;&nbsp;</span>
													<?php }?>	
												</div>
												<div style="clear:both;"></div>
											</div>
										<?php } ?>
									<?php 
										$tempOptionName = $option['name'];
										
										} 
									?>

							<?php							 
									}
							?>
						<div class="instruction" style ="margin-top:5px;">
						<p class="special_instructions"> 
						<?php 
							if(!empty($product['special_instructions'])){?>
							<p class="note_note"><b>Special Instructions:&nbsp</b><?php echo $product['special_instructions'] ;?></p>
							<?php 
							}else{
								
							} ?>
							</p>
							</div>							
						</li>

						<?php }?>
						</div>
					</ul>
											
					<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cart_products_data_list last_last">
					<div class="inner_ul">
					<hr/>
						<?php if(isset($totals[0]) && isset($totals[0]['title']) && isset($totals[0]['text'])){ ?>
							<li id="<?php echo $totals[0]['id']; ?>" data-amount="<?php echo $totals[0]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[0]['title']; ?></strong><b class="prce grn"><?php echo $totals[0]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[1]) && isset($totals[1]['title']) && isset($totals[1]['text'])){ ?>
							<li id="<?php echo $totals[1]['id']; ?>" data-amount="<?php echo $totals[1]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[1]['title']; ?></strong><b class="prce grn"><?php echo $totals[1]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[2]) && isset($totals[2]['title']) && isset($totals[2]['text'])) { ?>
							<li id="<?php echo $totals[2]['id']; ?>" data-amount="<?php echo $totals[2]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[2]['title']; ?></strong><b class="prce grn"><?php echo $totals[2]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[3]) && isset($totals[3]['title']) && isset($totals[3]['text'])){ ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[3]['title']; ?></strong><b class="prce"><?php echo $totals[3]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[4]) && isset($totals[4]['title']) && isset($totals[4]['text'])) { ?>
							<li class="no_border cart_totals_list"><p><strong  class="black"><?php echo $totals[4]['title']; ?></strong><b class="prce grn"><?php echo $totals[4]['text']; ?></b></p></li>
						<?php } ?>
						
						<?php if(isset($totals[5]) && isset($totals[5]['title']) && isset($totals[5]['text'])) { ?>
							<li class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[5]['title']; ?></strong><b class="prce grn"><?php echo $totals[5]['text']; ?></b></p></li>
						<?php } ?>
						
						<?php if(isset($totals[6]) && isset($totals[6]['title']) && isset($totals[6]['text'])) { ?>
							<li id="<?php echo $totals[6]['id']; ?>" data-amount="<?php echo $totals[6]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[6]['title']; ?></strong><b class="prce grn"><?php echo $totals[6]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[7]) && isset($totals[7]['title']) && isset($totals[7]['text'])) { ?>
							<li id="<?php echo $totals[7]['id']; ?>" data-amount="<?php echo $totals[7]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[7]['title']; ?></strong><b class="prce grn"><?php echo $totals[7]['text']; ?></b></p></li>
						<?php } ?>

						<?php if(isset($totals[8]) && isset($totals[8]['title']) && isset($totals[8]['text'])) { ?>
							<li id="<?php echo $totals[8]['id']; ?>" data-amount="<?php echo $totals[8]['text']; ?>" class="no_border cart_totals_list"><p><strong class="black"><?php echo $totals[8]['title']; ?></strong><b class="prce grn"><?php echo $totals[8]['text']; ?></b></p></li>
						<?php } ?>
						</div>
					</ul>	
	<footer>
	<div class="container-fluid">
	
											<?php $tempArrOption = array();
												$order_status_type = $products[0]['order_status_type'];
												
												
												$color_pending = "";
												$color_prepared = "";
												$color_delivered = "";
												if($order_status_type=="pending"){
													$color_pending = "active_li";	
												}else if($order_status_type=="ready"){
													$color_prepared = "active_li";
												}else if($order_status_type=="delivered"){
													$color_delivered = "active_li";
												}
										
										
										?>	
	
		<ul class="footer_items" >
		  <li>Assigned Status</li>
		  <li><a class=" <?php echo $color_pending; ?> href0" href="javaScript:void(0);" onclick="changeStatusOrder(0);">Pending</a></li>
		  <li><a class=" <?php echo $color_prepared;?> href1" href="javaScript:void(0);" onclick="changeStatusOrder(1);">Prepared</a></li>
		  <li><a class=" <?php echo $color_delivered; ?> href2" href="javaScript:void(0);" onclick="changeStatusOrder(2);">Delivered</a></li>
		  
		</ul>
		
	</div>
	</footer>					
				</div>							
										
								</div>		
										

			
				
		</div>
		
		</body>				




</html>
<?php die(); ?>