/**
 * 
 */

$(function(){
	$("#completionbt").click(function(){
		var todono = {todono : $("#aa").val(), completion : $("#bb").val()};
		$.ajax({
			type : "POST",
			url : "complete.ajax",
			dataType : "json",
			data : todono,
			success : function(data) {
				if (data == true) {
					$("#completionbt").val("완료됨");
					$("#completionbt").addClass("btn-success");
					$("#bb").val('true');
					
				}
				else {
					$("#completionbt").val("완료하기").removeClass('btn-success');
					$("#bb").val('false');
				}
			}

		});
	});
});
