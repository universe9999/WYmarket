
function ajaxInquiry(inquiryID) {
	var data = {
		inquiryID: inquiryID
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("modalContent").innerHTML = `${this.responseText}`;
				document.getElementById("reply").style.display = 'none';
				document.getElementById('btn1').style.display = 'block';
				document.getElementById('btn2').style.display = 'block';
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/admin/inquiryModal', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));

	var myModal = new bootstrap.Modal(document.getElementById('inquiryModal'));
	myModal.show()

}

function ajaxAdminToUser(adminToUser, inquiryID) {
	var data = {
		inquiryID: inquiryID,
		userNick: adminToUser
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("reply").innerHTML = `${this.responseText}`;
				document.getElementById("reply").style.display = 'block';
				document.getElementById('btn1').style.display = 'none';
				document.getElementById('btn2').style.display = 'none';
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/admin/adminToUser', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}

function ajaxshowHistory(id) {
	console.log("id : " + id);
	var data = {
		inquiryID: id
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("inModal").innerHTML = `${this.responseText}`;
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/checkHistory', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));

	var myModal = new bootstrap.Modal(document.getElementById('inquirySentModal'));
	myModal.show()
}

function ajaxReply(inquiryID) {
	const id = document.getElementById('text');
	console.log(id.value);
	if (id.value == "") {
		alert('내용을 입력해주세요');
	} else {
		const prefix = "/wymarket/admin/sendInquiryAdminToUser/" + id.value + "/" + inquiryID;

		let uri = prefix;

		xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
			if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4
				document.getElementById("ajaxli").innerHTML += `${this.responseText}`;
				document.getElementById("ajaxli").style.display = 'flex';
			}
		}

		xhttp.open('GET', uri, true);

		xhttp.send(); //2

		alert("답장이 성공적으로 보내졌습니다.");
	}
}

