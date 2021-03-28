var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop2'));
myModal.show()

function ajaxNickCheck(){
	var data = {
		userNick: document.querySelector('[name="userNick"]').value
	}		
	
	var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("userNickCheck").value = `${this.responseText}`;
			} else {

			}
		} 
	}
	
	xhttp.open('POST', '/wymarket/selectNick', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}

function ajaxNickUpdate(){
		var data = {
		userNick: document.querySelector('[name="userNick"]').value,
	}		
	
	var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {

			} else {

			}
		} 
	}
	
	xhttp.open('POST', '/wymarket/auth/kakao/kakaonick', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}




