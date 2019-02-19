<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModifyForm.jsp 파일입니다.</title>
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
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
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
<style type="text/css">
.img_wrap {
	width: 300px;
	margin-top: 50px;
}

.img_wrap img {
	max-width: 100%;
	max-height: 100%;
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
		<a href="home">home</a>
		<form action="boardModify" name="boardModify" id="boardModify"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" id="page" value="${page }">
			<input type="hidden" name="INFO_NUM" id="INFO_NUM"
				value="${boardModify.INFO_NUM }">
			<div class="form-group">
				<div class="form-group">
					<div>글번호</div>
					<div class="form-control">${boardModify.INFO_NUM }</div>
				</div>
				<div class="form-group">
					<div>회원아이디</div>
					<div>${boardModify.MEMBER_ID }</div>
				</div>
				<div class="form-group">
					<div>글제목</div>
					<div>
						<input class="form-control" type="text" id="INFO_TITLE"
							name="INFO_TITLE" value="${boardModify.INFO_TITLE }">
					</div>
				</div>
				<div class="form-group">
					<div>글내용</div>
					<div>
						<textarea class="form-control" id="summernote" name="INFO_CONTENT">${boardModify.INFO_CONTENT }</textarea>
					</div>
				</div>
				<div class="form-group">
					<div>
						<label for="INFO_IMAGE">첨부파일</label> <input type="file"
							class="form-control" id="input_img" name="INFO_IMAGE"
							value="${boardModify.INFO_IMAGE_NAME }">
					</div>
					<div class="form-control">원본 파일 이름 :
						${boardModify.INFO_IMAGE_NAME }</div>
				</div>
				<c:if test="${boardModify.INFO_IMAGE_NAME != null}">
					<div class="form-group">
						<div>사진</div>
						<div>
							<img class="img_wrap" id="img"
								src="./resources/uploadFile/${boardModify.INFO_IMAGE_NAME }"
								width="73" height="70">ㄴ
						</div>
					</div>
				</c:if>
			</div>
			<button type="submit" class="btn btn-info">수정하기</button>
			<button type="reset" class="btn btn-info">다시쓰기</button>
		</form>
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