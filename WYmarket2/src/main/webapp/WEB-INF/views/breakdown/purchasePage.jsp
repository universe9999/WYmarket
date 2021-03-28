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

<%@ include file="/WEB-INF/views/breakdown/incloud/font_css.jspf"%>

<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/breakdown.css">
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">



</head>
<body>
	<div id="grid_2" class="div">

		<header
			style="padding: 20px; text-align: center; font-family: 'Noto Sans KR', sans-serif; font-size: 40px;"
			class="titlefont">
			<i class="fas fa-arrow-left cPoint" style="float: left;"
				onclick="location.href = '<%=application.getContextPath() %>/mypage/Productmanagement'"></i>
			구매내역
		</header>
		<!-- 로그인 정보 세션 -->

		<main>
			<div id="mainDiv">
			<%-- 	<div>
					<ul class="list-inline firstli">
						<li class="list-inline-item menutitle "><button id="salebtn"
								class="shadow--sm "
								onclick="location.href = '<%=application.getContextPath()%>/param/sale'"
								style="border-bottom: 2px solid black;">구매후기 대기중</button></li>
						<li class="list-inline-item menutitle"><button
								id="completedbtn" class="shadow--sm "
								onclick="location.href = '<%=application.getContextPath() %>/param/salecomplete'">구매후기
								환료</button></li>
					</ul>
				</div> --%>
<div style="height: 676px; overflow: auto;" >
				<c:forEach var="PurchaserPhVO_list" items="${PurchaserPhVO }">

			
 		

					<div class="shadow shadow-strong completed"
						style="padding: 15px 15px; border-radius: 1rem;">

						<img alt=""
							src="${pageContext.request.contextPath}${PurchaserPhVO_list.iimagepath}"
							style="width: 300px; height: 165px; border: solid 2px #dee2e6; border-radius: 0.5rem;">

						<div style="width: 100%;">
							<span style="font-weight: bold; color: darkorange;">[ 구매완료
								]</span> <br> <input type="checkbox" name="radio_btn"
								value="${userItem_list.itemid }" id="titleRadio"
								onclick="oneCheck(this)"  style="display: none;"/> <span
								style="font-weight: bold; font-size: 27px;">
								${PurchaserPhVO_list.ititle } </span> <br> <span style="white-space: nowrap;">
								${PurchaserPhVO_list.address }</span> <br>
							<c:choose>
								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 0 && PurchaserPhVO_list.refreshTime < 60}">
									<span>${PurchaserPhVO_list.refreshTime}초 전</span>
									<br>
								</c:when>

								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 60 && PurchaserPhVO_list.refreshTime < 3600}">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 60)}"
										integerOnly="true" />
									<span>${percent}분 전</span>
									<br>
								</c:when>

								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 3600 && PurchaserPhVO_list.refreshTime < 86400}">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 3600)}"
										integerOnly="true" />
									<span>${percent}시간 전</span>
									<br>
								</c:when>

								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 86400 && PurchaserPhVO_list.refreshTime < 2764800} ">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 86400)}"
										integerOnly="true" />
									<span>${percent }일 전</span>
									<br>
								</c:when>


								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 86400 && PurchaserPhVO_list.refreshTime < 2764800}">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 86400)}"
										integerOnly="true" />
									<span>${percent}일 전</span>
									<br>
								</c:when>

								<c:when
									test="${PurchaserPhVO_list.refreshTime >= 2678400 && PurchaserPhVO_list.refreshTime < 32140800}">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 2678400)}"
										integerOnly="true" />
									<span>${percent }달 전</span>
									<br>
								</c:when>
								<c:when test="${PurchaserPhVO_list.refreshTime >= 32140800}">
									<fmt:parseNumber var="percent"
										value="${((PurchaserPhVO_list.refreshTime) / 32140800)}"
										integerOnly="true" />
									<span>${percent }년 전 </span>
									<br>
								</c:when>
							</c:choose>

							<input type="radio" value="${PurchaserPhVO_list.itemid }"
								name="itemid" style="display: none"> <span
								style="font-weight: bold; font-size: 20px;"> <c:set
									var="money" value="${PurchaserPhVO_list.price }" /> <fmt:formatNumber
									value="${money }" type="number" />원 <br></span>
						
						<div style="align-self: flex-end;">
							<span style="margin: 0;" class="like_view"><i
								class="far fa-comments" style="color: skyblue;"></i>
								${PurchaserPhVO_list.likecnt } </span> <span style="margin: 0;"
								class="like_view"><i class="far fa-heart"
								style="color: red;"></i> ${PurchaserPhVO_list.viewcnt } </span> <br>
						</div>
						</div>
						
					</div>
					<br>
					
			
				
				

				</c:forEach>
				</div>
					<div id="nonexistent" style="display: none;"></div>
			<!-- 	<button class="nonebtn" id="reviewBtn" style="width: 160px;"
					onclick="reviewWriting()">구매 후기남기기</button>
			</div> -->
		</main>
	</div>


	<script type="text/javascript">

var radio_btn = document.getElementsByName("radio_btn");
var radio_btn_check = 0;
const nonexistent1 = document.getElementById("nonexistent");
if (radio_btn.length == 0) {
	console.log(radio_btn.length);
	/* nonexistent1.style.display = 'block'; */
	nonexistent1.innerText = '구매하신 상품이 존재하지 않습니다.';
	document.getElementById("reviewBtn").style.display = 'none';

}



function oneCheck(element) {
	radio_btn.forEach((cd) => {
		cd.checked = false;
	});
	element.checked = true;
}

function reviewWriting() {
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