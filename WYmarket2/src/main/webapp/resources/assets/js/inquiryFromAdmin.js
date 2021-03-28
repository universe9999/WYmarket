function ajaxShowHistory(id) {
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