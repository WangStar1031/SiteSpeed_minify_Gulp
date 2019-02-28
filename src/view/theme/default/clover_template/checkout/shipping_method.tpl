<script type="text/javascript"><!--
$('select[id=\'shipping_method_pickup_location\']').bind('change', function() {
	$('input[id=\'shipping_method_pickup\']').val($('select[id=\'shipping_method_pickup_location\']').val());
	$('#shipping_method_pickup').prop('checked', true);
});
//--></script>
<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<p><strong><?php echo $shipping_method['title']; ?></strong></p>
<?php if (!$shipping_method['error']) { ?>

<?php
reset($shipping_method['quote']);
$firstPickup = key($shipping_method['quote']);
if ($firstPickup && (strpos($firstPickup, 'pickup_') === 0)) {?>
<div class="radio">
  <label>
    <?php if ($shipping_method['quote'][$firstPickup]['code'] == $code || !$code) { ?>
    <?php $code = $shipping_method['quote'][$firstPickup]['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $shipping_method['quote'][$firstPickup]['code']; ?>" id="shipping_method_pickup" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $shipping_method['quote'][$firstPickup]['code']; ?>" id="shipping_method_pickup" />
    <?php } ?></label>
    <select name="shipping_method" id="shipping_method_pickup_location">
		<?php foreach ($shipping_method['quote'] as $quote) { ?>
			<?php if ($quote['code'] == $code || !$code) { ?>
			  <?php $code = $quote['code']; ?>
			  <option value="<?php echo $quote['code']; ?>" checked="checked" ><?php echo $quote['title']; ?></option>
			  <?php } else { ?>
			  <option value="<?php echo $quote['code']; ?>" ><?php echo $quote['title']; ?></option>
			<?php } ?>
		<?php } ?>
	</select><?php if($quote['text'] != ''){echo '&nbsp;&nbsp;-&nbsp;&nbsp;'.$quote['text']; } ?>
</div>
<?php } else { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
    <?php } ?>
    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
</div>
<?php } ?>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<p class="hide_in_pay_now"><strong><?php echo $text_comments; ?></strong></p>
<p class="hide_in_pay_now">
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<div class="buttons hide_in_pay_now">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary shop_btn" />
  </div>
</div>
