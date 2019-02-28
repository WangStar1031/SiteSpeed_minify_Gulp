<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<!-- <p><?php //echo $text_payment_method; ?></p> -->

<!-- Checkbox for Save CC option, in /checkout/payment_method.tpl -->

<div class="checkbox" <?php /* To bypass CIM when user is !logged */ if(!$logged || !isset($payment_methods['authorizenet_cim'])){ ?> style="display:none;" <?php } ?> >
   <h4>Pay using Credit Card / Debit Card</h4>
  <label>
    <input type="checkbox" name="save_cc_option" value="1" checked="checked" onchange="save_cc_option()" id="save_cc_option" />
	Save Card for seamless transactions in the future or use an already saved card
  </label>
</div>

<?php foreach ($payment_methods as $payment_method) { ?>
	
<?php /* To bypass CIM when user is !logged */ if(!$logged && $payment_method['code'] == 'authorizenet_cim'){ continue; }; ?>

<div class="radio" <?php if($logged && isset($payment_methods['authorizenet_cim'])){ ?> style="display:none;" <?php } ?> >
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
	<?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<p class="hide-shipping-yes"><strong><?php echo $text_comments; ?></strong></p>
<p class="hide-shipping-yes">
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="pull-right">
	<!-- Set to force accept the terms and conditons to bypass validation -->
	<input style="display:none" type="checkbox" name="agree" value="1" checked="checked" />
	<?php /* echo $text_agree; ?>
    <?php  if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } */ ?>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary shop_btn" />
  </div>

</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary shop_btn" />
  </div>
</div>
<?php } ?>
