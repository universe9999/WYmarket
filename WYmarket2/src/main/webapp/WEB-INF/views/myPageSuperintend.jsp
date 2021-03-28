<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}

.mainBar {
	height: 4rem;
	border-bottom: 1px solid rgb(244, 244, 250);
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
}

.productBarMain {
	width: 1024px;
	display: flex;
	height: 100%;
	font-size: 13px;
}

.productBar:first-child {
	margin-left: -0.5rem;
}

.productBar {
	height: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin-right: 2rem;
}

.productBarAfter::after {
	content: "";
	width: 1px;
	height: 14px;
	border-right: 1px solid rgb(210, 210, 210);
	margin-left: 2rem;
}

.eXqDQY {
	background: rgb(255, 255, 255);
	font-size: 16px;
}

.dhPrXG {
	width: 1024px;
	margin: auto;
}

.dhPrXG>table {
	width: 100%;
	text-align: center;
	table-layout: fixed;
}

.dhPrXG>table>thead {
	font-weight: 500;
	border-top: 1px solid rgb(30, 29, 41);
	border-bottom: 1px solid rgb(30, 29, 41);
}

.dhPrXG table thead>tr {
	height: 2.5rem;
}

.dhPrXG table tr>:first-child {
	width: 10.5rem;
}

.dhPrXG table tr>:nth-child(2) {
	width: 8rem;
}

.dhPrXG table tr>:nth-child(3) {
	width: 21rem;
}

.dhPrXG table tr>:nth-child(4) {
	width: 6.5rem;
}

.dhPrXG table tr>:nth-child(5) {
	width: 4.5rem;
}

.dhPrXG table tr>:nth-child(6) {
	width: 9.5rem;
}

.dhPrXG table tr>:nth-child(7) {
	width: 4rem;
}

.dzcnmr {
	display: flex;
	margin: 2.5rem 0px 2rem;
}

.frGPEd {
	width: 400px;
	height: 3rem;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	position: relative;
}

.frGPEd>input {
	height: 100%;
	width: 100%;
	padding: 0px 68px 0px 1rem;
	border: 1px solid rgb(195, 194, 204);
	border-radius: 2px;
}

.fQvnGB {
	position: absolute;
	top: 0px;
	right: 0px;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: 20px 20px;
	width: 52px;
	height: 100%;
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTIuMTUyIDguNjA4QTYuNDYzIDYuNDYzIDAgMCAxIDguNjEgMi4xNTJhNi40NjMgNi40NjMgMCAwIDEgNi40NTYgNi40NTYgNi40NjMgNi40NjMgMCAwIDEtNi40NTYgNi40NTYgNi40NjMgNi40NjMgMCAwIDEtNi40NTctNi40NTZtMTMuMjQ5IDUuMjdhOC41NSA4LjU1IDAgMCAwIDEuODE2LTUuMjdDMTcuMjE3IDMuODYyIDEzLjM1NSAwIDguNjEgMCAzLjg2MiAwIDAgMy44NjIgMCA4LjYwOGMwIDQuNzQ3IDMuODYyIDguNjA4IDguNjA5IDguNjA4YTguNTYgOC41NiAwIDAgMCA1LjI3LTEuODE2bDQuMjg0IDQuMjg0YTEuMDczIDEuMDczIDAgMCAwIDEuNTIxIDAgMS4wNzUgMS4wNzUgMCAwIDAgMC0xLjUyMmwtNC4yODMtNC4yODR6Ii8+Cjwvc3ZnPgo=);
}

.jAXfuM {
	width: 7rem;
	margin-left: 10px;
}

.cont {
	position: relative;
	box-sizing: border-box;
}

.eAMYPo {
	width: 100%;
	height: 3rem;
	display: flex;
	border: 1px solid rgb(195, 194, 204);
	border-radius: 2px;
}

.hwfws3 {
	align-items: center;
	display: flex;
	flex: 1 1 0%;
	flex-wrap: wrap;
	padding: 2px 8px;
	position: relative;
	overflow: hidden;
	box-sizing: border-box;
}

.iOnkn {
	width: 100%;
	text-align: center;
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2MCIgaGVpZ2h0PSI2MCIgdmlld0JveD0iMCAwIDYwIDYwIj4KICAgIDxwYXRoIGZpbGw9IiNEQ0RCRTQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTU3IDBhMyAzIDAgMCAxIDMgM3YyN2MwIC43OTUtLjMxNCAxLjU2LS44NzggMi4xMjFsLTI3IDI3YTIuOTkxIDIuOTkxIDAgMCAxLTQuMjQyIDBsLTI3LTI3YTIuOTk3IDIuOTk3IDAgMCAxIDAtNC4yNDJsMjctMjdBMy4wMDUgMy4wMDUgMCAwIDEgMzAgMGgyN3pNMzAgNTIuNzU4TDM0Ljc2IDQ4IDEyIDI1LjI0MiA3LjI0MyAzMCAzMCA1Mi43NTh6bTI0LTI0VjZIMzEuMjQ0bC0xNSAxNUwzOSA0My43NThsMTUtMTV6TTQ1IDE4YTMgMyAwIDEgMSAwLTYgMyAzIDAgMCAxIDAgNnoiLz4KPC9zdmc+Cg==);
	background-position: center center;
	background-repeat: no-repeat;
	background-size: 5rem;
	height: 21rem;
	padding-top: 14rem;
	color: rgb(155, 153, 169);
}

