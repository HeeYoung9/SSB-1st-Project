<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="insertCart.js"></script>
</head>
<body>
	<input id="test" type="button" onclick="addCart()" value="addCart">
<div class="cartDiv" value="cartDiv" onclick="addCart()">
	<input class="item_id" type="text" value="1">
	<input class="cart_quantity" type="text" value="1">
	<input class="options_id" type="text" value="1">
</div>
</body>
</html>