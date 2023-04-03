<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
	table {
		border-collapse:collapse;
		margin:40px auto;
	}
	table tr th{
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		width:200px;
		text-align:center;
	}
	a{
		text-decoration:none;
		color:#000;
		font-weight:700;
	}
	h1 {
		text-align:center;
	}
	ul {
		width:450px;
		height:50px;
		margin:10px auto;
		text-align:center;					
	}
	li {
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		margin:0 5px;
		border-radius:5px;
		display:inline;				
	}		
</style>
</head>
<body>
	<h1>회원목록</h1>
	<table>
		<tr>
			<td colspan="3">전체 회원 수: ${pagination.count}</td>
		</tr>		
		<tr>
			<th>ID</th>
			<th>이름</th>
		</tr>
		<c:forEach items="${list}" var="user">
			 <tr>
				<td><a href="/user/userDetail/${user.username}">${user.username}</a></td>
				<td>${user.uName}</td>
		     <tr>
		</c:forEach>
	</table>
	
	
<!--  아래부터 Pagination -->	
	<div>
		<ul>
			<c:choose>
				<c:when test="${pagination.startPage > 5}">
					<li>
						<a href="/user/userList?page=${pagination.prevPage }">
							◀
						</a>
					</li>
				</c:when>
			</c:choose>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
				<c:choose>
					<c:when test="${ pagination.page == i}">
						
						<li style="background-color:#ededed;">
							<span>${i}</span>
						</li>
					</c:when>
					<c:when test="${pagination.page != i }">
						<li>
							<a href="/user/userList?page=${i}">${i}</a>
						</li>
					</c:when>				
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${ pagination.nextPage < pagination.lastPage }">
					<li style="display:inlien;">
						<a href ="/user/userList?page=${pagination.nextPage }">▶</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</body>	
</html>