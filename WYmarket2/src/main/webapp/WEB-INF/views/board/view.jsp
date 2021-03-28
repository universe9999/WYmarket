<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"   %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
 <script type="text/javascript"  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
 $(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="./delete";
				document.form1.submit();
			}
		});
		
		$("#btnUpdate").click(function(){
			var title = $("#ntitle").val();
			var content = $("#ncontent").val();
			var writer = $("#adminNick").val();
			if(title==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(content==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if(writer==""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			document.form1.action="./update";
			document.form1.submit();
			
		});
	});
 </script> 
  <style>
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

#btnUpdate {
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
.cc{
border: #c8c9cc solid 1px;
border-radius: 4px;
}

  </style>
</head>
<body>
	<div class="container" id='outer'>
		<h2 style="color: orange;">공지사항 수정/삭제</h2>

		<form method="post" name="form1" >
			<div class="container" id='formContainer'>
			<p>작성일자 : <fmt:formatDate value="${vo.ndate}" pattern="yyyy-MM-dd a HH:mm:ss"/></p>
			<p>조회수 : ${vo.nviewcnt}</p>
				<p>제목</p>
				<input class="cc" name="ntitle" id="ntitle" size="80" value="${vo.ntitle}" placeholder="제목을 입력해주세요" />
				<p>내용</p>
				<textarea class="cc" name="ncontent" id="ncontent" rows="20" cols="80" placeholder="내용을 입력해주세요" >${vo.ncontent}</textarea>
				<input name="adminNick" id="adminNick" placeholder="이름을 입력해주세요"
					value="관리자" />
						<input name="adminNick" id="adminNick" value=" " placeholder="이름을 입력해주세요" />
				<div class="container" id='btnContainer'>
					<input type="hidden" name="noticeID" value="${vo.noticeID }" />
			<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
			<button class="btn btn-secondary" type="button" id="btnDelete">삭제</button>
				</div>
			</div>

		</form>
	</div>

	 

</body>
</html>