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
			<c:choose>
				<c:when test="${pageVO.page<=1 }">[이전]&nbsp;</c:when>
				<c:when test="${pageVO.page>1 }">
					<a href="cartForm2?page=${pageVO.page-1 }">[이전]</a>&nbsp;
	</c:when>
			</c:choose>

			<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
				var="i">
				<a href="cartForm2?page=${i }">${i }</a>
			</c:forEach>
			<c:choose>
				<c:when test="${pageVO.page>=pageVO.maxPage }">[다음]&nbsp;</c:when>
				<c:when test="${pageVO.page<pageVO.maxPage }">
					<a href="cartForm2?page=${pageVO.page+1 }">[다음]</a>&nbsp;
	</c:when>
			</c:choose>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="./resources/vendor/chart.js/Chart.min.js"></script>
	<script src="./resources/vendor/datatables/jquery.dataTables.js"></script>
	<script src="./resources/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="./resources/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="./resources/js/demo/datatables-demo.js"></script>
	<script src="./resources/js/demo/chart-area-demo.js"></script>
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



</body>
</html>