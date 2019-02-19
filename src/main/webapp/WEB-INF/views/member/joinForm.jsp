<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	function OnCheckPhone(oTa) {
		var oForm = oTa.form;
		var sMsg = oTa.value;
		var onlynum = "";
		var imsi = 0;
		onlynum = RemoveDash2(sMsg); //하이픈 입력시 자동으로 삭제함 
		onlynum = checkDigit(onlynum); // 숫자만 입력받게 함 
		var retValue = "";

		if (event.keyCode != 12) {
			if (onlynum.substring(0, 2) == 02) { // 서울전화번호일 경우  10자리까지만 나타나교 그 이상의 자리수는 자동삭제 
				if (GetMsgLen(onlynum) <= 1)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 2)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 3);
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5) + "-"
							+ onlynum.substring(5, 7);
				;
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5) + "-"
							+ onlynum.substring(5, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
			}
			if (onlynum.substring(0, 2) == 05) { // 05로 시작되는 번호 체크 
				if (onlynum.substring(2, 3) == 0) { // 050으로 시작되는지 따지기 위한 조건문 
					if (GetMsgLen(onlynum) <= 3)
						oTa.value = onlynum;
					if (GetMsgLen(onlynum) == 4)
						oTa.value = onlynum + "-";
					if (GetMsgLen(onlynum) == 5)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 5);
					if (GetMsgLen(onlynum) == 6)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 6);
					if (GetMsgLen(onlynum) == 7)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7);
					if (GetMsgLen(onlynum) == 8)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8);
					if (GetMsgLen(onlynum) == 9)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7) + "-"
								+ onlynum.substring(7, 9);
					;
					if (GetMsgLen(onlynum) == 10)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 10);
					if (GetMsgLen(onlynum) == 11)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7) + "-"
								+ onlynum.substring(7, 11);
					if (GetMsgLen(onlynum) == 12)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 12);
					if (GetMsgLen(onlynum) == 13)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 12);
				} else {
					if (GetMsgLen(onlynum) <= 2)
						oTa.value = onlynum;
					if (GetMsgLen(onlynum) == 3)
						oTa.value = onlynum + "-";
					if (GetMsgLen(onlynum) == 4)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 4);
					if (GetMsgLen(onlynum) == 5)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 5);
					if (GetMsgLen(onlynum) == 6)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6);
					if (GetMsgLen(onlynum) == 7)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7);
					if (GetMsgLen(onlynum) == 8)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6) + "-"
								+ onlynum.substring(6, 8);
					;
					if (GetMsgLen(onlynum) == 9)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 9);
					if (GetMsgLen(onlynum) == 10)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6) + "-"
								+ onlynum.substring(6, 10);
					if (GetMsgLen(onlynum) == 11)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 11);
					if (GetMsgLen(onlynum) == 12)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 11);
				}
			}

			if (onlynum.substring(0, 2) == 03 || onlynum.substring(0, 2) == 04
					|| onlynum.substring(0, 2) == 06
					|| onlynum.substring(0, 2) == 07
					|| onlynum.substring(0, 2) == 08) { // 서울전화번호가 아닌 번호일 경우(070,080포함 // 050번호가 문제군요) 
				if (GetMsgLen(onlynum) <= 2)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 3)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 8);
				;
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);

			}
			if (onlynum.substring(0, 2) == 01) { //휴대폰일 경우 
				if (GetMsgLen(onlynum) <= 2)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 3)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
			}

			if (onlynum.substring(0, 1) == 1) { // 1588, 1688등의 번호일 경우 
				if (GetMsgLen(onlynum) <= 3)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
			}
		}
	}

	function RemoveDash2(sNo) {
		var reNo = ""
		for (var i = 0; i < sNo.length; i++) {
			if (sNo.charAt(i) != "-") {
				reNo += sNo.charAt(i)
			}
		}
		return reNo
	}

	function GetMsgLen(sMsg) { // 0-127 1byte, 128~ 2byte 
		var count = 0
		for (var i = 0; i < sMsg.length; i++) {
			if (sMsg.charCodeAt(i) > 127) {
				count += 2
			} else {
				count++
			}
		}
		return count
	}

	function checkDigit(num) {
		var Digit = "1234567890";
		var string = num;
		var len = string.length
		var retVal = "";

		for (i = 0; i < len; i++) {
			if (Digit.indexOf(string.substring(i, i + 1)) >= 0) {
				retVal = retVal + string.substring(i, i + 1);
			}
		}
		return retVal;
	}
