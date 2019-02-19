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
		<section id="content">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>정보변경</h4>
									<div class="icon">
										<i class="fa fa-info fa-3x"></i>
									</div>
								</div>
								<div class="box-bottom">
									<a href="memberModifyCheckForm">정보변경</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>쇼핑</h4>
									<div class="icon">
										<i class="fa fa-desktop fa-3x"></i>
									</div>
								</div>
								<div class="box-bottom">									
											<a href='cartForm2?page=1'>장바구니</a> / 
											<a href="history?page=1">구매내역</a>										
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>숙박정보</h4>
									<div class="icon">
										<i class="fa fa-pagelines fa-3x"></i>
									</div>
								</div>
								<div class="box-bottom">
									<c:choose>
										<c:when test="${sessionScope.MEMBER_DIVISION == 3 }">
											<a href="companyList">회사 목록</a> / 
											<a href="companyJoinForm">회사 등록</a>
										</c:when>
										<c:otherwise>
											<a href="bookList">숙박/캠핑 내역</a> / 
											<a href="memberMyReviewRoom">숙박/캠핑 리뷰</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>게시판</h4>
									<div class="icon">
										<i class="fa fa-edit fa-3x"></i>
									</div>

								</div>
								<div class="box-bottom">
									<c:choose>
										<c:when test="${sessionScope.MEMBER_DIVISION == 3 }">
											<a href="myScrapForm">스크랩</a>
										</c:when>
										<c:otherwise>
											<a href="myScrapForm">스크랩</a> / 
											<a href="memberMyReviewInfo">정보공유 게시판 리뷰</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
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