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
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2>
									<span>Healing</span>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">

							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>숙박/캠핑</h4>
										<div class="icon">
											<i class="fa fa-pagelines fa-3x"></i>
										</div>
										<p>힐링하러 떠나요~</p>

									</div>
									<div class="box-bottom">
										<a href="lodgmentForm">숙박/캠핑</a>
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
										<p>여행에 필요한 것들을 쇼핑하세요~</p>
									</div>
									<div class="box-bottom">
										<a href="shoppingForm?page=1">쇼핑</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>정보공유</h4>
										<div class="icon">
											<i class="fa fa-edit fa-3x"></i>
										</div>
										<p>여러분의 여행정보를 공유해보세요</p>
									</div>
									<div class="box-bottom">
										<a href="boardForm?page=1">정보공유</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>history</h4>
										<div class="icon">
											<i class="fa fa-edit fa-3x"></i>
										</div>
										<c:if test="${sessionScope.MEMBER_ID == null}">
											<p>로그인하세요</p>
										</c:if>
										<p>${sessionScope.MEMBER_ID }</p>

									</div>
									<div class="box-bottom">
										<c:choose>
											<c:when test="${sessionScope.MEMBER_ID == null}">
												<a href="loginForm">로그인</a>
											</c:when>
											<c:when test="${MEMBER_DIVISION == 4 }">
												<a href="adminModeForm">관리자 모드</a>
											</c:when>
											<c:otherwise>
												<a href="memberInfoForm">회원정보</a>
											</c:otherwise>
										</c:choose>
									</div>									
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Portfolio Projects -->
		</section>		
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
