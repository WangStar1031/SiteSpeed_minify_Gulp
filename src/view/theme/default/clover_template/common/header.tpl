<?php 

	// phpinfo();
	//echo '<pre>'; print_r($_SESSION); echo '</pre>';
	if($_SERVER['HTTPS'] != 1){	
		// header('Location:'.$base);
		// die;
	}

	// $dayToday = strtolower(date('l'));
	// $todayStatus = $alwaysStatusArr[$dayToday];

	// if($store_status == 'closed' && $todayStatus !== 'off'){
		// header('Location:'.$base.'index.php?route=common/home/shopClosed');
		// die;	
	// }	

?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<!--
<script>
var _rollbarConfig = {
accessToken: "d4c6820b873348118a1e1b5fc651dd4a",
captureUncaught: true,
captureUnhandledRejections: true,
payload: {
environment: "production"
}
};
// Rollbar Snippet
!function(r){function o(n){if(e[n])return e[n].exports;var t=e[n]={exports:{},id:n,loaded:!1};return r[n].call(t.exports,t,t.exports,o),t.loaded=!0,t.exports}var e={};return o.m=r,o.c=e,o.p="",o(0)}([function(r,o,e){"use strict";var n=e(1),t=e(4);_rollbarConfig=_rollbarConfig||{},_rollbarConfig.rollbarJsUrl=_rollbarConfig.rollbarJsUrl||"https://cdnjs.cloudflare.com/ajax/libs/rollbar.js/2.3.3/rollbar.min.js",_rollbarConfig.async=void 0===_rollbarConfig.async||_rollbarConfig.async;var a=n.setupShim(window,_rollbarConfig),l=t(_rollbarConfig);window.rollbar=n.Rollbar,a.loadFull(window,document,!_rollbarConfig.async,_rollbarConfig,l)},function(r,o,e){"use strict";function n(r){return function(){try{return r.apply(this,arguments)}catch(r){try{console.error("[Rollbar]: Internal error",r)}catch(r){}}}}function t(r,o){this.options=r,this._rollbarOldOnError=null;var e=s++;this.shimId=function(){return e},window&&window._rollbarShims&&(window._rollbarShims[e]={handler:o,messages:[]})}function a(r,o){var e=o.globalAlias||"Rollbar";if("object"==typeof r[e])return r[e];r._rollbarShims={},r._rollbarWrappedError=null;var t=new p(o);return n(function(){o.captureUncaught&&(t._rollbarOldOnError=r.onerror,i.captureUncaughtExceptions(r,t,!0),i.wrapGlobals(r,t,!0)),o.captureUnhandledRejections&&i.captureUnhandledRejections(r,t,!0);var n=o.autoInstrument;return o.enabled!==!1&&(void 0===n||n===!0||"object"==typeof n&&n.network)&&r.addEventListener&&(r.addEventListener("load",t.captureLoad.bind(t)),r.addEventListener("DOMContentLoaded",t.captureDomContentLoaded.bind(t))),r[e]=t,t})()}function l(r){return n(function(){var o=this,e=Array.prototype.slice.call(arguments,0),n={shim:o,method:r,args:e,ts:new Date};window._rollbarShims[this.shimId()].messages.push(n)})}var i=e(2),s=0,d=e(3),c=function(r,o){return new t(r,o)},p=d.bind(null,c);t.prototype.loadFull=function(r,o,e,t,a){var l=function(){var o;if(void 0===r._rollbarDidLoad){o=new Error("rollbar.js did not load");for(var e,n,t,l,i=0;e=r._rollbarShims[i++];)for(e=e.messages||[];n=e.shift();)for(t=n.args||[],i=0;i<t.length;++i)if(l=t[i],"function"==typeof l){l(o);break}}"function"==typeof a&&a(o)},i=!1,s=o.createElement("script"),d=o.getElementsByTagName("script")[0],c=d.parentNode;s.crossOrigin="",s.src=t.rollbarJsUrl,e||(s.async=!0),s.onload=s.onreadystatechange=n(function(){if(!(i||this.readyState&&"loaded"!==this.readyState&&"complete"!==this.readyState)){s.onload=s.onreadystatechange=null;try{c.removeChild(s)}catch(r){}i=!0,l()}}),c.insertBefore(s,d)},t.prototype.wrap=function(r,o,e){try{var n;if(n="function"==typeof o?o:function(){return o||{}},"function"!=typeof r)return r;if(r._isWrap)return r;if(!r._rollbar_wrapped&&(r._rollbar_wrapped=function(){e&&"function"==typeof e&&e.apply(this,arguments);try{return r.apply(this,arguments)}catch(e){var o=e;throw"string"==typeof o&&(o=new String(o)),o._rollbarContext=n()||{},o._rollbarContext._wrappedSource=r.toString(),window._rollbarWrappedError=o,o}},r._rollbar_wrapped._isWrap=!0,r.hasOwnProperty))for(var t in r)r.hasOwnProperty(t)&&(r._rollbar_wrapped[t]=r[t]);return r._rollbar_wrapped}catch(o){return r}};for(var u="log,debug,info,warn,warning,error,critical,global,configure,handleUncaughtException,handleUnhandledRejection,captureEvent,captureDomContentLoaded,captureLoad".split(","),f=0;f<u.length;++f)t.prototype[u[f]]=l(u[f]);r.exports={setupShim:a,Rollbar:p}},function(r,o){"use strict";function e(r,o,e){if(r){var t;"function"==typeof o._rollbarOldOnError?t=o._rollbarOldOnError:r.onerror&&!r.onerror.belongsToShim&&(t=r.onerror,o._rollbarOldOnError=t);var a=function(){var e=Array.prototype.slice.call(arguments,0);n(r,o,t,e)};a.belongsToShim=e,r.onerror=a}}function n(r,o,e,n){r._rollbarWrappedError&&(n[4]||(n[4]=r._rollbarWrappedError),n[5]||(n[5]=r._rollbarWrappedError._rollbarContext),r._rollbarWrappedError=null),o.handleUncaughtException.apply(o,n),e&&e.apply(r,n)}function t(r,o,e){if(r){"function"==typeof r._rollbarURH&&r._rollbarURH.belongsToShim&&r.removeEventListener("unhandledrejection",r._rollbarURH);var n=function(r){var e,n,t;try{e=r.reason}catch(r){e=void 0}try{n=r.promise}catch(r){n="[unhandledrejection] error getting `promise` from event"}try{t=r.detail,!e&&t&&(e=t.reason,n=t.promise)}catch(r){t="[unhandledrejection] error getting `detail` from event"}e||(e="[unhandledrejection] error getting `reason` from event"),o&&o.handleUnhandledRejection&&o.handleUnhandledRejection(e,n)};n.belongsToShim=e,r._rollbarURH=n,r.addEventListener("unhandledrejection",n)}}function a(r,o,e){if(r){var n,t,a="EventTarget,Window,Node,ApplicationCache,AudioTrackList,ChannelMergerNode,CryptoOperation,EventSource,FileReader,HTMLUnknownElement,IDBDatabase,IDBRequest,IDBTransaction,KeyOperation,MediaController,MessagePort,ModalWindow,Notification,SVGElementInstance,Screen,TextTrack,TextTrackCue,TextTrackList,WebSocket,WebSocketWorker,Worker,XMLHttpRequest,XMLHttpRequestEventTarget,XMLHttpRequestUpload".split(",");for(n=0;n<a.length;++n)t=a[n],r[t]&&r[t].prototype&&l(o,r[t].prototype,e)}}function l(r,o,e){if(o.hasOwnProperty&&o.hasOwnProperty("addEventListener")){for(var n=o.addEventListener;n._rollbarOldAdd&&n.belongsToShim;)n=n._rollbarOldAdd;var t=function(o,e,t){n.call(this,o,r.wrap(e),t)};t._rollbarOldAdd=n,t.belongsToShim=e,o.addEventListener=t;for(var a=o.removeEventListener;a._rollbarOldRemove&&a.belongsToShim;)a=a._rollbarOldRemove;var l=function(r,o,e){a.call(this,r,o&&o._rollbar_wrapped||o,e)};l._rollbarOldRemove=a,l.belongsToShim=e,o.removeEventListener=l}}r.exports={captureUncaughtExceptions:e,captureUnhandledRejections:t,wrapGlobals:a}},function(r,o){"use strict";function e(r,o){this.impl=r(o,this),this.options=o,n(e.prototype)}function n(r){for(var o=function(r){return function(){var o=Array.prototype.slice.call(arguments,0);if(this.impl[r])return this.impl[r].apply(this.impl,o)}},e="log,debug,info,warn,warning,error,critical,global,configure,handleUncaughtException,handleUnhandledRejection,_createItem,wrap,loadFull,shimId,captureEvent,captureDomContentLoaded,captureLoad".split(","),n=0;n<e.length;n++)r[e[n]]=o(e[n])}e.prototype._swapAndProcessMessages=function(r,o){this.impl=r(this.options);for(var e,n,t;e=o.shift();)n=e.method,t=e.args,this[n]&&"function"==typeof this[n]&&("captureDomContentLoaded"===n||"captureLoad"===n?this[n].apply(this,[t[0],e.ts]):this[n].apply(this,t));return this},r.exports=e},function(r,o){"use strict";r.exports=function(r){return function(o){if(!o&&!window._rollbarInitialized){r=r||{};for(var e,n,t=r.globalAlias||"Rollbar",a=window.rollbar,l=function(r){return new a(r)},i=0;e=window._rollbarShims[i++];)n||(n=e.handler),e.handler._swapAndProcessMessages(l,e.messages);window[t]=n,window._rollbarInitialized=!0}}}}]);
// End Rollbar Snippet
</script> -->
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


