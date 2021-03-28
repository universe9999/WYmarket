<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
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
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/register.css">
<style>
* {
	box-sizing: border-box;
	user-select: none;
}

#blocker {
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 100%;
}

#cycleDiv {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 2;
}
</style>

<title>로딩 중..</title>
</head>
<body>

	<div id='blocker'></div>
	<div class="d-flex justify-content-center" id='cycleDiv'>
		<div class="spinner-border" style="width: 3rem; height: 3rem;"
			role="status">
			<span class="visually-hidden" id='cycle'>Loading...</span>
		</div>
	</div>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
		<section class="container">
			<h2>상품 등록</h2>
			<form action="./add" role="form" method="POST" name="form"
				autocomplete="off" enctype="multipart/form-data">
				<ul class="sc-as a1">
					<li class="sc-ve a2">
						<div class="sc-Dr a311">상품이미지</div>
						<div class="sc-ge a32">
							<ul class="sc-ht a4">
								<li class="sc-tr a51">
									<!-- 이미지 등록하는 버튼 --> 이미지 등록 <input type="file" id="iimagepath"
									name="file" accept="image/jpg, image/jpeg, image/png" />
								</li>
								<li draggable="false" class="sc-bn a52" id="sc-bn a52">
									<div class="select_img" id="select_img">
										<img src="" />
									</div> <script>
										$(document).ready(function(){
											$("#select_img").hide();
										})
									
										$("#iimagepath").change(function(){
										   if(this.files && this.files[0]) {
										    var reader = new FileReader;
										    reader.onload = function(data) {
										     $(".select_img img").attr("src", data.target.result).width(200);        
										    }
										    reader.readAsDataURL(this.files[0]);
										    $("#select_img").show();
										   }
										  });
									</script>
								</li>
							</ul>
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Dr a311">제목</div>
						<div class="sc-Ge a322">
							<input type="text" id="ititle" name="ititle"
								placeholder="상품명을 입력해주세요" />
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Ww a3111">카테고리</div>
						<div class="sc-Vv a3222">
							<select id="icategory" name="icategory">
								<option selected>전체</option>
								<option>여성의류</option>
								<option>패션잡화</option>
								<option>남성의류</option>
								<option>디지털/가전</option>
								<option>도서/티켓/취미/애완</option>
							</select>
						</div>
					</li>
					<li class="sc-ve a2">
						<!-- 가격 -->
						<div class="sc-TE a3111">가격</div>
						<div class="sc-Ge a322">
							<input type="text" id="price" placeholder="숫자만 입력해주세요."
								name="price" />
						</div>
					</li>
					<li class="sc-ve a2">
						<!-- 소개 -->
						<div class="sc-TE a3111">상품 설명</div>
						<div class="sc-Ge a322">
							<textarea rows="6" cols="50" id="icontent" name="icontent"
								class="sc-HA a4"></textarea>
						</div>
					</li>
					<li class="sc-ve a2">
						<div class="sc-Ff a33">
							<input class="btn btn-primary" type="button" value="등록"
								onclick="inputCheck()">
						</div>
					</li>
				</ul>
			</form>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

	<script type="text/javascript">
	$("root").find("input, select, button, textarea").prop("disabled",true);
	setTimeout(() => {
		location.href='<%=application.getContextPath()%>/main';
	}, 5000);
</script>

</body>
</html>