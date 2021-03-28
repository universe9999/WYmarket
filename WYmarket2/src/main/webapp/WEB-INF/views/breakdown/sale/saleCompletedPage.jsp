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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Akaya+Kanadaka&family=Nanum+Pen+Script&family=Roboto+Slab:wght@500&display=swap"
	rel="stylesheet">

<%@ include file="/WEB-INF/views/breakdown/incloud/font_css.jspf"%>
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">

<style type="text/css">
.cDisabled {
	pointer-events: none;
	opacity: 0.6;
}

</style>
</head>
<body>

	<div id="grid_2" class="div">

		<header
			style="padding: 20px; text-align: center; font-family: 'Noto Sans KR', sans-serif; font-size: 40px; padding-left: 40px;"
			class="titlefont"><i class="fas fa-arrow-left cPoint" style="float: left;" onclick="location.href = '<%=application.getContextPath() %>/mypage/Productmanagement'"></i>거래내역</header>

		<main>
			<div id="mainDiv">
				<ul class="list-inline firstli">
					<li class="list-inline-item menutitle"><button id="salebtn"
							onclick="location.href = '<%=application.getContextPath()%>/param/sale'">판매중</button></li>
					<li class="list-inline-item menutitle"><button
							id="completedbtn"
							onclick="location.href = '<%=application.getContextPath()%>/param/salecomplete'"
							style="border-bottom: 2px solid black;">거래완료</button></li>
					<li class="list-inline-item menutitle"><button
							onclick="location.href = '<%=application.getContextPath()%>/param/salehidden'">숨김</button></li>
				</ul>


				<div style="text-align: right; font-size: 22px; margin: 10px;">
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button" class="btn"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="box-shadow: 0 0 0 0;">
							<i class="fas fa-ellipsis-h"></i>
						</button>
						<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<li id="productChoice" class="cDisabled"><div
									class="dropdown-item" onclick="productChoice()">거래상품 선택</div></li>
							<li id="ReservationChoise" class="cDisabled"><div
									class="dropdown-item" onclick="ReservationChoise()">상품예약</div></li>
							<li id="hideenChoice" value="숨기기" class="cDisabled"><div
									class="dropdown-item" onclick="hideenChoice()">상품 숨기기</div></li>
							<li id="pullUp" class="cDisabled"><div class="dropdown-item"
									onclick="pullUp()">끌어올리기</div></li>
						</ul>
					</div>
				</div>

				<c:if test="${purchasedetailsCount == 0}">
					<div id="nonexistent">상품이 존재하지 않습니다.</div>
				</c:if>
				<div style="height: 676px; overflow: auto;" >
				<c:forEach var="SellerPhVO_list" items="${SellerPhVO }">
					
					<div class="shadow shadow-strong completed">

						<img alt=""
							src="${pageContext.request.contextPath}${SellerPhVO_list.iimagepath}">
						<div style="width: 100%;">
							<span style="font-weight: bold; color: darkorange;">[ 거래완료
								]</span> <br> <span style="font-weight: bold; font-size: 25px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden ;font-family: 'Sunflower', sans-serif; "> ${SellerPhVO_list.ititle}</span><br> <input type="checkbox"
									 name="radio_btn"
									value="${userItem_list.ititle }" id="titleRadio" onclick="oneCheck(this)"/><span>${SellerPhVO_list.address }</span>

 				<br>
							<c:choose>
								<c:when
									test="${SellerPhVO_list.refreshTime >= 0 && SellerPhVO_list.refreshTime < 60}">
									<span>${SellerPhVO_list.refreshTime}초 전</span>
									<br>
								</c:when>
								<c:when
									test="${SellerPhVO_list.refreshTime >= 60 && SellerPhVO_list.refreshTime < 3600}">
									<fmt:parseNumber var="percent"
										value="${((SellerPhVO_list.refreshTime) / 60)}"
										integerOnly="true" />
									<span>${percent}분 전</span>
									<br>
								</c:when>

								<c:when
									test="${SellerPhVO_list.refreshTime >= 3600 && SellerPhVO_list.refreshTime < 86400}">
									<fmt:parseNumber var="percent"
										value="${((SellerPhVO_list.refreshTime) / 3600)}"
										integerOnly="true" />
									<span>${percent }시간 전</span>
									<br>
								</c:when>

								<c:when
									test="${SellerPhVO_list.refreshTime >= 86400 && SellerPhVO_list.refreshTime < 2764800}">
									<fmt:parseNumber var="percent"
										value="${((SellerPhVO_list.refreshTime) / 86400)}"
										integerOnly="true" />
									<span>${percent }일 전</span>
									<br>
								</c:when>


								<c:when
									test="${SellerPhVO_list.refreshTime >= 2678400 && SellerPhVO_list.refreshTime < 32140800}">
									<fmt:parseNumber var="percent"
										value="${((SellerPhVO_list.refreshTime) / 2678400)}"
										integerOnly="true" />
									<span>${percent }달 전</span>
									<br>
								</c:when>
								<c:when test="${SellerPhVO_list.refreshTime >= 32140800}">
									<fmt:parseNumber var="percent"
										value="${((SellerPhVO_list.refreshTime) / 32140800)}"
										integerOnly="true" />
									<span>${percent }년 전</span>
									<br>
								</c:when>
							</c:choose>

							<span style="font-weight: bold; font-size: 20px;"> <c:set
									var="money" value="${SellerPhVO_list.price }" /> <fmt:formatNumber
									value="${money }" type="number" />원 <br></span>
						</div>
						<div style="width: 320px; align-self: flex-end;">
							<span style="margin: 0;" class="like_view"><i
								class="far fa-comments" style="color: skyblue;"></i>
								${SellerPhVO_list.likecnt } </span> <span style="margin: 0;"
								class="like_view"><i class="far fa-heart"
								style="color: red;"></i> ${SellerPhVO_list.viewcnt } </span> <br>


						</div>
					</div>
					<br>
				</c:forEach>
				</div>
				
				<br>
				<!-- <button id="revieShowwBtn"
					onclick="reviewShow()" class= "nonebtn" style="width: 140px;">구매자 후기 보기</button>
			 -->
				<input type="text" value="${success}" id="success"
					style="display: none;">
			</div>
		</main>
	</div>


	<script type="text/javascript">

		var success = document.getElementById("success");
		var radio_btn = document.getElementsByName("radio_btn");
		var radio_btn_check = 0;
		
		if (success.value == 'success') {
			location.href = '<%=application.getContextPath()%>/param/salecomplete';
			console.log(success.value + "확인");
		}
		
		if (radio_btn.length == 0) {
			document.getElementById("revieShowwBtn").style.display = 'none';
		}

		
		function oneCheck(element) {
			radio_btn.forEach((cd) => {
				cd.checked = false;
			});
			element.checked = true;
		}
		
		
		function revieShowwBtn() {
			for( var i = 0; i < radio_btn.length; i++ ){  		
				if(radio_btn[i].checked==true){
					console.log("확인");
					radio_btn_check++;
					return;
				}
			}	
			
			if(radio_btn_check==0){
	            alert("상품을 선택해주세요");
	            return;
	        }
		}
		
	</script>
</body>
</html>