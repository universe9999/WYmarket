<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<link rel="shortcut icon"
	href="<%=application.getContextPath()%>/image/salef.ico">
<title>리스트</title>

<link rel="stylesheet"
   href="<%=application.getContextPath()%>/resources/assets/css/myPage.css" />
<style>
section#content ul {
	margin: 0px 100px 0px 190px;
}

section#content ul li {
	display: inline-block;
	margin: 0px 10px 10px 0px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}

section#content div.iimagepath img {
	width: 200px;
	height: 200px;
}

section#content div.ititle {
	padding: 10px 0;
	text-align: center;
	font-weight: 500;
	border-top-style: solid;
	border-top-width: 1px;
	border-top-color: silver;
}

section#content div.ititle a {
	color: #000;
}

section#content div.price {
	font-weight: bold;
	padding-left: 15px;
	font-size: 16px
}

section#content div.refreshtime1 {
	text-align: right;
	padding: 0px 15px 10px 0px;
	color: silver;
	font-size: 13px
}
.fwledp2{
	width: 280px;
    margin: 8px 10px;
}
.cFzedp2{
	position: relative;
    width: 100%;
    height: 278px;
}
</style>

</head>
<body>
	<div id="root">

		<section id="container">
			<div id="container_box">
	<div style="display: flex; justify-content: center;">
				<section id="content">
				<div style="width: 1200px;">
					<div style="width: 100%;">                       		
                              <div class="khixbV">
                                 <c:forEach var="goods" items="${goods }">
                                    <c:if test="${goods.istate eq 'Onsale'}">
                                       <div class="fwledp2">

                                          <div class="jJGnAY">
                                             <div class="cFzedp2">
                                                <a
                                                   href="<%=application.getContextPath()%>/goods/view2?n=${goods.itemid}">
                                                   <img alt=""
                                                   src="${pageContext.request.contextPath}${goods.iimagepath}"
                                                   style="width: 100%; height: 100%;">
                                                </a>
                                             </div>
                                             <div class="jFyxuP">

                                                <div class="dPZorb">
                                                   <c:if
                                                      test="${goods.ireservationstate eq 'Yreservation'}">
                                                      <span style="font-weight: bold; color: darkorange;">[
                                                         예약중 ]</span>

                                                   </c:if>
                                                   ${goods.ititle }

                                                </div>
                                                <div class="clniGs">
                                                   <div class="hxBDFe">
                                                      <c:set var="money" value="${goods.price }" />
                                                      <fmt:formatNumber value="${money }" type="number" />
                                                      원


                                                   </div>
                                                   <div class="dfsKyK">
                                                      <c:choose>
                                                         <c:when
                                                            test="${goods.refreshtime >= 0 && goods.refreshtime < 60}">
                                                            <span>${goods.refreshtime}초 전</span>
                                                            <br>
                                                         </c:when>

                                                         <c:when
                                                            test="${goods.refreshtime >= 60 && goods.refreshtime < 3600}">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 60)}"
                                                               integerOnly="true" />
                                                            <span>${percent}분 전</span>
                                                            <br>
                                                         </c:when>

                                                         <c:when
                                                            test="${goods.refreshtime >= 3600 && goods.refreshtime < 86400}">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 3600)}"
                                                               integerOnly="true" />
                                                            <span>${percent}시간 전</span>
                                                            <br>
                                                         </c:when>

                                                         <c:when
                                                            test="${goods.refreshtime >= 86400 && goods.refreshtime < 2764800} ">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 86400)}"
                                                               integerOnly="true" />
                                                            <span>${percent }일 전</span>
                                                            <br>
                                                         </c:when>


                                                         <c:when
                                                            test="${goods.refreshtime >= 86400 && goods.refreshtime < 2764800}">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 86400)}"
                                                               integerOnly="true" />
                                                            <span>${percent}일 전</span>
                                                            <br>
                                                         </c:when>

                                                         <c:when
                                                            test="${goods.refreshtime >= 2678400 && goods.refreshtime < 32140800}">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 2678400)}"
                                                               integerOnly="true" />
                                                            <span>${percent }달 전</span>
                                                            <br>
                                                         </c:when>
                                                         <c:when test="${goods.refreshtime >= 32140800}">
                                                            <fmt:parseNumber var="percent"
                                                               value="${((goods.refreshtime) / 32140800)}"
                                                               integerOnly="true" />
                                                            <span>${percent }년 전 </span>
                                                            <br>
                                                         </c:when>
                                                      </c:choose>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="lkXrFk">
                                                <i class="fas fa-map-marker-alt"
                                                   style="width: 15px; height: 17px; position: relative; bottom: 1px;"></i>
                                                <span class="address"
                                                   style="position: relative; top: -4px;"> <input
                                                   name="addressinput" type="text" style="display: none;"
                                                   value="${goods.address }" />
                                                   ${goods.address }
                                                </span>
                                             </div>
                                          </div>
                                       </div>
                                    </c:if>
                                 </c:forEach>
                              </div>
                          
                       



                     </div>
                     </div>
				</section>
				</div>
			</div>
		</section>

	</div>

</body>
</html>