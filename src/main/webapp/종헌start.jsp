<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>start.jsp</h1>

	MVC ������Ʈ�� ��������
	
	<input type="button" value="��ٱ���" onclick="location.href='./cartList.ca?member_id=1'">
	<input type="button" value="�����" onclick="location.href='./location.lo?member_id=1'">
	<input type="button" value="���ø���Ʈ" onclick="location.href='./wishlist.wl?member_id=1'">
	<input type="button" value="�׽�Ʈ" onclick="location.href='./locationTest.lo'">
	<input type="button" value="�˾�" onclick="openWindow()">
	<script type="text/javascript">
		function openWindow() {
	        var popup = window.open("./locationPopup.lo?member_id=1", "�˾�", "width=600, height=1000");
	        popup.document.getElementById("member_id").value
	    }
	</script>
</body>
</html>