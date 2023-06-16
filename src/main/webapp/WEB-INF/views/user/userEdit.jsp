<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel ="stylesheet" type="text/css" href="/css/signup.css">
</head>
<body>
	<h1>회원 수정</h1>
	<img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	    <div class="wrap">                
	        <div class="user">                    
	            <div class="logo">
	                <a href="#"><img src="http://res.cloudinary.com/dpcloudinary/image/upload/v1506186248/logo.png" alt=""></a>
	            </div>                                                                     
	            <!-- FORM -->
	            <div class="form-wrap">
	                <!-- TABS -->
	                <div class="tabs">
						<h3 class="signup-tab"><a class="sign-up" href="#signup-tab-content"><span>Sign Up</span></a></h3>
	                </div>
	                  <!-- TABS CONTENT -->
	              	<div class="tabs-content">
	                    <!-- TABS CONTENT LOGIN -->
	                	<div id="login-tab-content" class="active">
	                  		<form action="/user/userEdit" method="post">
		                  		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
								<input type="hidden" name="username" value="${user.username }">
								<input type="text" class="input" name="uName" placeholder="name 입력">	
								<input type="password" class="input" name="password" placeholder="password 입력">
								<p>	권한: <input type="radio" name="checkedAuthorities" value="ROLE_ADMIN,ROLE_USER" >관리자	 <!-- 사용이유 : radio로는 value 값을 여러개 보낼수없어서 받아오는쪽에서 값을 나누기로 결정 -->
										<input type="radio" name="checkedAuthorities" value="ROLE_USER" >일반
								</p>	
	                   			<button type="submit" class="button" style="padding-top: 10px;padding-bottom: 10px; float:right;"> 수정하기 </button>	                   		
	                   		</form>
	                	</div>                                                  
	               	</div>
	           </div>
	         </div>
	     </div>	
</body>
</html>