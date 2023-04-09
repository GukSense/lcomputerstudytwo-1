<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>Insert title here</title>


</head>
<body>
		<div class="container text-center">
			<div class="row justify-content-md-center border-bottom" >
		 		<div class="col col-lg-2">질문</div>
		 		<div class="col-md-auto">응답</div>
		 		<div class="col col-lg-2">설정</div>
		 	</div>
	 	
	 	<div class="row" style="background-color: #fffff;" >
	 		<div class="col"></div>
    		<div class="col-6">
    			<div class="mb-3">
 					 <label for="floatingInput	">설문지 타이틀 </label>
  					 <input type="text" class="form-control" id="floatingInput" placeholder="제목없는 설문지">
				</div>
				<div class="mb-3">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="2" placeholder="설문지내용"></textarea>
				</div>
    		</div>
	    	<div class="col"></div>	 	
	    </div>
	    <div class="row">
	    	<div class="col"></div>
	    	<div class="col-6">설문지내용</div>
	    	<div class="col"></div>	
	    </div>
	</div>
</body>
</html>