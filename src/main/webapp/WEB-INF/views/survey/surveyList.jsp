<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SurveyList</title>
<link rel ="stylesheet" type="text/css" href="/css/table.css">
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
	<div class="logo">
		<a href="/board/boardList"><img src="/img/L_logo-removebg-preview.png" alt="" style="width:150px; height:70px;"></a>		
		<h1> Survey </h1>
		<a href="/survey/surveyList"><img src="/img/survey.png" style="border-radius:40px width:40px height:40px;height: 70px; padding-left:15px;"></a>
	</div>
	<section>
	<div class="tbl-header">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
		</table>
	</div>
		
		<table>
			<c:forEach items="${list}" var="survey">
			<tbody>
				<tr>
					<td>${survey.sIdx }</td>
					<td><a href="/survey/response/${survey.sIdx}" title="${survey.sDescription }">${survey.sTitle }</a></td>
					<td>${survey.sName } </td>
					<td>${survey.sDateTime }</td>
				</tr>
			</tbody>
			</c:forEach>		
		</table>
	</section>
		<div class="btm">
			<div class="fl_search">			
			</div>
			<div class= "fr">
				<input type="button" class="written" style="width:auto;" onclick="location.href = '/survey/question'" value="설문작성" >				
			</div>
		
		</div>
</body>
</html>