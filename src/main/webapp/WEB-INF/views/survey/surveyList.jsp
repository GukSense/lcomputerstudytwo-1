<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SurveyList</title>
</head>
<body>
	<!-- 로그인 기능 -->
	<sec:authorize access="isAnonymous()">
		<a href="/beforeSignUp" style="color:#1b5ac2; float: right;">회원가입</a> 
		<a href="/login" style="color:#1b5ac2; float: right; padding-right:10px;">로그인</a>
    </sec:authorize>
    <!-- 로그아웃 기능 -->
    <sec:authorize access="isAuthenticated()">
		<a href="/logout" style="color:#1b5ac2; float: right; padding-right:10px;">로그아웃</a>
	</sec:authorize>
	
	<ul>		
		<c:forEach items="${list}" var="survey">
			<li>
				NO:${survey.sIdx } 	<a href="/survey/response/${survey.sIdx} }" title="${survey.sDescription }">설문제목: ${survey.sTitle }</a> 	설문작성자: ${survey.sName } 작성일: ${survey.sDateTime }	
			</li>	
		</c:forEach>		
	</ul>
	<a href="/survey/response">임시 응답 페이지바로가기</a>
	<a href="/survey/question">설문작성</a>
</body>
</html>