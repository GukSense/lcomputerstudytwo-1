<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Survey Response</title>

<style>
	.option {
	border-right:0;
	border-left:0;
	border-top:0;
	border: none;
	}
</style>
</head>
<body>
 	<div class="container text-center">
 		<div class="row">
	 		<div class="col"><!-- 빈공간 --></div>
	    	<div class="col-7 check" style="border: 1px solid #bcbcbc; margin-top: 100px; margin-bottom: 50px;">
	      		
	      		<h2>${survey.sTitle}</h2>
	      		<br>${survey.sDescription }
	      		<br>
	      			<c:forEach items="${survey.questions}" var="q">
			      		<div class="answer row justify-content-start" align="left" style="margin-left: 15px;margin-top: 10px;">
				      		<strong>Q ${q. qTitle}</strong>
				      			<c:forEach items="${q.items }" var="i">
				      				<input type="hidden" value="${q.qType}" class="qType">
				      				<input type="hidden" value="${q.qIdx}" class="qIdx">
				      					<c:if test="${q.qType eq 'multipleChoice' }">
							      			<div class="form-check">
							      				<input class="form-check-input" type="radio" name="flexRadioDefault_${q.qIdx }">
							      				<input class="form-control option" type="text" value="${i. content}" aria-label="readonly input example" readonly>
							      			</div>				      					
				      					</c:if>
				      					<c:if test="${q.qType eq 'long'}">
				      						<div class="form-floating">
												<textarea class="form-control option" placeholder="주관식" style="height: 100px"></textarea>
												<label for="floatingTextarea2">${i.content }</label>
											</div>
				      					</c:if>
				      					<c:if test="${q.qType eq 'check'}">
				      						<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" name="flexRadioDefault_${q.qIdx }">
												<input class="form-control option" type="text" value="${i.content }" aria-label="readonly input example" readonly>
											</div>
				      					</c:if>
				      				
				      			</c:forEach>
			      		</div>
	      			</c:forEach>
	      			<br><br><div align="right" style="padding-bottom:10px;">
	      				<a href="/survey/response/static/${survey.sIdx}/${survey.sTitle}" class="btn btn-info">통계</a>
	      				<button type="button" class="btn btn-dark submit">응답</button>
	      			</div>     		
	   		</div>
	    	<div class="col"><!-- 빈공긴 --></div>
	    </div>
	</div>
</body>
<script>
	$(document).on('click','.submit', function(){
		console.log('click');
		let answers = [];
		
		let resSurvey = {
			sIdx:${survey.sIdx},							
			answers: answers
		};
		$('.answer').each(function(index){
			let q_idx = $(this).children().first().next().next().val();
			let q_type = $(this).children().first().next().val();
			let items = [];
			
			let opt = $(this).find('.option');			
				$(opt).each(function(index) {
					let item_content = '';
					let nextOpt = opt.parent().next().next().next().find('.option');					
						if(q_type == 'multipleChoice') {
							let check = $(this).parent('.form-check').find('input[type=radio]').prop('checked');							
							if(check == true) {
								item_content = opt.val();
							} else if (check == false) {
								item_content = null;
								opt = nextOpt;
								
							}
						} else if (q_type == 'long') {
							item_content = opt.val();
						} else if(q_type == 'check') {
							console.log('check');
							let check = $(this).parent('.form-check').find('input[type=checkbox]').prop('checked');
							if(check == true) {
								item_content = opt.val();
								opt = nextOpt;
							} else if(check == false) {
								item_content = null;
								opt = nextOpt;
							}						
						}				
					let item = {
						content: item_content	
					};
					if(item.content != null) {
						items.push(item);						
					}									
				})
		
									
			let answer = {
				qIdx: q_idx,				
				resItems: items
			}
				answers.push(answer);
		
		})
		
		let result = JSON.stringify(resSurvey);
		
		$.ajax({
			method: "POST",
			url: "/survey/response/process",
			data: result,
			contentType : "application/json",
			success: function(data) {
				alert('data dataSaved');
			}
		})
	})
</script>

</html>