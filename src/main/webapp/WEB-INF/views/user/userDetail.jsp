<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 상세정보</title>
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
<link rel ="stylesheet" type="text/css" href="/css/signup.css">
</head>
<body>
<a href="/user/userList">유저 리스트</a>	
<h1><br>회원상세정보</h1>
<div class="wrap">                
	<div class="user">                    
    	<div class="logo">
    		<a href="#"><img src="http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/logo.png" alt=""></a>
        </div>                                                                     
        <!-- FORM -->
        <div class="form-wrap">
        <!-- TABS -->
	        <div class="tabs">
				<span><b>회원정보</span>
	        </div>
	        <!-- TABS CONTENT -->
	        <div class="tabs-content">
	        <!-- TABS CONTENT LOGIN -->
		        <div id="login-tab-content" class="active">
					<div class="tbi-content">
						<table>
							<tr>
								<td>회원 ID</td>
								<td>${user.username }</td>
							</tr>
							<tr>
								<td>회원 이름</td>
								<td>${user.uName}</td>
							</tr>	
							<tr>
								<td>회원 레벨</td>
								<td>공백</td>
							</tr>
							<tr>
								<td>회원 가입일</td>
								<td>${user.uDateTime }</td>
							</tr>
							<tr style = "height:50px"></tr>
						</table>	
						<a style="color:black;" href="/user/beforeEditUser/${user.username}" >수정</a>
						<a class="fr" style="color:red;" href="/user/userDelete/${user.username}" >삭제</a>							
			        </div>                      							
            	</div>                                                  
        	</div>
		</div>
	</div>
</div>	


</body>
</html>