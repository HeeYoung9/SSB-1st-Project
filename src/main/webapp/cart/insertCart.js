function addCart() {
	var arr = new Array;
	//값받아오기
	alert(1);
	alert($('cartDiv .item_id').val());
	$(".cartDiv").each(function() {
		let cartItem = {
  		"item_id" : $('cartDiv .item_id').value,
  		"cart_quantity" : $('cartDiv .cart_quantity').value,
  		"options_id" : $('cartDiv .options_id').value
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