<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type="text/css" href="/css/signup.css">
</head>
<body>
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
                          <form class="login-form" action="/signup" method="post">
                          	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                            <input type="text" class="input" name="uName" placeholder="name 입력">
                            <input type="text" class="input" id="user_login" name="username" placeholder="id 입력">
                            <input type="password" class="input" id="user_pass" name="password" placeholder="password 입력">                     
                            <input type="submit" class="button" value="가입하기">
                          </form>
                          <div class="help-action">
                            <p><i class="fa fa-arrow-left" aria-hidden="true"></i><a class="forgot" href="/login">Remind your password?</a></p>
                          </div>
                        </div>                                                  
                      </div>
                  </div>
                </div>
            </div>       	
</body>
</html>