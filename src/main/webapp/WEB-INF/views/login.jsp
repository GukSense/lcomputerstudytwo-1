<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel ="stylesheet" type="text/css" href="/css/login.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
  <div class="container">
    <div class="img">
      <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content">
      <form action="/loginPro" method="post">
      	<input type="hidden" name="${_csrf.parameterName }" value="${csrf.token }">
        <img src="/img/L_logo.png">
        <h2 class="title">Login</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">                  
                    <input type="text" class="input" name="username" placeholder="Username">
                 </div>
              </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">                   
                    <input type="password" class="input" name="password" placeholder="Password">
                 </div>
              </div>
              <div style="display:flex; justify-content: space-between;">
              		<div>
	              		Save<input id="remember_me" name="remember-me" style="margin:3px;" type="checkbox"/> 
              		</div>
    	          <a href="/beforeSignUp">Sign up</a>
              </div>
              <input type="submit" class="btn" value="Login">
            </form>
        </div>
    </div>			
</body>
</html>