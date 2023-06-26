<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal"/>
<c:forEach items="${list}" var="comment">		
	<li>
			<c:if test="${comment.cDepth > 0}">
				<c:forEach var="i" begin="1" end="${comment.cDepth}">
						<img src="/img/reply_ico.png" alt="" style="width:15px; height:15px;">
				</c:forEach>
			</c:if>
			<div>				
				<a>${comment.cName }</a>
				<span>날짜: ${comment.cDateTime }</span>
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
								<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
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