</script>
<script type="text/javascript">
	/* 자바 스크립트 합수 선언 */
	// 비밀번호 확인
	function passConfirm() {
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치,
		다르면 비밀번호 불일치라는 텍스트를 출력함.*/
		var password = document.getElementById('MEMBER_PASS');
		var passwordConfirm = document.getElementById('passwordConfirm');
		var confirmMsg = document.getElementById('confirmMsg');
		var correctColor = "#00ff00";
		var wrongColor = "#ff0000";

		if (password.value == passwordConfirm.value) {
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "<br>비밀번호 일치";
		} else {
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "<br>비밀번호 불일치";
		}
	}

	/* ajax(Asynchronus javascript and XML) */
	// 아이디 중복확인
	var idCheck = 0;
	function idOverlap() {
		console.log("idOverlap 함수 호출");
		var id = (document.getElementById("MEMBER_ID").value);
		var idReg = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{4,15}$/;

		$
				.ajax({
					type : "post",
					url : "idOverlap",
					data : {
						"MEMBER_ID" : joinForm.MEMBER_ID.value
					/* "파라미터 이름" : 파라미터 값 */
					},
					/* 내가 전송할 타입 */
					dataType : "text",

					/* success = ajax 성공여부 판단.
						성공이 되면 if문 실행이되고,
						실패면 error 부분이 실행됨.
					 */
					success : function(data) {
						if (data == "1") {
							if (id.length<4 || id.length>12) {
								alert("아이디는  4~12자의 영문 소문자와 숫자로만 입력 첫글자는 영문자로 입력바랍니다..");
								idCheck = 3;
								console.log(idCheck);
							} else {
								var ic = 0;
								//아이디 유효성 검사 (영문소문자, 숫자만 허용)
								for (var i = 0; i < document.joinForm.MEMBER_ID.value.length; i++) {
									ch = document.joinForm.MEMBER_ID.value
											.charAt(i)
									if (!(ch >= '0' && ch <= '9')
											&& !(ch >= 'a' && ch <= 'z')
											&& !(ch >= 'A' && ch <= 'Z')) {
										alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
										document.joinForm.MEMBER_ID.focus();
										document.joinForm.MEMBER_ID.select();
										ic = 1;
										return false;
									}
								}

								if (ic != 1) {
									alert("이아디는 사용 가능합니다.");
									idCheck = 1;
									console.log(idCheck);
								}
							}
						} else {
							alert("이 아이디는 사용할 수 없습니다.");
							idCheck = 2;
							console.log(idCheck);
						}
					},
					error : function() {
						alert("아이디 중복확인 ajax 실패");
					}
				});
	}

	var emailCheck = 0;
	// 이메일 인증 Ajax
	function createKey() {
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (document.getElementById("MEMBER_EMAIL").value != ''
				|| emailReg.test(document.getElementById("MEMBER_EMAIL").value)) {
			var mail = document.getElementById("MEMBER_EMAIL").value;
			$
					.ajax({
						type : "post",
						url : "createKey",
						data : {
							"MEMBER_EMAIL" : joinForm.MEMBER_EMAIL.value
						},
						dateType : "text",
						success : function(data) {
							alert("메일이 전송되었습니다.");
							emailCheck = 1;
							document.getElementById("passForm").innerHTML = '<label for="MEMBER_EMAIL">이메일 <input class="btn btn-info pull-right" type="button" onclick="createKey()" value="인증"></label> <input type="email" name="MEMBER_EMAIL" class="form-control" id="MEMBER_EMAIL" placeholder="ooo@oooo.ooo" required="required"><input type="text" class="form-control" id="mailTestIn" placeholder="인증번호 입력란" required="required">';
							document.getElementById("MEMBER_EMAIL").value = mail;
						},
						error : function() {
							alert('이메일 인증 실패');
						}
					});
		} else {
			alert("이메일을 입력해 주세요");
		}
	}

	// 회원가입 Ajax
	function sendForm() {
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var id = (document.getElementById("MEMBER_ID").value);
		var pw = (document.getElementById("MEMBER_PASS").value);
		var pwcon = (document.getElementById("passwordConfirm").value);
		var name = (document.getElementById("MEMBER_NAME").value);
		var age = (document.getElementById("MEMBER_AGE").value);
		var phone = (document.getElementById("MEMBER_PHONE").value);
		var email = (document.getElementById("MEMBER_EMAIL").value);
		var idReg = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,15}$/;
		var division = (document.getElementById("MEMBER_DIVISION").value);
		var postcode = (document.getElementById("MEMBER_POSTCODE").value);
		var jibunaddress = (document.getElementById("MEMBER_JIBUNADDRESS").value);
		var detailaddress = (document.getElementById("MEMBER_DETAILADDRESS").value);

		// 아이디 입력 여부
		if (id == "") {
			alert("아이디를 입력해주세요");
			return false;
		} else if (idCheck == 0 || idCheck == 3) {
			// 아이디 중복확인 부분
			alert("아이디 중복체크를 해주세요.");
			return false;
		} else if (idCheck == 2) {
			alert("사용할 수 없는 아이디입니다.");
			return false;
		} else if (id.length<4 || id.length>12) {
			//아이디 길이 체크 (4~12자)
			alert("아이디를 4~12자까지 입력해주세요.")
			document.joinForm.MEMBER_ID.focus();
			document.joinForm.MEMBER_ID.select();

			//아이디 유효성 검사 (영문소문자, 숫자만 허용)
			for (var i = 0; i < document.joinForm.MEMBER_ID.value.length; i++) {
				ch = document.joinForm.MEMBER_ID.value.charAt(i)
				if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
						&& !(ch >= 'A' && ch <= 'Z')) {
					alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
					document.joinForm.MEMBER_ID.focus();
					document.joinForm.MEMBER_ID.select();
					return false;
				}
			}
			return false;
		} else if (id.indexOf(" ") >= 0) {
			alert("아이디에 공백을 사용할 수 없습니다.")
			document.joinForm.MEMBER_ID.focus();
			document.joinForm.MEMBER_ID.select();
			return false;
		} else if (pw == "") {
			//비밀번호 입력여부 체크
			alert("비밀번호를 입력하지 않았습니다.")
			document.joinForm.MEMBER_PASS.focus();
			return false;
		} else if (joinForm.MEMBER_PASS.value == joinForm.MEMBER_ID.value) {
			// 아이디와 비밀번호 같은지 확인 여부
			alert("아이디와 비밀번호가 같습니다.")
			document.joinForm.MEMBER_PASS.focus();
			return false;
		} else if (pw.length<4 || pw.length>12) {
			//비밀번호 길이 체크(4~8자 까지 허용)
			alert("비밀번호를 4~12자까지 입력해주세요.")
			document.joinForm.MEMBER_PASS.focus();
			document.joinForm.MEMBER_PASS.select();
			return false;
		} else if (pw != pwcon) {
			//비밀번호와 비밀번호 확인 일치여부 체크
			alert("비밀번호가 일치하지 않습니다")
			document.joinForm.passwordConfirm.value = ""
			document.joinForm.passwordConfirm.focus();
			return false;
		} else if (name == "") { // 이름 입력 여부 확인 
			alert("이름을 입력하지 않았습니다.")
			document.joinForm.MEMBER_NAME.focus();
			return false;
		} else if (name < 2) { // 이름 글자수 확인
			alert("이름을 2자 이상 입력해주십시오.")
			document.joinForm.MEMBER_NAME.focus();
			document.joinForm.MEMBER_NAME.select();
			return false;
		} else if (age == "") { // 나이 입력 여부 확인
			alert("나이를 입력해주세요.");
			document.joinForm.MEMBER_AGE.focus();
			return false;
		} else if (phone == "") { // 전화번호 입력 여부 확인
			alert("전화번호를 입력해주세요.");
			document.joinForm.MEMBER_PHONE.focus();
			return false;
		} else if (phone.length > 14 || phone.length < 0) {
			// 전화번호 형식 확인
			alert("전화번호 형식을 맞춰주세요.");
			document.joinForm.MEMBER_PHONE.focus();
			document.joinForm.MEMBER_PHONE.select();
			return false;
		} else if (email == "") {
			// 이메일 입력 확인
			alert("이메일을 입력하지 않았습니다.")
			document.joinForm.MEMBER_EMAIL.focus();
			return false;
		} else if (emailReg.test(email) === false) {
			// 이메일 형식
			alert("잘못된 이메일 형식입니다.");
			document.joinForm.MEMBER_EMAIL.value = ""
			document.joinForm.MEMBER_EMAIL.focus();
			return false;
		} else if (emailCheck != 1) {
			// 이메일 인증 버튼 클릭 확인
			alert('이메일을 인증해 주세요.');
			return false;
		} else if (postcode == "") {
			// 우편 주소 입력 확인
			alert('주소를 검색해주세요.');
			return false;
		} else if (jibunaddress == "") {
			alert('주소를 검색해주세요.');
			return false;
		} else if (detailaddress == "") {
			alert("상세주소를 기입해주세요.");
			document.joinForm.MEMBER_DETAILADDRESS.focus();
			return false;
		} else if (division == 2) {
			var business = (document.getElementById("MEMBER_BUSINESS").value);
			var company = (document.getElementById("MEMBER_COMPANY").value);
			if (business == "") {
				alert("사업자번호를 입력해주세요.");
				document.joinForm.MEMBER_BUSINESS.focus();
				return false;
			} else if (company == "") {
				alert("회사명을 입력해주세요.");
				document.joinForm.MEMBER_COMPANY.focus();
				return false;
			}
		}

		if (document.getElementById("mailTestIn").value != '') {
			// 이메일 인증
			$.ajax({
				type : 'post',
				url : 'checkKey',
				data : {
					"key" : joinForm.mailTestIn.value
				},
				dataType : 'text',
				success : function(data) {
					if (data == "1") {
						if (division == 1) {
							alert("회원가입 성공");
						}
						document.getElementById("joinForm").submit();
					} else {
						alert("인증키가 다릅니다.");
					}
				},
				error : function() {
					alert('인증키 확인 실패');
				}
			});
		} else {
			alert("인증키를 입력해 주세요.");
		}
	}

	// 아이디 값 변화
	function idCheRe() {
		idCheck = 0;
	}
