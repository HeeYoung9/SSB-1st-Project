<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="./cart/cartListJS.js"></script>
</head>
<body>
	<form action="./Order.bo" method="post">
		<!-- �ӽ��ּ� -->
		<table border="1px solid black">
			<tr>
				<th><input type="checkbox" checked="checked" id="CheckAll"></th>
				<th>�̹����ּ�</th>
				<th>��ǰID</th>
				<th>��ǰ �̸�</th>
				<th>�ɼ�</th>
				<th>��ٱ��� ����</th>
				<th>����</th>
				<th></th>
			</tr>
			<c:forEach var="dto" items="${dtoArray }">
				<tr name="cart" value="${dto.cart_id }">
					<td><input type="checkbox" name="cart_id"
						value="${dto.cart_id }" checked="checked"></td>
					<td><img alt="��ǰ�̹���" src="${dto.item_img_main }"></td>
					<td name="item_id">${dto.item_id }</td>
					<td name="item_name">${dto.item_name }</td>
					<td name="options_value">${dto.options_value }</td>
					<td name="cart_quantity">${dto.cart_quantity }</td>
					<td name="options_price">${dto.options_price * dto.cart_quantity }</td>
					<td><input type="button" value="����"
						onclick="changeOption('${dto.cart_id}','${dto.item_id}');"></td>
					<!-- üũ�ڽ� ��ü ����/���� ����� -->
					<td>${dto.options_price * dto.cart_quantity }</td>
					<!-- ���������� ����� -->
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="�ֹ�">
	</form>
	<script src="cartList.js"></script>
</body>
<script type="text/javascript">
	var path = window.location.pathname;
	alert(path);
	function changeOption(cart_id, item_id) {//��ǰID�޾ƿ���
		$.ajax({
			type : "POST",
			url : "./cartAJAX.ca",
			dataType : "text",
			data : {
				"item_id" : item_id
			},
			error : function() {
				alert('��Ž���!!');
			},
			success : function(data) {
				//alert('��ż���!!');
				var list = JSON.parse(data);//json ��ü�� ��ȯ
				//��ü�� ����� ���� �Ѹ���
				$("[name=cart][value=" + cart_id + "]>[name=options_value]")
						.text(list[0].options_id);
			}
		});
	}
</script>
</html>