<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
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

</head>

<body>
	<div id="wrapper">
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
							<li class="active"><a href="home">Home</a></li>
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
		<!-- end header -->

		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<c:forEach var="board" items="${boardReview}">
								<div class="cta-text">
									<h3>댓글 : ${board.INFO_REVIEW_CONTENT }</h3>
									<h3>추천 : ${board.INFO_REVIEW_LIKE }</h3>
									<h3>신고 : ${board.INFO_REVIEW_REPORT }</h3>

									<h3>
										<a href="boardDetail?INFO_NUM=${board.INFO_NUM }&page=1"
											class="btn btn-success btn-rounded">보러가기</a>
									</h3>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- divider -->
		<div class="row">
			<div class="col-lg-12">
				<div class="solidline"></div>
			</div>
		</div>
		<!-- end divider -->
		<!-- Portfolio Projects -->

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
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

</body>

</html>
