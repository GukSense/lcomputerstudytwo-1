<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel ="stylesheet" type="text/css" href="/css/signup.css">
<style>
	body {
	  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	  background: linear-gradient(to right, #25c481, #25b7c4);
	  font-family: 'Roboto', sans-serif;
	}
	.wrap {
	    position: static;
	    margin: auto;
	    
	    height: auto;
	    overflow: hidden;
	}
	.wrap:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	table{
	  width:100%;
	  table-layout: fixed;
	}
		
	td{
	  padding: 15px;	  
	  vertical-align:middle;
	  font-weight: 300;
	  font-size: 12px;	  
	  border-bottom: solid 1px #black;
	}
	.fr {
		float:right;		
	}
	.pagi_ul {	/* 페이지네이션 css*/
		width:450px;
		height:50px;
		margin:10px auto;
		display: table;
  		margin-left: auto;
 		margin-right: auto;						
	}
	.pagination, .tab_li{	/* 페이지네이션 css*/
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		margin:0 5px;
		border-radius:5px;
		display:inline;				
		text-align:center;
		background-color:#fff;	
	}
	
	.tab_menu{
		display:flex;
		justify-content:row;		
		
	}
	.tab_menu li {
		padding-right:15px;
		padding-left:15px;
		border:none;
		line-height:45px;
	}
	.form-wrap a {
		color:#666;
	    padding-bottom: 4px;
   		border-bottom: 1px solid #d9d9d9;
	}
</style>
</head>
<body>
	<h1> 회원</h1>
	<div class="wrap">                
                <div class="user">                    
                    <div class="logo">
                        <a href="#"><img src="http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/logo.png" alt=""></a>
                    </div>                                                                     
                    <!-- FORM -->
                    <div class="form-wrap">
                        <!-- TABS -->
                      <div class="tabs">
						<span><b>회원 목록	${pagination.count} 명</span>
                      </div>
                        <!-- TABS CONTENT -->
                      						
						<div class="tbi-content">	
                          	<table>	 
                          	   <tr></tr>                         	                        	
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
                          </div>                      							
                        </div>                                                                        
                </div>				
								<a href="/board/boardList">게시판 돌아가기</a>									
            </div>				
<!--  아래부터 Pagination -->	
				
					<ul class="pagi_ul">
						<c:choose>
							<c:when test="${pagination.startPage > 5}">
								<li class="pagination">
									<a href="/user/userList?page=${pagination.prevPage }">
										◀
									</a>
								</li>
							</c:when>
						</c:choose>
						<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
							<c:choose>
								<c:when test="${ pagination.page == i}">						
									<li class="pagination"">
										<span>${i}</span>
									</li>
								</c:when>
								<c:when test="${pagination.page != i }">
									<li class="pagination">
										<a href="/user/userList?page=${i}">${i}</a>
									</li>
								</c:when>				
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${ pagination.nextPage < pagination.lastPage }">
								<li class="pagination" style="display:inlien;">
									<a href ="/user/userList?page=${pagination.nextPage }">▶</a>
								</li>
							</c:when>
						</c:choose>
					</ul>
</body>	
</html>