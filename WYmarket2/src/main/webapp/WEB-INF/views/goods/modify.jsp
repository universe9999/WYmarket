<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <link rel="icon" href="<%=application.getContextPath() %>/image/salef.ico">
    <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/salef.ico">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function inputCheck() {
	var iimagepath = document.form.iimagepath.value;
    const ititle = document.getElementById("ititle").value;
    const icg = document.getElementById("icategory");
    const icategory = icg.options[icg.selectedIndex].value;
    const icontent = document.getElementById("icontent").value;
    const price = document.getElementById("price").value;
    
    if (iimagepath == null || iimagepath == "") {
        alert('이미지를 등록해주세요');
        document.form.iimagepath.focus();
        return;
    }
    if (ititle == null || ititle == "") {
        alert('제목을 입력해주세요');
        document.form.ititle.focus();
        return;
    }
    if (icategory == null || icategory == "전체") {
        alert('카테고리를 선택해주세요');
        document.form.icategory.focus();
        return;
    }
    if (price == null || price == ""){
        alert('가격을 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (price.match(/^[0-9]*$/ig) == null){
        alert('숫자만 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (price <= 100){
    	alert('100원 이상 입력해주세요');  
        document.form.price.focus();                       
        return;  
    }
    if (icontent == null || icontent == "") {
        alert('내용을 입력해주세요');
        document.form.icontent.focus();
        return;
    }
    document.form.submit();
}
</script>
<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 150px;
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
	height: 400px;
}

.select_img img {
	width: 300px;
	height: 300px;
	margin: 20px 0;
}
</style>

<title>상품수정</title>
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
				<h2>상품 수정</h2>

				<form role="form" method="POST" name="form"
					autocomplete="off" enctype="multipart/form-data">
					
					<input type="hidden" name="itemid" value="${goods.itemID}" />

					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label>
						<input type="file" id="iimagepath" name="iimagepath" />
						<div class="select_img">
							<img src="${pageContext.request.contextPath}${goods.simagePath }" />
							<input type="hidden" name="iimagepath" value="${pageContext.request.contextPath}${goods.simagePath }" />
						</div>
						<script>
							$("#iimagepath").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(300);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
						</script>
					</div>
					
					<div class="inputArea">
						<label for="ititle">상품명</label>
						<input type="text" id="ititle" name="ititle" value="${goods.stitle}"/>
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label> 
						<select id="icategory" name="icategory" >
							<option selected>${goods.scategory}</option>
							<option>여성의류</option>
							<option>패션잡화</option>
							<option>남성의류</option>
							<option>디지털/가전</option>
							<option>도서/티켓/취미/애완</option>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="price">상품가격</label>
						<input type="text" id="price" name="price" value="${goods.price}"/>
					</div>
					
					<div class="inputArea">
						<label for="icontent">상품소개</label>
						<input type="text" id="icontent" name="icontent" value="${goods.scontent}"/>
					</div>
					

					<div class="inputArea">
						<input type="button" id="update_Btn" value="완료" onclick="inputCheck()" />
						<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
						<script>
							$("#back_Btn").click(function(){
								history.back();
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