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