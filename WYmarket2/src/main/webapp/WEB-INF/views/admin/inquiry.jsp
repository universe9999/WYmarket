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
	user-select: none;
}

#outerouter {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#outer {
	margin-top: 30px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	width: 1200px;
	border: solid 1px white;
	border-radius: 20px;
	height: 900px;
	margin-bottom: 0px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.inner {
	margin-top: 15px;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	margin-left: auto;
}

ul {
	width: 100%;
	overflow: auto;
	height: 750px;
}

li {
	cursor: pointer;
	background: white;
}

li:hover {
	background-color: rgba(255, 191, 82, 1);
}

.lili {
	width: 104.5%;
	margin-left: -12px;
}

p {
	font-size: 18px;
	font-family: 'Lato', sans-serif;
}

.p1 {
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

#reply {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#text, #text1 {
	margin-top: 10px;
	margin-bottom: 15px;
}

#text {
	margin-left: -13px;
	width: 107%;
}

#inquirybtn {
	margin-left: -13px;
	margin-bottom: 5px;
}

.btn-primary {
	color: #fff;
	background-color: #FF8A3D;
	border-color: #FF8A3D;
}

.btn-primary:hover {
	background-color: #FF8A3D;
	border-color: #FF8A3D;
}

#backbtn {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
	width: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: -60px;
}

#ajaxli {
	flex-direction: column-reverse;
}
</style>
<body>
	<div class="container" id='outerouter'>
		<div class="container" id='outer'>
			<div class='container inner'>
				<p class='p1'>받은 문의</p>
				<ul class="list-group" id='ul1'>
					<c:forEach var="inquiry" items="${inquiries }">
						<li class="list-group-item"
							onclick="ajaxInquiry('${inquiry.inquiryID }')">문의 번호 :
							${inquiry.inquiryID } <br> 닉네임 : ${inquiry.userNick } <br>
							카테고리 : ${inquiry.inquiryCategory } <br> 날짜 : <fmt:formatDate
								value="${inquiry.inquiryDate }" pattern="yy/MM/dd HH:mm" />
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class='container inner'>
				<p class='p1'>보낸 답장</p>
				<ul class="list-group">
					<div class='container' id='ajaxli' style="display: none;"></div>
					<c:forEach var="inquiry" items="${inqAdminToUser }">
						<li class="list-group-item"
							onclick="ajaxshowHistory('${inquiry.inquiryID}')">문의 번호 :
							${inquiry.userInquiryID } <br> 닉네임 : ${inquiry.userNick } <br>
							카테고리 : ${inquiry.inquiryCategory }<br> 날짜 : <fmt:formatDate
								value="${inquiry.inquiryDate }" pattern="yy/MM/dd HH:mm" />
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<button type="button" class="btn btn-primary" id='backbtn'
			onclick="location.href='/wymarket/admin'">이전으로</button>
	</div>


	<div class="modal fade" id="inquiryModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수신함</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id='modalContent'></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id='btn1'
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id='btn2'
						onclick="ajaxAdminToUser('${inqVO.userNick}','${inqVO.inquiryID }')">답장하기</button>
					<div class="container" id='reply'></div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="inquirySentModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id='inModal'></div>
		</div>
	</div>



	<script
		src="<%=application.getContextPath()%>/resources/assets/js/inquiry.js"></script>

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
							<p>${historyInq.inquiryDate }</p>
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