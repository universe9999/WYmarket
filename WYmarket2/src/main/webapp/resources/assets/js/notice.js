const inquirySelectTag = document.getElementById('inputGroupSelect01');
const textArea = document.getElementById('textArea');

function send() {
	if (inquirySelectTag.value == '문의 카테고리 검색') {
		alert('카테고리를 설정해주세요');
	} else if (textArea.value == ''){
		alert('내용을 입력해주세요');
	} else{
		console.log(textArea.value);
		document.getElementById(inquirySelectTag.getAttribute('form')).submit();
		alert("성공적으로 접수되었습니다.");
	}
}