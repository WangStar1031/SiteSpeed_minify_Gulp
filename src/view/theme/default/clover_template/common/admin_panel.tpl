<?php
 // print_r();
 // echo $this->request->get['shop_token'];
	if($shop_token){
		// echo 'success';
	}else{
		echo 'invalid token!!!';
	}

// echo $_GET['shop_token'];
// echo $shop_token;
// die('test');
 ?> 
 
 

 
     
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>Admin Panel</title>

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
	
	<script type="text/javascript">
	
	
	</script>
	

</head>

<body>
<div class="container-fluid">
   <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <!-- <h1>Dashboard <small>Statistics Overview</small></h1> -->
            <ol class="breadcrumb ol_list">
              <li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
				<li class="pull-right">
					<div class="onoffswitch ">		
						<input name="delivery_status" onclick="status_delivery(this.id);" class="onoffswitch-checkbox" id="myonoffswitch" value="1" checked="" type="checkbox">
						 <!-- Rectangular switch -->
						<!-- Rounded switch -->
						<label class="switch">
						  <input type="checkbox">
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
                    <p class="announcement-heading"><b style="font-size:65px;">2</b></p>
                    <p class="announcement-text">CURRENT!</p>
				</center>
               
				
				<div style="margin-top:px;">
				<center> 
					<legend style="width:90px; color:black;"></legend>
                    <p class="text"><font size="3">New Orders! :	<b style="font-size:20px;color: #3e5d7a;">2</b></font></p>
				</center>
                  </div>	
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
              <div class="panel-heading" style="height:240px;">
                <div class="row">
					<div><center style="margin-top:5px;"><i style="margin-right:10px;" class="fa fa-clock-o fa-1x"></i><font class="first_box_font" size="5">Pickup Time</font></center></div>
                  <div class="col-xs-12 col-sm-4 col-md-5 first_minute">
					  <center>
					   
                    <p class="announcement-heading"><b style="font-size:65px;">20</b></p>
                    <p class="text">MINUTES</p>
					<legend style="width:90px; color:black;"></legend>
					  <!--<button href="#" type="button" class="btn btn-primary btn-xs dsble_btn">Pause Ordering</button>-->
					<!--<p class="text" style="background:#80808099; width:90px; height:25px; margin-top:10px;" ><font color="white" size="1" style="margin-left:9px;">Pause Ordering</font></p> -->
					</center>	  
                  </div>
                  <div class="col-xs-12 col-sm-7 col-md-6 pull-right cont_center" style="margin-top:16px;">
					 
					<div style="background:"></div>  
					  
					  
		
					<div class="col-xs-4 time_gap" style="background:">
						<center>
                    	<p class="announcement-heading">10</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>								
					  
					<div class="col-xs-4 time_gap" style="background:#9daebe;">
						<center>
                    	<p class="announcement-heading">20</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>
					  
					<div class="col-xs-4 time_gap" style="background:">
						<center>
                    	<p class="announcement-heading">30</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>					  
				  </div>
					
					
                  <div class="col-xs-12 col-sm-7 col-md-6 pull-right cont_center">
					<div class="col-xs-4 time_gap" style="background:">
						<center>
                    	<p class="announcement-heading">40</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>	
					  
					<div class="col-xs-4 time_gap" style="background:">
						<center>
                    	<p class="announcement-heading">50</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
					</div>	
					  
					<div class="col-xs-4 time_gap" style="background:">
						<center>
                    	<p class="announcement-heading">60</p>
                    	<p class="announcement-text">Minutes</p>
						</center>
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
					<div class="blog-header" style="margin-top:10px;margin-bottom: 10px;">
					<p>show</p> 
					<button type="button" class="btn btn-default custom_btn">Pending:5</button>
					<button type="button" class="btn btn-default custom_btn btn_active">Pepared: 12</button>
					<button type="button" class="btn btn-default custom_btn">Delivered:9</button>
					<button type="button" class="btn btn-default custom_btn pull-right" style="float:right;">Edit</button>
					
					
					
					
					
					
					
					
					</div>
					
					
				
								<div align="center" class="" id="order_listing_box">
									
					<div class="row new_row paid">
					<div class="checkbox checkbox-info checkbox-circle">
                        <input id="checkbox8" type="checkbox" />
                        <label for="checkbox8">
                          
                        </label>
                    </div>
										<a href="http://indian2/ci_bitehiest/admin/orderInfoDetail">
										<div class="col-xs-12 col-sm-2 col-md-2 a_pick_up">
											<span><i aria-hidden="true" class="fa fa-shopping-bag"></i><br>
											PICK UP</span><br>
											<hr>
											<span><i class="fa fa-check-circle" aria-hidden="true"></i><br>
											PAID<span><br></span></span>
										</div>
										<div class=" col-xs-12 col-sm-3 col-md-3 a_user_name" >
											<p>GUEST</p>
											<h2>test lname</h2><label>phone:456</label>
										</div>
										<div class="col-xs-12 col-sm-3 col-md-3 a_user_name" >
											<p>submited</p>
											<h2>12:30 PM</h2><label>amount:$11.3394</label>
										</div>
										<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">
											<p>ready</p>
											<h2>Tuesday 14:43:00</h2>
										</div></a><a href="wow"></a>
										<div class=" col-xs-12 col-sm-1 col-md-1 a_printer" style="padding-top:10px;">
											<a href="wow"><i aria-hidden="true" class="fa fa-print"></i></a>
										</div>
									</div>
									<div align="center" class="">
										<a href="http://indian2/ci_bitehiest/admin/orderInfoDetail"></a>
										<div class="row new_row unpaid" ">
											<a href="http://indian2/ci_bitehiest/admin/orderInfoDetail">
											<div class=" col-xs-12 col-sm-2 col-md-2 a_pick_up">
												<span><i class="fa fa-car" aria-hidden="true"></i><br>
												Deivery</span><br>
												<hr>
												<span><i aria-hidden="true" class="fa fa-times-circle-o"></i><br>
												UNPAID<span><br></span></span>
											</div>
											<div class=" col-xs-12 col-sm-3 col-md-3 a_user_name">
												<p>GUEST</p>
												<h2>test lname</h2><label>phone:456</label>
											</div>
											<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">
												<p>submited</p>
												<h2>12:30 PM</h2><label>amount:$11.3394</label>
											</div>
											<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">
												<p>ready</p>
												<h2>Tuesday 09:17:00</h2>
											</div></a><a href="wow"></a>
											<div class=" col-xs-12 col-sm-1 col-md-1 a_printer" style="padding-top:10px;">
												<a href="wow"><i aria-hidden="true" class="fa fa-print"></i></a>
											</div>
										</div>
										<div align="center" class="">
											<a href="http://indian2/ci_bitehiest/admin/orderInfoDetail"></a>
											<div class="row new_row delivery">
												<a href="http://indian2/ci_bitehiest/admin/orderInfoDetail">
												<div class=" col-xs-12 col-sm-2 col-md-2 a_pick_up">
													<span><i aria-hidden="true" class="fa fa-shopping-bag"></i><br>
													PICK UP</span><br>
													<hr>
													<span><i aria-hidden="true" class="fa fa-times-circle-o"></i><br>
													UNPAID<span><br></span></span>
												</div>
												<div class=" col-xs-12 col-sm-3 col-md-3 a_user_name" >
													<p>CUSTOMER</p>
													<h2>test test</h2><label>phone:1234567890</label>
												</div>
												<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">
													<p>submited</p>
													<h2>12:30 PM</h2><label>amount:$9.9614</label>
												</div>
												<div class="col-xs-12 col-sm-3 col-md-3 a_user_name">
													<p>ready</p>
													<h2>Tuesday 11:20:00</h2>
												</div></a><a href="wow"></a>
												<div class=" col-xs-12 col-sm-1 col-md-1 a_printer" style="padding-top:10px;">
													<a href="wow"><i aria-hidden="true" class="fa fa-print"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
			</div><!-- External Page Content Displayer -->
		</center>
</div><!-- External Page container-fluid Displayer -->
	<footer>
	<div class="container-fluid">
	
		<ul class="footer_items">
		  <li>Change Status</li>
		  <li>Pending</li>
		  <li>Prepared</li>
		  <li>Delivered</li>
		  
		</ul>
	</div>
	
	
	</footer>
	</body>
	<?php die(); ?>
</html>