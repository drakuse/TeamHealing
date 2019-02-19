<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<script src=" http://code.jquery.com/jquery-latest.min.js"></script>
<title>productUpdateForm.jsp 파일입니다.</title>
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
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
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
		<form action="productUpdate" name="productUpdate" id="productUpdate"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="PRODUCT_NAME" class="col-sm-2 control-label">상품명</label>
				<input class="form-control" type="text" id="PRODUCT_NAME"
					name="PRODUCT_NAME" placeholder="상품명">
			</div>

			<div class="form-group">
				<label for="PRODUCT_PRICE" class="col-sm-2 control-label">가격</label>
				<input class="form-control" type="text" id="PRODUCT_PRICE"
					name="PRODUCT_PRICE" placeholder="가격">
			</div>

			<div class="form-group">
				<label for="PRODUCT_CATEGORY" class="col-sm-2 control-label">카테고리</label>
				<select style="width: 100%;" name="PRODUCT_CATEGORY"
					id="PRODUCT_CATEGORY">
					<option value="텐트">텐트</option>
					<option value="타프">타프</option>
					<option value="취사용품">취사용품</option>
					<option value="캠핑용품">캠핑용품</option>
				</select>
			</div>

			<div class="form-group">
				<label for="PRODUCT_INFO" class="col-sm-2 control-label">상품정보</label>
				<input type="text" class="form-control" id="PRODUCT_INFO"
					name="PRODUCT_INFO">
			</div>

			<div class="form-group">
				<label for="input_img" class="col-sm-2 control-label">상품사진</label> <input
					type="file" class="form-control" id="input_img"
					name="PRODUCT_IMAGE">
			</div>
			<div class="form-group">
				<label>이미지</label>
				<p>
					<img class="img_wrap" id="img" />
				</p>
			</div>
			<input type="submit" value="상품등록">
		</form>
	</div>

	<!-- 파일 이미지 Ajax 부분 -->
	<script>
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop")
				.on(
						"drop",
						function(event) {
							event.preventDefault();

							var files = event.originalEvent.dataTransfer.files;

							var file = files[0];

							var formData = new FormData();

							formData.append("file", file);
							$
									.ajax({
										url : "uploadAjax",
										data : formData,
										dataType : "text",
										processData : false,
										contentType : false,
										type : 'POST',
										success : function(data) {
											var str = "";

											// 이미지 파일 확인 부분
											if (checkImageType(data)) {
												str = "<div><a href='displayFile?fileName="
														+ getImageLink(data)
														+ "'>"
														+ "<img name='PRODUCT_IMAGE' src='displayFile?fileName="
														+ data
														+ "'/>"
														+ "</a><small data-src=" + data + ">X</small></div>";
											} else {
												str = "<div><a href='displayFile?fileName="
														+ data
														+ "'>"
														+ getOriginalName(data)
														+ "</a><small data-src="+data +">X</small></div></div>";
											}
											$(".uploadedList").append(str);
										}
									});
						});
	</script>

	<!-- 파일 삭제 부분 -->
	<script>
		$(".uploadedList").on("click", "small", function(event) {
			var that = $(this);

			$.ajax({
				url : "deleteFile",
				type : "POST",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						alert("deleted");
						that.parent("div").remove();
					}
				}
			});
		});
	</script>

	<script>
		$("#productUpdate").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";

					$(".uploadedList.delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'>";
							});
					that.append(str);
					that.get(0).submit();
				})
	</script>

	<!-- 이미지파일 확장자 구별 부분 -->
	<script>
		function checkImageType(fileName) {
			var pattern = /jpg$|gif$|png$|jpeg$/i;
			return fileName.match(pattern);
		}
	</script>
	<!-- 일반파일 원본 이름으로 바뀌는 부분 -->
	<script>
		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
	</script>
	<!-- 이미지파일 원본이름으로 바뀌는 부분 -->
	<script>
		function getImageLink(fileName) {

			if (!checkImageType(fileName)) {
				return;
			}
			var front = fileName.substr(0, 12);
			var end = fileName.substr(14);

			return front + end;
		}
	</script>
	<script type="text/javascript">
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
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