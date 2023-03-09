<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 마이 페이지</h1>
	<hr>
		<div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="principal"/>
				<h2>${principal }</h2>
			</sec:authorize>
			<a href="/">돌아가기</a>
		</div>
</body>
</html>