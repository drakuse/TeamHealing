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
							<a href="companyList?COMPANY_NUM=${COMPANY_NUM}"
								class="btn btn-success btn-rounded">목록으로</a>

							<div
								style="dorder: 1px dashed #BDBDBD; width: 400px; height: auto; margin: auto;">
								<form id="roomJoin" name="roomJoin" action="roomJoin"
									method="post" enctype="multipart/form-data">
									<input type=hidden name="COMPANY_NUM"
										value="${company.COMPANY_NUM}">
									<div class="form-group">
										<h3>
											방이름 <br> <input type="text" class="form-control"
												id="ROOM_NAME" name="ROOM_NAME" required="required">
										</h3>
									</div>
									<div class="form-group">
										<h3>
											가격 <br> <input type="number" class="form-control"
												name="ROOM_PRICE" required="required">
										</h3>
									</div>
									<div class="form-group">
										<h3>
											제한인원 <br> <input type="number" name="ROOM_LIMIT"
												class="form-control" required="required">
										</h3>
									</div>
									<h3>
										<input type="file" id="input_img" name="ROOM_IMAGE"
											required="required">
									</h3>

									<p>
										<img class="img_wrap" id="img" />
									</p>
									<div class="big-cta">
										<div class="cta-text">
											<h3>
												<a href="#" onclick='submit()'
													class="btn btn-warning btn-rounded">방등록</a>
											</h3>
										</div>
									</div>
								</form>
							</div>
						</div>
						<br> <br>
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
	<script type="text/javascript">
		function submit() {
			console.log('ddd');
			document.roomJoin.action = "roomJoin";
			document.roomJoin.submit();
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#input_img").on('change', function() {
				readURL(this);
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>