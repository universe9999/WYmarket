<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error!!</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	 
}

.ss {
	background-color: #FF8A3D;
	border: none;
	width: 300px;
	height: 50px;
	margin-top:50px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-weight: bold;
	
	
}
.dd{
	z-index: 1;
	position: relative;
	margin-top: -25px;
}
.ss:hover{
background-color: gray;
}
img {
	margin-left: auto;
	margin-right: auto;
	z-index: 0;
	position: relative;
}
</style>
</head>
<body>
	<div class="container">
		<img src="<%=application.getContextPath()%>/image/404error.png"
			alt="" width="1000" height="550">

		<div class="dd"
			style="text-align: center; font-size: 50px; font-weight: 15px; color: #FF8A3D;">
			앗! 죄송해요<br>해당 페이지로 접근이 불가능해요.
		</div>
		
		<button class="btn btn-primary ss" type="button"
			onclick="location.href='/wymarket/login'">메인으로</button>
	</div>


</body>
</html>





