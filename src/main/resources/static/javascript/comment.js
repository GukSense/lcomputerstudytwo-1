//댓글등록
$(document).ready(function(){
	$('#submit-button').click(function(){
		var formData = {
			cBidx: $('input[name=cBidx]').val(),	
			cContent: $('textarea[name=cContent]').val()
		};
		
		$.ajax({
			type: "POST",
			url:  "/comment/writeComment",
			data: formData,
			success: function(response) {
				console.log(response);
			}
		})
		.done(function(data){
			alert("Data Saved");
		});
	});
});


//삭제

$(document).ready(function() {
    $('.btnDelete').click(function() {
        
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
		});
    });
});

//수정 폼 오픈
$(document).ready(function(){
	console.log('클릭');
	$('.btnUpdateForm').click(function(){
		$(this).parent().parent().next().css('display','');
	})	
})
//수정 폼 닫기
$(document).ready(function(){
	console.log('click');
	$('.btnCancel').click(function(){
		$(this).parent().parent().css('display','none');
	})
	
})
//수정 정보 보내기
$(document).ready(function(){
	$('.btnUpdate').click(function(){
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
		alert("Data Edited" + data);
	});
	});
});