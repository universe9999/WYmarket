<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Lato&family=Shippori+Mincho&display=swap"
	rel="stylesheet">
</head>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0px;
}

#outer {
	margin-top: 30px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	width: 750px;
	border: solid 1px white;
	border-radius: 20px;
	height: 900px;
	margin-bottom: 0px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#inner {
	display: flex;
	flex-direction: column;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	margin-left: auto;
	justify-content: center;
}

ul {
	width: 100%;
	overflow: auto;
	height: 750px;
}

li {
	cursor: pointer;
	background-color: white;
}

li:hover {
	background-color: rgba(255, 191, 82, 1);
}

p {
	font-size: 18px;
	font-family: 'Lato', sans-serif;
}

#p1 {
	text-align: center;
	font-weight: bold;
}

.modal-footer {
	margin-left: auto;
	margin-right: auto;
	width: 90%
}

.modal-title {
	margin-left: auto;
	margin-right: auto;
	width: 80%
}

textarea {
	margin-bottom: 10px;
	height: 200px;
}

#text1 {
	margin-top: 10px;
	margin-bottom: 15px;
}

.btn-primary {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
	width: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 15px;
}

.btn-primary:hover {
	background-color: rgba(70, 70, 85, 1);
}
</style>
<body>
	<div class="container" id='outer'>
		<div class='container' id='inner'>
			<p id='p1'>받은 답장</p>
			<ul class="list-group">
				<c:forEach var="inquiry" items="${replyFromAdmin }">
					<li class="list-group-item"
						onclick="ajaxShowHistory('${inquiry.inquiryID}')">문의 번호 :
						${inquiry.userInquiryID } <br> 닉네임 : ${inquiry.userNick } <br>
						카테고리 : ${inquiry.inquiryCategory } <br> 날짜 : <fmt:formatDate
							value="${inquiry.inquiryDate }" pattern="yy/MM/dd HH:mm" />
					</li>
				</c:forEach>
			</ul>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/wymarket/board/notice/c'">이전으로</button>
		</div>
	</div>


	<div class="modal fade" id="inquirySentModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id='inModal'></div>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/inquiryFromAdmin.js"></script>

</body>
</html>

<%-- 				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id='modalContent'>
					<div class="container" id='inquiryContainer'>
						<div class="container" id='inquiryContainerInner'>
							<p>${historyInq.userNick }</p>
							<p>${historyInq.inquiryCategory }</p>
							<textarea class="form-control" aria-label="With textarea"
								name="textArea" readonly="readonly">${historyInq.inquiryContent }
				</textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<textarea class="form-control" aria-label="With
						textarea"
						name="textArea" readonly="readonly">${historyInqAdmin.inquiryContent }</textarea>
				</div> --%>