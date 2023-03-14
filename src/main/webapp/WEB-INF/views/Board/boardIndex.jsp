<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>BoardIndex</h1>
	
	<table>
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
				<td class= "td_title">${board.bTitle }</td>
				<td>${board.bWriter} </td>
				<td>${board.bDateTime }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="border:none; padding:10px 0px;" >
		</tr>
	</table>
</body>
</html>