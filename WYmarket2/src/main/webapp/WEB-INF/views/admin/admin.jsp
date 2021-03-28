<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="icon"
	href="<%=application.getContextPath()%>/image/wyfavicon.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/wyfavicon.ico">
<!-- <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Do+Hyeon&family=Indie+Flower&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital@1&family=Lobster&display=swap"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Lato&family=Shippori+Mincho&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	
}

#selectID {
	margin-left: 20px;
}

#kakaoLogout {
	text-decoration: none;
	text-align: center;
	padding-top: 7px;
	background-color: #fef01b;
	color: #3A1D1D;
	border-radius: 5px;
	font-weight: bold;
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 37px;
	cursor: pointer;
	vertical-align: middle;
}

#logoutheader {
	display: flex;
	justify-content: flex-end;
}

#outerContainer {
	display: flex;
	flex-direction: row;
	margin-top: 50px;
	position: relative;
	right: 100px;
}

#searchcontainer {
	margin-top: 48px;
}

#searchcontainer>form {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	width: 670px;
	margin-right: auto;
	margin-left: 150px;
	margin-top: -37px;
}

#rightHandContainer {
	display: flex;
	flex-direction: column;
	margin-left: 10px;
	margin-top: 40px;
}

#rightHandContainer>.container {
	width: 250px;
}

#adminProfile {
	display: flex;
	flex-direction: column;
	background-color: #f2f3f7;
	border: none;
	/* box-shadow: 7px 7px 7px rgba(0, 0, 0, .1); */
}

.profileP {
	margin-top: 13px;
	font-family: 'Lato', sans-serif;
}

#adminHeader {
	margin-top: 10px;
}

img {
	border-radius: 50%;
	object-fit: cover;
}

#img1 {
	width: 100px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

#nick {
	text-align: center;
}

#adminMemo {
	border: none;
	background-color: #feffdd;
	/* box-shadow: 7px 7px 7px rgba(0, 0, 0, .1); */
	width: 100%;
	height: 275px;
}

#img2 {
	width: 70px;
	height: 70px;
}

#adminBtn {
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
}

#memoBtn {
	background-color: rgba(70, 70, 85, 0);
	border: none;
	color: gray;
	font-size: 16px;
	margin-left: 170px;
}

.svg-inline--fa {
	display: inline-block;
	font-size: 30px;
	height: 1em;
	overflow: visible;
	vertical-align: -.125em;
}

#memoInput {
	border: none;
	background-color: rgba(254, 255, 221, 0);
	width: 300px;
}

.textarea {
	background-color: rgba(254, 255, 221, 0);
	border-bottom: 1px solid #ccc;
	font-family: inherit;
	font-size: inherit;
	padding: 1px 6px;
	display: block;
	width: 100%;
	overflow: hidden;
	resize: both;
	min-height: 40px;
	line-height: 20px;
}

.textarea[contenteditable]:empty::before {
	content: "메모를 입력하십시요";
	color: gray;
}

#tableDiv {
	overflow: auto;
	white-space: nowrap;
}

th {
	text-align: center;
	vertical-align: middle;
}

.page-link {
	background-color: white;
	color: black;
	border-radius: 10%;
}

.page-item {
	margin-left: 10px;
}

.form-select {
	width: 120px;
}

#search {
	width: 300px;
	margin-left: 10px;
}

#searchbtn {
	width: 60px;
	background-color: rgba(70, 70, 85, 1);
	border: none;
	color: white;
	margin-left: 10px;
}

#searchallbtn {
	margin-left: auto;
	background-color: rgba(70, 70, 85, 1);
	border: none;
	color: white;
}

#twobtn {
	margin-top: 5px;
}

#memoBtn {
	margin-bottom: 15px;
}

#memoNick {
	margin-bottom: 30px;
	margin-top: 15px;
}

#twobtn>* {
	width: 110%;
	margin-left: -10px;
	margin-top: 15px;
}

[name='btn'] {
	background-color: rgba(131, 131, 135, 0.3);
	border-color: rgba(70, 70, 85, 1);
	color: rgba(70, 70, 85, 1);
	border: none;
}

[name='btn']:hover {
	background-color: #FF8A3D;
}

#withdrawalbtn {
	background-color: #c978ff; border: none;
}

#accessbtn {
	background-color: #29cc57;
	border: none;
}

#adminBtn {
	background-color: #ff953e;
	border: none;
}

#nick, #memoNick {
	font-family: 'Do Hyeon', sans-serif;
	margin-left: auto;
	margin-right: auto;
}

#nick {
	font-size: 20px;
}

.table>:not(caption)>*>* {
	padding: .5rem 25px;
	background-color: var(- -bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(- -bs-table-accent-bg);
}

thead>tr>th {
	font-family: 'Kanit', sans-serif;
	font-size: 16px;
}

tbody>tr>th {
	font-family: sans-serif;
	font-size: 14px;
}

.page-item.active .page-link {
	z-index: 3;
	background: rgba(219, 218, 213, 1);
	color: black;
	border: none;
}

.page-link:active, .page-link:hover {
	color: black;
	background: radial-gradient(at 10% 30px, #e3e3e3, white);
}

#memo {
	height: 200px;
	overflow: auto;
	font-family: 'Lato', sans-serif;
}

#inquiryBtn {
	background-color: #747ee8;
	border: none;
}

