<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberManagementForm.jsp 파일입니다.</title>
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
	<div
		style="dorder: 1px dashed #BDBDBD; width: 80%; height: auto; margin: auto;">
		<p>일반 회원</p>

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>우편번호</th>
					<th>지번주소</th>
					<th>상세주소</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.MEMBER_DIVISION == 1 }">
						<tr>
							<td>${member.MEMBER_ID }</td>
							<td>${member.MEMBER_NAME }</td>
							<td>${member.MEMBER_AGE }</td>
							<td>${member.MEMBER_PHONE }</td>
							<td>${member.MEMBER_EMAIL }</td>
							<td>${member.MEMBER_POSTCODE }</td>
							<td>${member.MEMBER_JIBUNADDRESS }</td>
							<td>${member.MEMBER_DETAILADDRESS }</td>
							<td><a class="btn btn-danger"
								href="memberDelete?MEMBER_ID=${member.MEMBER_ID }">삭제</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<br>
		<p>사장 회원(승인 대기)</p>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>우편번호</th>
					<th>지번주소</th>
					<th>상세주소</th>
					<th>승인</th>
					<th>사업자번호</th>
					<th>업소명</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.MEMBER_DIVISION == 2 }">
						<tr>
							<td>${member.MEMBER_ID }</td>
							<td>${member.MEMBER_NAME }</td>
							<td>${member.MEMBER_AGE }</td>
							<td>${member.MEMBER_PHONE }</td>
							<td>${member.MEMBER_EMAIL }</td>
							<td>${member.MEMBER_POSTCODE }</td>
							<td>${member.MEMBER_JIBUNADDRESS }</td>
							<td>${member.MEMBER_DETAILADDRESS }</td>
							<td><a class="btn btn-success"
								href="memberApprove?MEMBER_DIVISION=${member.MEMBER_DIVISION }&MEMBER_ID=${member.MEMBER_ID}">승인</a></td>
							<td>${member.MEMBER_BUSINESS }</td>
							<td>${member.MEMBER_COMPANY }</td>
							<td><a class="btn btn-danger"
								href="memberDelete?MEMBER_ID=${member.MEMBER_ID }">삭제</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<br>
		<p>사장 회원(승인)</p>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>우편번호</th>
					<th>지번주소</th>
					<th>상세주소</th>
					<th>사업자번호</th>
					<th>업소명</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.MEMBER_DIVISION == 3 }">
						<tr>
							<td>${member.MEMBER_ID }</td>
							<td>${member.MEMBER_NAME }</td>
							<td>${member.MEMBER_AGE }</td>
							<td>${member.MEMBER_PHONE }</td>
							<td>${member.MEMBER_EMAIL }</td>
							<td>${member.MEMBER_POSTCODE }</td>
							<td>${member.MEMBER_JIBUNADDRESS }</td>
							<td>${member.MEMBER_DETAILADDRESS }</td>
							<td>${member.MEMBER_BUSINESS }</td>
							<td>${member.MEMBER_COMPANY }</td>
							<td><a class="btn btn-danger"
								href="memberDelete?MEMBER_ID=${member.MEMBER_ID }">삭제</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
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