.breakdown {
	border: 0;
	outline: 0;
	background-color: white;
}

.dhPrXG table tbody>tr {
	border-bottom: 1px solid rgb(220, 219, 228);
}

.dhPrXG table tr>td:first-child {
	height: 9.5rem;
}

.dhPrXG table tr>:nth-child(2) {
	width: 8rem;
}

.dhPrXG table tr>:nth-child(3) {
	width: 21rem;
}

.dhPrXG table tr>:nth-child(4) {
	width: 6.5rem;
}

.dhPrXG table tr>:nth-child(5) {
	width: 4.5rem;
}

.dhPrXG table tr>:nth-child(6) {
	width: 9.5rem;
}

.dhPrXG table tr>td:last-child {
	display: flex;
	flex-direction: column;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 9.5rem;
}

.bXnHq5 {
	width: 100%;
	height: 3rem;
	display: flex;
	border: 1px solid rgb(195, 194, 204);
	border-radius: 2px;
}

.hwfss {
	align-items: center;
	display: flex;
	flex: 1 1 0%;
	flex-wrap: wrap;
	position: relative;
	overflow: hidden;
	box-sizing: border-box;
}

.sing {
	width: 100%;
	color: rgb(51, 51, 51);
	margin-left: 2px;
	margin-right: 2px;
	max-width: calc(100% - 8px);
	overflow: hidden;
	position: absolute;
	text-overflow: ellipsis;
	white-space: nowrap;
	top: 50%;
	transform: translateY(-50%);
	box-sizing: border-box;
}
</style>

