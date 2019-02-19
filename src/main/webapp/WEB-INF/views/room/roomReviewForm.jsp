<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('images/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.ROOM_REVIEW_SCORE>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="wrap">
		<br> <b><font size="5" color="gray">댓글 답변</font></b>
		<form action="roomReview" method="post" enctype="multipart/form-data"
			name="roomReview" id="roomReview" target="parentForm">
			<input type="hidden" name="BOOK_NUM" value="${book.BOOK_NUM }">
			<input type="hidden" name="ROOM_NUM" value="${book.ROOM_NUM }">
			<input type="hidden" name="COMPANY_NUM" value="${book.COMPANY_NUM }">

			<span class="star-input"> <span class="input"> <input
					type="radio" name="ROOM_REVIEW_SCORE" value="1" id="p1"> <label
					for="p1">1</label> <input type="radio" name="ROOM_REVIEW_SCORE"
					value="2" id="p2"> <label for="p2">2</label> <input
					type="radio" name="ROOM_REVIEW_SCORE" value="3" id="p3"> <label
					for="p3">3</label> <input type="radio" name="ROOM_REVIEW_SCORE"
					value="4" id="p4"> <label for="p4">4</label> <input
					type="radio" name="ROOM_REVIEW_SCORE" value="5" id="p5"> <label
					for="p5">5</label>
			</span> <output for="star-input">
					<b>3</b>점
				</output>
			</span>
			<div id="commentReplyForm">
				<textarea rows="7" cols="70" name="ROOM_REVIEW_CONTENT"></textarea>
				<br> <br> <input type="file" id="input_img"
					name="ROOM_REVIEW_IMAGE">
			</div>
			<p>
				<img class="img_wrap" id="img" />
			</p>
			<div style="width: 180px; margin: auto;">
				<input type="button" value="등록" class="btn btn-info"
					onclick="checkValue()"> <input class="btn btn-danger"
					type="button" value="창닫기" onclick="window.close()">
			</div>
		</form>
	</div>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
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

	<script type="text/javascript">
		var starRating = function() {
			var $star = $(".star-input"), $result = $star.find("output>b");

			$(document).on("focusin", ".star-input>.input", function() {
				$(this).addClass("focus");
			})

			.on("focusout", ".star-input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 100);
			})

			.on("change", ".star-input :radio", function() {
				$result.text($(this).next().text());
			}).on("mouseover", ".star-input label", function() {
				$result.text($(this).text());
			}).on("mouseleave", ".star-input>.input", function() {
				var $checked = $star.find(":checked");
				if ($checked.length === 0) {
					$result.text("0");
				} else {
					$result.text($checked.next().text());
				}
			});
		};
		starRating();
	</script>

	<!-- 답변 등록 버튼 -->
	<script type="text/javascript">
		function checkValue() {
			var form = document.forms[0];
			// 전송할 값을 변수에 담는다.    
			var content = form.ROOM_REVIEW_CONTENT.value

			if (!content) {
				alert("내용을 입력하세요");
				return false;
			} else {
				console.log(content);
				document.roomReview.action = "roomReview"
				document.roomReview.submit();
				self.opener = self;
				window.close();
			}
		}
	</script>
</body>
</html>