<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>Home Page</h1>
        <hr>
        <div>
        	<sec:authorize access="isAnonymous()">
	           <a href="/login">로그인</a>
	           <a href="/beforeSignUp">회원가입</a>
        	</sec:authorize>
        	<sec:authorize access="isAuthenticated()">
        		<a href="/logout">로그아웃</a>
        		<sec:authentication property="principal" var="principal"/>
        		<h2>${principal }</h2>
        	</sec:authorize>
        </div>
        
        <div>
	        <sec:authorize access="isAuthenticated()">
	        	<a href="/user/info">내 정보</a>
	        	<a href="/admin">관리자</a>
<<<<<<< Updated upstream
	        	<a href="/board/boardList">게시판</a>	        	
=======
	        	<button type="button" onclick="location.href='/Board/beforeInsertBoard'">글쓰기</button>
>>>>>>> Stashed changes
	        </sec:authorize>
        </div>
</body>
</html>