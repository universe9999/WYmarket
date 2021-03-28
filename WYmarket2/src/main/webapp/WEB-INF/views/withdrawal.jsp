<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="icon" href="../image/wyfavicon.ico">
<link rel="shortcut icon" href="../image/wyfavicon.ico">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	$(function() {
		$("#btnSubmit").click(function() {
			var content = $("#ncontent").val();

			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}

			document.form1.submit();

		});
	})
</script>
<style>
#outer {
	width: 1000px;
	margin-top: 100px;
}

.wid {
	justify-content: center;
}

.content {
	height: 500px;
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 5%;
	box-shadow: 1px 1px 10px rgb(180, 178, 178);
	border-radius: 1.0rem;
	padding: 10px 0;
	background-color: rgb(251, 250, 250);
}

.top {
	margin-top: 5%;
	margin-bottom: 20px;
	font-size: 50px;
	color: orange;
	margin-left: 15%;
}

.le {
	margin-left: 5%;
}
</style>
</head>
<body>
	<div class="container-md wid  " id='outer'>
		<div class="top wid">계정 삭제하기</div>
		<div class="content ">
			<br>
			<div class="le">
				<div>
					<b>... ${user.userNick}님과 이별인가요? 너무 아쉬워요.</b>
				</div>
				<br>
				<div>
					계정을 삭제하면 매너온도, 게시글, 관심, 채팅 등 모든 <br>활동 정보가 삭제됩니다. 계정 삭제 후 7일간
					다시 가입할 수 없습니다.
				</div>
				<br>
				<div>
					<b>${user.userNick}님이 계정을 삭제하려는 이유가 궁금해요</b>
				</div>
				<form method=post name="form1" action="./userDelete">
					<div id='formContainer'>

						<input style="width: 600px;" name="ncontent" type="text"
							id="ncontent" class="form-control"
							placeholder="계정을 삭제하려는 이유를 알려주세요" aria-label="Username"
							aria-describedby="basic-addon1" />


						<div>
							말씀해주신 소중한 의견을 반영하여 더 따뜻한 서비스를 만들어 가도록 노력할게요<br> 언제나 이 자리에서
							기다리고 있을게요. 언제든지 돌아와 주세요. <br>지금까지 함께여서 진심으로 행복했어요.
						</div>
						<br> <b>정말 계정을 삭제하시겠어요?</b>
					</div>
				 
						<br>
					  &nbsp;
						<button style=" background-color: gray; border: none;"
							class="btn btn-primary" type="button" id="btnSubmit">네,
							삭제할게요</button> 
					 
					<button onclick="location.href='/wymarket/main'"
							style="float: left; background-color: orange; border: none;"
							class="btn btn-primary" type="button">더 사용해볼래요</button>   
				</form>


			</div>


		</div>

	</div>

</body>
</html>