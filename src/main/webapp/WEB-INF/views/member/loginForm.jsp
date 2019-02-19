<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm 파일입니다.</title>
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

<style type="text/css">
html {
	height: 100%
}

::-moz-selection {
	background: #fe57a1;
	color: #fff;
	text-shadow: none;
}

::selection {
	background: #fe57a1;
	color: #fff;
	text-shadow: none;
}

body {
	background-image: radial-gradient(cover, rgba(92, 100, 111, 1) 0%,
		rgba(31, 35, 40, 1) 100%), url('http://i.minus.com/io97fW9I0NqJq.png')
}

.login {
	background: #eceeee;
	border: 1px solid #42464b;
	border-radius: 6px;
	height: 300px;
	margin: 20px auto 0;
	width: 298px;
}

.login h1 {
	background-image: linear-gradient(top, #f1f3f3, #d4dae0);
	border-bottom: 1px solid #a6abaf;
	border-radius: 6px 6px 0 0;
	box-sizing: border-box;
	color: #727678;
	display: block;
	height: 43px;
	font: 600 14px/1 'Open Sans', sans-serif;
	padding-top: 14px;
	margin: 0;
	text-align: center;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2), 0 1px 0 #fff;
}

input[type="password"], input[type="text"] {
	background: url('http://i.minus.com/ibhqW9Buanohx2.png') center left
		no-repeat, linear-gradient(top, #d6d7d7, #dee0e0);
	border: 1px solid #a1a3a3;
	border-radius: 4px;
	box-shadow: 0 1px #fff;
	box-sizing: border-box;
	color: #696969;
	height: 39px;
	margin: 31px 0 0 29px;
	padding-left: 37px;
	transition: box-shadow 0.3s;
	width: 240px;
}

input[type="password"]:focus, input[type="text"]:focus {
	box-shadow: 0 0 4px 1px rgba(55, 166, 155, 0.3);
	outline: 0;
}

.show-password {
	display: block;
	height: 16px;
	margin: 26px 0 0 28px;
	width: 87px;
}

input[type="checkbox"] {
	cursor: pointer;
	height: 16px;
	opacity: 0;
	position: relative;
	width: 64px;
}

input[type="checkbox"]:checked {
	left: 29px;
	width: 58px;
}

.toggle {
	background: url(http://i.minus.com/ibitS19pe8PVX6.png) no-repeat;
	display: block;
	height: 16px;
	margin-top: -20px;
	width: 87px;
	z-index: -1;
}

input[type="checkbox"]:checked+.toggle {
	background-position: 0 -16px
}

.forgot {
	color: #7f7f7f;
	display: inline-block;
	float: right;
	font: 12px/1 sans-serif;
	left: -19px;
	position: relative;
	text-decoration: none;
	top: 5px;
	transition: color .4s;
}

.forgot:hover {
	color: #3b3b3b
}

input[type="button"] {
	width: 240px;
	height: 35px;
	display: block;
	font-family: Arial, "Helvetica", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	text-shadow: 1px 1px 0px #37a69b;
	padding-top: 6px;
	margin: 29px 0 0 29px;
	position: relative;
	cursor: pointer;
	border: none;
	background-color: #37a69b;
	background-image: linear-gradient(top, #3db0a6, #3111);
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px
		5px #999;
}

.shadow {
	background: #000;
	border-radius: 12px 12px 4px 4px;
	box-shadow: 0 0 20px 10px #000;
	height: 12px;
	margin: 30px auto;
	opacity: 0.2;
	width: 270px;
}

input[type="button"]:active {
	top: 3px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 2px 0px 0px #31524d, 0px 5px
		3px #999;
}
</style>
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
								<li><a href="memberLogout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->
	<form action="memberLogin" name="loginForm" id="loginForm"
		method="post">
		<div class="login">
			<input type="text" placeholder="Username" name="MEMBER_ID"
				id="MEMBER_ID"> <input type="password"
				placeholder="password" name="MEMBER_PASS" id="MEMBER_PASS"><input
				type="button" onclick="login()" value="로그인"><input
				type="button" onclick="joinForm()" value="회원가입">
		</div>
		<div class="shadow"></div>
	</form>

	<script>
		// 로그인 버튼 클릭
		function login() {
			loginForm.submit();
		}

		// 회원 가입 버튼 클릭
		function joinForm() {
			location.href = "joinDivisionForm";
		}
	</script>
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