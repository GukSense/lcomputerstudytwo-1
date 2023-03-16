<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<th><h3>제목: ${board.title }</h3></th>
		</tr>
		<tr>
			<td>날짜: ${board.date }	조회수: ${board.hits }	</td>
		</tr>
		<tr>
			<td><h1>${board.content}</h1> </td>
		</tr>
	</table>
	
</body>
</html>