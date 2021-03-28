<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 사유</title>
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
<style>
#outer {
	width: 1000px;
	margin-top: 100px;
}

tr {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" id='outer'>
		<h2 style="color: orange;">회원 탈퇴 내역</h2>
		<br>
		<div style="width: 100%; height: 650px; overflow: auto">


			<table class="table table-light table-hover table-striped">
				<thead>
					<tr>

						<th scope="col">닉네임</th>
						<th scope="col">회원 탈퇴 사유</th>
						<th scope="col">재가입 가능 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${listW}">
						<tr>
							<td>${vo.userNick}</td>
							<td>${vo.ncontent}</td>
							<td><fmt:formatDate value="${vo.banDate}"
									pattern="yyyy-MM-dd" /></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</body>
</html>