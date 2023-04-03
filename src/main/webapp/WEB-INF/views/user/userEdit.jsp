<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입</h1>
	
	<hr>
	<form action="/user/userEdit" method="post">
	<!--  csrf -->
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
		<input type="hidden" name="username" value="${user.username }">
		<input type="text" name="uName" placeholder="name 입력">	
		<input type="password" name="password" placeholder="password 입력">
		<p>	권한: <input type="checkbox" name="OneofthetwoAuthority" value="ROLE_ADMIN" >관리자
				<input type="checkbox" name="OneofthetwoAuthority" value="ROLE_USER" checked >일반
		</p>	
		<button type="submit"> 수정하기 </button>
	</form>
</body>
</html>