<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="./resources/css/jcarousel.css" rel="stylesheet" />
<link href="./resources/css/flexslider.css" rel="stylesheet" />
<link href="./resources/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="./resources/skins/default.css" rel="stylesheet" />
<!-- Bootstrap Core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="./resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">
<!-- DataTables CSS -->
<link
	href="./resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link
	href="./resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="./resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="./resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- 페이지 버튼 css -->
<style>
.button1 {
	width: 35px;
	height: 35px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	background-color: #f8585b;
	border-radius: 10px;
}

.btn2 {
	width: 35px;
	height: 35px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	background-color: #f8585b;
	border-radius: 10px;
	disabled;
}
</style>
</head>

<script>
	function multisubmit(index, orderN,page) {		
		var orderNum = document.getElementById('order'+orderN).value;
		document.getElementById("ORDER_NUM").value = orderNum;
		
		console.log(page);
		if (index == 1) {
		         document.purchaseForm.action = "purchaseForm2";
		      } else {
		         document.purchaseForm.action = "delete?page="+page;
		      }
		document.purchaseForm.submit();
	}
</script>
<body>
	<header>
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home"><span>H</span>ealing</a>
				</div>
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<c:choose>
							<c:when test="${sessionScope.MEMBER_ID == null}">
								<li><a href="loginForm">로그인</a></li>
								<li><a href="joinDivisionForm">회원가입</a></li>
							</c:when>
							<c:when test="${MEMBER_DIVISION == 4 }">
								<li><a href="adminModeForm">관리자 모드</a></li>
								<li><a href="memberLogout">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="memberInfoForm">회원정보</a></li>
								<li><a href="memberLogout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div
		style="dorder: 1px dashed #BDBDBD; width: 80%; height: auto; margin: auto;">
		<form action="purchaseForm" name="purchaseForm" id="purchaseForm"
			method="POST">
			<input type="hidden" id="ORDER_NUM" name="ORDER_NUM">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>구매 / 삭제</th>
					</tr>
				</thead>
				<c:forEach var="cart" items="${cartList}" varStatus="cnt">
					<tr>
						<td><img
							src="./resources/uploadFile/${product.get(cnt.index).PRODUCT_IMAGE_NAME }"
							width="73" height="70">${cart.PRODUCT_NAME }</td>
						<td>${cart.ORDER_AMOUNT }</td>
						<td>${cart.ORDER_PRICE }</td>
						<td><input class="btn btn-success" type="button"
							onclick="multisubmit(1, ${cart.ORDER_NUM})" value="구매하기">
							<input class="btn btn-danger" type="button"
							onclick="multisubmit(2, ${cart.ORDER_NUM},${pageVO.page })"
							value="삭제하기"></td>
					</tr>
					<input type="hidden" id="order${cart.ORDER_NUM}"
						name="order${cart.ORDER_NUM}" value="${cart.ORDER_NUM}">
				</c:forEach>
			</table>
		</form>

		<div style="width: 340px; margin: auto;">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pageVO.page<=1 }">
					<input type="button" class="btn btn2" disabled value="◀">
				</c:when>
				<c:when test="${pageVO.page>1 }">
					<input type="button" class="button1"
						onclick="movePage(${pageVO.page-1 })" value="◀">
				</c:when>
			</c:choose>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
				varStatus="cnt">

				<c:if test="${pageVO.page == cnt.count }">
					<input type="button" class="btn btn2" value="${cnt.count }"
						disabled>
				</c:if>
				<c:if test="${pageVO.page != cnt.count }">
					<input type="button" class="button1"
						onclick="movePage(${cnt.count })" value="${cnt.count }">
				</c:if>

			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="${pageVO.page>=pageVO.maxPage }">
					<input type="button" class="btn btn2" disabled value="▶">
				</c:when>
				<c:when test="${pageVO.page<pageVO.maxPage }">
					<input type="button" class="button1"
						onclick="movePage(${pageVO.page+1 })" value="▶">
				</c:when>
			</c:choose>
		</div>
	</div>

	<form id="searchInfo" name="searchInfo" action="cartForm2" method="get">
		<input type="hidden" id="page" name="page">
	</form>
	<!-- Bootstrap core JavaScript-->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./resources/js/jquery.js"></script>
	<script src="./resources/js/jquery.easing.1.3.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.fancybox.pack.js"></script>
	<script src="./resources/js/jquery.fancybox-media.js"></script>
	<script src="./resources/js/google-code-prettify/prettify.js"></script>
	<script src="./resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="./resources/js/portfolio/setting.js"></script>
	<script src="./resources/js/jquery.flexslider.js"></script>
	<script src="./resources/js/animate.js"></script>
	<script src="./resources/js/custom.js"></script>

	<script type="text/javascript">
function movePage(page){
	document.getElementById("page").value = page;
    document.searchInfo.submit();
}
</script>

</body>
</html>