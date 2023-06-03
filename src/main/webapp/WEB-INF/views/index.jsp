<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
	.head {
		display:flex;
		justify-content: space-between;
	}
	.head_logo {
		display:flex;		
	}
	.menu {
		display:flex;		 				
	}
	.head > .menu > a {
		color:#555;
	} 
</style>

</head>
<body>
	<nav class="head">	
		<div class="head_logo">
			<img src="/img/L_logo.png" style="width:150px; height:80;">
			<h1 style="padding-top: 30px;">Academy</h1>
		</div>	
		<div class="menu">
	       	<sec:authorize access="isAnonymous()">
	           <a href="/login" style="padding-right: 15px;">로그인 </a>
	           <a href="/beforeSignUp" style="padding-right: 15px;">회원가입 </a>
	           <a href="/board/boardList" style="padding-right: 15px;">게시판 </a>	   
	       	</sec:authorize>
		</div>
	</nav>
	<img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">      				        
		        <ul>
		        	<sec:authorize access="isAuthenticated()">
		        		<li><a href="/logout">로그아웃</a></li>
		        		<li><sec:authentication property="principal" var="principal"/></li>
		        		<li><h2>${principal }</h2></li>
		        	</sec:authorize>
		        </ul>
		        
		        <div>
			        <sec:authorize access="isAuthenticated()">
			        	<a href="/user/info">내 정보</a>
			        	<a href="/admin">관리자</a>
			        	<a href="/board/boardList">게시판</a>	        	
			        </sec:authorize>
		        </div>
</body>
</html>
