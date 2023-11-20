<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="insertCart.js"></script>
</head>
<body>
<div id="selecters">
	<input type="hidden" value="42" id="item_idSelecter">
	<input type="number" value="1" min="1" max="5" id="cart_quantitySelecter">
	<select id="options_idSelecter">
		<option value="12" label="12">
		<option value="13" label="13">
		<option value="14" label="14">
	</select>
</div>
<input type="button" value="setCart" onclick="setCart()">
<div id="cartPool">

</div>
<input type="button" value="addCart" onclick="addCart()">
</body>
</html>