</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>	
		<div class="gPdUna">
			<div class="mainBar">
				<nav class="productBarMain">

					<div class="productBar productBarAfter">
						<button class="breakdown"
							onclick="location.href ='<%=application.getContextPath()%>/goods/register2'">상품등록</button>
					</div>
					<div class="productBar productBarAfter">
						<button class="breakdown"
							onclick="location.href ='<%=application.getContextPath()%>/mypage/Productmanagement'">상품목록</button>
					</div>
					<div class="productBar productBarAfter">
						<button class="breakdown"
							onclick="location.href ='<%=application.getContextPath()%>/param/purchase'">구매내역</button>
					</div>
					<div class="productBar">
						<button class="breakdown"
							onclick="location.href = '<%=application.getContextPath()%>/param/sale'">판매관리</button>
					</div>
				</nav>
			</div>
			<div class="eXqDQY">
				<main class="dhPrXG">
					<header class="dzcnmr">
						<form action="<%=application.getContextPath() %>/mypage/Productmanagement" class="frGPEd">
							<input type="text" name = "psearch" placeholder="상품명을 입력해주세요."/>
							<button  class="fQvnGB"></button>
						</form>
						<div class="jAXfuM">
							<div class="cont">
								<div class="eAMYPo">
									<select class="hwfws3" name="pageOpenCount"
										onchange="if(this.value) location.href=(this.value);">
										<option selected disabled="disabled">목록 수</option>
										<option
											value="./Productmanagement?pagenum=1&amount=2&usernick=${user.userNick }">10개씩</option>
										<option
											value="./Productmanagement?pagenum=1&amount=3&usernick=${user.userNick }">20개씩</option>
										<option
											value="./Productmanagement?pagenum=1&amount=4&usernick=${user.userNick }">50개씩</option>
									</select>
								</div>
							</div>
						</div>
						<div class="jAXfuM">
							<div class="cont">
								<div class="eAMYPo">
									<select class="hwfws3" name="pageOpenCount"
										onchange="if(this.value) location.href=(this.value);">
										<option selected disabled="disabled">원래 판매상태에 따른 페이지</option>
										<option
											value="<%=application.getContextPath()%>/param/sale">10개씩</option>
										<option
											value="./Productmanagement?pagenum=1&amount=20&usernick=${user.userNick }">20개씩</option>
										<option
											value="./Productmanagement?pagenum=1&amount=50&usernick=${user.userNick }">50개씩</option>
									</select>										
								</div>
							</div>
						</div>
					</header>


					<table>
						<thead>
							<tr>
								<th>사진</th>
								<th>판매상태</th>
								<th>상품명</th>
								<th>가격</th>
								<th>찜/댓글</th>
								<th>최근 수정일</th>
								<th>기능</th>
							</tr>
						</thead>
						<tbody>
								
							<c:forEach var="shitem_List" items="${pageList }">
								<tr>
									<td><a
										href="<%=application.getContextPath()%>/goods/view2?n=${shitem_List.itemid}"><img
											src="${pageContext.request.contextPath}${shitem_List.iimagepath}"
											alt="" style="width: 120px; height: 120px;" /></a></td>
									<td>
										<div class="cont">
											<div class="bXnHq5">
												<div class="hwfss">

													<c:choose>
														<c:when test="${shitem_List.istate eq 'Onsale' }">
															<div class="sing">판매중</div>
														</c:when>

														<c:when test="${shitem_List.istate eq 'Yreservation' }">
															<div class="sing">예약중</div>
														</c:when>

														<c:when test="${shitem_List.istate eq 'Hidden' }">
															<div class="sing">숨김</div>
														</c:when>

														<c:when test="${shitem_List.istate eq 'Completed' }">
															<div class="sing">거래완료</div>
														</c:when>
													</c:choose>


												</div>

											</div>
										</div>
									</td>
									<td><a style="text-decoration: none;"
										href="<%=application.getContextPath()%>/goods/view2?n=${shitem_List.itemid}">${shitem_List.ititle }</a></td>
									<td><c:set var="money" value="${shitem_List.price }" /> <fmt:formatNumber
											value="${money }" type="number" /> 원</td>
									<td>${shitem_List.likecnt}/${shitem_List.viewcnt}</td>
									<td><c:choose>
											<c:when
												test="${shitem_List.refreshTime >= 0 && shitem_List.refreshTime < 60}">
												<span>${shitem_List.refreshTime}초 전</span>
												<br>
											</c:when>

											<c:when
												test="${shitem_List.refreshTime >= 60 && shitem_List.refreshTime < 3600}">
												<fmt:parseNumber var="percent"
													value="${((shitem_List.refreshTime) / 60)}"
													integerOnly="true" />
												<span>${percent}분 전</span>
												<br>
											</c:when>

											<c:when
												test="${shitem_List.refreshTime >= 3600 && shitem_List.refreshTime < 86400}">
												<fmt:parseNumber var="percent"
													value="${((shitem_List.refreshTime) / 3600)}"
													integerOnly="true" />
												<span>${percent}시간 전</span>
												<br>
											</c:when>

											<c:when test="${shitem_List.refreshTime >= 86400} ">
												<fmt:parseNumber var="percent"
													value="${((shitem_List.refreshTime) / 86400)}"
													integerOnly="true" />
												<span>${percent }일 전</span>
												<br>
											</c:when>
										</c:choose></td>
									<td>기능</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:choose>
					<c:when test="${empty itemvo }">
					<div class="iOnkn">상품 목록이 존재하지 않습니다.</div>
					</c:when>
					<c:otherwise>
						 
					<div>
						<c:url var="previousHref"
							value="./Productmanagement?pagenum=${page.startPage - page.size}&amount=${page.amount }&usernick=${user.userNick }" />
						<c:url var="nextHref"
							value="./Productmanagement?pagenum=${page.endPage + 1}&amount=${page.amount }&usernick=${user.userNick }" />

						<c:url var="onego"
							value="./Productmanagement?pagenum=${page.currPage + 1}&amount=${page.amount }&usernick=${user.userNick }" />
						<c:url var="oneback"
							value="./Productmanagement?pagenum=${page.currPage - 1}&amount=${page.amount }&usernick=${user.userNick }" />
						<nav aria-label="...">

							<ul class="pagination" style="padding-top: 22px;">

								<li
									class="page-item<c:if test="${not page.previous }"> disabled</c:if>">
									<a class="page-link" href="${previousHref }" tabindex="-1"
									aria-disabled="true">&lt;&lt;</a>
								</li>

								<li
									class="page-item <c:if test="${page.currPage eq 1}">disabled</c:if>">
									<a class="page-link" href="${oneback }" tabindex="-1"
									aria-disabled="true">&lt;</a>
								</li>

								<c:forEach var="i" begin="${page.startPage }"
									end="${page.endPage }">
									<li
										class="page-item<c:if test="${page.currPage eq i }"> active</c:if>"
										aria-current="page"><a class="page-link"
										href="./Productmanagement?pagenum=${i }&amount=${page.amount }&usernick=${user.userNick }">${i }</a>
									</li>
								</c:forEach>

								<li
									class="page-item <c:if test ="${page.currPage eq page.lastPage}">disabled</c:if>">
									<a class="page-link" href="${onego }" tabindex="-1"
									aria-disabled="true">&gt;</a>

								</li>
								<li
									class="page-item<c:if test="${not page.next }"> disabled</c:if>">
									<a class="page-link" href="${nextHref }" tabindex="-1"
									aria-disabled="true">&gt;&gt;</a>
								</li>
							</ul>
						</nav>
					</div>
					</c:otherwise>
					</c:choose>

				</main>
			</div>
		</div>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


</body>
</html>