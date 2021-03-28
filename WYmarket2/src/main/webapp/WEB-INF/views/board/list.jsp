<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>


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
<script type="text/javascript">
	$(function() {
		$("#btnWrite").click(function() {
			location.href = "/wymarket/board/write";
		});
	})
		$(function() {
		$("#btnBack").click(function() {
			location.href = "/wymarket/main";
		});
	})
</script>
<style>
#outer {
	width: 1000px;
	margin-top: 100px;
}

tr {
	text-align: center;
}

#btncontainer {
	margin-top: -10px;
}

#btncontainer>*:first-of-type {
	float: left;
	margin-left: -10px;
}

#btncontainer>*:last-of-type {
	float: right;
	margin-right: -10px;
}
</style>
</head>
<body>

	<div class="container" id='outer'>
		<h2 style="color: orange;">공지사항</h2>
		<br>

		<table class="table table-light table-hover table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list}" step="1" end="9">
					<tr>
						<td><a href="./look?noticeID=${vo.noticeID}">${vo.noticeID}</a></td>
						<td><a href="./view?noticeID=${vo.noticeID}">${vo.ntitle}</a></td>
						<td><fmt:formatDate value="${vo.ndate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${vo.nviewcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br>
		<div class="container" id='btncontainer'>
			<button style="background-color: #FF8A3D; border: none;"
				type="button" class="btn btn-secondary" id="btnWrite">글쓰기</button>
			<button style="background-color: rgba(70, 70, 85, 1); border: none;"
				type="button" class="btn btn-secondary" id="btnBack">이전으로</button>
		</div>
	</div>
</body>
</html>



