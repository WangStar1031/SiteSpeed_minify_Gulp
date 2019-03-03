
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>

<?php
if($_SERVER['QUERY_STRING'] != ''){
	if( !isset($_SESSION['locationId']) && empty(($_SESSION['locationId'])) && $_SERVER['QUERY_STRING'] != 'route=common/home' ){ ?>
	<script>
	$(document).ready(function() {
		showAlert();
	});
	</script>	
	<?php } ?>

<?php } ?>

<script type="text/javascript">
	var $logged = <?php echo $logged ? 1 : 0 ?>;
	var $BASE = "<?php echo BASE; ?>";
	var checkLocationId = '<?php echo (!empty($_SESSION['locationId']) ? $_SESSION['locationId'] : false) ?>';
	var $QUERY_STRING = '<?php echo( $_SERVER['QUERY_STRING'] );?>';
</script>


<meta name="google-signin-client_id" content="993187382576-vb8b222co7skm71opqt6vvs6bq8qolgr.apps.googleusercontent.com">

<?php if( $_GET['route'] == 'common/home' ){ ?>	
	<script> 
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
	</script>
<?php } ?>


<?php if(  $_SERVER['QUERY_STRING']  == '' ){?>
	<script> 
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
	</script> 
<?php } ?>

	
<?php header('Access-Control-Allow-Origin: *'); ?>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $title; ?></title>

<?php 
$add_to_home_img = IMG_URL.'upload/catalog/view/theme/default/image/add_to_home.png';
$site_add_to_home_img = $base.'image/add_to_home.png';
if (@getimagesize($site_add_to_home_img) !== false) 
{
   $add_to_home_img =  $site_add_to_home_img;
}
$splitArr = explode(' - Online Ordering Powered By Bite',$title);
$app_title = $splitArr[0];
?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="<?php echo $app_title; ?>">
<link rel="shortcut icon" sizes="16x16" href="<?php echo $add_to_home_img;?>"> 
<link rel="shortcut icon" sizes="196x196" href="<?php echo $add_to_home_img;?>">
<link rel="apple-touch-icon-precomposed" href="<?php echo $add_to_home_img;?>">

<link rel="shortcut icon" href="<?php echo BASE_URL; ?>upload/image/BiteHeistF.ico" />

<base href="<?php echo BASE_URL; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php //echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- 
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/inline1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/outside/jquery-ui/jquery-ui.css">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/font/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/bootstrap.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/style.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/responsive.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/stylesheet-pure-css.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/flipclock/compiled/flipclock.css" />
 -->

<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/all_styles.css" />


<!--For Add to home popup-->

<?php foreach ($styles as $style) { ?>
<!-- <link href="<?php echo 'upload/'.$style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" /> -->
<?php } ?>


<?php if(isset($thcoloropt)) { ?>
<style type="text/css"><?php echo $thcoloropt; ?></style>
<?php } ?>
<?php echo $google_analytics; ?>

<!-- Custom Theme Style Options -->
<style>
	<?php if(isset($shop_color)) { ?>
	.shop_btn, .priceCircle, .add_to_order_button, .confirmTime, .chk_bt_custom, .circleP {
		<?php $colorValArr = explode(':', $shop_color); ?>
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
		border-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
		color: #fff;
	}
	.shop_btn:hover, .shop_btn:focus, .shop_btn:active {
		<?php $colorValArr = explode(':', $shop_color); ?>
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
		opacity:0.8;
		color: #fff;
	}
	.fa, .green, .red, .shop_font_color, .back_bt, .QuantityInputBox input[type="text"]{
		<?php echo $shop_color; ?>
	}
	.back_bt:hover{
		<?php echo $shop_color; ?>
		opacity:0.8;
	}

	.custButton{
		border-style: solid;
	    border-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
	}

	.custButton1{
		border-style: solid;
	    border-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
	}
	.swal-button--confirm{
		border-style: solid;
	    border-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>	
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
	}
	.swal-button{
		border-style: solid;
	    border-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>	
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>	
	}

	.swal-button:hover {
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?> !important;
	}

	.btn-default.active{
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
		opacity: 0.8 !important; 
		color: #fff !important;
	}

	.btn-default.active:hover{
		background-color:<?php echo (isset($colorValArr[1]) ? $colorValArr[1] : '' ); ?>
		opacity: 1 !important; 
		color: #fff !important;
	}

	<?php } //end shop color ?>
	.header{
		<?php if(isset($top_navigation_bar)) { echo $top_navigation_bar; } ?>
	}
	body {
		<?php if(isset($body)){echo $body;} ?>	
	}
	.priceCircle{
		<?php if(isset($price_box)){echo $price_box; } ?>	
	}
	.add_to_order_button{
		<?php if(isset($add_to_order_box)){echo $add_to_order_box; } ?>	
	}	
	h1 {
		<?php if(isset($heading_h1)){echo $heading_h1;} ?>	
		<?php if(isset($heading_h1_font)){echo $heading_h1_font;} ?>	
	}
	h2 {
		<?php if(isset($heading_h2)){echo $heading_h2;} ?>
		<?php if(isset($heading_h2_font)){echo $heading_h2_font;} ?>
	}
	h3 {
		<?php if(isset($heading_h3)){echo $heading_h3;} ?>
		<?php if(isset($heading_h3_font)){echo $heading_h3_font;} ?>
	}
	h4 {
		<?php if(isset($heading_h4)){echo $heading_h4;} ?>
		<?php if(isset($heading_h4_font)){echo $heading_h4_font;} ?>
	}
	h5 {
		<?php if(isset($heading_h5)){echo $heading_h5;} ?>
		<?php if(isset($heading_h5_font)){echo $heading_h5_font;} ?>
	}
	h6 {
		<?php if(isset($heading_h6)){echo $heading_h6;} ?>
		<?php if(isset($heading_h6_font)){echo $heading_h6_font;} ?>
	}
	<?php if($banner_image){ ?>
	.banner{
		background: url('<?php echo $banner_image; ?>') no-repeat center center;
		background-size: cover;
	}	
	<?php } ?>
