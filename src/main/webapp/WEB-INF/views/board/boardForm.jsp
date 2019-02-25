<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

		<!-- /.panel-heading -->
		<form id="searchInfo" name="searchInfo" action="searchInfo"
			method="POST">
			<div>
				<input type="hidden" id="page" name="page" value="${pageVO.page }">
				<input type="text" id="search" name="search" value="${search }">
				<input type="submit" value="검색">
			</div>
		</form>
		<table class="table table-striped table-hover">
			<thead>
				<c:forEach var="board" items="${boardBest }">
					<tr>
						<th colspan="7">베스트 글</th>
					</tr>
					<tr>
						<td>${board.INFO_NUM }</td>
						<td><a
							href="boardDetail?INFO_NUM=${board.INFO_NUM}&page=${pageVO.page}">${board.INFO_TITLE }</a></td>
						<td>${board.MEMBER_ID }</td>
						<td>${board.INFO_DATE }</td>
						<td>${board.INFO_HIT }</td>
						<td>${board.INFO_LIKE }</td>
						<td>${board.INFO_REPORT }</td>
					</tr>
				</c:forEach>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>회원아이디</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>추천</th>
					<th>신고</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="7"><a href="boardWriteForm"
						class="btn btn-success pull-right">글쓰기</a></td>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.INFO_NUM }</td>
						<td><a
							href="boardDetail?INFO_NUM=${board.INFO_NUM}&page=${pageVO.page}">${board.INFO_TITLE }</a></td>
						<td>${board.MEMBER_ID }</td>
						<td>${board.INFO_DATE }</td>
						<td>${board.INFO_HIT }</td>
						<td>${board.INFO_LIKE }</td>
						<td>${board.INFO_REPORT }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="width: 340px; margin: auto;">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pageVO.page<=1 }">
					<input type="button" class="btn btn2" disabled value="◀">
				</c:when>
				<c:when test="${pageVO.page>1 }">
					<input type="button" class="button1"
						onclick="movePage(${pageVO.page-1 })" value="◀">
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
						onclick="movePage(${cnt.count })" value="${cnt.count }">
				</c:if>

			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="${pageVO.page>=pageVO.maxPage }">
					<input type="button" class="btn btn2" disabled value="▶">
				</c:when>
				<c:when test="${pageVO.page<pageVO.maxPage }">
					<input type="button" class="button1"
						onclick="movePage(${pageVO.page+1 })" value="▶">
				</c:when>
			</c:choose>
		</div>
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
	<script type="text/javascript">
function movePage(page){
	document.getElementById("page").value = page;
    document.searchInfo.action="searchInfo"
    document.searchInfo.submit();
}
</script>
</body>
</html>