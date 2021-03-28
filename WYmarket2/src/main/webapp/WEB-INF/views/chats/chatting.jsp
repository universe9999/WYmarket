<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/chatf.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/chatf.ico">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<title>채팅방</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
 
</head>
<style>
.cen {
	text-align-last: center;
}

.style {
	justify-content: center;
}

.content {
	height: 600px;
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	box-shadow: 1px 1px 10px rgb(180, 178, 178);
	border-radius: 1.0rem;
	padding: 10px 0;
	background-color: rgb(251, 250, 250);
}

.top {
	margin-top: 10%;
	margin-bottom: 20px;
	font-size: 50px;
	color: orange;
}

.btn-primary {
	background-color: rgba(255, 191, 82, 1);
	border: none;
}

.btn-primary:hover {
	background-color: #FF8A3D;
}
</style>
<body>
	<div class="container-md cen style">
		<div class="top">WY Talk Room</div>
	<!-- 	<button onclick="location.href='/wymarket/main'" class="btn btn-primary" type="button" style="background-color: gray;">메인으로</button><br><br>  -->
		<div class="content" style="overflow: auto;">
			${userNick}님의 채팅방 목록
			<hr>
			<c:forEach var="vo" items="${sellerList}">
				<button type="button"
					onclick="window.open('./room?roomId=${vo.roomId }&item=${vo.item}&price=${vo.price}&sellerName=${vo.sellerName}&buyerName=${vo.buyerName}&check=0','채팅방','width=650,height=800,left=650,top=130,status=no,scrollbars=yes')"
					class="btn btn-primary">
					구매자 : ${vo.buyerName}<br> 판매상품 : ${vo.item}<br> 연락 시간 :
					<fmt:formatDate value="${vo.chatDate}" pattern="yy/MM/dd HH:mm" />
					<span class="badge bg-secondary">${vo.buyerCount}</span>
				</button>
				<!-- 삭제 버튼 -->
				<button onclick="location.href='/wymarket/chats/chatting?roomId=${vo.roomId }&delete=true'" class="btn btn-primary" type="button" id="btnDelete" style="background-color: gray;">x</button>
				
				<br>
				<br>
			</c:forEach>
			<br>
			<hr>
			<c:forEach var="vo" items="${buyerList}">
				<button type="button"
					onclick="window.open('./room?roomId=${vo.roomId }&item=${vo.item}&price=${vo.price}&sellerName=${vo.sellerName}&buyerName=${vo.buyerName}&check=0','chat','width=650,height=800,left=650,top=130,status=no,scrollbars=yes')"
					class="btn btn-primary">
					판매자 : ${vo.sellerName}<br>  연락 시간 :
					<fmt:formatDate value="${vo.chatDate}" pattern="yy/MM/dd HH:mm" />
					<span class="badge bg-secondary">${vo.sellerCount}</span>
				</button>
					<!-- 삭제 버튼 -->
				<button onclick="location.href='/wymarket/chats/chatting?roomId=${vo.roomId }&delete=true'" class="btn btn-primary" type="button" id="btnDelete" style="background-color: gray;">x</button>
				<br>
				<br>
			</c:forEach>

		</div>
	</div>



</body>
</html>