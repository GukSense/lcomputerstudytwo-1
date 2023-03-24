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
		});
	});
});


//삭제

$(document).ready(function() {
    $('.btnDelete').click(function() {
        var formData = {
        	 cIdx : $(this).attr('cDelteCidx').val(),
        	 cBidx : $(this).attr('cDeleteBidx').val()
			
		}

        $.ajax({
            type: "POST",
            url: "/delete-comment",
            data: formData,
            success: function(response) {
                console.log(response);
            }
        });
    });
});