<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js" type="text/javascript"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/bootbox/bootbox.js" type="text/javascript"></script>
<link href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/font/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/bootstrap.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/style.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/responsive.css" rel="stylesheet">
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/stylesheet-pure-css.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>upload/catalog/view/javascript/flipclock/compiled/flipclock.css" />

<!--For Add to home popup-->
<link href="<?php echo BASE_URL; ?>upload/catalog/view/theme/default/stylesheet/addtohomescreen.css" rel="stylesheet">
<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/addtohomescreen.js" type="text/javascript"></script>


<?php foreach ($styles as $style) { ?>
<link href="<?php echo 'upload/'.$style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script src="<?php echo BASE_URL; ?>upload/catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo 'upload/'.$script; ?>" type="text/javascript"></script>
<?php } ?>
<?php if(isset($thcoloropt)) { ?>
<style type="text/css"><?php echo $thcoloropt; ?></style>
<?php } ?>
<?php echo $google_analytics; ?>

<!-- Custom Theme Style Options -->
<style>

#productSearchButton{
		right: 286px !important;
	}
	
#productSearchBox{
	right: 231px !important;
}


@media(max-width:1250px){
	
	#productSearchButton{
		right: 0px !important;
	}
	
	#productSearchBox{
		right: -4px !important;
	}
	
	.mR255 {
		margin-right: 0; 
	}

	.top_head search_product {
		margin-right: 0; 
	}	
}



