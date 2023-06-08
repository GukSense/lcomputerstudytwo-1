<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" type="text/css" href="/css/table.css">
<meta charset="EUC-KR">
<title>boardList</title>
</head>
<body>
	<!-- 로그인 로그아웃 기능 -->
	<sec:authorize access="isAnonymous()">
		<a href="/beforeSignUp" style="color:#1b5ac2; float: right;">회원가입</a> 
		<a href="/login" style="color:#1b5ac2; float: right; padding-right:10px;">로그인</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
		<a href="/logout" style="color:#1b5ac2; float: right; padding-right:10px;">로그아웃</a>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="/admin">관리자페이지</a>	
		</sec:authorize>
	</sec:authorize>	
	<!--  로고 이미지 -->
	<div class="logo">
		<a href="/board/boardList"><img src="/img/L_logo-removebg-preview.png" alt="" style="width:150px; height:70px;"></a>		
		<h1> Academy</h1>
		<a href="/survey/surveyList"><img src="/img/survey.png" style="border-radius:40px width:40px height:40px;height: 70px; padding-left:15px;"></a>
	</div>
	<section>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<thead>
					<tr>
						<td colspan="5" style="border:none; padding:10px 0px;">
							<ul class ="tab_menu">
								<li class="tab_li"><a href="/board/boardList?category=lcomputer" style="color:#ffffff;">lcomputer</a></li>
								<li class="tab_li"><a href="/board/boardList?category=개발" style="color:#ffffff;">개발</a></li>
								<li class="tab_li"><a href="/board/boardList?category=일상" style="color:#ffffff;">일상</a></li>
								<li class="tab_li"><a href="/board/boardList?category=질문" style="color:#ffffff;">질문</a></li>
							</ul>
						</td>
					</tr>					
					<tr>
						<th>탭</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일시</th>
						<th>조회수</th>
					</tr>
				</thead>
			</table>			
		</div>
		<div class="tbi-content">
			 <table cellpadding="0" cellspacing="0" border="0">
			 	<tbody>
					<c:forEach items="${list}" var="board">
				 		<tr>
							<td>${board.bCategory}</td>				
							<td class= "td_title">
								<a href="/board/viewBoard/${ board.bIdx}">
									${board.bTitle}				
								</a></td>
							<td>${board.bWriter} </td>
							<td>${board.bDateTime }</td>
							<td>${board.bHits }</td>				 		
				 		</tr>
					</c:forEach>
			 	</tbody>
			 </table>
		</div>
	</section>
		<div class="btm">
		<!-- 검색 -->
			<div class="fl_search">
				<form method="get" action="/board/boardList" name="search">					
					<span class="select">
						<select class ="select_t" name="target" >
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_writer">작성자</option>
						</select>
					
						<input type="text" class="i_search" placeholder="검색어 입력" name="keyword">	
						<button class="s_button">검색</button>
					</span>
					
				</form>
			</div>
			<sec:authorize access="isAuthenticated()">
				<div class= "fr">
						<input type="button" class="written" onclick="location.href = '/board/beforeWriteBoard'" value="글쓰기"  name="write">
				</div>
			</sec:authorize>	
			
		</div>
		
<!-- 페이지네이션 -->

<!--페이지네이션-->
	<div>
		<ul>
			<c:choose>
				<c:when test="${pagination.startPage > 5}">
					<li class="pagination">
						<a href="/board/boardList?page=${pagination.prevPage }">
							◀
						</a>
					</li>
				</c:when>
			</c:choose>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
				<c:choose>
					<c:when test="${ pagination.page == i}">
						
						<li class="pagination" style="background-color:#ededed; color:black;">
							<span>${i}</span>
						</li>
					</c:when>
					<c:when test="${pagination.page != i }">
						<li class="pagination">
							<a href="/board/boardList?page=${i}">${i}</a>
						</li>
					</c:when>				
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${ pagination.nextPage < pagination.lastPage }">
					<li class="pagination" style="display:inlien;">
						<a href ="/board/boardList?page=${pagination.nextPage }">▶</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</body>
</html>