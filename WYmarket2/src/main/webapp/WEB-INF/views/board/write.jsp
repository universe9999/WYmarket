<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$("#btnSave").click(function() {
			var title = $("#ntitle").val();
			var content = $("#ncontent").val();
			var writer = $("#adminNick").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			/* 			if (writer == "") {
			 alert("이름을 입력하세요");
			 document.form1.writer.focus();
			 return;
			 } */
			//데이터 전송	 
			document.form1.submit();

		});
	})
</script>
<style type="text/css">
#adminNick {
	display: none;
}

* {
	box-sizing: border-box;
}

#outer {
	width: 600px;
	margin-top: 30px;
}

h2 {
	text-align: center;
}

#btnContainer {
	margin-left: auto;
	margin-right: auto;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#btnSave {
	margin-right: 15px;
	background-color: #FF8A3D;
	border: none;
}

#formContainer {
	display: flex;
	flex-direction: column;
}

#formContainer>* {
	margin-top: 20px;
}

#ncontent {
	height: 300px;
}

p {
	margin-bottom: -10px;
}
</style>
</head>
<body>
	<div class="container" id='outer'>
		<h2 style="color: orange;">공지사항 작성</h2>

		<form method="post" name="form1" action="./insert">
			<div class="container" id='formContainer'>
				<p>제목</p>
				<input name="ntitle" type="text" id="ntitle" class="form-control"
					placeholder="제목을 입력해주세요" aria-label="Username"
					aria-describedby="basic-addon1" />
				<p>내용</p>
				<textarea name="ncontent" id="ncontent" placeholder="내용을 입력해주세요"
					class="form-control" aria-label="With textarea"></textarea>

				<input name="adminNick" id="adminNick" placeholder="이름을 입력해주세요"
					value="관리자" />
				<div class="container" id='btnContainer'>
					<button class="btn btn-primary" type="button" id="btnSave">확인</button>
					<button type="reset" class="btn btn-secondary">초기화</button>
				</div>
			</div>

		</form>
	</div>










</body>
</html>