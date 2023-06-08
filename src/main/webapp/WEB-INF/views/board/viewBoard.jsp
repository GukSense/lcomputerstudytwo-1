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
<link rel ="stylesheet" type="text/css" href="/css/table.css">
<style>
section > #commentList > li {
	border-bottom:1px solid rgba(255,255,255,0.5);
	list-style:none;
	line-height:25px;
	padding:10px;
}
section > #commentList {	
	width:100%;	
	padding-left: 0px;	
	margin-bottom: 0px;
}
.simple_wrt {
	margin-left:50px;
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
	<section>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th><h3>제목: ${board.bTitle }</h3></th>				
				</tr>
			</thead>	
			</table>
		</div>
		<div class="tbi-content">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
			<tr>
				<td>날짜: ${board.bDateTime }	조회수: ${board.bHits }	작성자: ${board.bWriter }</td>
			</tr>
			<tr>
				<td>
					<h1>${board.bContent}</h1> 
					<c:if test="${not empty board.filePath}"><img src="http://43.202.26.177/home/ec2-user/src/main/resources/static/file/${board.filePath }"></c:if>
				</td>			
			</tr>
			<tr>
				<td>
					<sec:authorize access="isAuthenticated()">		<!-- 댓글의 수정 삭제는 글작성자 이거나 관리자일때만 보이게설정 -->
							<c:choose>
								<c:when test="${principal.username == board.bId}">	
									<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">	<!-- 관리자o && 작성자o && 관리자x 작성자o-->
										<a href="/board/beforeEditBoard/${board.bIdx }">수정</a>
										<a href="/board/deleteBoard/${board.bIdx }">삭제</a>
									</sec:authorize>		
								</c:when>
								<c:when test="${principal.username != board.bId}">													
									<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- 관리자o && 작성자x -->
										<a href="/board/deleteBoard/${board.bIdx }">삭제</a>
									</sec:authorize>					
								</c:when>
							</c:choose>						
					</sec:authorize>		
					<a href="/board/beforeReplyBoard/${board.bOrder }&${board.bGroup }&${board.bDepth }">답글</a>
				</td>
			</tr>
			</tbody>
		</table>
			<c:if test="${not empty board.filePath}"><a href="http://43.202.26.177/home/ec2-user/src/main/resources/static/file/${board.filePath }">다운로드</a></c:if>
		</div>
	</section>	
	
<!-- 댓글코멘트 -->	
<section>
	<ul id="commentList">
		<c:forEach items="${list}" var="comment">		
		<li>
			<div>				
				<a>${comment.cName }</a>
				<span>시간: ~전</span>
			</div>
				<div class="cont">${comment.cContent }</div>
			<div>
				<br>
				<span></span>
				<input type="hidden" name=cBidx value="${board.bIdx }">
				<input type="hidden" name="cIdx" value="${comment.cIdx }">				
					<sec:authorize access="isAuthenticated()">		<!-- 댓글의 수정 삭제는 글작성자 이거나 관리자일때만 보이게설정 -->
						<c:choose>
							<c:when test="${principal.username == comment.cId}">	<!-- 관리자o && 작성자o -->
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button type="button" class="btnUpdateForm">수정</button>
									<button type="button" class="btnDelete" cDelteCidx="${comment.cIdx }" cDeleteBidx="${comment.cBidx }">삭제</button>
								</sec:authorize>		
							</c:when>
							<c:when test="${principal.username != comment.cId}">	<!-- 관리자o && 작성자x -->													
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button type="button" class="btnDelete" cDelteCidx="${comment.cIdx }" cDeleteBidx="${comment.cBidx }">삭제</button>
								</sec:authorize>					
							</c:when>
						</c:choose>						
					</sec:authorize>
				<button type="button" class="btnReplyForm">답글</button>
				
			</div>
		</li>
		<li style="display: none;"> 	<!-- If 수정버튼 클릭시 생성될 박스 -->
				<div>					
					<textarea class="editBox" rows="3" cols="80"></textarea>
					<button type="button" class="btnUpdate" cno="${comment.cIdx }" bno="${comment.cBidx }">수정</button>
					<button type="button" class="btnCancel">취소</button>
				</div>
		</li>
		<li style="display: none; list-style-position:inside;">		<!-- If 답글버튼 클릭시 생성될 박스 -->
				<div>
					<textarea class="replyBox" rows="3" cols="80"></textarea>
					<button type="button" class="btnReply" bidx="${comment.cBidx}" order="${comment.cOrder }" group="${comment.cGroup}" depth="${comment.cDepth }">등록</button>
					<button type="button" class="btnCancelR">취소</button>
				</div>
		</li>
		</c:forEach>	
	</ul>
</section>

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