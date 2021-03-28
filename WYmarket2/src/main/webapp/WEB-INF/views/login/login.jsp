<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>login</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<%-- <link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/login.css"> --%>
<style type="text/css">
* {
	box-sizing: border-box;
}

#loginContainer1 {
	display: flex;
	justify-content: center;
}

#loginContainer2 {
	display: flex;
	flex-direction: column;
	width: 360px;
	background-color: white;
	height: 500px;
	margin-top: 100px;
	border-radius: 10%
}

#gpsBody {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#title {
	text-align: center;
	margin-top: 20px;
}

#img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	object-fit: cover;
	width: 50%;
}

#gpsContent {
	text-align: center;
	line-height: 40px;
	font-weight: bold;
	font-size: 20px;
}

#modalkakao {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	margin-top: 25px;
}

#phonenumber, #checkphone, #sms, #checksms {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 25px;
	height: 50px;
}

#checksms {
	margin-top: 0px;
}

#time {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 10px;
}

#checkphone, #checksms {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}

#nick2Char, #nickOverrap {
	display: none;
	margin-top: 10px;
	margin-bottom: -5px;
}

input:-internal-autofill-selected {
	appearance: menulist-button;
	background-color: rgb(255, 138, 61) !important;
	background-image: none !important;
	color: -internal-light-dark(black, white) !important;
}

#loginbtn {
	color: #fff;
	background-color: #FF8A3D;
	border-color: #FF8A3D;
}

#loginbtn:hover {
	color: #fff;
	background-color: #FF8A3D;
	border-color: #FF8A3D;
}

body {
	background-image: url("/wymarket/image/carrotbg.jpg");
}

#time2 {
	margin-top: 10px;
	margin-bottom: -10px;
}
</style>
</head>
<body>

	<script>
function onlyNumber(){
	   if((event.keyCode<48)||(event.keyCode>57))
	      event.returnValue=false;
	}
</script>
	<div class="container" id='loginContainer1'>
		<div class="container" id='loginContainer2'>


			<h3 id="title">로그인</h3>


			<input type="text" class="form-control" aria-label="PhoneNumber"
				aria-describedby="basic-addon1" placeholder="휴대폰 번호를 입력해주세요"
				maxlength="11" onkeypress="onlyNumber();"
				style="ime-mode: disabled;" id="phonenumber"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
				autocomplete="off">

			<button class="btn btn-primary" type="submit" id="checkphone">인증문자
				받기</button>

			<input type="text" class="form-control" aria-label="smsCode"
				aria-describedby="basic-addon1" placeholder="인증 번호를 입력해주세요"
				maxlength="4" onkeypress="onlyNumber();" style="ime-mode: disabled;"
				id="sms" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
				autocomplete="off">

			<p id="time"></p>

			<button class="btn btn-primary" type="submit" id="checksms">동의하고
				시작하기</button>
			<input type="text" id="getsmscode" style="display: none" /> <input
				type="text" id="getph" style="display: none" /> <a
				href="https://kauth.kakao.com/oauth/authorize
