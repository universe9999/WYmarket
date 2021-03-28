<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
 <link rel="icon" href="<%=application.getContextPath() %>/image/wyfavicon.ico">
    <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/wyfavicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script> 
$('.carousel').carousel({ 
	interval: 1000 //기본 5초
	})
</script>


<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/main.css">
<style type="text/css">
* {
	box-sizing: border-box;
} 
/*
#logoutheader {
	display: flex;
	justify-content: flex-end;
} */
#myCarousel{
	width: 1200px;
	margin:0 auto; 
	margin-bottom: 40px;
}
.carousel-indicators{
	margin:0 auto;
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
		 
		<section id="container">
			<div id="container_box"> 
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="image/page1.jpg" alt="page1">
				    </div>
				    <div class="item">
				      <img src="image/page2.jpg" alt="page2">
				    </div>
				    <div class="item">
				      <img src="image/page3.jpg" alt="page3">
				    </div>
				    <div class="item">
				      <img src="image/page4.jpg" alt="page4">
				    </div>
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				
				<%@ include file="goods/list.jsp"%>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>


	<script>
	
/* 	console.log("AdminNick in Main.jsp" + "${Admin.adminNick}");
	if("${Admin.adminNick}" != ""){
			var form = document.createElement("form");
		    form.setAttribute("method", "get");
		    form.setAttribute("action", "/wymarket/admin");
			document.body.appendChild(form);
		    form.submit();
	} */
	
/* 		if (window.performance.navigation.type == 1) {
			window.location.href = '/wymarket/login';
		} */

		/* F5, Ctrl+r, Ctrl+F5 */
		/* document.onkeydown = function(e){
		 if(e.keyCode == 116 || e.ctrlKey == true && (e.keyCode == 82)){
		 e.cancelBubble = true; 
		 e.returnValue = false; 
		 setTimeout(function(){
		 window.location.href = '/wymarket/login';
		 }, 1000);
		 return false;
		 }
		 } */
		 
	 
		 
	</script>

</body>
</html>