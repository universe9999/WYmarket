<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수</title>
<link rel="icon"
	href="<%=application.getContextPath()%>/image/wyfavicon.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/wyfavicon.ico">
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
<style>
* {
	box-sizing: border-box;
	user-select: none;
}

#outerContainer {
	margin-top: 50px;
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

.table>:not(caption)>*>* {
	padding: .5rem 25px;
	background-color: var(- -bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(- -bs-table-accent-bg);
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

.form-select {
	width: 120px;
	height: 40px;
}

#datecontainer {
	display: flex;
	flex-direction: row;
	margin-left: 12px;
	margin-top: 25px;
}

#datecontainer>:last-child {
	margin-left: auto;
	margin-right: 11px;
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
	color: white;
}

#datecontainer>form {
	display: flex;
	flex-direction: row;
}

form>* {
	margin-left: 10px;
}

#searchallbtn {
	margin-right: 10px;
	background-color: rgba(70, 70, 85, 1);
	border-color: rgba(70, 70, 85, 1);
	color: white;
}

#totalCount {
	text-align: center;
	margin-left: auto;
	width: 150px;
	margin-top: -80px;
}

#countPart {
	height: 40px;
}

.card-text {
	margin-top: -8px;
}

#btnContainer {
	margin-left: 277px;
	margin-top: 20px;
}

#userAccessCntBtn {
	margin-right: 15px;
	background-color: #469536;
	border: none;
}

#userSignUpCntBtn {
	background-color: #FF8A3D;
	border: none;
}
</style>
</head>
<body>
	<div class="container" id='outerContainer'>
		<div class="container" id='leftHandContainer'>
			<div class="container" id='tableDiv'>
				<table class="table table-responsive table-striped">
					<thead>
						<tr>

							<th scope="col"><c:if test="${accessFlag eq '1' }">접속 번호</c:if>
								<c:if test="${accessFlag ne '1' }">회원 번호</c:if></th>
							<th scope="col">전화 번호</th>
							<th scope="col">카카오 이메일</th>
							<th scope="col">닉네임</th>
							<th scope="col">위도</th>
							<th scope="col">경도</th>
							<th scope="col">주소</th>
							<th scope="col">매너온도</th>
							<th scope="col"><c:if test="${accessFlag eq '1' }">접속일</c:if>
								<c:if test="${accessFlag ne '1' }">생성일</c:if></th>
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
								<th scope="col"><c:if test="${accessFlag eq '1' }">${user.accessID }</c:if>
									<c:if test="${accessFlag ne '1' }">${user.userID }</c:if></th>
								<th scope="col">${user.phoneNumber}</th>
								<th scope="col">${user.kakaoMail}</th>
								<th scope="col">${user.userNick}</th>
								<th scope="col">${user.latitude}</th>
								<th scope="col">${user.longitude}</th>
								<th scope="col">${user.address}</th>
								<th scope="col">${user.manner}</th>
								<th scope="col"><c:if test="${accessFlag eq '1' }">
										<fmt:formatDate value="${user.accessDate}" pattern="yy/MM/dd" />
									</c:if> <c:if test="${accessFlag ne '1' }">
										<fmt:formatDate value="${user.userCreateDate}"
											pattern="yy/MM/dd" />
									</c:if></th>
								<th scope="col">${user.buyItemCnt}</th>
								<th scope="col">${user.saleItemCnt}</th>
								<th scope="col">${user.reviewCnt}</th>
								<th scope="col">${user.keyWord}</th>
								<th scope="col" id='banTF${i }'>${user.ban}</th>
								<th scope="col">
									<button class="btn btn-primary"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="ban" name="btn">정지</button>
								</th>
								<th scope="col">
									<button class="btn btn-primary"
										onclick="banUnban(this,'${user.userNick }',${i })"
										data-btn-type="unban" name="btn">정지 해제</button>
								</th>
								<th scope="col">
									<%-- 			<button class="btn btn-primary"
										onclick="toMyPage('${user.userNick}')" name="btn">마이
										페이지</button> --%>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr>
			<div class="container">
				<h5 id='rowCount'>
					검색 결과 : <b>${accessCount } 건</b>
				</h5>
			</div>
			<c:url var="firstHref"
				value="./usercount?pageNum=1&amount=${pagination.amount }" />
			<c:url var="previousHref2"
				value="./usercount?pageNum=${pageService.startPage - 1}&amount=${pagination.amount }" />
			<c:url var="nextHref2"
				value="./usercount?pageNum=${pageService.endPage + 1}&amount=${pagination.amount }" />
			<c:url var="previousHref1"
				value="./usercount?pageNum=${pagination.pageNum - 1 }&amount=${pagination.amount }" />
			<c:url var="nextHref1"
				value="./usercount?pageNum=${pagination.pageNum + 1 }&amount=${pagination.amount }" />
			<c:url var="lastHref"
				value="./usercount?pageNum=${pageService.lastPage }&amount=${pagination.amount }" />

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
							href="./usercount?pageNum=${i }&amount=${pagination.amount }
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
			<div class="card border-dark mb-3" style="max-width: 18rem;"
				id='totalCount'>
				<div class="card-header">누적 접속자 수</div>
				<div class="card-body text-dark" id='countPart'>
					<p class="card-text">${userCountTotal }</p>
				</div>
			</div>
		</div>
		<div class="container" id='datecontainer'>

			<button class="btn btn-primary" onclick="searchAll()"
				id='searchallbtn'>전체 리스트 보기</button>

			<form action="/wymarket/admin/accessUserCount" id='accessForm'>

				<select class="form-select" aria-label="Default select example"
					name="yearSelect" id='year' onchange="yearChange()"
					form='accessForm'>
					<option selected>연도 선택</option>
					<c:forEach var="i" begin="2018" end="${currentYear }">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select> <select class="form-select" aria-label="Default select example"
					name="monthSelect" onchange="monthChange(1)" id='month'>
					<option selected>월 선택</option>
					<c:forEach var="i" begin="1" end="12">
						<option value=${i }>${i }</option>
					</c:forEach>
				</select> <select class="form-select" aria-label="Default select example"
					name="daySelect" id='day'>
					<option selected>일 선택</option>
				</select>

			</form>

			<button type="button" class="btn btn-primary" id='backbtn'
				onclick="location.href='/wymarket/admin'">이전으로</button>
		</div>
		<div class="container" id='btnContainer'>
			<button id='userAccessCntBtn' class="btn btn-primary" type="button"
				onclick="userAccessCount()">접속자 수 보기</button>
			<button id='userSignUpCntBtn' class="btn btn-primary" type="button"
				onclick="userSignUpCount()">가입자 수 보기</button>
		</div>
	</div>

	<script
		src="<%=application.getContextPath()%>/resources/assets/js/usercount.js"></script>


	<script>
		const yearCon = document.getElementById('year');
		const monthCon = document.getElementById('month');
		const dayCon = document.getElementById('day');

		if("${selectedYear}" == ""){
			yearCon.value = '연도 선택';
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
		} else{
			yearCon.value = "${selectedYear}";
			monthCon.value = "${selectedMonth}";
			if("${selectedDay}" == ""){
				dayCon.value = '일 선택';
			} else{
				dayCon.value = "${selectedDay}";
			}

		}

		if(monthCon.value == '월 선택'){
			dayCon.disabled = true;
			dayCon.value = '일 선택';
		}
		
 		if (window.performance.navigation.type == 1) {
			yearCon.value = '연도 선택';
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
		} 

		if (yearCon.value != '연도 선택') {
			monthCon.disabled = false;
		} else {
			monthCon.disabled = true;
			dayCon.disabled = true;
		}


		function yearChange() {
			if (yearCon.value != '연도 선택') {
				monthCon.disabled = false;
			} else {
				monthCon.disabled = true;
				
			}
			monthCon.value = '월 선택';
			dayCon.value = '일 선택';
			dayCon.disabled = true;
		}
