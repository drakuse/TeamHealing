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

<title></title>
<style>
ul {
	list-style: none;
	padding-left: 0px;
}

td {
	padding-left: 0px;
}
</style>
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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js"
	type="application/javascript"></script>
<script>
	{
	  "code": -15100,
	  "msg": "approve_url(https	://api.bootpay.co.kr/kakao?receipt_id=5c4e468ce23d1b25eb02afec) does not match registered website domain.",
	  "action": "BootpayError"
	}
</script>
<script>
function kakao(index){
	var PRODUCT_NUM = $('#PRODUCT_NUM').val();
	var PRODUCT_NAME= $('#PRODUCT_NAME').val();
	var ORDER_AMOUNT= $('#ORDER_AMOUNT').val();
	var ORDER_PRICE= $('#ORDER_PRICE').val();
	var MEMBER_NAME=$('#MEMBER_NAME').val();
	var ORDER_DIVISION=$('#ORDER_DIVISION').val();
	var ORDER_NUM=$('#ORDER_NUM').val();
	
	
	BootPay.request({
	price: ORDER_PRICE,
	application_id: "5c4aa4c9b6d49c2262e2a9ae",
	name: PRODUCT_NAME,
	pg: 'kakao',
	method: 'easy',
	show_agree_window: 0,
	items: [
		{
			item_name: '나는 아이템',
			qty: 1,
			unique: '123',
			price: 1000,
			cat1: 'TOP',
			cat2: '티셔츠',
			cat3: '라운드 티',
		}
	],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
	order_id: '고유order_id_1234',
	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	account_expire_at: '2018-05-25',
	extra: {
	    start_at: '2018-10-10',
		end_at: '2021-10-10',
        vbank_result: 1,
        quota: '0,2,3'
	}
}).error(function (data) {
	console.log(data);
}).cancel(function (data) {
	console.log(data);
}).ready(function (data) {
	console.log(data);
}).confirm(function (data) {
	console.log(data);
	if (confirm('결제하시겠습니까?')) {
		if(index==1){
			var ORDER_NAME=$('#ORDER_NAME1').val();
			var ORDER_POSTCODE=$('#ORDER_POSTCODE1').val();
			var ORDER_JIBUNADDRESS=$('#ORDER_JIBUNADDRESS1').val();
			var ORDER_DETAILADDRESS=$('#ORDER_DETAILADDRESS1').val();
			var ORDER_PHONE=$('#ORDER_PHONE1').val();
			var ORDER_REQUIREMENT=$('#ORDER_REQUIREMENT1').val();
		}else{
			var ORDER_NAME=$('#ORDER_NAME').val();
			var ORDER_POSTCODE=$('#ORDER_POSTCODE').val();
			var ORDER_JIBUNADDRESS=$('#ORDER_JIBUNADDRESS').val();
			var ORDER_DETAILADDRESS=$('#ORDER_DETAILADDRESS').val();
			var ORDER_PHONE=$('#ORDER_PHONE').val();
			var ORDER_REQUIREMENT=$('#ORDER_REQUIREMENT').val();
		}
		this.transactionConfirm(data);
		location.href="kakaoPay?PRODUCT_NUM="+PRODUCT_NUM+"&PRODUCT_NAME="+PRODUCT_NAME
				+"&ORDER_AMOUNT="+ORDER_AMOUNT+"&ORDER_PRICE="+ORDER_PRICE
				+"&ORDER_DIVISION="+ORDER_DIVISION+"&ORDER_NUM="+ORDER_NUM+
				"&ORDER_NAME="+ORDER_NAME+"&ORDER_POSTCODE="+ORDER_POSTCODE+
				"&ORDER_JIBUNADDRESS="+ORDER_JIBUNADDRESS+"&ORDER_DETAILADDRESS="+ORDER_DETAILADDRESS+
				"&ORDER_PHONE="+ORDER_PHONE+"&ORDER_REQUIREMENT="+ORDER_REQUIREMENT;
		
	} else {
		this.removePaymentWindow();
	}
}).close(function (data) {
    console.log(data);
}).done(function (data) {
	console.log(data);
});
	}
</script>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".resultArea > ul").last().hide();
		var radioContent = $(".resultArea > ul");
		$("input[type='radio']").click(function() {
			radioContent.hide();
			radioContent.eq($("input[type='radio']").index(this)).show();
		});
	});
