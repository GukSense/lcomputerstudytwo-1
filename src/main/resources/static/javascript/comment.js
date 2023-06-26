//댓글등록
$(document).on('click','#submit',function(){	
	let cBidx = $('input[name=cBidx]').val()	
	let cContent = $('textarea[name=cContent]').val();
		
		
		$.ajax({
			type: "POST",
			url:  "/comment/writeComment",
			data: {
				cBidx: cBidx,
				cContent: cContent												
			},
			success: function(response) {
				console.log(response);
			}
		})
		.done(function(data){
			console.log(data);
			alert("Data Saved");
			$('#commentList').html(data);
		});
	});



//삭제

$(document).on('click','.btnDelete',function() {
	let	cIdx = $(this).attr('cDelteCidx');
    let	cBidx = $(this).attr('cDeleteBidx');

    $.ajax({
        type: "POST",
        url: "/delete-comment",
        data: 	{	cIdx: cIdx, 
        			cBidx: cBidx
        }
    })
    .done(function(data){
		alert("Data Delete");
		$('#commentList').html(data);
	});
});


//수정 폼 오픈
$(document).on('click', '.btnUpdateForm', function () {	
	console.log('클릭');
	let contents = $(this).parent().parent().find('.cont').text();
	if (contents!=null) {
		console.log('값이존재');
		console.log('값'+ contents);
	};
	$(this).parent().parent().next().css('display', '');
	$(this).parent().parent().next().find('.editBox').val(contents);
});	

//수정 폼 닫기
$(document).on('click','.btnCancel', function(){
	console.log('click');
	$(this).parent().parent().css('display','none');		
})
//수정 정보 보내기
$(document).on('click','.btnUpdate', function(){
	console.log('click');
	let	cIdx = $(this).attr('cno');
    let	cBidx = $(this).attr('bno');
    let cContent = $(this).parent().find('.editBox').val();
	$.ajax({
		type: "POST",
		url: "/edit-comment",
		data: {
			cIdx: cIdx,
			cBidx: cBidx,
			cContent: cContent
			}			
		})
	.done(function(data){
		alert("Data Edited");
		$('#commentList').html(data);
	});
});
//답글 폼 오픈
$(document).on('click','.btnReplyForm',function(){
	console.log('click');
	$(this).parent().parent().next().next().css('display','');
})
//답글 폼 닫기
$(document).on('click','.btnCancelR',function(){
	console.log('click');
	$(this).parent().parent().css('display','none')
})
$(document).on('click','.btnReply',function(){
	let bidx = $(this).attr('bidx');
	let contents = $(this).prev().val();
	let order = $(this).attr('order');
	let depth  = $(this).attr('depth');
	let group = $(this).attr('group');
	
	$.ajax({
		type: "POST",
		url: "/reply-comment",
		data: {
			cBidx: bidx,
			cContent: contents,
			cOrder: order,
			cDepth: depth,
			cGroup: group
			}			
		})
	.done(function(data){
		alert("Data Replyed");
		$('#commentList').html(data);
	});
})