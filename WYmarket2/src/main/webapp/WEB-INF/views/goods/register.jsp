<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <link rel="icon" href="<%=application.getContextPath() %>/image/salef.ico">
    <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/salef.ico">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
    <%-- var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("encoding", "multipart/form-data");
    form.setAttribute("enctype", "multipart/form-data");
    form.setAttribute("action", "<%=application.getContextPath() %>/goods/add/" 
    		+ ititle + "/" + icategory + "/" + icontent + "/" + price + "/" + iimagepath);
    document.body.appendChild(form);
    form.submit(); --%>
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

.select_img img { margin:20px 0; }

</style>

<title>상품등록</title>
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
				<h2>상품 등록</h2>
				<form action="./add" role="form" method="POST" name="form"
				 autocomplete="off"  enctype="multipart/form-data">
					
					<div class="inputArea">
						<label for="iimagepath">상품 이미지</label>
						<input type="file" id="iimagepath" name="file" />
						<div class="select_img"><img src=""/></div>
						
						<script>
							$("#iimagepath").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(500);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
						</script>
					</div>
					
					<div class="inputArea">
						<label for="ititle">상품명</label> <input type="text" id="ititle"
							name="ititle" />
					</div>
					<div class="inputArea">
						<label for="icategory">카테고리</label> 
						<select id="icategory" name="icategory" >
							<option selected>전체</option>
							<option>여성의류</option>
							<option>패션잡화</option>
							<option>남성의류</option>
							<option>디지털/가전</option>
							<option>도서/티켓/취미/애완</option>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="price">상품가격</label> <input type="text" id="price"
							name="price" />
					</div>
					
					<div class="inputArea">
						<label for="icontent">상품소개</label>
						<textarea rows="5" cols="50" id="icontent" name="icontent"></textarea>
					</div>
					
					<div class="inputArea">
						<input type="button" value="등록" onclick="inputCheck()"/>
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