</script>
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
	<input type="hidden" name="ORDER_NUM" id="ORDER_NUM"
		value="${cartVO.ORDER_NUM }" />
	<input type="hidden" name="MEMBER_ID" value="${cartVO.MEMBER_ID }" />
	<input type="hidden" name="PRODUCT_NAME" id="PRODUCT_NAME"
		value="${cartVO.PRODUCT_NAME }" />
	<input type="hidden" name="ORDER_AMOUNT" id="ORDER_AMOUNT"
		value="${cartVO.ORDER_AMOUNT }" />
	<input type="hidden" name="ORDER_PRICE" id="ORDER_PRICE"
		value="${cartVO.ORDER_PRICE }" />
	<input type="hidden" name="PRODUCT_NUM" id="PRODUCT_NUM"
		value="${cartVO.PRODUCT_NUM }" />
	<input type="hidden" name="ORDER_NAME" id="ORDER_NAME1"
		value="${member.MEMBER_NAME }" />
	<input type="hidden" name="ORDER_POSTCODE" id="ORDER_POSTCODE1"
		value="${member.MEMBER_POSTCODE }" />
	<input type="hidden" name="ORDER_JIBUNADDRESS" id="ORDER_JIBUNADDRESS1"
		value="${member.MEMBER_JIBUNADDRESS }" />
	<input type="hidden" name="ORDER_DETAILADDRESS"
		id="ORDER_DETAILADDRESS1" value="${member.MEMBER_DETAILADDRESS }" />
	<input type="hidden" name="ORDER_PHONE" id="ORDER_PHONE1"
		value="${member.MEMBER_PHONE }" />
	<input type="hidden" name="ORDER_DIVISION" id="ORDER_DIVISION"
		value="${cartVO.ORDER_DIVISION }" />

	<section class="callaction">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div style="width: 400px; height: auto; margin: auto;">
						<div class="big-cta">
							<div class="cta-text">
								<h2>상품이름 ${cartVO.PRODUCT_NAME }</h2>
								<h3>수량 ${cartVO.ORDER_AMOUNT } &nbsp; 금액
									${cartVO.ORDER_PRICE }</h3>


								<ul>
									<li><input type="radio" name="tab" id="tab1"
										checked="checked" /> <label for="tab1" class="contentType">기본배송지</label>
										<input type="radio" name="tab" id="tab2" /> <label for="tab2"
										class="contentType">직접입력</label></li>
								</ul>
							</div>
						</div>
						<div class="resultArea">
							<ul>
								<li>

									<h4>
										수령인 ${member.MEMBER_NAME }<br> <br> 주소
										${member.MEMBER_POSTCODE}
										${member.MEMBER_JIBUNADDRESS}${member.MEMBER_DETAILADDRESS}<br>
										<br> 핸드폰 ${member.MEMBER_PHONE }<br> <br> 요구사항
										<input type="text" class="form-control"
											name="ORDER_REQUIREMENT" id="ORDER_REQUIREMENT1" /> <input
											type="hidden" name="ORDER_NAME"
											value="${member.MEMBER_NAME }" /><br> <br> <a
											href="#" onclick="kakao(1)"
											class="btn btn-success btn-rounded">구매하기</a>
									</h4>
								</li>
							</ul>
						</div>
						<div class="resultArea">
							<input type="hidden" name="ORDER_NUM"
								value="${cartVO.ORDER_NUM }" /> <input type="hidden"
								name="MEMBER_ID" value="${cartVO.MEMBER_ID }" /> <input
								type="hidden" name="PRODUCT_NAME"
								value="${cartVO.PRODUCT_NAME }" /> <input type="hidden"
								name="ORDER_AMOUNT" value="${cartVO.ORDER_AMOUNT }" /> <input
								type="hidden" name="ORDER_PRICE" value="${cartVO.ORDER_PRICE }" />

							<ul>
								<li>
									<div class="form-group">
										<h4>수령인</h4>
										<input type="text" name="ORDER_NAME" id="ORDER_NAME"
											class="form-control" />
									</div>

									<div class="form-group">
										<h4>
											주소 <input class="btn btn-success btn-rounded" type="button"
												onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" name="ORDER_POSTCODE" id="ORDER_POSTCODE"
												class="form-control" placeholder="우편번호"> <br> <input
												type="text" class="form-control" name="ORDER_JIBUNADDRESS"
												id="ORDER_JIBUNADDRESS" placeholder="주소"><br> <input
												type="text" class="form-control" name="ORDER_DETAILADDRESS"
												id="ORDER_DETAILADDRESS" placeholder="상세주소"><br>
											휴대전화<br> <input type="text" class="form-control"
												onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)"
												name="ORDER_PHONE" id="ORDER_PHONE" /><br> 요구사항<br>
											<input type="text" class="form-control"
												name="ORDER_REQUIREMENT" id="ORDER_REQUIREMENT" /><br>
										</h4>
										<br> <a href="#" onclick="kakao(2)"
											class="btn btn-success btn-rounded">구매하기</a>

									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = '';

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						document.getElementById('ORDER_POSTCODE').value = data.zonecode;
						document.getElementById("ORDER_JIBUNADDRESS").value = addr;

						document.getElementById("ORDER_DETAILADDRESS")
								.focus();
					}
				}).open();
	}
</script>
</html>