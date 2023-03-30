<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal"/>
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
