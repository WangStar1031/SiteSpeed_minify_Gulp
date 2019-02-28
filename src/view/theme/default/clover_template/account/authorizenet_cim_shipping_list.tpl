<?php
/**
 * Contains part of the Opencart Authorize.Net CIM Payment Module code.
 *
 * PHP version 5
 *
 * LICENSE: This source file is subject to memiiso license.
 * Please see the LICENSE.txt file for more information.
 * All other rights reserved.
 *
 * @author     memiiso <gel.yine.gel@hotmail.com>
 * @copyright  2013-~ memiiso
 * @license    Commercial License. Please see the LICENSE.txt file
 */
?>

<table class="radio">
	  <?php foreach ($shipping_methods as $shipping_method) { ?>
	  <tr>
	    <td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
	  </tr>
	  <?php if (!$shipping_method['error']) { ?>
	  <?php foreach ($shipping_method['quote'] as $quote) { ?>
	  <tr class="highlight">
	    <td><?php if ($quote['code'] == $code || !$code) { ?>
	      <?php $code = $quote['code']; ?>
	      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
	      <?php } else { ?>
	      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
	      <?php } ?></td>
	    <td><label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></td>
	    <td style="text-align: right;"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
	  </tr>
	  <?php } ?>
	  <?php } else { ?>
	  <tr>
	    <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
	  </tr>
	  <?php } ?>
	  <?php } ?>
</table>

