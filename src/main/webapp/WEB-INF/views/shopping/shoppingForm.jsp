<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="">
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
<title>boardForm.jsp 파일입니다.</title>
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
<script>
	function allSearch(page) {
		location.href = "allSearch?page="+page;
	}
	function tent(page) {
		location.href = "categorySearch?PRODUCT_CATEGORY=텐트"+"&page="+page;
	}

	function tarp(page) {
		location.href = "categorySearch?PRODUCT_CATEGORY=타프"+"&page="+page;
	}

	function cooking(page) {
		location.href = "categorySearch?PRODUCT_CATEGORY=취사용품"+"&page="+page;
	}

	function camping(page) {
		location.href = "categorySearch?PRODUCT_CATEGORY=캠핑용품"+"&page="+page;
	}
</script>
<style>
input[type=text] {
	border: 2px solid black;
	border-radius: 4px;
	width: 200px;
	height: 40px;
}
</style>
<title>쇼핑폼</title>

</head>
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
								<li><a href="#" onclick="location.href='cartForm2?page=1'">
										장바구니 </a></li>
							</c:when>
							<c:when test="${MEMBER_DIVISION == 4 }">
								<li><a href="adminModeForm">관리자 모드</a></li>
								<li><a href="memberLogout">로그아웃</a></li>
								<li><a href="#" onclick="location.href='cartForm2?page=1'">
										장바구니 </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="memberInfoForm">회원정보</a></li>
								<li><a href="memberLogout">로그아웃</a></li>
								<li><a href="#" onclick="location.href='cartForm2?page=1'">
										장바구니 </a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div style="width: 340px; margin: auto;">
		<form action="searchText" name="searchText" id="searchText">
			<input type="text" id="searchText" name="searchText"
				placeholder="상품명 검색" value="${ searchText}"> <input
				type="hidden" name="page" id="page" value="1"> <input
				type="submit" class="btn btn-success" value="검색">
		</form>

	</div>
	<input type="button" class="btn btn-primary" onclick="allSearch(1)"
		value="전체" />
	<input type="button" class="btn btn-primary" onclick="tent(1)"
		value="텐트" />
	<input type="button" class="btn btn-primary" onclick="tarp(1)"
		value="타프" />
	<input type="button" class="btn btn-primary" onclick="cooking(1)"
		value="취사용품" />
	<input type="button" class="btn btn-primary" onclick="camping(1)"
		value="캠핑용품" />
	<br>

	<!-- 상품목록 표시부분 -->

	<div class="row">
		<div class="col-lg-12">
			<div class="row">
				<section id="projects">
					<ul id="thumbs" class="portfolio">
						<!-- Item Project and Filter Name -->
						<c:forEach var="product" items="${productList }"
							varStatus="status">
							<li class="col-lg-3 design" data-id="id-0" data-type="web">
								<div class="item-thumbs">
									<h1>
										<a
											href="productDetailForm?PRODUCT_NUM=${product.PRODUCT_NUM}&page=${pageVO.page}&page2=1&PRODUCT_CATEGORY=${pageVO.PRODUCT_CATEGORY}">
											<img style="width: 250px; height: 150px;"
											src="./resources/uploadFile/${product.PRODUCT_IMAGE_NAME }">
										</a>
									</h1>
									<h3>
										${product.PRODUCT_NAME }<br>${product.PRODUCT_PRICE }원
									</h3>
								</div>
							</li>
						</c:forEach>
						<!-- End Item Project -->
					</ul>
				</section>

				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="width: 340px; margin: auto;">
		<c:choose>
			<c:when test="${pageVO.page<=1 }">
				<input type="button" class="btn btn2" value="◀" disabled>
			</c:when>
			<c:when test="${pageVO.page>1 }">
				<c:if test="${ searchText eq null}">
					<c:choose>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '텐트'}">
							<input type="button" class="button1"
								onclick="tent(${pageVO.page-1})" value="◀">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '타프'}">
							<input type="button" class="button1"
								onclick="tarp(${pageVO.page-1})" value="◀">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '취사용품'}">
							<input type="button" class="button1"
								onclick="cooking(${pageVO.page-1})" value="◀">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '캠핑용품'}">
							<input type="button" class="button1"
								onclick="camping(${pageVO.page-1})" value="◀">
						</c:when>
						<c:otherwise>
							<input type="button" class="button1"
								onclick="allSearch(${pageVO.page-1})" value="◀">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ searchText ne null}">
					<input
						onclick="location.href='searchText?page=${pageVO.page-1 }&searchText=${ searchText }'"
						class="button1" value="◀">
				</c:if>

			</c:when>
		</c:choose>
		<!--페이지 번호  -->
		<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
			varStatus="cnt">
			<c:if test="${ searchText eq null}">
				<c:if test="${pageVO.page == cnt.count }">
					<c:choose>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '텐트'}">
							<input type="button" class="btn btn2" disabled
								onclick="tent(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '타프'}">
							<input type="button" class="btn btn2" disabled
								onclick="tarp(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '취사용품'}">
							<input type="button" class="btn btn2" disabled
								onclick="cooking(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '캠핑용품'}">
							<input type="button" class="btn btn2" disabled
								onclick="camping(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:otherwise>
							<input type="button" class="btn btn2" disabled
								onclick="allSearch(${cnt.count})" value="${cnt.count}">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${pageVO.page != cnt.count }">
					<c:choose>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '텐트'}">
							<input type="button" class="button1" onclick="tent(${cnt.count})"
								value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '타프'}">
							<input type="button" class="button1" onclick="tarp(${cnt.count})"
								value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '취사용품'}">
							<input type="button" class="button1"
								onclick="cooking(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '캠핑용품'}">
							<input type="button" class="button1"
								onclick="camping(${cnt.count})" value="${cnt.count}">
						</c:when>
						<c:otherwise>
							<input type="button" class="button1"
								onclick="allSearch(${cnt.count})" value="${cnt.count}">
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:if>
			<c:if test="${ searchText ne null}">
				<c:if test="${pageVO.page == cnt.count }">
					<input class="btn btn2" disabled value="${cnt.count}">
				</c:if>
				<c:if test="${pageVO.page != cnt.count }">
					<input
						onclick="location.href='searchText?page=${cnt.count }&searchText=${ searchText }'"
						class="btn btn2" value="${cnt.count}">
				</c:if>
			</c:if>
		</c:forEach>

		<!--다음  -->
		<c:choose>
			<c:when test="${pageVO.page>=pageVO.maxPage }">
				<input type="button" class="btn btn2" value="▶" disabled>
			</c:when>
			<c:when test="${pageVO.page<pageVO.maxPage }">
				<c:if test="${ searchText eq null}">
					<c:choose>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '텐트'}">
							<input type="button" class="button1"
								onclick="tent(${pageVO.page+1})" value="▶">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '타프'}">
							<input type="button" class="button1"
								onclick="tarp(${pageVO.page+1})" value="▶">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '취사용품'}">
							<input type="button" class="button1"
								onclick="cooking(${pageVO.page+1})" value="▶">
						</c:when>
						<c:when test="${pageVO.PRODUCT_CATEGORY eq '캠핑용품'}">
							<input type="button" class="button1"
								onclick="camping(${pageVO.page+1})" value="▶">
						</c:when>
						<c:otherwise>
							<input type="button" class="button1"
								onclick="allSearch(${pageVO.page+1})" value="▶">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ searchText ne null}">
					<input
						onclick="location.href='searchText?page=${pageVO.page+1 }&searchText=${ searchText }'"
						class="button1" value="▶">
				</c:if>
			</c:when>
		</c:choose>
	</div>
	<script>
		function movePage(page){
			document.getElementById("page").value="page";
			document.searchText.action="searchText";
			document.searchText.submit();
		}
	</script>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

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