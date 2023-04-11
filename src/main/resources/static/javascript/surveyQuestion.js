$(document).on('click','#plusOption',function(){
	console.log('click');
	//추가할 태그
	let childTags = '<div class="row" id="targetOption">';
	childTags += '		<div class="col-8" id="tmp" style="padding:10px;">';
	childTags += '			<input id="option" type="text" placeholder="Option">';
	childTags += '	 	</div>';
	childTags += '	 	<div class="col-4" style="padding:10px;">';
	childTags += '	 		<button type="button" class="btn-close" aria-label="Close" style="float:left;"></button>';
	childTags += '	 	</div>';
	childTags += '	 </div>';
	console.log(childTags);
	//추가할 위치
	let targetTag = $('#optionDiv');
	console.log(targetTag);
	//선택한태그 추가
	targetTag.append(childTags);
	
	
			
	
});

$(document).on('click','#closeOption',function(){
	$(this).parent().parent().remove();
	
	
})
/*
$(document).on('click', '#btn_survey', function () {
	let questions = [];
}

	$.each('.q', function () {
		let q_title = $(this).find('.q_title').val();
		let q_type = $(this).find('q_type:selected').val();
		let items = [];
	$.each('.item', function () {
		let item_content = $(this...
		let item = {
		content: item_content
		};
		items.push(item);
});
let question = {
	title: q_title,
	type: q_type,
	items: items
}
questions.push(question);
});
let survey = {
title:
desc:
questions: questions
};
$.ajx(
data: survey
)
});
*/