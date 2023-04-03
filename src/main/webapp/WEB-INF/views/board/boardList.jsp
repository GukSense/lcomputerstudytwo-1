<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<style>
	<style>
	a {
		text-decoration: none; /* 링크의 밑줄 제거 */
  		color: #222222; /* 링크의 색상 제거 */
  		font-weight:13px;
	}
	table {
		border-collapse:collapse;
		margin:40px auto;
		margin-top:0px;
	}
	
	table tr th, table tr td {
		border:1px solid #818181;
		width:200px;
		text-align:center;
	}
	.td_title {
		width:800px;
	    text-align:left;
	    text-indent:10px;
  		overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
	.fl_search{
		height: 40px;
		width: 460px;
		bachground: #ffffff;
		display:flex;
		
	}
	.fr {
		height: 40px;
		border: 1px solid #1b5ac2;
		background: #ffffff;
	}
	.select_t {
		color:#ffffff;
		background:#1b5ac2;
		border: 1px solid #1b5ac2;
		outline:none;
	}
	.i_search {
		font-size: 16px;
		width: 325px;
		padding: 10px;
		border: 0px;
		outline:none;
		float:left;
	}
	.s_button, .written{
		width:50px;
		height:100%;
		border:0px;
		background:#1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
	}
	.select {
		height: 40px;
		width: 462px;
		border: 1px solid #1b5ac2;
		background:#1b5ac2;
		display:flex;
	}
	.fr {
		float:right;
		
	}
	.btm {
		display:flex;
		justify-content: space-between;
		clear:both;
	}
	ul {	<!-- 페이지네이션 css-->
		width:450px;
		height:50px;
		margin:10px auto;
		display: table;
  		margin-left: auto;
 		margin-right: auto;
					
	}
	li {	<!-- 페이지네이션 css-->
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		margin:0 5px;
		border-radius:5px;
		display:inline;
		background:#1b5ac2;
		color:#ffffff;
		text-align:center;
	}
	
	.tab_menu{
		display:flex;
		justify-content:row;
		height:45px;
		background:#1b5ac2;
	}
	.tab_menu li {
		padding-right:15px;
		padding-left:15px;
		border:none;
		line-height:45px;	
	}
	.logo {
		text-align:center;
	}
	.administratorBtn, .retrunBtn, .manageBtn, .loginBtn, .logoutBtn{
		border: none;
		background:#ffffff;
		outline: none;
		float: right;
		color: #1b5ac2;
	}
</style>
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
		<a href="/board/boardList"><img src="/img/logo.jpg" alt="" style="width:150px; height:70px;"></a>
		<a href="/board/boardList"><img src="/img/logo_title.jpg" alt="" style="width:400px; height:70px;"></a>
	</div>
	<table>
	<tr>
		<td colspan="5" style="border:none; padding:10px 0px;">
			<ul class ="tab_menu">
				<li><a href="/board/boardList?category=lcomputer" style="color:#ffffff;">lcomputer</a></li>
				<li><a href="/board/boardList?category=개발" style="color:#ffffff;">개발</a></li>
				<li><a href="/board/boardList?category=일상" style="color:#ffffff;">일상</a></li>
				<li><a href="/board/boardList?category=질문" style="color:#ffffff;">질문</a></li>
			</ul>
		</td>
	</tr>
		<tr style="background:#1b5ac2; color=#ffffff;">
			<th>탭</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
			<th>조회수</th>
		</tr>
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
		<tr>
			<td colspan="5" style="border:none; padding:10px 0px;" >
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
		</tr>
	</table>
<!-- 페이지네이션 -->

<!--페이지네이션-->
	<div>
		<ul>
			<c:choose>
				<c:when test="${pagination.startPage > 5}">
					<li>
						<a href="/board/boardList?page=${pagination.prevPage }">
							◀
						</a>
					</li>
				</c:when>
			</c:choose>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
				<c:choose>
					<c:when test="${ pagination.page == i}">
						
						<li style="background-color:#ededed; color:black;">
							<span>${i}</span>
						</li>
					</c:when>
					<c:when test="${pagination.page != i }">
						<li>
							<a href="/board/boardList?page=${i}">${i}</a>
						</li>
					</c:when>				
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${ pagination.nextPage < pagination.lastPage }">
					<li style="display:inlien;">
						<a href ="/board/boardList?page=${pagination.nextPage }">▶</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</body>
</html>