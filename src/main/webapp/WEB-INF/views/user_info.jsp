<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel ="stylesheet" type="text/css" href="/css/signup.css">
<style>
	body {
	  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	  background: linear-gradient(to right, #25c481, #25b7c4);
	  	font-family: 'Roboto', sans-serif;
	}
	table{
	  width:100%;
	  table-layout: fixed;
	}
	.tbl-header{
	  background-color: rgba(255,255,255,0.3);
	 }
	.tbl-content{
	  height:300px;
	  overflow-x:auto;
	  margin-top: 0px;
	  border: 1px solid rgba(255,255,255,0.3);
	}
	th{
	  padding: 20px 15px;
	  text-align: left;
	  font-weight: 500;
	  font-size: 12px;	  
	  text-transform: uppercase;
	}
	td{
	  padding: 15px;
	  text-align: left;
	  vertical-align:middle;
	  font-weight: 300;
	  font-size: 12px;	  
	  border-bottom: solid 1px rgba(255,255,255,0.5);
	}
	.fr {
		float:right;
		
	}
</style>
</head>
<body>
	<h1>    </h1>
	<div class="wrap">                
                <div class="user">                    
                    <div class="logo">
                        <a href="#"><img src="http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/logo.png" alt=""></a>
                    </div>                                                                     
                    <!-- FORM -->
                    <div class="form-wrap">
                        <!-- TABS -->
                      <div class="tabs">
						<span><b>My Page	</span>
                      </div>
                        <!-- TABS CONTENT -->
                      <div class="tabs-content">
                            <!-- TABS CONTENT LOGIN -->
                        <div id="login-tab-content" class="active">
							<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal"/>
						<div class="tbi-content">	
                          	<table>
	                          	<tr><td></td></tr>
	                        	<tr>
	                        		<td>유저 아이디</td><td>${principal.username }</td>
	                        	</tr>
			                    <tr>
			                    	<td>유저 레벨</td><td>${principal.authorities }</td>
			                    </tr>
			                    <tr>
			                    	<td>유저 네임</td><td>${principal.uName }</td>
			                    </tr>
			                    <tr><td></td></tr>
			                    <tr><td></td></tr>
			                    <tr><td></td></tr>
                          	</table>    
							
							<a href="/">돌아가기</a>
							<a class="fr" href="/user/userDetail/${principal.username }">수정하기</a>
                          </div>                      
							</sec:authorize>
                        </div>                                                  
                      </div>
                  </div>
                </div>
            </div>	
</body>
</html>