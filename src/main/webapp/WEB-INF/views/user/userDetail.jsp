<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 상세정보</title>
<style>
	table {
		border-collapse:collapse;
	}
	table tr th {
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		text-align:center;
		width:200px
	}
	a{
		text-decoration:none;
		color:#000;
		font-weight:700;
		border:none;
		cursor:pointer;
		padding:10px;
		display:inline-block;
	}
</style>
</head>
<body>
<a href="/user/userList">유저 리스트</a>	
<h1><br>회원상세정보</h1>
<table>
	<tr>
		<td>회원 ID</td>
		<td>${user.username }</td>
	</tr>
	<tr>
		<td>회원 이름</td>
		<td>${user.uName}</td>
	</tr>	
	<tr>
		<td>회원 레벨</td>
		<td>공백</td>
	</tr>
	<tr>
		<td>회원 가입일</td>
		<td>${user.uDateTime }</td>
	</tr>
	<tr style = "height:50px">	
		<td style="border:none;">	
			<a href="/user/beforeEditUser/${user.username}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;">수정</a>
		</td>
		<td style="border:none;">
			<a href="/user/userDelete/${user.username}" style="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
		</td>
	</tr>
</table>	



</body>
</html>