@media only screen and (min-width:1250px) {
	.mR255 {
		margin-right: 0; 
	}

	.top_head search_product {
		margin-right: 0; 
	}

 
}

.menu_item_text{
	margin-right: 0;
}

.top_head search_product{
	margin-right: 274px !important;
}


.mR255{
	margin-right: 274px;
}

.mR2555{
	padding-right: 274px !important;;
}


<?php if(isset($shop_color)) { ?>
.shop_btn, .priceCircle, .add_to_order_button, .confirmTime, .chk_bt_custom {
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
<script>
function testjquery(element_id,action_type,target_value){

	if(element_id == '#top'){
		element_id = '.nav';	
	}
	
	if(element_id == '.header-cart button'){
		element_id = '#cart';	
	}
	
	if(element_id == '.topnav-links'){
		element_id = '.nav ul li a';	
	}	
	
	if(element_id == 'shop_color'){
		$('.fa').css('color', target_value);
		$('.shop_btn, .priceCircle, .add_to_order_button').css('background-color', target_value);
		$('.shop_btn').hover( function () {
			$(this).css('background-color', target_value);
		});
	}	
	
	console.log(element_id+' '+action_type+' '+target_value);

  	$(element_id).css(action_type, target_value);


}
</script>
<script src="upload/catalog/view/javascript/jquery.blockUI2.js" type="text/javascript"></script>
	<script type="text/javascript"><!--
	// facebook code
			// window.fbAsyncInit = function() {
				// FB.init({
					// appId      : '<?php echo $fb_login_app_id; ?>', // App ID
					// status     : true, // check login status
					// cookie     : true, // enable cookies to allow the server to access the session
					// xfbml      : true  // parse XFBML
				// });
			// };

			// Load the SDK Asynchronously
			// (function(d){
				// var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
				// js = d.createElement('script'); js.id = id; js.async = true;
				// js.src = "//connect.facebook.net/en_US/all.js";
				// d.getElementsByTagName('head')[0].appendChild(js);
			// }(document));
			//--></script>
<script>
$(document).ready(function(){
    // $("#click").click(function(){
        // $(".nav").slideToggle("slow");
    // });
	// $( ".main_menu" ).trigger('click');
	//for new UI
	
	$( "a.main_menu" ).click(function() {
		//$( ".left_header" ).toggle("slow");
		//$( ".right_header" ).toggle("slow");
	});
	
});
</script>
<script>
function toggleCartPanel(){

	// var screenWidth = $( window ).width();
	// if(screenWidth <= 1280 || getURLVar('route') == 'checkout/cart'){
		location = '<?php echo BASE; ?>index.php?route=cloverAPI/clover/maincart';
	// }else{
		// $.ajax({
			// url: 'index.php?route=common/cart/showHeaderCartPanel',
			// type: 'get',
			// dataType: 'html',
			// success: function(html) {
				// $('#cart_info_div').html(html);
			// }	
		// });	
		//$('#cart_info_div').toggle('slow');
	// }	
}

$.ajax({
	url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/get_cart',
	type: 'get',
	dataType: 'html',
	success: function(html) {
		$('#cart_info_div').html(html);
	}	
});	

var numberOfItems = '<?php echo $_SESSION['clover_cart']['total_items']; ?>'; 


function updateCartInPanel( device, product_id, product_key = '', temp = '' ) {
	var qty = 0;
	
<?php
	if( $_SERVER['QUERY_STRING']=="route=cloverAPI/clover/maincart" || $_SERVER['QUERY_STRING']=="route=cloverAPI/clover/checkout_form" ) {
?>
		qty = $( '#input_cart_'  + product_id +'_'+ temp ).val();
		
		if( device == 'mobile' ) {
			qty = $( '#input_cart_mobile_' + product_id +'_'+ temp ).val();
		}
<?php
	} else {
?>
	qty = $( '#input_carts_' + product_id +'_'+ temp ).val();

<?php
	}
?>

	
	$.blockUI2({
		css: { 
			border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
		}
	});
	
	var post = {};
	post[ 'product_id' ] = product_id;
	post[ 'qty' ] = qty;
	post[ 'product_key' ] = product_key;
	
	 $.ajax({
		url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/cartUpdate',
        type: 'post',
        data:  post,
        dataType: 'html',
        beforeSend: function() {
        	// $('#button-guest-shipping').button('loading');
		},
        complete: function() {
			$( ".tooltip ,.tooltip-inner,.tooltip-arrow" ).remove(); //added as the tooltip was getting stuck and always displayed when the update button was pressed without altering the quantity.
			// $('#button-guest-shipping').button('reset');
        },
        success: function(html) {
			
            $('.alert, .text-danger').remove();
			$('#cart_info_div').html(html);
			$('#cart-total').html(numberOfItems);
			if (getURLVar('route') == 'checkout/cart') {
				location = '<?php echo BASE; ?>index.php?route=checkout/cart';
			}else if(getURLVar('route') == 'cloverAPI/clover/checkout_form'){
				var item_in_cart = '<?php echo $_SESSION['clover_cart']['total_items']; ?>';
				if(item_in_cart == 0){
					window.location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
				}else{
					location.reload();
				}
				
			}else if(getURLVar('route') == 'cloverAPI/clover/maincart'){
				 location.reload();
			}else{
				 window.location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
			}	
			setTimeout($.unblockUI2, 100);
			
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			setTimeout($.unblockUI2, 100);
        }

    }); 
}



function showLoginForm(){
	var baseURL = '<?php echo BASE; ?>';
	bootbox.dialog({
	  title: "Sign In",
	  message:  '<div id="display-error" style="font-size:130%; color:red; margin:5px 0px; display:none;"></div>'+
				'<div id="loginData" class="container-override">' +
				'<div class="row">' +
				'<div class="col-md-12">' +
				'<div class="login-box well">' +
				// '<form id="ajaxLoginForm">' +
				// '<legend>Sign In</legend>' +
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
				// '<div class="form-group"><a class="ocx-fb-login-trigger fb-login-uid-0 ocx-stay-here btn btn-block btn-social btn-facebook cs-fblogin-btn" fb-login-uid="0" href="javascript:void(0);"><span class="fa fa-facebook"></span> Facebook Login</a></div>'+
				'<div class="form-group">'+
				'<input id="login-button" onclick="validateLogin()" type="submit" class="btn btn-default btn-login-submit btn-block m-t-md shop_btn" value="Login" />'+
				'</div>'+
				'<div class="form-group sign-up">'+
				'<p class="text-center m-t-xs text-sm">Do not have an account?</p>' + 
				'<a href="javascript:void(0)" onclick="showRegistrationForm()" class="btn button-green btn-block m-t-md shop_btn">Create an account</a>'+
				'</div>'+
				// '</form>'+
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
			url: '<?php echo BASE; ?>index.php?route=account/login/validateAjaxLogin',
			type: 'post',
			data: $('#loginData input[type=\'text\'], #loginData input[type=\'password\'], #loginData input[type=\'hidden\'], #loginData input[type=\'radio\']:checked, #loginData input[type=\'checkbox\']:checked, #loginData select, #loginData textarea'),
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
				// clover_logout();
				if (json['warning']) {
					$('#display-error').html(json['warning']).show();
				}
			if (json['errorLoginAttempt']) {
				$('#display-error').html(json['errorLoginAttempt']).show();
			}
				if (json['success']) {
					if( logout_page )
						location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
					else
						location.reload();
				}
			},
			error: function(json) {
			},
			fail: function(json) {
				console.log('failed '+json);
				bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
					location.reload();
				});
			}	
		});
}
</script>
<script>

