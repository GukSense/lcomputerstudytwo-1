let multipleChoice = '';
let long = '';
let check = '';
/*질문타입설정*/
$(document).on('change','.q_type',function(){
	$(this).parent().parent().parent().find('.optionDiv').html('');	//
	
	if($(this).val()== 'multipleChoice') {
		let inputName = $(this).parent().parent().parent().find("input[name='flexRadioDefault']");
		multipleChoice = '	<div class="row targetOption">';
		multipleChoice += 	'	<div class="col-8 tmp" style="padding:10px;">';
		multipleChoice += 	'		<div class="form-check">';
		multipleChoice +=	'			<input class="form-check-input" type="radio" name="flexRadioDefault">';
		multipleChoice +=	'			<input class="option" type="text" placeholder="Option">';
		multipleChoice +=	'		</div>';
		multipleChoice +=	'	</div>';
		multipleChoice +=	'	<div class="col-4" style="padding:10px;">';
		multipleChoice +=	'		<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
		multipleChoice +=	'	</div>';
		multipleChoice +=	'</div>';	
		
		if($(this).parent().parent().parent().find('.plusEtc').hasClass('visually-hidden')){
			$(this).parent().parent().parent().find('.plusEtc').attr('class','btn btn-link plusEtc');
		};	//
		if($(this).parent().parent().parent().find('.plusOption').hasClass('visually-hidden')){
			$(this).parent().parent().parent().find('.plusOption').attr('class','btn btn-light plusOption');
		};	//
		
		
		$(this).parent().parent().parent().find('.optionDiv').append(multipleChoice);	//

		$(inputName).each(function(){
			let currentName = inputName.attr('name');
			let newName = currentName + 1;
			inputName.attr('name', newName);
		})
	} else if($(this).val()== 'long'){
		long = '	<div class="row targetOption">';
		long += 	'	<div class="col-8 tmp" style="padding:10px;">';
		long += 	'		<div class="form-floating">';
		long +=	'				<textarea class="form-control option" placeholder="주관식" style="height: 100px"></textarea>';
		long +=	'				<label for="floatingTextarea2">Comments</label>';
		long +=	'			</div>';
		long +=	'		</div>';
		long +=	'		<div class="col-4" style="padding:10px;">';
		long +=	'			<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
		long +=	'		</div>';
		long +=	'	</div>';
		
		$(this).parent().parent().parent().find('.optionDiv').append(long);	//
		$(this).parent().parent().parent().find('.plusEtc').addClass('visually-hidden');	//
		$(this).parent().parent().parent().find('.plusOption').addClass('visually-hidden');	//
			
	} else if ($(this).val()== 'check') {
		check = '	<div class="row targetOption">';
		check += 	'	<div class="col-8 tmp" style="padding:10px;">';
		check += 	'		<div class="form-check">';
		check +=	'			<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">';
		check +=	'			<input class="option" type="text" placeholder="Option">';
		check +=	'		</div>';
		check +=	'	</div>';
		check +=	'	<div class="col-4" style="padding:10px;">';
		check +=	'		<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
		check +=	'	</div>';
		check +=	'</div>';
		
		if($(this).parent().parent().parent().find('.plusEtc').hasClass('visually-hidden')){
			$(this).parent().parent().parent().find('.plusEtc').attr('class','btn btn-linkbtn btn-link plusEtc');
		};	//
		if($(this).parent().parent().parent().find('.plusOption').hasClass('visually-hidden')){
			$(this).parent().parent().parent().find('.plusOption').attr('class','btn btn-light plusOption');
		};	//
		
		$(this).parent().parent().parent().find('.optionDiv').append(check);			
	} 
	
})
/*옵션추가*/
$(document).on('click','.plusOption',function(){
	console.log('check');	
	let targetTag = $(this).parent().parent().find('.optionDiv');			
	if($(this).parent().parent().find('.q_type').val() == 'multipleChoice') {
		targetTag.append(multipleChoice);		
	} else if ($(this).parent().parent().find('.q_type').val() == 'check') {
		console.log('get the checkbox');
		targetTag.append(check);
	} else {
		//추가할 태그
		let nomal = '<div class="row targetOption">';
		nomal += '		<div class="col-8 tmp" style="padding:10px;">';
		nomal += '			<input class="option" type="text" placeholder="Option">';
		nomal += '	 	</div>';
		nomal += '	 	<div class="col-4" style="padding:10px;">';
		nomal += '	 		<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
		nomal += '	 	</div>';
		nomal += '	 </div>';
		console.log(nomal);
		//선택한태그 추가
		targetTag.append(nomal);				
	}
});
/*기타옵션추가*/
$(document).on('click','.plusEtc',function(){
	console.log('check');	
	let targetTag = $(this).parent().parent().find('.optionDiv');//추가할 위치
	//추가할태그
	if($(this).parent().parent().find('.q_type').val() == 'multipleChoice') {
		multipleChoice = multipleChoice.replace('<input class="option" type="text" placeholder="Option">','<input class="option" type="text" placeholder="etc" value="etc..">' );
		targetTag.append(multipleChoice);
	} else if ($(this).parent().parent().find('.q_type').val() == 'check') {
		console.log('get the checkbox');
		check = check.replace('<input class="option" type="text" placeholder="Option">','<input class="option" type="text" placeholder="etc" value="etc..">' );
		targetTag.append(check);
	} else {		
		let nomal = '<div class="row targetOption">';
		nomal += '		<div class="col-8 tmp" style="padding:10px;">';
		nomal += '			<input class="option" type="text" placeholder="Option">';
		nomal += '	 	</div>';
		nomal += '	 	<div class="col-4" style="padding:10px;">';
		nomal += '	 		<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
		nomal += '	 	</div>';
		nomal += '	 </div>';
		
		nomal = nomal.replace('<input class="option" type="text" placeholder="Option">','<input class="option" type="text" placeholder="etc" value="etc..">' );		
		targetTag.append(nomal);
		$(this).parent().parent().find("input[value='기타']").prop('value', '기타아님');				
	}			
});
/*옵션닫기*/
$(document).on('click','.closeOption',function(){
	$(this).parent().parent().remove();			
})
/*질문폼추가*/
$(document).on('click','#plusQuestion',function(){
	let targetTag = $('.question');
	
	let plusQuestion = '<div class="row question">';
	plusQuestion += '		<div class="col"></div>';
	plusQuestion += '		<div class="col-6" style="border: 1px solid #bcbcbc;">';
	plusQuestion += '			<div class="row">';
	plusQuestion += '				<div class="col-md-8">';
	plusQuestion += '					<input class="q_title" type="text" placeholder="질문타이틀" style="border-bottom: 1px solid #bcbcbc;border-left:0;border-right:0;border-top:0;width:100%;height:56px;">';
	plusQuestion += '				</div>';
	plusQuestion += '				<div class="col-6 col-md-4">';
	plusQuestion += '					<select class="form-select q_type" aria-label="Default select example" style="background-color:#ffffff; color:gray;border:none;width:100%;height:56px;">';
	plusQuestion += '						<option selected>설문방식</option><option value="multipleChoice">객관식</option><option value="long">주관식</option><option value="check">체크박스</option>';
	plusQuestion += '					</select>';
	plusQuestion += '				</div>';
	plusQuestion += '			</div>';
	plusQuestion += '			<div class="row optionDiv" style="padding:15px;">';
	plusQuestion += '				<div class="row targetOption">';
	plusQuestion += '					<div class="col-8 tmp" style="padding:10px;">';
	plusQuestion += '						<input class="option" type="text" placeholder="Option">';
	plusQuestion += '					</div>';
	plusQuestion += '					<div class="col-4" style="padding:10px;">';
	plusQuestion += '						<button type="button" class="btn-close closeOption" aria-label="Close" style="float:left;"></button>';
	plusQuestion += '					</div>';
	plusQuestion += '				</div>';
	plusQuestion += '			</div>';
	plusQuestion += '			<div class="d-flex justify-content-start" style="padding-left:15px;">';
	plusQuestion += '				<button  type="button" class="btn btn-light plusOption">옵션 추가</button><button  type="button" class="btn btn-link plusEtc"> "기타"추가</button><button type="button" class="btn btn-dark deleteQ">Delete</button>';
	plusQuestion += '			</div>';
	plusQuestion += '		</div>';
	plusQuestion += '	<div class="col"></div>';
	plusQuestion += '</div>';
	
	targetTag.parent().append(plusQuestion);
});
/*질문폼닫기*/
$(document).on('click','.deleteQ',function(){
	console.log('click');
	$(this).parent().parent().parent().remove();
});
/*설문지 데이터 보내기*/
$(document).on('click', '#btn_survey', function () {
	let questions = [];
	$('.question').each(function( index ) {	//jQuery를 사용해 배열을 관리하고자 할 때 사용하는 each()
		//질문타이틀
		let q_title = $(this).children().first().next().children().first().children().find('.q_title').val();	
		//질문타입
		let q_type = $(this).children().first().next().children().first().children().first().next().find('.q_type').val();
		let items = [];	//질문 리스트
		
		let opt = $(this).children().first().next().children().first().next().find('.option');
		if(opt.hasClass("option") == true) {
			$(opt).each(function ( index ) {
				let item_content = opt.val();	// 질문콘텐츠
				let item = {
					content: item_content
				};
				items.push(item);
				
				opt = opt.parent().parent().parent().next().find('.option');
				
				if(opt.hasClass("option")== false){
					return false;
				} 
			});
			
		} else {
			items.push(null);
		}
		let question = {
			qTitle: q_title,
			qType: q_type,
			items: items
		}
		questions.push(question);
	});
	let survey = {
		sTitle: $(this).parent().parent().parent().find('.surveyTitle').val(),
		sDescription: $(this).parent().parent().parent().find('.survey_content').val(),		
		questions: questions
	};
	
	let result = JSON.stringify(survey);
	$.ajax({
		method: "POST",
		url: "/survey/adjust/process",
		data: result,
		contentType : "application/json",
		success: function(data) {
			alert('data' + data);
		}
	})	
});
