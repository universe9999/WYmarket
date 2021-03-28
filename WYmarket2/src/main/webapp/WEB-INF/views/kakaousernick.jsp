<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 성공</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
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

.title {
	text-align: center;
	margin-top: 20px;
}

#setNick, #kakaoLogout {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 90%;
	margin-top: 25px;
	height: 50px;
}

#setNick {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}

#kakaoLogout {
	text-decoration: none;
	text-align: center;
	padding-top: 14px;
	background-color: #fef01b;
	color: #3A1D1D;
	border-radius: 5px;
	font-weight: bold;
}

#nick2Char, #nickOverrap {
	display: none;
	margin-top: 10px;
	margin-bottom: -5px;
}

body {
	background-image: url("/wymarket/image/carrotbg.jpg");
}

#img {
	margin-top: 15px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	object-fit: cover;
	width: 50%;
	display: block;
}

#mainbtn, #mainbtn:hover {
	color: #fff;
	background-color: #FF8A3D;
	border-color: #FF8A3D;
}

.btn-primary:active {
	border-color: #FF8A3D;
}
</style>
</head>

<body>

	<div class="container" id="loginContainer1">
		<div class="container" id="loginContainer2">


			<img id='img' src="/wymarket/image/carrotcharacter.png" alt="" />
			<h3 class='title'>닉네임 설정</h3>

			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				id='setNick' data-bs-target="#staticBackdrop2"
				onclick="initialize()">닉네임 설정 및 시작</button>

			<input type="text" id="userNickCheck" style="display: none" />

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop2"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
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
									id="userNick" name="userNick" autocomplete="off">
							</div>
							<p id="nick2Char">닉네임은 두 글자 이상이어야 합니다.</p>
							<p id="nickOverrap">이미 사용중인 닉네임입니다.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id='mainbtn' onclick="toMain()">메인으로</button>
						</div>
					</div>
				</div>
			</div>

			<a id='kakaoLogout'
				href="https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199
&logout_redirect_uri=http://localhost:8080/wymarket/login">카카오톡
				로그아웃</a>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/kakaousernick.js"></script>

	<script>
	
	if(window.performance.navigation.type == 1){
		location.href = '/wymarket/login';
	}
	
	function initialize(){
		document.getElementById('userNick').value = '';
		document.getElementById('nick2Char').style.display = 'none';
		document.getElementById('nickOverrap').style.display = 'none';
	}
	
function toMain() {
	const nickInput = document.getElementById("userNick");
	if (nickInput.value.length <= 1) {
		document.getElementById('nick2Char').style.display = 'block';
		document.getElementById('nickOverrap').style.display = 'none';
	} else {
		console.log("toMain console" + document.getElementById("userNickCheck").value);
		if (document.getElementById("userNickCheck").value == "1") {
			document.getElementById('nick2Char').style.display = 'none';
			document.getElementById('nickOverrap').style.display = 'block';
		} else {
 			ajaxNickUpdate();
 			setTimeout(function(){
 	 			var form = document.createElement("form");
 				form.setAttribute("method", "get");
 				form.setAttribute("action", "/wymarket/main");
 				document.body.appendChild(form);
 				form.submit(); 
	        }, 1000);

		}

	}
}
			
	const nickname = document.getElementById('userNick');
	nickname.addEventListener('keyup', ()=> {
		ajaxNickCheck();
		console.log(nickname.value);
	});
</script>
</body>
</html>