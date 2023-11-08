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
				<td><label>수취인이름 : </label></td>
				<td><input type="text" name="location_name"></td>
			</tr>
			<tr>
				<td><label>수취인전화번호 : </label></td>
				<td><input type="tel" name="location_phone"></td>
			</tr>
			<tr>
				<td><label>배송지우편번호 : </label></td>
				<td><input type="number" name="location_postcode"></td>
			</tr>
			<tr>
				<td><label>주소 : </label></td>
				<td><input type="text" name="location_add"></td>
			</tr>
			<tr>
				<td><label>상세주소 : </label></td>
				<td><input type="text" name="locationD_add"></td>
			</tr>
			<tr>
				<td><label>배송지이름 : </label></td>
				<td><input type="text" name="location_title"></td>
			</tr>
			<tr>
				<td><label>배송요청사항 : </label></td>
				<td><input type="text" name="location_requested"></td>
			</tr>
		</table>
		<input type="hidden" name="member_id" value="1"><!-- 세션에서 회원ID 받아오게 바꾸기 -->
		<input type="submit" value="등록">
	</form>
</body>
</html>