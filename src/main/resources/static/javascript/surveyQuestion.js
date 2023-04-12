$(document).on('click','#plusOption',function(){
	console.log('check');
	//추가할 태그
	let childTags = '<div class="row" id="targetOption">';
	childTags += '		<div class="col-8" id="tmp" style="padding:10px;">';
	childTags += '			<input class="option" type="text" placeholder="Option">';
	childTags += '	 	</div>';
	childTags += '	 	<div class="col-4" style="padding:10px;">';
	childTags += '	 		<button type="button" class="btn-close" id="closeOption" aria-label="Close" style="float:left;"></button>';
	childTags += '	 	</div>';
	childTags += '	 </div>';
	console.log(childTags);
	//추가할 위치
	let targetTag = $('#optionDiv');
	console.log(targetTag);
	//선택한태그 추가
	targetTag.append(childTags);	
});


$(document).on('click','#plusEtc',function(){
	//추가할태그
	let plusEtc = '<div class="row" id="targetOption">';
	plusEtc += '		<div class="col-8" id="tmp" style="padding:10px;">';
	plusEtc += '			<input class="option" type="text" placeholder="기타" value="기타">';
	plusEtc += '	 	</div>';
	plusEtc += '	 	<div class="col-4" style="padding:10px;">';
	plusEtc += '	 		<button type="button" class="btn-close" id="closeOption" aria-label="Close" style="float:left;"></button>';
	plusEtc += '	 	</div>';
	plusEtc += '   </div>';
	
	//추가할 위치
	let targetTag = $('#optionDiv');
	//선택한태그 추가
	targetTag.append(plusEtc);
});
$(document).on('click','#closeOption',function(){
	$(this).parent().parent().remove();			
})


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
				
				opt = opt.parent().parent().next().find('.option');
				
				if(opt.hasClass("option")== false){
					return false;
				} 
			});
			
		} else {
			items.push(null);
		}
		let question = {
			title: q_title,
			type: q_type,
			items: items
		}
		questions.push(question);
	});
	let survey = {
		title: $(this).parent().parent().find('.surveyTitle').val(),
		contents: $(this).parent().parent().find('.survey_content').val(),		
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