</script>
<title>joinForm.jsp 파일입니다.</title>
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

	<div
		style="dorder: 1px dashed #BDBDBD; width: 400px; height: auto; margin: auto;">
		<form action="memberJoin" name="joinForm" id="joinForm" method="post">
			<div class="form-group">
				<label>회원 가입</label>
			</div>
			<c:choose>
				<c:when test="${MEMBER_DIVISION == 1}">
					<div class="form-group">
						<label for="MEMBER_ID">아이디 <input style="width: 40%;"
							class="btn btn-success pull-right" onclick="idOverlap()"
							value="중복확인" /></label> <input type="text" class="form-control"
							id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디"
							required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_PASS">비밀번호</label> <input type="password"
							class="form-control" id="MEMBER_PASS" name="MEMBER_PASS"
							placeholder="비밀번호" required="required">
					</div>

					<div class="form-group">
						<label for="passwordConfirm">비밀번호 확인</label> <input
							type="password" class="form-control" id="passwordConfirm"
							name="passwordConfirm" placeholder="2차 확인"
							onkeyup="passConfirm()" required="required"> <span
							id="confirmMsg"></span>
					</div>

					<div class="form-group">
						<label for="MEMBER_NAME">이름</label> <input type="text"
							class="form-control" id="MEMBER_NAME" name="MEMBER_NAME"
							placeholder="이름" required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_AGE">나이</label> <input type="text"
							class="form-control" id="MEMBER_AGE" name="MEMBER_AGE"
							placeholder="나이" required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_PHONE">전화번호</label> <input type="text"
							class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE"
							placeholder="'-'자동입력입니다." onfocus="OnCheckPhone(this)"
							onKeyup="OnCheckPhone(this)" required="required">
					</div>

					<div class="form-group" id="passForm">
						<label for="MEMBER_EMAIL">이메일 <input
							class="btn btn-info pull-right" type="button"
							onclick="createKey()" value="인증"></label> <input type="email"
							name="MEMBER_EMAIL" class="form-control" id="MEMBER_EMAIL"
							placeholder="ooo@oooo.ooo" required="required">
					</div>

					<div class="form-group">
						<label>주소 <input type="button"
							class="btn btn-info pull-right form-control"
							onclick="member_execDaumPostcode()" value="우편번호 찾기"
							required="required"></label> <input type="text"
							id="MEMBER_POSTCODE" name="MEMBER_POSTCODE" class="form-control"
							placeholder="우편번호"> <br> <input type="text"
							class="form-control" id="MEMBER_JIBUNADDRESS"
							name="MEMBER_JIBUNADDRESS" placeholder="지번주소" required="required">
						<span id="guide" style="color: #999; display: none"></span> <input
							type="text" class="form-control" id="MEMBER_DETAILADDRESS"
							name="MEMBER_DETAILADDRESS" placeholder="상세주소"
							required="required">
					</div>

				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="MEMBER_ID">아이디 <input style="width: 40%;"
							class="btn btn-success pull-right" onclick="idOverlap()"
							value="중복확인" /></label> <input type="text" class="form-control"
							id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디"
							required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_PASS">비밀번호</label> <input type="password"
							class="form-control" id="MEMBER_PASS" name="MEMBER_PASS"
							placeholder="비밀번호" required="required">
					</div>

					<div class="form-group">
						<label for="passwordConfirm">비밀번호 확인</label> <input
							type="password" class="form-control" id="passwordConfirm"
							name="passwordConfirm" placeholder="2차 확인"
							onkeyup="passConfirm()" required="required"> <span
							id="confirmMsg"></span>
					</div>

					<div class="form-group">
						<label for="MEMBER_NAME">이름</label> <input type="text"
							class="form-control" id="MEMBER_NAME" name="MEMBER_NAME"
							placeholder="이름" required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_AGE">나이</label> <input type="text"
							class="form-control" id="MEMBER_AGE" name="MEMBER_AGE"
							placeholder="나이" required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_PHONE">전화번호</label> <input type="text"
							class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE"
							placeholder="'-'자동입력입니다." onfocus="OnCheckPhone(this)"
							onKeyup="OnCheckPhone(this)" required="required">
					</div>

					<div class="form-group" id="passForm">
						<label for="MEMBER_EMAIL">이메일 <input
							class="btn btn-info pull-right" type="button"
							onclick="createKey()" value="인증"></label> <input type="email"
							name="MEMBER_EMAIL" class="form-control" id="MEMBER_EMAIL"
							placeholder="ooo@oooo.ooo" required="required">
					</div>

					<div class="form-group">
						<label>주소 <input type="button"
							class="btn btn-info pull-right form-control"
							onclick="member_execDaumPostcode()" value="우편번호 찾기"
							required="required"></label> <input type="text"
							id="MEMBER_POSTCODE" name="MEMBER_POSTCODE" class="form-control"
							placeholder="우편번호"> <br> <input type="text"
							class="form-control" id="MEMBER_JIBUNADDRESS"
							name="MEMBER_JIBUNADDRESS" placeholder="지번주소" required="required">
						<span id="guide" style="color: #999; display: none"></span> <input
							type="text" class="form-control" id="MEMBER_DETAILADDRESS"
							name="MEMBER_DETAILADDRESS" placeholder="상세주소"
							required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_BUSINESS">사업자 번호</label> <input type="text"
							class="form-control" id="MEMBER_BUSINESS" name="MEMBER_BUSINESS"
							placeholder="사업자 번호" required="required">
					</div>

					<div class="form-group">
						<label for="MEMBER_COMPANY">업소명</label> <input type="text"
							class="form-control" id="MEMBER_COMPANY" name="MEMBER_COMPANY"
							placeholder="사업자 번호" required="required">
					</div>
				</c:otherwise>
			</c:choose>
			<div style="width: 200px; height: auto; margin: auto;">
				<input type="button" class="btn btn-primary" value="회원가입"
					onclick="sendForm()" /> <input type="reset"
					class="btn btn-warning" value="다시쓰기" />
			</div>
			<input type="hidden" name="MEMBER_DIVISION" id="MEMBER_DIVISION"
				value="${MEMBER_DIVISION }">
		</form>
	</div>

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function member_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('MEMBER_POSTCODE').value = data.zonecode;
							document.getElementById("MEMBER_JIBUNADDRESS").value = data.jibunAddress;

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
			postCheck = 1;
		}
	</script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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