?client_id=f5c99e47d61ce4b7e521d120e1f04199
&redirect_uri=http://localhost:8080/wymarket/auth/kakao/login
&response_type=code"><img
				id='modalkakao' src="/wymarket/image/kakao_login_medium_narrow.png"
				alt="abc" /></a> <input type="text" id="getConfirm"
				style="display: none" /> <input type="text" id="userNickCheck"
				style="display: none" /> <input type="text" id="smsReqCnt"
				style="display: none" /> <input type="text" id="ajaxToMain"
				style="display: none" /><input type="text" id="withdrawNone"
				style="display: none" />
		</div>
	</div>


	<!-- Modal -->

	<div class="modal fade" id="staticBackdrop1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content ">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">환영합니다!</h5>
				</div>
				<div class="modal-body" id="gpsBody">
					<img id="img" src="/wymarket/image/carrotcharacter.png" alt="" />
					<div class="modal-body" id="gpsContent"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">닉네임 설정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group flex-nowrap">
						<span class="input-group-text" id="addon-wrapping">닉네임</span> <input
							type="text" class="form-control" placeholder="닉네임을 입력하세요"
							aria-label="Username" aria-describedby="addon-wrapping"
							id="nickname" name="nick_name" autocomplete="off">
					</div>
					<p id="nick2Char">닉네임은 두 글자 이상이어야 합니다.</p>
					<p id="nickOverrap">이미 사용중인 닉네임입니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id='loginbtn'
						onclick="toMain()">로그인하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="phoneClick" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 발송</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">SMS 인증번호가 발송되었습니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="smsRetry" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 요청 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">이미 발송되었습니다. 시간이 끝난 후 확인해주세요.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="smsFail" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">SMS 인증 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">SMS 인증번호가 일치하지 않습니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="notPh" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">전화번호 형식 불일치</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">전화번호 형식이 아닙니다.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="timeExceed" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">인증 시간 초과</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">인증 시간이 초과되었습니다. 다시 인증 요청하세요.</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="cntExceed" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">인증 횟수 초과</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					인증 횟수 3회 초과로 인하여 더 이상 인증하실 수 없습니다.<br>
					<p id='time2'></p>
				</div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="withdrawnID" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">탈퇴된 계정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" id='withPh'></div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="withdrawnKakao" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">탈퇴된 계정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" id='withMail'></div>


				<div class="modal-footer" id="modalfooter">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/assets/js/login.js"></script>

	<script>
	window.onpageshow = function(event) {
		if (event.persisted || window.performance.navigation.type == 2) {
			window.location.href = '/wymarket/login';
		}
	}

		 if ("${kakaoWithdrawal}" == 1) {
			kakaoModal();
			var myModal = new bootstrap.Modal(document.getElementById('withdrawnKakao'));
			myModal.show()
			
		} else {
			var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop1'));
			myModal.show()
		} 
		
	const confirm = document.getElementById('getConfirm');

	const phonetext = document.getElementById('phonenumber');
	const phonebtn = document.getElementById('checkphone');

	const smstext = document.getElementById('sms');
	const smsbtn = document.getElementById('checksms');
	const withdrawNone = document.getElementById('withdrawNone');

	phonebtn.addEventListener('click', () => {
		if (phonetext.value.length == 11) {
			if (timeLimit == 90 || timeLimit == 0) {
				ajaxDateWithdrawal(phonetext.value);
				setTimeout(function() {
				ajaxGetph(phonetext.value);
				ajaxGetSMS(phonetext.value);
				}, 1000);
				setTimeout(function() {
					if(withdrawNone.value == 'N'){
						ajaxViewWithdrawalDate(phonetext.value);
						var myModal = new bootstrap.Modal(document.getElementById('withdrawnID'));
						myModal.show()
					} else{
					setTimeout(function() {
						if (document.getElementById("getsmscode").value == 4) {
							ajaxExceedTime();
							var myModal = new bootstrap.Modal(document.getElementById('cntExceed'));
							myModal.show()
							setTimeout(function() {
								startTime2();
							}, 1000);
						} else {
							timeLimit = 90;
							startTime();
							ajaxToNick();
							setTimeout(function() {
								var myModal = new bootstrap.Modal(document.getElementById('phoneClick'));
								myModal.show()
							}, 1000);
						}
					}, 1000);
					}
				}, 1000);

			} else {
				var myModal = new bootstrap.Modal(document.getElementById('smsRetry'));
				myModal.show()
			}
		} else {
			var myModal = new bootstrap.Modal(document.getElementById('notPh'));
			myModal.show()
		}

	});

	smsbtn.addEventListener('click', () => {
		if (timeLimit == 0) {
			var myModal = new bootstrap.Modal(document.getElementById('timeExceed'));
			myModal.show()
		} else {
			if (smstext.value == document.getElementById('getsmscode').value
				&& phonetext.value == document.getElementById('getph').value && smstext.value != ""
				&& phonetext.value != "") {
				if (document.getElementById('getConfirm').value == "0") {
					var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop2'));
					myModal.show()
					document.getElementById('nickname').value = '';
					document.getElementById('nickOverrap').style.display = 'none';
					document.getElementById('nick2Char').style.display = 'none';
				} else {
					ajaxToMain();
					setTimeout(function() {
						if (document.getElementById("ajaxToMain").value == '1') {
							var form = document.createElement("form");
							form.setAttribute("method", "get");
							form.setAttribute("action", "./admin");
							document.body.appendChild(form);
							form.submit();
						} else {
							var form = document.createElement("form");
							form.setAttribute("method", "get");
							form.setAttribute("action", "./main");
							document.body.appendChild(form);
							form.submit();
						}

					}, 1000);
				}

			} else {
				var myModal = new bootstrap.Modal(document.getElementById('smsFail'));
				myModal.show()
			}
		}
	});


	function toMain() {
		const nickInput = document.getElementById("nickname");
		if (nickInput.value.length <= 1) {
			document.getElementById('nick2Char').style.display = 'block';
			document.getElementById('nickOverrap').style.display = 'none';
		} else {
			if (document.getElementById("userNickCheck").value == "1") {
				document.getElementById('nick2Char').style.display = 'none';
				document.getElementById('nickOverrap').style.display = 'block';
			} else {
				if (timeLimit != 0) {
					ajaxNickUpdate();
					setTimeout(function() {
						var form = document.createElement("form");
						form.setAttribute("method", "get");
						form.setAttribute("action", "./main");
						document.body.appendChild(form);
						form.submit();
					}, 1000);
				} else {
					var myModal = new bootstrap.Modal(document.getElementById('timeExceed'));
					myModal.show()
				}

			}

		}
	}

	const nickname = document.getElementById('nickname');
	nickname.addEventListener('keyup', () => {
		ajaxNickCheck();
	});


	var timeLimit = 90;
	function startTime() {

		var x = setInterval(function() {

			timeLimit--;

			if (timeLimit < 60) {
				document.getElementById("time").innerHTML = timeLimit;
			} else {
				var min = (timeLimit / 60).toFixed(0);
				var sec = timeLimit % 60;
				if (sec < 10) {
					sec = '0' + sec;
				}
				document.getElementById("time").innerHTML = min + ":" + sec;
			}

			if (timeLimit == 0) {
				clearInterval(x);
			}
		}, 1000);
	};


	var cnt = 0;
	var time = 1000;
	function startTime2() {
		timeLimit2 = document.getElementById('time2').value;
		cnt++;
		if (cnt > 1) {
			time *= 1000;
		}
		var x = setInterval(function() {

			timeLimit2--;
			
			var min = parseInt(timeLimit2 / 60);
			var sec = timeLimit2 % 60;
			
			if (timeLimit2 < 60) {
				document.getElementById("time2").innerHTML = timeLimit2;
			} else {

				if (sec < 10) {
					sec = '0' + sec;
				}
				document.getElementById("time2").innerHTML = min + ":" + sec;
			}


			if (timeLimit2 == 0) {
				clearInterval(x);
			}
		}, time);
	};

	</script>

</body>
</html>