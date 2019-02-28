<!-- START FacebookLogin -->
<style type="text/css">
	<?php echo htmlspecialchars_decode($data['FacebookLogin']['CustomCSS']); ?>
</style>

<div class="box" id="facebookLoginBox"></div>
<script type="text/html" class="facebookLoginHTML">
	<?php if ($data['FacebookLogin']['WrapIntoWidget'] == 'Yes') { ?>
		<div class="box box-fblogin list-group">
		  <a href="javascript:void(0)" class="box-heading list-group-item active"><?php echo $data['FacebookLogin']['WrapperTitle']; ?></a>
		  <div class="box-content list-group-item">
			<div class="facebookButton"><a href="javascript:void(0)" onclick="initiateFBLogin();" class="facebookLoginAnchor <?php if(!empty($data['FacebookLogin']['ButtonDesign'])) echo $data['FacebookLogin']['ButtonDesign']; else echo 'fbkNoDesign'; ?>"><span></span><?php echo $data['FacebookLogin']['ButtonLabel']; ?></a></div>
		  </div>
		</div>
	<?php } else { ?>
		<div class="facebookButton"><a href="javascript:void(0)" onclick="initiateFBLogin();" class="facebookLoginAnchor <?php echo $data['FacebookLogin']['ButtonDesign']; ?>"><span></span><?php echo $data['FacebookLogin']['ButtonLabel']; ?></a></div>
	<?php } ?>
</script>

<script language="javascript" type="text/javascript"> 
<?php
 if (!empty($data['FacebookLogin']['position_use_selector'])) { ?>
    var posSelector = '<?php echo $data['FacebookLogin']['position_selector']; ?>';
    var positionFBButton = function() {
		<?php if ($data['FacebookLogin']['WrapIntoWidget'] == 'Yes') { ?>
			var sourceSelector = '.facebookLoginHTML:first';
		<?php } else { ?>
			var sourceSelector = '.facebookLoginHTML:first .box-content';
		<?php } ?>
		
        if (posSelector) {
            $(posSelector).prepend($('.facebookLoginHTML:first').html());	
        } else {
            $('#content').prepend($('.facebookLoginHTML:first').html());	
        }	
    }
    
    $(document).ready(function() {
        if ($(posSelector).find('.facebookLoginAnchor').length == 0) {
            positionFBButton();
        }
    });
    $(document).ajaxComplete(function() {
        var tries = 0;
        var tryAppendButton = setInterval(function() {
            tries++;
            if ($(posSelector).find('.facebookLoginAnchor').length == 0) {
                positionFBButton();
            }
            if (tries > 20 || $(posSelector).find('.facebookLoginAnchor').length > 0) {
                clearInterval(tryAppendButton);	
            }
        },300);
    });
<?php } else { ?>
	$('#facebookLoginBox').after($('.facebookLoginHTML:first').html());
<?php } ?>

$('#facebookLoginBox').remove();
</script>

<script>  
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
		  statusChangeCallback(response);
		});
	}

	function checkFacebookLogin() 
    {
        FB.getLoginStatus(function(response) {
          if (response.status === 'connected') {
            window.location.replace('<?php echo $redirect_url ?>');
          }
         });
    }

	function initiateFBLogin() {
        FB.login(function(response) {
        	checkFacebookLogin();
        }, {scope: '<?php echo $scope; ?>'});
    }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '<?php echo $data['FacebookLogin']['APIKey']; ?>',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.4' // use version 2.2
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));  
</script>
<!-- END FacebookLogin -->