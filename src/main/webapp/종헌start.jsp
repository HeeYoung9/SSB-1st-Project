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
	
	<input type="button" value="��ٱ���" onclick="location.href='./cartList.ca?'">
	<input type="button" value="�����" onclick="location.href='./location.lo?'">
	<input type="button" value="���ø���Ʈ" onclick="location.href='./wishlist.wl?'">
	<input type="button" value="�׽�Ʈ" onclick="location.href='./locationTest.lo'">
	<input type="button" value="�˾�" onclick="openWindow()">
	<input type="text" id="getPopup" value="1">
	<input type="radio" value="1" name="getPopup">1
	<input type="radio" value="2" name="getPopup">2
	<input type="radio" value="3" name="getPopup">3
	<input type="radio" value="4" name="getPopup">4
	<script type="text/javascript">
		function openWindow() {
	        var popup = window.open("./locationPopup.lo", "�˾�", "width=600, height=1000");
	    }
	</script>
</body>
</html>