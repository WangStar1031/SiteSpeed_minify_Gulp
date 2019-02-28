<!--<div style="width:100%; float:left;" class="panel panel-default">--><div style="width:100%; float:left;" class=" panel-default">
  <?php /* <div class="panel-heading">
   <h4 class="panel-title"><!--a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"--><?php echo $heading_title; ?> <!--i class="fa fa-caret-down"--></i><!--/a--></h4> 
  </div> */ ?>
  <div id="collapse-coupon" class="">
    <div class="panel-body outerPanel">	  <!--
      <label class="col-sm-12 control-label custome-coupon" for="input-coupon" style="font-size: 20px; color: #4d5e6a"><?php //echo $entry_coupon; ?></label>	  -->
      <div class="input-group outerInput">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control inputInner" />
        <span class="input-group-btn my_button">
			<input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary shop_btn inputInnerButton" />
        </span>	  </div>	  <div class="input-group col-sm-12 couponMsg">	  </div>
      <script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=checkout/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');			$('.couponMsg').html( '' );
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json.error) {
				$('.couponMsg').html('<div style="color:#cc0000;" class="show_error_message">' + json.error + '</div>');

				// $('html, body').animate({ scrollTop: 0 }, 'slow');
			}
			if (json.success) {				$('.couponMsg').html('<div style="color:#4CAF50;" class="show_error_message">' + json.success + '</div>');				$.ajax({					url: '<?php echo BASE; ?>index.php?route=checkout/checkout/loadOrderSummary',					success: function(orderData) {						$('#custom-checkout-form_part_2').html( orderData );					}				});				// location.reload();			}
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
    </div>
  </div>
</div>
