<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="./locationInsertAction.bo">
		<table>
			<tr>
				<td><label>�������̸� : </label></td>
				<td><input type="text" name="location_name"></td>
			</tr>
			<tr>
				<td><label>��������ȭ��ȣ : </label></td>
				<td><input type="tel" name="location_phone"></td>
			</tr>
			<tr>
				<td><label>����������ȣ : </label></td>
				<td><input type="number" name="location_postcode"></td>
			</tr>
			<tr>
				<td><label>�ּ� : </label></td>
				<td><input type="text" name="location_add"></td>
			</tr>
			<tr>
				<td><label>���ּ� : </label></td>
				<td><input type="text" name="locationD_add"></td>
			</tr>
			<tr>
				<td><label>������̸� : </label></td>
				<td><input type="text" name="location_title"></td>
			</tr>
			<tr>
				<td><label>��ۿ�û���� : </label></td>
				<td><input type="text" name="location_requested"></td>
			</tr>
		</table>
		<input type="hidden" name="member_id" value="1"><!-- ���ǿ��� ȸ��ID �޾ƿ��� �ٲٱ� -->
		<input type="submit" value="���">
	</form>
</body>
</html>