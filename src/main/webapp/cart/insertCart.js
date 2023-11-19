function addCart() {
	alert(1);
	var arr = new Array;
	$(".cartDiv").each(function() {
		let cartItem = {
  		"item_id" : $(this).find('.item_id').val(),
  		"cart_quantity" : $(this).find('.cart_quantity').val(),
  		"options_id" : $(this).find('.options_id').val()
		};
		arr.push(cartItem);
	});
	$.ajax({
		type: "POST",
		url: "./insertCart.ca",
		dataType: "text",
		data: {
			"arr": JSON.stringify(arr)
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			
		}
	});
};