#inquiryBtn:hover {
	background-color: #747ee8;
}
</style>
</head>
<header id='logoutheader'> </header>
<body>



	<div class="container" id='outerContainer'>
		<div class="container" id='leftHandContainer'>
			<div class="container" id='tableDiv'>
				<table class="table table-responsive table-striped">
					<thead>
						<tr>
							<th scope="col">회원 번호</th>
							<th scope="col">전화 번호</th>
							<th scope="col">카카오 이메일</th>
							<th scope="col">닉네임</th>
							<th scope="col">위도</th>
							<th scope="col">경도</th>
							<th scope="col">주소</th>
							<th scope="col">매너온도</th>
							<th scope="col">생성일</th>
							<th scope="col">구매완료 횟수</th>
							<th scope="col">판매완료 횟수</th>
							<th scope="col">받은 리뷰 수</th>
							<th scope="col">키워드</th>
							<th scope="col">정지 여부</th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<c:set var="i" value="${i+1}" />
							<tr>
								<th scope="col">${user.userID }</th>
								<th scope="col">${user.phoneNumber}</th>
								<th scope="col">${user.kakaoMail}</th>
								<th scope="col">${user.userNick}</th>
								<th scope="col">${user.latitude}</th>
								<th scope="col">${user.longitude}</th>
								<th scope="col">${user.address}</th>
								<th scope="col">${user.manner}</th>
								<th scope="col"><fmt:formatDate
										value="${user.userCreateDate}" pattern="yy/MM/dd" /></th>
								<th scope="col">${user.buyItemCnt}</th>
								<th scope="col">${user.saleItemCnt}</th>
								<th scope="col">${user.reviewCnt}</th>
								<th scope="col">${user.keyWord}</th>
								<th scope="col" id='banTF${i }'>${user.ban}</th>
								<th scope="col">
									<button class="btn btn-primary" name="btn"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="ban">정지</button>
								</th>
								<th scope="col">
									<button class="btn btn-primary" name="btn"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="unban">정지 해제</button>
								</th>
								<th scope="col">
									<%-- <button class="btn btn-primary" name="btn"
										onclick="toMyPage('${user.userNick }')">마이 페이지</button> --%>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr>
			<div class="container">
				<h5 id='rowCount'>
					검색 결과 : <b>${rowCount } 건</b>
				</h5>
			</div>

			<c:url var="firstHref"
				value="./admin?pageNum=1&amount=${pagination.amount }" />
			<c:url var="previousHref2"
				value="./admin?pageNum=${pageService.startPage - 1}&amount=${pagination.amount }" />
			<c:url var="nextHref2"
				value="./admin?pageNum=${pageService.endPage + 1}&amount=${pagination.amount }" />
			<c:url var="previousHref1"
				value="./admin?pageNum=${pagination.pageNum - 1 }&amount=${pagination.amount }" />
			<c:url var="nextHref1"
				value="./admin?pageNum=${pagination.pageNum + 1 }&amount=${pagination.amount }" />
			<c:url var="lastHref"
				value="./admin?pageNum=${pageService.lastPage }&amount=${pagination.amount }" />

			<nav aria-label="...">
				<ul class="pagination justify-content-center">
					<li
						class="page-item<c:if test="${pagination.pageNum eq 1}"> disabled</c:if>">
						<a class="page-link" href="${firstHref }" tabindex="-1"
						aria-disabled="true">처음으로</a>
					</li>
					<li
						class="page-item<c:if test="${not pageService.previous }"> disabled</c:if>">
						<a class="page-link" href="${previousHref2 }" tabindex="-1"
						aria-disabled="true">&lt;&lt;</a>
					</li>
					<li
						class="page-item<c:if test="${pagination.pageNum eq 1}"> disabled</c:if>">
						<a class="page-link" href="${previousHref1 }" tabindex="-1"
						aria-disabled="true">&lt;</a>
					</li>
					<c:forEach var="i" begin="${pageService.startPage }"
						end="${pageService.endPage }">
						<li
							class="page-item<c:if test="${pagination.pageNum eq i }"> active</c:if>"
							aria-current="page"><a class="page-link"
							href="./admin?pageNum=${i }&amount=${pagination.amount }
							">${i }</a></li>
					</c:forEach>
					<li
						class="page-item<c:if test="${pagination.pageNum eq pageService.lastPage }"> disabled</c:if>">
						<a class="page-link" href="${nextHref1 }" tabindex="-1"
						aria-disabled="true">&gt;</a>
					</li>
					<li
						class="page-item<c:if test="${not pageService.next }"> disabled</c:if>">
						<a class="page-link" href="${nextHref2 }" tabindex="-1"
						aria-disabled="true">&gt;&gt;</a>
					</li>
					<li
						class="page-item<c:if test="${pagination.pageNum eq pageService.lastPage }"> disabled</c:if>">
						<a class="page-link" href="${lastHref }" tabindex="-1"
						aria-disabled="true">끝으로</a>
					</li>
				</ul>
			</nav>
			<div class="container" id='searchcontainer'>
				<button class="btn btn-primary" onclick="searchAll()"
					id='searchallbtn'>전체 리스트 보기</button>
				<form action="/wymarket/admin" id='form1'>
					<select class="form-select" aria-label="Default select example"
						name="list" id='selectID' form="form1">
						<option selected>검색분류</option>
						<option value="userId"
							<c:if test="${lists eq 'userId'}">selected</c:if>>회원번호</option>
						<option value="userNick"
							<c:if test="${lists eq 'userNick'}">selected</c:if>>닉네임</option>
						<option value="address"
							<c:if test="${lists eq 'address'}">selected</c:if>>주소</option>
					</select> <input id='search' type="text" class="form-control"
						aria-label="Username" aria-describedby="basic-addon1"
						name="search" value="${searchs }"> <input id='searchbtn'
						type="button" class="form-control" aria-label="Username"
						aria-describedby="basic-addon1" value="검색" onclick="blockNull()">

				</form>
			</div>

		</div>
		<div class="container" id='rightHandContainer'>
			<div class="container" id='adminProfile'>
				<div class="container" id='adminHeader'>
					<img src="/wymarket/image/carrotcharacter.png" alt="" id='img1' />
					<p class='profileP' id='nick'>${Admin.adminNick }</p>
				</div>
				<p class='profileP'>
					<b>생성일 :</b>
					<fmt:formatDate value="${Admin.adminCreateDate }"
						pattern="yy/MM/dd" />
				</p>
				<p class='profileP'>
					<b>관리자 등급 : </b>${Admin.adminGrade }</p>
			</div>

			<div class="container" id='adminMemo'>
				<div class="container" id='memoP'>
	
					<button type="button" class="btn btn-primary" id='memoBtn'
						onclick="ajaxSaveMemo()">
						<i class="far fa-edit"></i>
					</button>
				</div>
				<p>
					<span id='memo' class="textarea" role="textbox"
						contenteditable=<c:if test="${Admin.adminGrade eq '부'}">"false"</c:if>></span>
				</p>
			</div>
			<div class="container" id='twobtn'>
				<button type="button" class="btn btn-primary" id='withdrawalbtn'
					onclick="location.href='<%=application.getContextPath()%>/board/withdrawalList';">탈퇴
					회원 보기</button>
				<button type="button" class="btn btn-primary" id='accessbtn'
					onclick="location.href='<%=application.getContextPath()%>/admin/usercount/first';">회원
					접속 정보 보기</button>
				<button type="button" class="btn btn-primary" id='adminBtn'
					onclick="location.href='<%=application.getContextPath()%>/board/list';">공지사항
					쓰기</button>
				<button type="button" class="btn btn-primary" id='inquiryBtn'
					onclick="location.href='<%=application.getContextPath()%>/admin/seeInquiry';">
					문의 보기
					<c:if test="${inquiryCount ne 0}">
						<span class="badge bg-secondary">${inquiryCount }</span>
					</c:if>
				</button>
				<a id='kakaoLogout'>로그아웃</a>
			</div>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/admin.js"></script>

	<script>
	
	document.getElementById('memo').innerHTML = "${Admin.adminMemo}";
	
	console.log("${Admin.phoneNumber}");
	console.log("${Admin.adminNick}");
	console.log("${Admin.adminCreateDate}");
	console.log("${Admin.adminGrade }");
	console.log("${Admin.adminMemo }");

	
	document.getElementById('kakaoLogout').addEventListener('click',()=>{
			ajaxLogOut();
			setTimeout(function(){
				window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=f5c99e47d61ce4b7e521d120e1f04199&logout_redirect_uri=http://localhost:8080/wymarket/login";
	        }, 1000); 
		});
	
	function ajaxSaveMemo() {
		console.log("${Admin.adminGrade }");
		if ("${Admin.adminGrade }" == '정') {
			var data = {
				adminGrade: "${Admin.adminGrade}",
				adminMemo: document.getElementById('memo').innerHTML
			}

			console.log(document.getElementById('memo').innerHTML);
			
			var xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == XMLHttpRequest.DONE) {
					if (xhttp.status == 200) {

					} else {

					}
				}
			}

			xhttp.open('POST', '/wymarket/saveMemo', true);
			xhttp.setRequestHeader('content-type', 'application/json');
			xhttp.send(JSON.stringify(data));

			console.log('여기오나?')

		} else {
			alert("'정' 관리자만 사용할 수 있는 기능입니다.")
		}

	}
	
	function toMyPage(userNick){
		location.href='/wymarket/param/myPage?myNick=' + userNick;
	}

	
	
</script>

</body>
</html>