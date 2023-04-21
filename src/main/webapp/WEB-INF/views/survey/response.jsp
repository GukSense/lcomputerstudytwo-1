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
	    	<div class="col-7" style="border: 1px solid #bcbcbc; margin-top: 100px; margin-bottom: 50px;">
	      		
	      		<h2>${survey.sTitle}</h2>
	      		<br>${survey.sDescription }
	      		<br>
	      			<c:forEach items="${survey.questions}" var="q">
			      		<div class="question row justify-content-start" align="left" style="margin-left: 15px;margin-top: 10px;">
				      		<br><strong> ${q. qTitle}</strong>
				      			<c:forEach items="${q.items }" var="i">
				      				
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
												<input class="form-control option" type="text" value="${i.content }">
											</div>
				      					</c:if>
				      				
				      			</c:forEach>
			      		</div>
	      			</c:forEach>
	      			<br><br><div align="right" style="padding-bottom:10px;"><button type="button" class="btn btn-dark">응답</button></div>     		
	   		</div>
	    	<div class="col"><!-- 빈공긴 --></div>
	    </div>
	</div>
</body>
<script>
	$(document).on('click','.submit', function(){
		let questions = [];
		let survey = {
			sIdx:${survey.sIdx},	
			sTitle:${survey.sTitle},
			questions: questions
		};
		$('.question').each(function(index){
			let q_title = '';
			let q_type = '';
			let items = [];
		
			$('items').each(function(index){
				let item_content = '';
				let item = {
					content: item_content	
				};
				items.push(item);
			})
		
			let question = {
				qTitle: q_title,
				qType: q_type,
				items: items
			}
		questions.push(question);
		
		})
	})
</script>

</html>