</style>

<style>
	@media only screen and (min-width : 320px) and (max-width : 767px){
		.priceselect{
		font-size: 17px !important;
	    line-height: 1 !important;
	    padding-top: 13 !important;
		}
	}
</style>

<!-- 
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/outside/google/jquery.min.js"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/outside/sweetalert/sweetalert.min.js"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline1.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/outside/google/platform.js" async defer></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline2.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline3.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline4.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline5.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/outside/jquery-ui/jquery-ui.js" async defer></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootbox/bootbox.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline6.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline7.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline8.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline9.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline10.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline11.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline12.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline13.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/inlineScripts/inline14.js" type="text/javascript"></script>
 -->
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/all_scripts.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
<!-- <script src="<?php echo 'upload/'.$script; ?>" type="text/javascript"></script> -->
<?php } ?>

</head>

<body class="<?php echo $class; ?> orderMenu">

<div class="main">
	<header class="header">
		<div class="container">
			<div>

					<div class="mobile_menu" id="mobile_menu" style="display:none;">
						<a class="main_menu">menu</a>
						<span id="shopping_bag_text" style="display:none;">SHOPING BAG</span>
					</div>
					<div class="left_header full-width-568">
							<a href="<?php echo $rootBase; ?>" class="logo" target="_blank" id="header_logo">
								<img src="<?php echo IMG_URL; ?>upload/image/catalog/BiteHeist_Logo.png" title="<?php echo $rootName; ?>" alt="<?php echo $rootName; ?>" class="img-responsive" />
							</a>
						<a href="javascript:void(0)" id="step_back_menu" class="btn step_back_menu" style="display:none;"><i class="fa fa-angle-left"></i> Locations</a>
						<div class="btn mobile_cart_hide_first_screen hide-desktop mobile_cart_btn hide-gt568" style="float:right;">	
							<?php echo $cart; ?>
						</div>
					</div>

					<div class="right_header" id="right_header">
							<ul class="list-inline my-account-list" style="float:left;">
								<?php if ($logged) { ?>
									<li class="dropdown">
									<a class="signin" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<i class="fa fa-user top_user_ico"></i><span class="top_user_signin shop_font_color"><?php if ($logged) { echo 'Hi, '.$customer_firstname; }else{ ?>sign in<?php } ?></span>
									</a>
									 <ul class="dropdown-menu dropdown-menu-right">
										
										<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
										<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
										<li><a href="<?php echo $logout; ?>" ><?php echo $text_logout; ?></a></li>
									  </ul>
									</li>
								<?php }else{ ?>
								<a class="signin" onclick="showLoginForm()" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user top_user_ico"></i><span class="top_user_signin shop_font_color"><?php if ($logged) { echo 'Hi, '.$customer_firstname; }else{ ?>sign in<?php } ?></span>
								</a>
								<?php } ?>
							</ul>
					</div>
					<!-- This cart button will be displayed on width greater than 568px -->		
					<div class="right_header mobile_cart_hide_first_screen" id="right_header_cart">
						<ul class="list-inline my-account-list" style="float:left;">
							<li>
								<div id="desktop_header_cart" class="btn mobile_cart_btn" onclick="toggleCartPanel()">	
									<?php echo $cart; ?>
								</div>
							</li>
						</ul>
					</div>
				</div>
		</div>
		<div class="clear"></div>
	</header>
	
	<section class="banner">
		<div class="fog">
			<?php if ($logo) { ?>
				<img src="<?php echo $logo; ?>" alt="" class="m_right" />
			<?php } ?>	
		</div>
		<div class="clear"></div>
	</section>
	
	<div class="hide-mobile hide-tablet">
		<div id="sidebarCart" class="outerContainer hide-mobile">
			<div class="cart_bag">
				<div id="cart_info_div" class="hide-mobile">
					<figure>
						<img src="<?php echo IMG_URL; ?>/upload/catalog/view/theme/default/image/cart_bag_img.png" alt="cart-bag" />
					</figure>
					<h2>Your bag is empty<span>...</span></h2>
					<p>and your stomach is sad.</p>
				</div>
			</div>
		</div>
		
	</div>
<div id = "gSignInn" >
<div id = "gSignIn" class="g-signin2" data-onsuccess="onSignIn" style="display:none;">
</div>
</div>
  <!-- header end-->
