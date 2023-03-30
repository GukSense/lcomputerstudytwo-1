<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>view The Board</title>
	<style>
		li {
			list-style:none;
		}
		.administratorBtn, .retrunBtn, .manageBtn, .loginBtn, .logoutBtn{
		border: none;
		background:#ffffff;
		outline: none;
		float: right;
		color: #1b5ac2;
	}
	</style>
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
	<br><h1>view The Board</h1>
	<sec:authentication property="principal" var="principal"/>
	${principal}
	<table>
		<tr>
			<th><h3>제목: ${board.bTitle }</h3></th>
		</tr>
		<tr>
			<td>날짜: ${board.bDateTime }	조회수: ${board.bHits }	작성자: ${board.bWriter }</td>
		</tr>
		<tr>
			<td><h1>${board.bContent}</h1> </td>
		</tr>
		<tr>
			<td>Check -> Order :${board.bOrder } Group:${board.bGroup } Depth:${board.bDepth }</td>
			<sec:authorize access="isAuthenticated()">
			<c:if test="${principal.username == board.bId || sec:authorize(`hasRole('ROLE_ADMIN')`}"> 
				<td><a href="/board/beforeEditBoard/${board.bIdx }">수정</a></td>
				<td><a href="/board/deleteBoard/${board.bIdx }">삭제</a></td>
			</c:if>
			</sec:authorize>
			<td><a href="/board/beforeReplyBoard/${board.bOrder }&${board.bGroup }&${board.bDepth }">답글</a></td>
		</tr>
	</table>
	
	<!-- 댓글코멘트 -->
	
	<ul id="commentList">
		<c:forEach items="${list}" var="comment">		
		<li>
			<div>				
				<a>${comment.cName }</a>
				<span>시간: ~전</span>
				${principal.authorities }
			</div>
				<div class="cont">${comment.cContent }</div>
			<div>
				<br>
				<span></span>
				<input type="hidden" name=cBidx value="${board.bIdx }">
				<input type="hidden" name="cIdx" value="${comment.cIdx }">
				<sec:authorize access="isAuthenticated()">
					<c:if test="${principal.username == comment.cId}">
						<button type="button" class="btnUpdateForm">수정</button>
						<button type="button" class="btnDelete" cDelteCidx="${comment.cIdx }" cDeleteBidx="${comment.cBidx }">삭제</button>
					</c:if>
				<button type="button" class="btnReplyForm">답글</button>
				</sec:authorize>
			</div>
		</li>
		<li style="display: none;">
				<div>					
					<textarea class="editBox" rows="3" cols="80"></textarea>
					<button type="button" class="btnUpdate" cno="${comment.cIdx }" bno="${comment.cBidx }">수정</button>
					<button type="button" class="btnCancel">취소</button>
				</div>
		</li>
		<li style="display: none; list-style-position:inside;">
				<div>
					<textarea class="replyBox" rows="3" cols="80"></textarea>
					<button type="button" class="btnReply" bidx="${comment.cBidx}" order="${comment.cOrder }" group="${comment.cGroup}" depth="${comment.cDepth }">등록</button>
					<button type="button" class="btnCancelR">취소</button>
				</div>
		</li>
		</c:forEach>	
	</ul>
	<div>
		<label></label>
			<div class="simple_wrt">
				<!-- <a>댓글을 작성해주시려면 로그인해주세요. 로그인 하시겠습니까?</a> -->
				<input type="hidden" name=cBidx value="${board.bIdx }">
				<textarea rows="4" cols="50" id="cContent" name="cContent" style="background: rgb(255,255,255); overflow: hidden; width:690px; height:63px; resize:none;"></textarea>
				<input type="button" value="등록" id="submit">
			</div>
		
	</div>
	
	<script src="/javascript/comment.js"></script>
</body>
</html>