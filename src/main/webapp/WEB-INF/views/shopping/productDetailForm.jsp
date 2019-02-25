<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="./resources/css/jcarousel.css" rel="stylesheet" />
<link href="./resources/css/flexslider.css" rel="stylesheet" />
<link href="./resources/css/style.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="./resources/skins/default.css" rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
   ======================================================= -->
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
<title>Insert title here</title>
</head>
<body>
	<!-- start header -->
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
								<li><a href="cartForm2?page=1">장바구니</a></li>
								<li><a href="memberLogout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->

	<section class="callaction">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="big-cta">
						<div class="cta-text">
							<h2>${productDetail.PRODUCT_NAME}</h2>
							<img
								src="./resources/uploadFile/${productDetail.PRODUCT_IMAGE_NAME }"
								width="73" height="70">

							<h3>${productDetail.PRODUCT_PRICE}원</h3>

							<h4>수량</h4>
							<input type="button" onclick="change(-1)"
								class="btn btn-secondary" value="-"> <input type="text"
								style="width: 50px;" name="amount" id="amount" value="1">
							<input type="button" onclick="change(1)"
								class="btn btn-secondary" value="+"> <br> <br>
							<a href="#" onclick="multisubmit(2)"
								class="btn btn-success btn-rounded">구매하기</a> <a href="#"
								onclick="multisubmit(1)" class="btn btn-danger btn-rounded">장바구니에
								담기</a>

							<c:if test="${category eq ''}">
								<a href="#" onclick="location='shoppingForm?page=${page}'"
									class="btn btn-warning btn-rounded">목록으로</a>
							</c:if>
							<c:if test="${category ne ''}">
								<a href="#"
									onclick="location='categorySearch?PRODUCT_CATEGORY=${category}&page=${page}'"
									class="btn btn-warning btn-rounded">목록으로</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<form action="purchaseForm" name="purchaseForm" id="purchaseForm"
		method="post">
		<input type="hidden" name="MEMBER_ID" id="MEMBER_ID"
			value="${sessionScope.MEMBER_ID}"> <input type="hidden"
			name="PRODUCT_NUM" id="PRODUCT_NUM"
			value="${productDetail.PRODUCT_NUM}"> <input type="hidden"
			name="PRODUCT_NAME" id="PRODUCT_NAME"
			value="${productDetail.PRODUCT_NAME}"> <input type="hidden"
			name="PRODUCT_PRICE" id="PRODUCT_PRICE"
			value="${productDetail.PRODUCT_PRICE}"> <input type="hidden"
			name="PRODUCT_CATEGORY" id="PRODUCT_CATEGORY"
			value="${productDetail.PRODUCT_CATEGORY}"> <input
			type="hidden" name="category" id="category" value="${category}">
		<input type="hidden" name="ORDER_AMOUNT" id="ORDER_AMOUNT">
	</form>
	<c:if test="${not empty reviewList }">
		<div style="width: 320px; height: auto; margin: auto;">
			<c:forEach var="review" items="${reviewList }">
				<table border="1" bordercolor="lightgray">
					<c:forEach var="review" items="${reviewList }">
						<tr>
							<td>${review.MEMBER_ID }&nbsp;${review.PRODUCT_REVIEW_DATE }</td>
						</tr>
						<tr bgcolor="F5F5F5">
							<td width="550">
								<div class="text_wrapper">${review.PRODUCT_REVIEW_CONTENT }</div>
							</td>
						</tr>

					</c:forEach>
				</table>
			</c:forEach>
		</div>
		<br>
		
		<div style="width: 150px; margin: auto;">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pageVO.page<=1 }">
					<input type="button" class="btn btn2" disabled value="◀">
				</c:when>
				<c:when test="${pageVO.page>1 }">
					<input type="button" class="button1"
						onclick="location.href='productDetailForm?PRODUCT_NUM=${productDetail.PRODUCT_NUM }&page=${page }&page2=${pageVO.page-1}'"
						value="◀">
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
						onclick="location.href='productDetailForm?PRODUCT_NUM=${productDetail.PRODUCT_NUM }&page=${page }&page2=${i}'"
						value="${cnt.count }">
				</c:if>

			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="${pageVO.page>=pageVO.maxPage }">
					<input type="button" class="btn btn2" disabled value="▶">
				</c:when>
				<c:when test="${pageVO.page<pageVO.maxPage }">
					<input type="button" class="button1"
						onclick="location.href='productDetailForm?PRODUCT_NUM=${productDetail.PRODUCT_NUM }&page=${page }&page2=${pageVO.page+1}'"
						value="▶">
				</c:when>
			</c:choose>
		</div>
	</c:if>
	<!-- javascript
    ================================================== -->
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
	<script>
		function change(num) {
			console.log()
			var cc = Number(document.getElementById("amount").value);
			if ((cc + num) >= 1) {
				document.getElementById("amount").value = cc + num;
				document.getElementById("ORDER_AMOUNT").value = cc + num;
			} else {
				alert('최소수량 은 1개 입니다.');
			}
		}

		function multisubmit(index) {
			var id = (document.getElementById("MEMBER_ID").value);
			var category = document.getElementById("PRODUCT_CATEGORY").value;
			var amount = document.getElementById("amount").value;
			document.getElementById("ORDER_AMOUNT").value = amount;

			if (id == null || id == '') {
				alert("로그인 후 이용 가능합니다.");
			} else {
				if (index == 2) {
					document.purchaseForm.action = "purchaseForm";
				} else {
					/* document.purchaseForm.action = "cartAction2"; */
					document.purchaseForm.submit();
					var answer = confirm("장바구니에 담겼습니다. 확인 하시겠습니까?");
					if (answer) {
						document.purchaseForm.action = "cartForm";
					} else {
						document.purchaseForm.action = "cartAction?page=1&PRODUCT_CATEGORY="
								+ category;
					}
				}
				document.purchaseForm.submit();
			}

		}
	</script>
</body>
</html>