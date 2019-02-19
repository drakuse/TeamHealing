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
<style type="text/css">
#wrap {
	width: 550px;
	margin: 0 auto 0 auto;
	text-align: center;
}

#commentUpdateForm {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrap">
		<br> <b><font size="5" color="gray">댓글 답변</font></b>
		<hr size="1" width="550">
		<br>

		<div id="commentReplyForm">
			<form name="replyInfo" target="parentForm">
				<input type="hidden" name="page" id="page" value="${page }">
				<input type="hidden" name="INFO_REVIEW_NUM"
					value="${INFO_REVIEW_NUM }">
				<textarea rows="7" cols="70" name="INFO_REVIEW_CONTENT"></textarea>
				<br> <br> <input type="button" value="등록"
					class="btn btn-info" onclick="checkValue()"> <input
					class="btn btn-danger" type="button" value="창닫기"
					onclick="window.close()">
			</form>
		</div>
	</div>

	<!-- 답변 등록 버튼 -->
	<script type="text/javascript">
		function checkValue() {
			var form = document.forms[0];
			// 전송할 값을 변수에 담는다.    
			var content = form.INFO_REVIEW_CONTENT.value

			if (!content) {
				alert("내용을 입력하세요");
				return false;
			} else {
				console.log(content);
				form.action = 'reviewReplywWrite';
				form.submit();
				self.opener = self;
				window.close();
			}
		}
	</script>
</body>
</html>