<?php if (!isset($redirect)) { ?>
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_name; ?></td>
        <td class="text-left always-hide"><?php echo $column_model; ?></td>
        <td class="text-right"><?php echo $column_quantity; ?></td>
        <td class="text-right"><?php echo $column_price; ?></td>
        <td class="text-right"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?></td>
        <td class="text-left always-hide"><?php echo $product['model']; ?></td>
        <td class="text-right"><?php echo $product['quantity']; ?></td>
        <td class="text-right"><?php echo $product['price']; ?></td>
        <td class="text-right"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="text-left"><?php echo $voucher['description']; ?></td>
        <td class="text-left"></td>
        <td class="text-right">1</td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="3" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<h3><?php echo $text_credit_card; ?></h3>
<?php 
	foreach($payment as $val){
		echo $val;	
	}
?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary button-confirm shop_btn" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	var theId = $('input[type=\'radio\'][name=\'select_payment_account\']:checked').attr('id');
	//console.log('id '+theId);
	
	if(theId == 'create_new_credit_card_aim'){
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=payment/authorizenet_aim/send',
			type: 'post',
			data: $('#payment_aim :input'),
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			complete: function() {
				$('#button-confirm').button('reset');
			},
			success: function(json) {
				if (json['error']) {
					alert(json['error']);
				}

				if (json['redirect']) {
					location = json['redirect'];
				}
			}
		});
	// }else if(theId == 'use_cim_payment_account' || theid == 'create_new_credit_card'){
	}else{
		var node = this;
		$.ajax({
			url: '<?php echo BASE; ?>index.php?route=payment/authorizenet_cim/send',
			type: 'post',
			data: $('#cimpayment').serialize(),
			dataType: 'json',		
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			complete: function() {
				// $('#button-confirm').button('reset');
			},				
			success: function(json) {
				if (json['error']) {
					$('#button-confirm').button('reset');					
					<?php /*if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
					json['error'] = json['error'].replace(/\n/g, '<br />'); 
					$("<div>"+json['error']+"</div>").dialog({
						modal: true,
						buttons: {
							<?php echo $text_close; ?>: function() {
							$( this ).dialog( "close" );
							$('.attention').remove();
							}
						}
						});
				<?php }else {?>
				alert(json['error']);
			  <?php } */ ?>
					alert(json['error']);
				}
			   if (json['success_held']) {					
					<?php /*if ($authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
					json['success_held'] = json['success_held'].replace(/\n/g, '<br />'); 
					$("<div>"+json['success_held']+"</div>").dialog({
						modal: true,
						buttons: {
							<?php echo $text_close; ?>: function() {
							$( this ).dialog( "close" );
							location = json['checkout_success_url'];
							}
						}
						});
					<?php }else {?>
					alert(json['success_held']);
					 location = json['checkout_success_url'];
				  <?php } */ ?>
					 location = json['checkout_success_url'];
				   }else if (json['checkout_success_url']) {
						location = json['checkout_success_url'];
					}
			},
			error: function(xhr, ajaxOptions, thrownError) {
					$('#button-confirm').button('reset');
					alert(thrownError);
				}
		});
		
	}	
});


/*
$('#button-confirm').on('click', function() {
	var node = this;
		$.ajax({
			url: 'index.php?route=payment/authorizenet_cim/send',
			type: 'post',
			data: $('#cimpayment').serialize(),
			dataType: 'json',		
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			complete: function() {
				// $('#button-confirm').button('reset');
			},				
			success: function(json) {
				if (json['error']) {
					$('#button-confirm').button('reset');					
					<?php if (@$authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
					json['error'] = json['error'].replace(/\n/g, '<br />'); 
					$("<div>"+json['error']+"</div>").dialog({
						modal: true,
						buttons: {
							<?php echo $text_close; ?>: function() {
							$( this ).dialog( "close" );
							$('.attention').remove();
							}
						}
						});
				<?php }else {?>
				alert(json['error']);
			  <?php } ?>					
				}
			   if (json['success_held']) {					
					<?php if (@$authorizenet_cim_use_jquerydialog == 'usejquerdialog') { ?>
					json['success_held'] = json['success_held'].replace(/\n/g, '<br />'); 
					$("<div>"+json['success_held']+"</div>").dialog({
						modal: true,
						buttons: {
							<?php echo $text_close; ?>: function() {
							$( this ).dialog( "close" );
							location = json['checkout_success_url'];
							}
						}
						});
					<?php }else {?>
					alert(json['success_held']);
					 location = json['checkout_success_url'];
				  <?php } ?>
					 location = json['checkout_success_url'];
				   }else if (json['checkout_success_url']) {
						location = json['checkout_success_url'];
					}
			},
			error: function(xhr, ajaxOptions, thrownError) {
					$('#button-confirm').button('reset');
					alert(thrownError);
				}
		});
	});
*/
//--></script>

<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
