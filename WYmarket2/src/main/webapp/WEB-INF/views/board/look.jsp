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
	 
		$("#btnBack").click(function(){
			 
			location.href = "/wymarket/board/list";
			
		});
	});
 </script> 
  <style>
  * {
	box-sizing: border-box;
}

#outer {
	width: 600px;
	margin-top: 30px;
}
#formContainer {
	display: flex;
	flex-direction: column;
}

#formContainer>* {
	margin-top: 20px;
}

 

h2 {
	text-align: center;
}
  #btnBack{
  background-color: #FF8A3D;
	border: none;
  }
  </style>
</head>
<body>
<div class="container" id='outer'>
		<h2 style="color: orange;">공지사항 수정/삭제</h2>

	 
			<div class="container" id='formContainer'>
<ul class="list-group list-group-flush">
  <li class="list-group-item">작성일자 : <fmt:formatDate value="${vo.ndate}" pattern="yyyy-MM-dd a HH:mm:ss"/></li>
  <li class="list-group-item">조회수 &nbsp;&nbsp;&nbsp;: ${vo.nviewcnt}</li>
  <li class="list-group-item">제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${vo.ntitle}</li>
  <li class="list-group-item">내용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${vo.ncontent}</li>
  <li class="list-group-item">작성자 &nbsp;&nbsp;&nbsp;: 관리자</li>
</ul>
	 
		 
		 
		 <button style="margin-left:172px; width: 200px;"class="btn btn-primary" type="button" id="btnBack">목록으로 가기</button>
 </div>
 </div>

</body>
</html>