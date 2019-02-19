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
		<c:forEach var="bo" items="${bookList}" varStatus="cnt">
			<section class="callaction">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="big-cta">
								<div class="cta-text">
							
									<h3>예약번호 : ${bo.BOOK_NUM }</h3>
									<h3>회원 ID : ${bo.MEMBER_ID }</h3>
									<h3>체크인 : ${bo.BOOK_CHECKIN }</h3>
									<h3>체크아웃 : ${bo.BOOK_CHECKOUT }</h3>
									<h3>가격 : ${bo.BOOK_PRICE }</h3>
									<a
										href="bookDetail?ROOM_NUM=${bo.ROOM_NUM }&BOOK_NUM=${bo.BOOK_NUM }&COMPANY_NUM=${bo.COMPANY_NUM }"
										class="btn btn-success btn-rounded">상세보기</a>
									<c:choose>
										<c:when test="${sessionScope.MEMBER_DIVISION eq 3 }">
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${review.get(cnt.index) eq 'y' }">
													<a href="#" class="btn btn-danger btn-rounded"> 리뷰완료 </a>
												</c:when>
												<c:otherwise>
													<a href="#" onclick="review(${cnt.index})"
														class="btn btn-warning btn-rounded">리뷰쓰기</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>

									<input type="hidden" id="checkOut${cnt.index }"
										value="${bo.BOOK_CHECKOUT }"> <input type="hidden"
										id="bookNum${cnt.index }" value="${bo.BOOK_NUM }">
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:forEach>
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
	var date = new Date();
	date.setDate(date.getDate());
	var tomorrow=date.getFullYear() + "-" + ("00" + (date.getMonth() + 1)).slice(-2) + "-" + ("00" + date.getDate()).slice(-2);
	function review(index){
		var checkout=new Date();
		checkout = document.getElementById("checkOut"+index).value
		bookNum = document.getElementById("bookNum"+index).value
		console.log(tomorrow);
		console.log(checkout);
		if(tomorrow>checkout){
			var userId = '${sessionScope.MEMBER_ID}';
			
			if(userId =="" || userId == null){
				alert("로그인 후 사용가능합니다.");
				return false;
			} else{
				// 댓글 답변창 open
				window.name="parentForm";
				window.open("roomReviewForm?BOOK_NUM="+bookNum,"replyForm","width=570, height=350, resizable = no, scrollbars = no");
			}
		}else{
			alert('아직 숙박하지 않았습니다');
		}
	}		
	</script>
</body>

</html>