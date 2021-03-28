
function getLocation() {
	navigator.geolocation.getCurrentPosition(function(position) {
		lat = position.coords.latitude;
		lon = position.coords.longitude;

		ajaxGetAddress(lat, lon);
	}, function(error) {
		console.error(error);
	}, {
		enableHighAccuracy: true,
		maximumAge: 0,
		timeout: Infinity
	});
}
getLocation();

function ajaxGetAddress(lat, lon) {
	const prefix = "wymarket/address";

	let uri = prefix + "/" + lat + "/" + lon;
	//alert(uri);

	// Ajax : Asynchronous JavaScript and XML (or JSON)

	// - 웹 서버와 비동기적으로 상호작용할 수 있다.
	// - 페이지를 변화시키지 않으면서 웹 서버로 요청을 보낸다. 새로고침을 안 하고!!
	// - 보낸 요청에 대한 응답이 도착하면 readyState값이 변한다
	// - 받은 응답을 통해 하고싶은 것을 한다.


	xhttp = new XMLHttpRequest();
	// readtState은 현재 정보를 담은 XMLHttpRequest의 상태 (opened, loaded, done 등)
	// readyState가 변할 때마다 발생하는 이벤트를 처리하는 메서드 정의
	xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4
			document.getElementById("gpsContent").innerHTML = `${this.responseText}`;
		}
	}

	xhttp.open('GET', uri, true); // 비동기 통신이면 true //1

	//xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(); //2

	// 3 rest 에서 요청한게 100MB라 치면 3인 상태(다운로드 중인) (로딩상태)

}



function ajaxGetSMS(phoneNumber) {
	const prefix = "/wymarket/getsms";

	let uri = prefix + "/" + phoneNumber;


	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4
			document.getElementById("getsmscode").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true); // 비동기 통신이면 true //1

	xhttp.send(); //2


}

function ajaxGetph(phoneNumber) {
	const prefix = "/wymarket/getph";

	let uri = prefix + "/" + phoneNumber;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4
			document.getElementById("getph").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true); // 비동기 통신이면 true //1

	xhttp.send(); //2

}


function ajaxToNick() {
	const prefix = "/wymarket/toNick";

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4
			document.getElementById("getConfirm").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true);

	xhttp.send(); //2

}

function ajaxNickCheck() {
	var data = {
		userNick: document.querySelector('[name="nick_name"]').value
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



function ajaxNickUpdate() {
	var data = {
		userNick: document.querySelector('[name="nick_name"]').value,
		phoneNumber: document.getElementById('getph').value
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {

			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/updateNick', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}



function ajaxToMain() {
	var data = {
		phoneNumber: document.getElementById('phonenumber').value
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("ajaxToMain").value = `${this.responseText}`;
				console.log('js에서의 값' + document.getElementById("ajaxToMain").value);
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/ajaxToMain', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}

function ajaxExceedTime() {
	const prefix = "/wymarket/exceedTime";

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("time2").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true);

	xhttp.send();
}

function ajaxDateWithdrawal(ph) {
	const prefix = "/wymarket/dateWithdrawal";

	let uri = prefix + "/" + ph;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("withdrawNone").value = `${this.responseText}`;
		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send();
}

function ajaxViewWithdrawalDate(ph) {
	const prefix = "/wymarket/dateWithdrawalModal";

	let uri = prefix + "/" + ph;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("withPh").innerHTML = `이미 탈퇴된 전화번호입니다.<br>${this.responseText}일 뒤에 다시 진행해주세요`;
		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send();
}

function kakaoModal() {
	const prefix = "/wymarket/dateWithdrawalModalKakao";

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("withMail").innerHTML = `이미 탈퇴된 이메일입니다.<br>${this.responseText}일 뒤에 다시 진행해주세요`;
		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send();
}
