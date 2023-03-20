<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>view The Board</title>
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
	
</body>
</html>