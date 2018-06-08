/**
 * 
 */

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode; // 5자리
																				// 새우편번호
																				// 사용
			document.getElementById('sample6_address').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample6_address2').focus();
		}
	}).open();
}

$(function() {
	$("#check_id").click(function() {

		if ($("#ididid").val()) {
			var id = {
				id : $("#ididid").val()
			};
			$.ajax({
				type : "POST",
				url : "ck.ajax",
				dataType : "json",
				data : id,
				success : function(data) {
					if (data == 1) {
						alert("해당 아이디가 존재합니다 제발 다른 아이디를 선택해 주세용");
						$("#ididid").val("");
						$("#ididid").focus();
					} else {
						alert("사용할 수 있는 아이디 입니당ㅎㅎ");
					}
				}

			});
		} else {
			alert("아이디를 제발 입력 해 주세요");
			$("#ididid").focus();
		}
	});
	
	$("#password2").blur(function(){
		if($("#password2").val()){
			var pass1 = $("#password").val();
			var pass2 = $("#password2").val();
			if(pass1==pass2){
				$("#hohoho").addClass("form-group").addClass("row");
				$("#hohoho2").addClass("col-md-3");
				$("#hohoho3").addClass("col-md-9").html("비밀번호가 일치합니당!!");
			}
			else{
				$("#hohoho").addClass("form-group").addClass("row");
				$("#hohoho2").addClass("col-md-3");
				$("#hohoho3").addClass("col-md-9").html("비밀번호가 일치 하지 않는당 다시 쓰3");
				
			}
		}
	});
});

