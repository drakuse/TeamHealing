<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail.jsp 파일입니다.</title>
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
</script>
<script>
	function multisubmit(index) {
		var answer = confirm("스크랩 확인?");

		if (answer) {
			document.boardDetailForm.action = "boardScrap";
		} else {
			document.boardDetailForm.action = "boardScrapAction";
		}
		document.boardDetailForm.submit();
	}
</script>
</head>
<body>
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
	<div class="container"></div>
	<div
		style="dorder: 1px dashed #BDBDBD; width: 80%; height: auto; margin: auto;">
		<form action="boardDetailForm" id="boardDetailForm"
			name="boardDetailForm" method="post">
			<input type="hidden" id="page" name="page" value="${page }">
			<input type="hidden" id="INFO_NUM" name="INFO_NUM"
				value="${boardDetail.INFO_NUM }"> <input type="hidden"
				id="INFO_TITLE" name="INFO_TITLE" value="${boardDetail.INFO_TITLE }">
			<div class="form-group">
				<label for="INFO_NUM" class="col-sm-2 control-label">글번호</label>
				<div class="col-sm-10">
					<input type="text" id="INFO_NUM" name="INFO_NUM" width="80%"
						class="form-control" value="${boardDetail.INFO_NUM }"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label for="MEMBER_ID" class="col-sm-2 control-label">회원 아이디</label>
				<div class="col-sm-10">
					<input type="text" id="MEMBER_ID" class="form-control"
						value="${boardDetail.MEMBER_ID }" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label for="INFO_TITLE" class="col-sm-2 control-label">글 제목</label>
				<div class="col-sm-10">
					<input type="text" id="INFO_TITLE" name="INFO_TITLE"
						class="form-control" value="${boardDetail.INFO_TITLE }"
						readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="INFO_CONTENT" class="col-sm-2 control-label">글
					내용</label>
				<div class="col-sm-10">
					<input type="text" id="INFO_CONTENT" name="INFO_CONTENT"
						class="form-control" value="${boardDetail.INFO_CONTENT }"
						readonly="readonly">
				</div>
			</div>
			<c:if test="${boardDetail.INFO_IMAGE_NAME != null}">
				<div class="form-group">
					<label for="INFO_CONTENT" class="col-sm-2 control-label">사진</label>
					<div class="col-sm-10">
						<img src="./resources/uploadFile/${boardDetail.INFO_IMAGE_NAME }"
							width="73" height="70">
					</div>
				</div>
			</c:if>
			<div class="form-group">
				<a
					href="boardLike?INFO_NUM=${boardDetail.INFO_NUM}&INFO_REVIEW_NUM=0&page=${page }"
					class="btn btn-success btn-rounded">${boardDetail.INFO_LIKE }&nbsp;&nbsp;<i
					class="fa fa-heart"></i></a> <a
					href="boardReport?INFO_NUM=${boardDetail.INFO_NUM}&INFO_REVIEW_NUM=0&page=${page }"
					class="btn btn-danger btn-rounded"> ${boardDetail.INFO_REPORT }&nbsp;&nbsp;<i
					class="fa fa-bullhorn"></i>
				</a>
				<c:if
					test="${boardDetail.MEMBER_ID == MEMBER_ID || MEMBER_DIVISION==4}">
					<a class="btn btn-danger pull-right"
						href="boardDelete?INFO_NUM=${boardDetail.INFO_NUM }">삭제</a>
					<a class="btn btn-warning pull-right"
						href="boardModifyForm?INFO_NUM=${boardDetail.INFO_NUM }&page=${page}">수정</a>
				</c:if>
				<a class="btn btn-primary pull-right" href="boardForm?page=${page }">목록</a>
				<a class="btn btn-default pull-right" onclick="multisubmit(1)"
					href="#">스크랩</a>
			</div>
		</form>
	</div>

	<div
		style="dorder: 1px dashed #BDBDBD; width: 80%; height: auto; margin: auto;">
		<br />
		<form action="reviewWrite" id="writeCommentForm" method="post">
			<input type="hidden" name="page" id="page" value="${page }">
			<!-- 댓글 부분 -->
			<div id="comment">
				<table border="1" bordercolor="lightgray">
					<!-- 로그인 했을 경우만 댓글 작성 가능 -->
					<c:if test="${sessionScope.MEMBER_ID != null}">
						<input type="hidden" name="INFO_NUM"
							value="${boardDetail.INFO_NUM }">
						<tr bgcolor="F5F5F5">

							<!-- 아이디 -->
							<td width="150">
								<div>${sessionScope.MEMBER_ID }</div>
							</td>

							<!-- 본문 작성 -->
							<td width="550">
								<div>
									<textarea class="form-control" id="summernote"
										name="INFO_REVIEW_CONTENT"></textarea>
								</div>
							</td>

							<!-- 댓글 등록 버튼 -->
							<td width="100" colspan="2">
								<div id="btn" style="text-align: center;">
									<p>
										<a href="#" class="btn btn-info" onclick="writeCmt()">댓글등록</a>
									</p>
								</div>
							</td>
						</tr>
					</c:if>

					<!-- 댓글 목록 -->
					<c:if test="${reviewList != null }">
						<c:forEach var="comment" items="${reviewList }">
							<tr>
								<!-- 아이디, 작성 날짜 -->
								<td width="150">
									<div>
										<c:if test="${comment.INFO_REVIEW_SEQ > 1 }">
							&nbsp;&nbsp;&nbsp;
							</c:if>
										${comment.MEMBER_ID }<br /> <font size="2" color="lightblack">${comment.INFO_REVIEW_DATE }</font>
									</div>
								</td>

								<!-- 댓글 내용 -->
								<td width="550">
									<!-- 댓글 작성자만 수정, 삭제 가능하도록 --> <c:if
										test="${comment.MEMBER_ID == sessionScope.MEMBER_ID  || sessionScope.MEMBER_DIVISION == 4}">
										<a href="#" class=" btn btn-danger pull-right"
											onclick="cmDeleteOpen(${comment.INFO_REVIEW_NUM})">삭제</a>
										<a href="#" class=" btn btn-warning pull-right"
											onclick="cmUpdateOpen(${comment.INFO_REVIEW_NUM})">수정</a>
									</c:if> <!-- 답변 -->
									<div class="text_wrapper">${comment.INFO_REVIEW_CONTENT }<c:if
											test="${comment.INFO_REVIEW_SEQ == 1 }">
											<a href="#" class="btn btn-info pull-right"
												onclick="cmReplyOpen(${comment.INFO_REVIEW_NUM})">답변</a>
										</c:if>
									</div>
								</td>
								<td>
									<div id="btn" style="text-align: center;">
										<a
											href="boardReviewLike?INFO_NUM=${boardDetail.INFO_NUM }&INFO_REVIEW_NUM=${comment.INFO_REVIEW_NUM}&page=${page }"
											class="btn btn-success btn-rounded">${comment.INFO_REVIEW_LIKE }&nbsp;&nbsp;<i
											class="fa fa-heart"></i></a> <a
											href="boardReviewReport?INFO_NUM=${boardDetail.INFO_NUM}&INFO_REVIEW_NUM=${comment.INFO_REVIEW_NUM }&page=${page }"
											class="btn btn-danger btn-rounded">
											${comment.INFO_REVIEW_REPORT }&nbsp;&nbsp;<i
											class="fa fa-bullhorn"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
	</script>
	<script>
	// 댓글 등록
	function writeCmt(){
		var form = document.getElementById("writeCommentForm");
		var content = form.INFO_REVIEW_CONTENT.value;
		if(!content){
			alert("내용을 입력하세요.");
			return false;
		} else{
			console.log(content);
			form.action = 'reviewWrite';
			form.submit();
		}
	}
	
	// 댓글 답변
	function cmReplyOpen(info_review_num){
		var userId = '${sessionScope.MEMBER_ID}';
		var page = (document.getElementById("page").value);
		
		if(userId =="" || userId == null){
			alert("로그인 후 사용가능합니다.");
			return false;
		} else{
			// 댓글 답변창 open
			window.name="parentForm";
			window.open("reviewReplyForm?INFO_REVIEW_NUM=" + info_review_num+"&page=" + page,"replyForm","width=570, height=350, resizable = no, scrollbars = no");
		}
	}
	
	// 댓글 삭제 알람창
	function cmDeleteOpen(info_review_num){
		var msg = confirm("댓글을 삭제합니다.");
		
		if(msg == true){ // 확인을 누르면 삭제
			deleteCmt(info_review_num);
		} else{
			return false; // 삭제 취소
		}
	}
	
	// 댓글 삭제
    function deleteCmt(info_review_num){
    	var param="INFO_REVIEW_NUM="+info_review_num;
    	var page = (document.getElementById("page").value);
    	
    	location.href="reviewReplyDelete?" + param +"&page=" + page;
    }
	
	// 댓글 수정창
	function cmUpdateOpen(info_review_num){
		var page = (document.getElementById("page").value);
		window.name="parentForm";
		window.open("reviewModifyForm?INFO_REVIEW_NUM="+info_review_num + "&page=" + page, "updateForm","width=570, height=350, resizable = no, scrollbars = no");
	}
	</script>
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