<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='icontent'] {
	display: block;
}

input {
	width: 150px;
}

textarea#icontent {
	width: 400px;
	height: 180px;
}

.select_img img {
	margin: 20px 0;
}
</style>

<title>상품조회</title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		<section id="container">
			<div id="container_box">
				<h2>상품 목록</h2>

				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="n" value="${goods.itemid}" />

					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label> <img
							src="${pageContext.request.contextPath}${goods.iimagepath }" />
					</div>
					<div class="inputArea">
						<label for="usernick">판매자</label> <span>${goods.usernick}</span>
					</div>
					<div class="inputArea">
						<label for="ititle">상품명</label> <span>${goods.ititle}</span>
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label> <span>${goods.icategory}</span>
					</div>

					<div class="inputArea">
						<label for="price">상품가격</label> <span><fmt:formatNumber
								value="${goods.price}" pattern="###,###,###" /></span>
					</div>

					<div class="inputArea">
						<label for="icontent">상품소개</label> <span>${goods.icontent}</span>
					</div>

					<div class="inputArea">
						<%-- <a href="goods/view?n=${goods.itemid}"> --%>
						<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

						<c:set var="sellerId" value="${sellerId}" />
						<c:set var="buyerId" value="${buyerId}" />

						<c:if test="${sellerId ne buyerId}">
							<%-- 자신이 올린 판매글에 들어가면 채팅 거래하기 없음 --%>
							<button type="button" id="chat_Btn"
								onclick="window.open('<%=application.getContextPath()%>/chats/room?roomId=${sellerId}${buyerId}&buyerName=${buyerName}&sellerName=${goods.usernick}&item=${goods.ititle}&price=${goods.price}&check=0','채팅방','width=650,height=800,left=650,top=130,status=no,scrollbars=yes')">
								채팅으로 거래하기</button>
						</c:if>

						<script>
							var formObj = $("form[role='form']");

							$("#modify_Btn").click(function(){
								formObj.attr("action", "./modify");//action
								formObj.attr("method", "get")
								formObj.submit();
							});

							$("#delete_Btn").click(function() {
								formObj.attr("action", "./delete");
								formObj.submit();
							});
						</script>
					</div>

				</form>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>