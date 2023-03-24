<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
	<h1>view The Board</h1>
	
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
			<td><a href="/board/beforeEditBoard/${board.bIdx }">수정</a></td>
			<td><a href="/board/deleteBoard/${board.bIdx }">삭제</a></td>
			<td><a href="/board/beforeReplyBoard/${board.bOrder }&${board.bGroup }&${board.bDepth }">답글</a></td>
		</tr>
	</table>
	
	<!-- 댓글코멘트 -->
	
	<ul id="commentList">
		
		<li>
			<div>
				<a>id</a>
				<span>~전</span>
			</div>
			<div class="cont">댓글내용</div>
			<div>
				<span></span>
				<button type="button" class="btnUpdateForm">수정</button>
				<button type="button" class="btnUpdateForm">삭제</button>
				<button type="button" class="btnReplyForm">답글</button>
			</div>
		</li>	
	</ul>
	<div>
		<label></label>
			<div class="simple_wrt">
				<!-- <a>댓글을 작성해주시려면 로그인해주세요. 로그인 하시겠습니까?</a> -->
				<input type="hidden" name=cBidx value="${board.bIdx }">
				<textarea rows="4" cols="50" id="cContent" name="cContent" style="background: rgb(255,255,255); overflow: hidden; width:690px; height:63px; resize:none;"></textarea>
				<button id="submit-button">등록</button>
			</div>
		
	</div>
	
	<script src="/javascript/comment.js"></script>
</body>
</html>