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
<style>
	#option {
		border-right:0;
		border-left:0;
		border-top:0;
		border-bottom:1px solid #bcbcbc;
		width:100%;
	}
	input:focus {
		outline:none;
	}	
</style>

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
	    	<div class="col">-</div>
	    	<div class="col-6" style="
	    							border: 1px solid #bcbcbc;
	    							width:640px;
	    							height:600px;">
	    		<div class="row">
		    		<div class="col-md-8"><input type="text" placeholder="질문타이틀" style="border-bottom: 1px solid #bcbcbc;border-left:0;border-right:0;border-top:0;width:100%;height:56px;"></div>
		    		<div class="col-6 col-md-4">
		    			<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
						  style="background-color:#ffffff; color:gray;border:none;width:100%;height:56px;">
						    설문방식
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="#">객관식 질문</a></li>
						    <li><a class="dropdown-item" href="#">체크박스</a></li>
						    <li><a class="dropdown-item" href="#">드롭다운</a></li>
						  </ul>
						</div>
		    		</div>					
	    		</div>
	    		<div class="row" id="optionDiv" style="padding:15px;">
		    		<div class="row" id="targetOption">
			    		<div class="col-8" id="tmp" style="padding:10px;"> 
							<input id="option" type="text" placeholder="Option">
			    		</div>
						<div class="col-4" style="padding:10px;">
			    			<button type="button" class="btn-close" aria-label="Close" style="float:left;"></button>
						</div>
<div class="col-8" id="tmp" style="padding:10px;"> 
							<input id="option" type="text" placeholder="Option">
			    		</div>
						<div class="col-4" style="padding:10px;">
			    			<button type="button" class="btn-close" aria-label="Close" style="float:left;"></button>
						</div>											
		    		</div>
	    		</div>
	    		<div class="d-flex justify-content-start" style="padding-left:15px;">
	    			<button  type="button" class="btn btn-light" id="plusOption">옵션 추가</button>
	    			<button  type="button" class="btn btn-link"> '기타'추가</button>		    			
	    		</div>		    		
	    	</div>
	    	<div class="col">-</div>	
	    </div>
	</div>
	
	<script src="/javascript/surveyQuestion.js"></script>
</body>


</html>