//to confirm order cancelation when browser back button is clicked
/*
window.onload = function () {
    if (typeof history.pushState === "function") {
        history.pushState("jibberish", null, null);
        window.onpopstate = function () {
            history.pushState('newjibberish', null, null);
            // Handle the back (or forward) buttons here
            // Will NOT handle refresh, use onbeforeunload for this.
			//alert('back');
			// $('#step_back_menu').trigger('click');
        };
    }
    else {
        var ignoreHashChange = true;
        window.onhashchange = function () {
            if (!ignoreHashChange) {
                ignoreHashChange = true;
                window.location.hash = Math.random();
                // Detect and redirect change here
                // Works in older FF and IE9
                // * it does mess with your hash symbol (anchor?) pound sign
                // delimiter on the end of the URL
            }
            else {
                ignoreHashChange = false;   
            }
        };
    }
}
*/



function showRegistrationForm(){
	bootbox.hideAll()
	
	var baseURL = '<?php echo BASE; ?>';
	bootbox.dialog({
	  title: "Sign Up",
	  message:  '<div id="display-error" style="font-size:130%; color:red; margin:5px 0px; display:none;"></div>'+
				'<div id="registrationData" class="container-override">' +
				'<div class="row">' +
				'<div class="col-md-12">' +
				'<div class="registration-box well col-md-12">' +
				// '<form id="ajaxLoginForm">' +
				// '<legend>Sign In</legend>' +
				'<div class="col-md-12">'+
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="firstname" value="" id="input-registration-firstname" placeholder="First Name" type="text" class="form-control" />' +
				'</div>' +
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="lastname" value="" id="input-registration-lastname" placeholder="Last Name" type="text" class="form-control" />' +
				'</div></div><div class="col-md-12">' +
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="email" value="" id="input-registration-email" placeholder="E-Mail Address" type="text" class="form-control" />' +
				'</div>' +
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="telephone" value="" id="input-registration-telephone" placeholder="Telephone" type="text" class="form-control" onkeypress="return isNumberKey(event)" />' +
				'</div></div><div class="col-md-12">' +
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="password" id="input-registration-password" placeholder="Password" value="" type="password" class="form-control" />' +
				'</div>' +
				'<div class="form-group col-md-6 required">' +
				'' +
				'<input name="confirm" id="input-registration-confirm" placeholder="Confirm Password" value="" type="password" class="form-control" />' +
				'</div></div>' +
				'<div class="input-group">' +
				'<div class="checkbox">' +
				'' +
				'<input name="Terms" id="Terms" type="checkbox" value="" style="opacity:1" required><label for="Terms"> I accept the <u><a href="https://biteheist.com/terms/" target="_blank">Terms and Conditions</a></u> </label>' +
				'</div>'+
				'<div class="show_error_message" style="color:#cc0000;">' +
				'</div>'+
				'</div>'+
				'<div class="form-group col-md-12">'+
				'<input id="registration-button" onclick="customRegister()" type="submit" class="btn btn-primary btn-registration-submit btn-block m-t-md shop_btn" value="CONTINUE" />'+
				// '<a class="ocx-fb-login-trigger ocx-stay-here btn btn-block btn-social fb-login-uid-0 btn-facebook cs-fblogin-register-btn" fb-login-uid="0" href="javascript:void(0);"><span class="fa fa-facebook"></span> Facebook Login</a>'+
				'</div>'+
				// '</form>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'
	});
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function validateAjaxRegistration(){
	$.ajax({
			url: '<?php echo BASE; ?>index.php?route=account/login/validateAjaxRegistration',
			type: 'post',
			data: $('#registrationData input[type=\'text\'], #registrationData input[type=\'password\'], #registrationData input[type=\'hidden\'], #registrationData input[type=\'radio\']:checked, #registrationData input[type=\'checkbox\']:checked, #registrationData select, #loginData textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#login-button').button('Signing In...');
			},
			complete: function() {
				$('#login-button').button('reset');
			},
			success: function(json) {

				console.log(json);
				// $('.alert, .text-danger').remove();
				// $('.form-group').removeClass('has-error');
				$('#display-error').html('').hide();

				if (json['warning']) {
					$('#display-error').html(json['warning']).show();
				}

				if (json['success']) {
					location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
				}
			},
			fail: function(json) {
				console.log('failed '+json);
				bootbox.alert("Oh-Oh!, something went wrong, please try again.", function() {
					location.reload();
				});
			}	
		});
}
// Register
function customRegister() {
	
		var error = 0;
		if (!($('#Terms').is(':checked'))) {
			error = 1
		//	alert("You must agree with the terms and conditions");
						//checkbox error message
			$('.show_error_message').text("You must agree with the terms and conditions");
		}
		
		if (error) {
			return false;
		} else {
			 true;
		}

    $.ajax({
        url: '<?php echo BASE; ?>index.php?route=checkout/register/customSave',
        type: 'post',
        data: $('#registrationData input[type=\'text\'], #registrationData input[type=\'date\'], #registrationData input[type=\'datetime-local\'], #registrationData input[type=\'time\'], #registrationData input[type=\'password\'], #registrationData input[type=\'hidden\'], #registrationData input[type=\'checkbox\']:checked, #registrationData input[type=\'radio\']:checked, #registrationData textarea, #registrationData select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},
        complete: function() {
            $('#button-register').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#registrationData').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-registration-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
            } else {
				$('.alert, .text-danger').remove();
				location.reload();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }   

		
    });
}
function clover_register(){
			$.ajax({
        url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/register',
        type: 'post',
        data: $('#registrationData input[type=\'text\'], #registrationData input[type=\'date\'], #registrationData input[type=\'datetime-local\'], #registrationData input[type=\'time\'], #registrationData input[type=\'password\'], #registrationData input[type=\'hidden\'], #registrationData input[type=\'checkbox\']:checked, #registrationData input[type=\'radio\']:checked, #registrationData textarea, #registrationData select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},
        complete: function() {
            $('#button-register').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#registrationData').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-registration-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
            } else {
				$('.alert, .text-danger').remove();
				location.reload();
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
		
}
</script>
<script>
//to confirm order cancelation when browser back button is clicked
//https://biteheist.com/01/PennAvenueMeats/index.php?route=common/home
//https://biteheist.com/01/PennAvenueMeats/


var urlStepBack = getURLVar('step_back');
var checkRoute = getURLVar('route');
var checkLocationId = '<?php echo (!empty($_SESSION['locationId']) ? $_SESSION['locationId'] : false) ?>';

// console.log(urlStepBack);
// console.log(checkRoute);
// console.log(checkLocationId);




var isSafari = navigator.vendor && navigator.vendor.indexOf('Apple') > -1 && navigator.userAgent && !navigator.userAgent.match('CriOS');
$( document ).ready(function() {
 
	if(isSafari){
	
		if((checkRoute == '' || checkRoute == 'common/home' || typeof checkRoute == 'undefined' || typeof checkRoute == 'null') && (urlStepBack != 'categories' || typeof urlStepBack == 'undefined') ){
			
			if(checkLocationId != false){
				bootbox.dialog({
				  message: "Are you sure you want to cancel this order?",
				  //title: "Custom title",
				  buttons: {
					// success: {
					  // label: "Success!",
					  // className: "btn-success",
					  // callback: function() {
						// Example.show("great success");
					  // }
					// },
					danger: {
					  label: "YES",
					  className: "btn-danger",
					  callback: function() {
						  
						  $.ajax({
							url: '<?php echo BASE; ?>index.php?route=common/home/unsetCurrentOrder',
							type: 'post',
							data: {unset : 'unset'},
							//dataType: 'json',
							beforeSend: function() {
								//$('#button-login').button('loading');
							},
							complete: function() {
								//$('#button-login').button('reset');
							},
							success: function() {
								$('#sidebarCart').hide();
								$('#mobile_cart_hide_first_screen').hide();
								$('#accordion').show();
								// window.location.href = '<?php //echo $home_url; ?>';
								// Example.show("uh oh, look out!");
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
						
					  }
					},
					main: {
					  label: "NO, DON'T CANCEL.",
					  className: "btn-primary",
					  callback: function() {
						 location = '<?php echo BASE; ?>index.php?route=common/home&step_back=categories';
						  
						// Example.show("Primary button");
					  }
					}
				  }
				});
			}	
		}
	}
});


window.onload = function () {
	if($.type(urlStepBack) != 'undefined' && urlStepBack != '' && !isSafari){
			history.pushState(null, document.title, location.href);
			window.addEventListener('popstate', function (event)
			{
			  history.pushState(null, document.title, location.href);
			  $('#step_back_menu').trigger('click');
			});
	}//endif
}

</script>
<!--<script //src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8A1it5vpYf-L9LKgFK3lnrykdRnbR6QE&sigsned_in=false" async defer></script>-->

<style>
@media only screen and (min-width : 320px) and (max-width : 767px){
	.priceselect{
	font-size: 17px !important;
    line-height: 1 !important;
    padding-top: 13 !important;
	}
}
</style>

</head>

<body class="<?php echo $class; ?> orderMenu">

<div class="main">
	<header class="header">
		<div class="container">
		
			<!-- <div class="view_cart">
				<a class="back_bt">BACK TO MENU</a>
				<ul>
					<li><strong class="pull-left">QTY</strong><strong class="pull-right">PRICE</strong><p><input type="text" class="qty" placeholder="1" /><span>Country Chicken Club</span><b class="prce">$8.50</b></p><p class="list_btm"><span>Bread: White Bread</span></p></li>
					
					<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Extra Turkey Bacon</span><b class="prce">$1.00</b></p></li>
					<li><p><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span><b class="prce">$1.00</b></p></li>
					<li class="no_border"><input type="text" class="coupan" /></li>
					<li class="no_border"><p><strong>SALES TAX 7%</strong><b class="prce">$0.80</b></p></li>
					<li class="no_border"><p><strong class="black">TOTAL DUE</strong><b class="prce grn">$15.25</b></p></li>
					<li class="no_border"><input type="button" value="PROCEED TO CHECKOUT"  class="chk_bt"/></li>
				</ul>
			</div> -->
			
			
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
						<!-- <nav class="navigation">
							<ul>
								<li><a href="#"><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/pickup.png" alt="" /><span>Pick Up</span></a></li>
								<li><a href="#"><img src="<?php //echo $base; ?>/upload/catalog/view/theme/default/image/pick_time.png" alt="" /><span>TODAY at 11:00am</span></a></li>
								<li><?php //echo $cart; ?></li>
							
							</ul>
						</nav> -->
						
							<ul class="list-inline my-account-list" style="float:left;">
								<?php if ($logged) { ?>
									<li class="dropdown">
									<a class="signin" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<i class="fa fa-user top_user_ico"></i><span class="top_user_signin shop_font_color"><?php if ($logged) { echo 'Hi, '.$customer_firstname; }else{ ?>sign in<?php } ?></span>
									</a>
									 <ul class="dropdown-menu dropdown-menu-right">
										
										<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
										<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
										<?php /* <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
										<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li> */ ?>
										<li><a id="logout" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
									
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
								<div id="desktop_header_cart" class="btn mobile_cart_btn" onclick="toggleCartPanel()" style="padding-top:12px;">	
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
				<img class="m_right" src="<?php echo $logo; ?>" alt=""  />
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
<script>
	$('#cart_info_div').html('<h2>Loading<span>...</span></h2>');
</script>
				<?php /*	
				<div class="view_cart">
					<a class="back_bt">BACK TO MENU</a>
					<ul>
						<li>
							<strong class="pull-left">QTY</strong>
							<strong class="pull-right">PRICE</strong>
							<p>
								<input type="text" class="qty" placeholder="1" />
								<span>Country Chicken Club</span>
								<b class="prce">$8.50</b>
							</p>
							<p class="list_btm"><span>Bread: White Bread</span></p>
						</li>
						<li>
							<p>
								<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/list_img.png" alt="" />
								<span>Extra Turkey Bacon</span>
								<b class="prce">$1.00</b>
							</p>
						</li>
						<li>
							<p>
								<img src="<?php echo $base; ?>upload/catalog/view/theme/default/image/list_img.png" alt="" /><span>Arugula</span>
								<b class="prce">$1.00</b>
							</p>
						</li>
						<li class="no_border">
							<input type="text" class="coupan" value="COUPON CODE" />
						</li>
						<li class="no_border">
							<p class="text-left">
								<strong>SALES TAX 7%</strong>
								<b class="prce">$0.80</b>
							</p>
						</li>
						<li class="no_border">
							<p class="text-left">
							<strong class="black">TOTAL DUE</strong>
							<b class="prce grn">$15.25</b>
							</p>
						</li>
						<li class="no_border">
							<button type="button" class="btn btn-success borderNone shop_btn">PROCEED TO CHECKOUT</button>
						</li>
					</ul>
				</div>
				*/ ?>
			</div>
		</div>
	</div>
	
  <!-- header end-->
<script>
$( window ).resize(function() {
   adjustlogo();
	
});

function adjustlogo(){
	
	// $(window).on('resize', function() {
    // if( !$( '.cart_bag' ).is( ":hidden" ) ) {
        // $('.m_right').addClass('mR255');
    // }
// });
	
	
	
	if( !$( '.cart_bag' ).is( ":hidden" ) ) {
		
        $( '.fog' ).find( 'img.m_right' ).addClass( 'mR255' );
		  $('#home_ribbon_text').addClass( 'mR2555' );
		   $('.powerby').addClass('mR2555');
		
    }
    
    if (getURLVar('route') == 'common/home') {
		 
		console.log('test');
		 
        if( $( window ).width() >= 1250 && getURLVar('step_back') == "" ) {
            $('#home_ribbon_text').removeClass( 'mR255' );
			$('#home_ribbon_text').removeClass( 'mR2555' );
			$('.powerby').removeClass('mR2555');
			$( '.fog' ).find( 'img.m_right' ).removeClass( 'mR255' );
			
        }
    } else {
		console.log('test1');
		var query_string = '<?php echo( $_SERVER['QUERY_STRING'] );?>';
		
		if( query_string == "" ) {
			$('#home_ribbon_text').removeClass( 'mR255' );
			
		}
	}
}

$(document).ready(function(){
    //adjustlogo();
	
	var screenWidth = $( window ).width();

	$( ".tooltip ,.tooltip-inner,.tooltip-arrow" ).remove(); //added as the tooltip was getting stuck and always displayed when the update button was pressed without altering the quantity.
	if (getURLVar('route') == 'common/home' || !getURLVar('route')) {
		$('#mobile_cart').hide();
		$('#cart').hide();
		// $('.mobile_cart_hide_first_screen').hide();
	}else if (getURLVar('route') == 'cloverAPI/clover/maincart') {
		
		if(screenWidth > 1280){
			$('#mobile_cart').hide();
			$('#desktop_cart').show();
		}else{
			$('#mobile_cart').show();
			$('#desktop_cart').hide();
		}
		//$('#right_header').show();
		//$('#mobile_menu').show();
		//$('#shopping_bag_text').show();
	}else{
		// $('#right_header').hide();
		$('#mobile_menu').hide();
	}
	
	//Hide sidebar cart panel in checkout and admin pages
	var urlRoute = getURLVar('route');
	if($.type(urlRoute) != 'undefined' && (urlRoute.search('maincart') > -1 || urlRoute.search('account') > -1 )){
		$('#sidebarCart').hide();
	}	
	if($.type(urlRoute) != 'undefined' && (urlRoute.search('checkout_form') > -1 || urlRoute.search('account') > -1 )){
		$('#sidebarCart').hide();
	}	
	if($.type(urlRoute) != 'undefined' && (urlRoute.search('success_order') > -1 || urlRoute.search('account') > -1 )){
		$('#sidebarCart').hide();
	}
	
	
	//Hide cart button on home page
	var urlRoute = getURLVar('route');
	var urlStepBack = getURLVar('step_back');
	
	if($.type(urlRoute) == 'undefined' || urlRoute == 'common/home'){
		// console.log($.type(urlStepBack));
		// console.log(urlStepBack);
		if($.type(urlStepBack) != 'undefined' && urlStepBack != ''){
			$('#right_header_cart').show();
		}else{
			$('#right_header_cart').hide();
		}	
	}
	
	//to hide banner on product description page and make body color white
	if(getURLVar('route') == 'product/product' && getURLVar('product_id') != 'undefined' &&  getURLVar('product_id') != ''){
		$('body').css('background-color', '#fff');
		$('.banner').hide();
	}
	
	//To hide 'back to menu' on menu items page
	/*setTimeout(function(){ 
		if(getURLVar('step_back') != 'undefined' && getURLVar('step_back') == 'categories'){
			$('.back_bt').hide();
		}
	}, 10);*/
		
	if( getURLVar('step_back') == "categories" && screenWidth > 1250 && screenWidth < 1280 ) {
		//dont call fix_banner_ui on menu items page when screen width is between 1250 and 1280
		console.log('test2');
	} else {
		fix_banner_ui();
	}
	
	
	if(screenWidth < 1280){
		//To make the perfect circle for tab and mobiles of the pricing div on the product description page
		
		
		
		var priceDivWidth = $(".priceCircle").width();
		var priceChildWidth = $(".priceCircle > div").width();
			priceDivWidth = parseInt(priceDivWidth) + 15;
		// alert(priceChildWidth);
		$('.priceCircle').css({
			'height': priceDivWidth + 'px',
			'width': priceDivWidth + 'px',
			// 'max-width':'70px',
			// 'max-height':'70px',
			'padding':'0px'
		});
		var priceDivHeight = $(".priceCircle").height();
		var priceDivHeightHalf = priceDivHeight/2;
		
		
		var priceChildheight = $(".priceCircle > div").height();
		var halfPriceChildheight = priceChildheight/2;
		$('.priceCircle > div').css({
			// 'height': priceChildWidth + 'px',
			// 'line-height': priceChildWidth + 'px',
			// 'max-width':'70px',
			// 'max-height':'70px'
			'padding-top': (priceDivHeightHalf - halfPriceChildheight) + 'px',
			'text-align': 'center'
		});
		
	}	

	
});	

</script>

<script>
function fix_banner_ui(){
	//To fix banner UI and footer powered by logo when sidebar is not there for desktops
	var screenWidth = $( window ).width();
	var urlRoute = getURLVar('route');
	
	if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && urlRoute != 'common/home' ){
		// $('.fog img').addClass('mR255');
		// $('.top_head').addClass('mR255');
		// $('.powerby').addClass('mR255');
	}else if(screenWidth >= 1250){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}	
	
	//for checkout and acount pages
	if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && (urlRoute.search('maincart') > -1 || urlRoute.search('account') > -1 )){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}else if(screenWidth >= 1250){
		// $('.fog img').addClass('mR255');
		// $('.top_head').addClass('mR255');
		// $('.powerby').addClass('mR255');
	}

	if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && (urlRoute.search('checkout_form') > -1 || urlRoute.search('account') > -1 )){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}	
	
	if(screenWidth >= 1250 && $.type(urlRoute) != 'undefined' && (urlRoute.search('success_order') > -1 || urlRoute.search('account') > -1 )){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}
	//console.log(urlRoute);
	if(screenWidth >= 1250 && ($.type(urlRoute) == 'undefined' || urlRoute == 'common/home')){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}		
}
function banner_fix_showCategoryDiv(){
	//To fix banner UI when sidebar is not there for desktops
	var screenWidth = $( window ).width();
	if(screenWidth >= 1280){
		// $('.fog img').addClass('mR255');
		// $('.top_head').addClass('mR255');
		// $('.powerby').addClass('mR255');
	}	
}
function banner_fix_hideCategoryDiv(){
	//To fix banner UI when sidebar is not there for desktops
	var screenWidth = $( window ).width();
	if(screenWidth >= 1280){
		$('.fog img').removeClass('mR255');
		$('.top_head').removeClass('mR255');
		$('.powerby').removeClass('mR255');
	}	
}
</script>
<script>
//To hide header logo on all pages except the first one
$(document).ready(function(){	
	var urlRoute = getURLVar('route');
	
	if($.type(urlRoute) == 'undefined' || urlRoute == 'common/home' ){
		$('#header_logo').show();
	}else{
		$('#header_logo').hide();
	}	
});
$("#logout").click(function(event){
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=cloverAPI/clover/logout',
		type: 'get',
		success: function(json) {
			window.location = '<?php echo BASE; ?>index.php?route=account/logout';
		}	
	});
	event.preventDefault();
});
</script>
<script>
$(document).ready(function(){
	
// if(getURLVar('route') == 'cloverAPI/clover/checkout_form'){
	// var item_in_cart = '<?php echo $_SESSION['whole_cart_array']['total_items']; ?>';
	// if(item_in_cart == 0){
		// window.location = '<?php echo BASE; ?>index.php?route=cloverAPI/clover/maincart';
	// }
// }

adjustlogo();

});

$( document ).ready(function() {
	var total_item = '<?php echo $_SESSION['clover_cart']['total_items']; ?>';
    $('#cart span').html(total_item);
});

</script>