/* 		function monthChange() {
			if (monthCon.value != '월 선택') {
				dayCon.disabled = false;

				const prefix = "/wymarket";
				let uri = prefix + "/admin/dayCheck/" + yearCon.value + "/"
						+ monthCon.value;
				location.href = uri;
			} else {
				dayCon.disabled = true;
			}
			dayCon.value = '일 선택';

		} */

		function userAccessCount() {
			if(yearCon.value == '연도 선택'){
				alert("연도를 반드시 선택해주세요");
			} else{
				document.getElementById(yearCon.getAttribute('form')).submit();
				console.log('1번');
				
			}
			
		}
		
		console.log('2번')
		monthChange(2);
		

	function userSignUpCount(){
		if(yearCon.value == '연도 선택'){
			alert("연도를 반드시 선택해주세요");
		} else{
			document.getElementById('accessForm').action = '/wymarket/admin/signupUserCount';
			document.getElementById(yearCon.getAttribute('form')).submit();

		}
	}
	
	function toMyPage(userNick){
		location.href='/wymarket/param/test02/' + userNick;
	}
	
	function monthChange(num) {
		if (monthCon.value != '월 선택') {
			dayCon.disabled = false;

			const prefix = "/wymarket";
			let uri = prefix + "/admin/dayCheck/" + yearCon.value + "/"
				+ monthCon.value;
			xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {
				if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
					console.log(this.responseText);
					
					if(this.responseText == 28){
						document.getElementById('day').innerHTML = 
							`<option selected>일 선택</option><c:forEach var="i" begin="1" end="28">
						<option value="${i }">${i }</option>
						</c:forEach>`;
					} else if(this.responseText == 29){
						document.getElementById('day').innerHTML = 
							`<option selected>일 선택</option><c:forEach var="i" begin="1" end="29">
						<option value="${i }">${i }</option>
						</c:forEach>`;
					} else if(this.responseText == 30){
						document.getElementById('day').innerHTML = 
							`<option selected>일 선택</option><c:forEach var="i" begin="1" end="30">
						<option value="${i }">${i }</option>
						</c:forEach>`;
					} else if(this.responseText == 31){
						document.getElementById('day').innerHTML = 
							`<option selected>일 선택</option><c:forEach var="i" begin="1" end="31">
						<option value="${i }">${i }</option>
						</c:forEach>`;
					}
					if("${selectedDay}" != ""){
						if(num == 2){
							document.getElementById('day').value = "${selectedDay}";
						}
					}	
				}
			}
			xhttp.open('GET', uri, true);
			xhttp.send();

		} else {
			dayCon.disabled = true;
		}
		dayCon.value = '일 선택';

	} 

	</script>


</body>
</html>