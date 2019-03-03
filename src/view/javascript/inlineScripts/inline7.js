
	function toggleCartPanel(){
		location = $BASE + 'index.php?route=checkout/cart';
	}

	$.ajax({
		url: $BASE + 'index.php?route=common/cart/showHeaderCartPanel',
		type: 'get',
		dataType: 'html',
		success: function(html) {
			$('#cart_info_div').html(html);
		}
	});