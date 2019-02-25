<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
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
<style>
* {
	box-sizing: border-box;
	font-family: 'NanumGothic, sans-serif';
}

body {
	margin: 0;
}
/* placeholder color */
input:-ms-input-placeholder {
	color: #000;
}

input::-webkit-input-placeholder {
	color: #000;
}

input::-moz-placeholder {
	color: #000;
}

input::-moz-placeholder {
	color: #000;
}

.wrapper {
	position: relative;
	width: 445px;
	height: 45px;
	margin: 10px;
}

.ion-calendar {
	position: absolute;
	right: 20px;
	top: 14px;
}
/* input */
#datepicker1 {
	border: 1px solid #c6e2f7;
	border-radius: 5px;
	width: 100%;
	height: 100%;
	font-size: 16px;
	text-align: center;
	cursor: pointer;
}

#datepicker1:hover {
	background-color: #eaf7ff;
}

#datepicker1:focus {
	outline: none;
}

#datepicker1:focus>.ui-datepicker {
	display: block;
}

#datepicker2 {
	border: 1px solid #c6e2f7;
	border-radius: 5px;
	width: 100%;
	height: 100%;
	font-size: 16px;
	text-align: center;
	cursor: pointer;
}

#datepicker2:hover {
	background-color: #eaf7ff;
}

#datepicker2:focus {
	outline: none;
}

#datepicker2:focus>.ui-datepicker {
	display: block;
}

/* calendar table */
.ui-datepicker {
	display: none;
	background-color: #fff;
	border-radius: 5px;
	margin-top: 10px;
	margin-left: 42.5px;
	margin-right: 42.5px;
	padding: 20px;
	width: 360px;
}

.ui-datepicker-prev, .ui-datepicker-next {
	cursor: pointer;
}

.ui-datepicker-next {
	float: right;
}

.ui-state-disabled {
	cursor: auto;
	color: hsla(0, 0%, 80%, 1);
}

.ui-datepicker-title {
	text-align: center;
	padding: 10px;
	font-weight: 100;
	font-size: 20px;
}

.ui-datepicker-calendar {
	width: 100%;
}
/* day of week cell */
.ui-datepicker-calendar>thead>tr>th {
	padding: 5px;
	font-size: 20px;
	font-weight: 400;
}
/* day cell */
.ui-datepicker-calendar>tbody>tr>td {
	border-radius: 100%;
	width: 44px;
	height: 44px;
	cursor: pointer;
	padding: 5px;
	font-weight: 100;
	text-align: center;
}

.ui-datepicker-calendar>tbody>tr>td:hover {
	background-color: #c6e2f7;
}

.ui-datepicker-calendar>tbody>tr>td>a {
	color: #000;
	font-size: 18px;
	font-weight: 400;
	text-decoration: none;
}
/* past days */
.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
	cursor: auto;
	background-color: #fff;
}
/* media */
@media ( max-width : 445px) {
	.wrapper {
		width: calc(90vw - 20px);
	}
	.ui-datepicker {
		margin-right: 0;
		margin-left: 0;
		padding: 10px;
		width: calc(100vw - 20px);
		margin: 10px auto;
	}
	.ui-datepicker-calendar>tbody>tr>td {
		width: 38px;
		height: 38px;
	}
}

.star-rating {
	width: 205px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 39px;
	overflow: hidden;
	background: url('images/grade_img.png') no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}
</style>
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
						<li class="active"><a href="home">Home</a></li>
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

	<input type="hidden" id="startDate" name="startDate"
		value="${search.checkIn }">
	<input type="hidden" id="endDate" name="endDate"
		value="${search.checkOut }">

	<section id="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<form id="searchRoom" name="searchRoom" action="searchRoom"
						method="post">
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>체크인</h4>
								</div>
								<div class="box-bottom">
									<input type="text" id="datepicker1" name="checkin"
										placeholder="체크인 날짜" readonly="readonly" value= /> <i
										class="ion-calendar"></i>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>체크아웃</h4>
								</div>
								<div class="box-bottom">
									<input type="text" id="datepicker2" name="checkout"
										placeholder="체크아웃 날짜" readonly="readonly" /> <i
										class="ion-calendar"></i>
								</div>
							</div>
						</div>
						<input type="hidden" id="company_num" name="company_num">
						<input type="hidden" id="room_num" name="room_num"> <input
							type="hidden" id="price" name="price"> <input
							type="hidden" id="companyScore" name="companyScore"
							value=${search.companyScore }>
					</form>

					<form name="searchCompany" id="searchCompany"
						action="searchCompany" method="POST">
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>지역</h4>
								</div>
								<div class="box-bottom">

									<input type="text" id="region" name="region" value="${region }">
									<c:choose>
										<c:when test="${page eq null}">
											<input type="hidden" id="page" name="page" value='1'>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="page" name="page" value='${page}'>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>검색</h4>
								</div>
								<div class="box-bottom">
									<input type="button" onclick="setComapnyNum()" value="날짜변경">
									<input type="submit" value="숙소검색">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- divider -->
		<div class="row">
			<div class="col-lg-12">
				<div class="solidline"></div>
			</div>
		</div>
		<!-- end divider -->
		<!-- Portfolio Projects -->
	</section>

	<input type="hidden" name="address" id="address"
		value="${company.COMPANY_ADDRESS }">
	<input type="hidden" name="name" id="name"
		value="${company.COMPANY_NAME}">

	<section class="callaction">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="big-cta">
						<h4>
							<span class="star-rating"> <span
								style="width:  ${search.companyScore*20 }%"></span>
							</span> ${search.companyScore }
						</h4>
						<div class="cta-text">
							<h2>
								<span>${company.COMPANY_NAME}</span>
							</h2>
							<c:if test="${company.COMPANY_IMAGENAME ne null}">
								<h6>
									<img
										src="./resources/companyImage/${company.COMPANY_IMAGENAME}">
								</h6>
							</c:if>
							${company.COMPANY_ADDRESS } <a href="#"
								class="btn btn-success btn-rounded" onclick="searchAddress()">지도</a>
						</div>
						<div id="maps">
							<div id="map" style="width: 100%; height: 350px; margin: auto;"></div>
							<div>
								<a href="#" class="btn btn-success btn-rounded"
									onclick="closeMap()">닫기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="row">
		<div class="col-lg-12">
			<div class="solidline"></div>
		</div>
	</div>

	<c:if test="${ emptyRoom eq 'n'}">
		<input type="hidden" id="companyNum" name="companyNum"
			value="${company.COMPANY_NUM }">
		<input type="hidden" id="companyName" name="companyName"
			value="${company.COMPANY_NAME }">
		<c:forEach var="ro" items="${roomList}" varStatus="cnt">
			<section class="callaction">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="big-cta">
								<h4>
									<span class="star-rating"> <span
										style="width: ${score.get(cnt.index)*20 }%"></span>
									</span> ${score.get(cnt.index) }
								</h4>
								<div class="cta-text">
									<h3>
										<span>${ro.ROOM_NAME}</span>
									</h3>
									<h6>
										<c:if test="${ro.ROOM_IMAGENAME ne null}">
											<img src="./resources/roomImage/${ro.ROOM_IMAGENAME}"
												width="500" height="250">
										</c:if>
									</h6>
									<h5>
										숙박인원 : ${ro.ROOM_LIMIT } <br> <br> 가격 :
										${ro.ROOM_PRICE }
									</h5>
									<a href="#" class="btn btn-theme btn-rounded"
										onclick="openReview(${cnt.index}, ${fn:length(roomList)})">리뷰보기</a>
									<a href="#" class="btn btn-primary btn-rounded"
										onclick="closeReview(${cnt.index})">리뷰닫기</a>
									<c:choose>
										<c:when test="${isBook.get(cnt.index) eq '예약완료' }">
											<a href="#" onclick="alreadyAlert()"
												class="btn btn-danger btn-rounded">예약완료</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="btn btn-success btn-rounded"
												onclick="kakao(${cnt.index})">${isBook.get(cnt.index) }</a>
											<input type="hidden" id="roomNum${cnt.index }"
												name="roomNum${cnt.index }" value="${ro.ROOM_NUM}">
											<input type="hidden" id="roomName${cnt.index }"
												name="roomName${cnt.index }" value="${ro.ROOM_NAME}">
											<input type="hidden" id="roomPrice${cnt.index }"
												name="roomPrice${cnt.index }" value="${ro.ROOM_PRICE}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="row">
				<div class="col-lg-12">
					<div class="solidline"></div>
				</div>
			</div>
			<section id="content">
				<div class="row">
					<div class="col-lg-12">
						<div id="review${cnt.index}" class="row">
							<c:if test="${not empty review.get(cnt.index) }">
								<c:forEach var="re" items="${review.get(cnt.index)}"
									varStatus="cnt2">
									<div class="col-lg-3">
										<span class="star-rating"> <span
											style="width:  ${re.ROOM_REVIEW_SCORE*20 }%"></span>
										</span>
										<div class="box">
											<div class="box-gray aligncenter">
												<h6>${re.MEMBER_ID }</h6>
												<c:if test="${not empty re.ROOM_REVIEW_IMAGENAME}">
													<div>
														<img
															src="./resources/reviewImage/${re.ROOM_REVIEW_IMAGENAME}"
															width="250" height="150">
													</div>
												</c:if>
												<c:if test="${empty re.ROOM_REVIEW_IMAGENAME }">
													<div class="icon">
														<i class="fa fa-edit fa-3x"></i>
													</div>

												</c:if>
												<p>${re.ROOM_REVIEW_CONTENT }</p>
											</div>
											<div class="box-bottom">
												<h6>
													<a href="#" onclick="roomLike(${re.ROOM_REVIEW_NUM })"
														class="btn btn-success btn-rounded">${re.ROOM_REVIEW_LIKE }&nbsp;&nbsp;<i
														class="fa fa-heart"></i></a> <a href="#"
														onclick="roomRefuse(${re.ROOM_REVIEW_NUM })"
														class="btn btn-danger btn-rounded">
														${re.ROOM_REVIEW_REPORT }&nbsp;&nbsp;<i
														class="fa fa-bullhorn"></i>
													</a>
												</h6>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</section>
		</c:forEach>
	</c:if>
	<input type="hidden" id="roomSize" value="${fn:length(roomList)}">
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
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
	<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js"
		type="application/javascript"></script>
	<script>
   {
     "code": -15100,
     "msg": "approve_url(https://api.bootpay.co.kr/kakao?receipt_id=5c4e468ce23d1b25eb02afec) does not match registered website domain.",
     "action": "BootpayError"
   }
</script>
	<!--  -->
	<script type="text/javascript">
function alreadyAlert(){
	alert('이미 예약되었습니다.');
}
</script>
	<script type="text/javascript">
function roomLike(num) {
	var member_id = "<%=(String) session.getAttribute("MEMBER_ID")%>"

	if(member_id=='null'){
		alert('로그인이 필요합니다.');
		}else{
			console.log(num);
			$.ajax({
				type : "post",
				url : "roomReviewLike",
				data : {
					"ROOM_REVIEW_NUM" : num
				},
				dataType : "text",
				//ajax 통신 성공
				success : function(data) {
					if (data == "1") {
						alert("이미 추천했습니다");
					} else {
						alert("추천했습니다");
						window.location.reload();
					}
				},
				//ajax 통신 실패
				error : function() {
					alert("ajax 실패");
				}
			});
		}	
}
</script>
	<!-- 결제 -->
	<script type="text/javascript">
	function roomRefuse(num) {
		var member_id = "<%=(String) session.getAttribute("MEMBER_ID")%>"

		if(member_id=='null'){
			alert('로그인이 필요합니다.');
			}else{
				console.log(num);
				$.ajax({
					type : "post",
					url : "roomReviewRefuse",
					data : {
						"ROOM_REVIEW_NUM" : num
					},
					dataType : "text",
					//ajax 통신 성공
					success : function(data) {
						if (data == "1") {
							alert("이미 신고했습니다");
						} else {
							alert("신고했습니다");
							window.location.reload();
						}
					},
					//ajax 통신 실패
					error : function() {
						alert("ajax 실패");
					}
				});
			}	
	}
	</script>

	<script>
	function kakao(index){
	var d1=$("#datepicker1").datepicker("getDate");
	var d2=$("#datepicker2").datepicker("getDate");
	var days=(d2-d1)/(60*60*24*1000)+1;
	var roomNum=$('#roomNum'+index).val();
	var roomName=$('#companyName').val()+" "+$('#roomName'+index).val();
	var roomPrice=$('#roomPrice'+index).val()*days;	

	var member_id = "<%=(String) session.getAttribute("MEMBER_ID")%>"

	if(member_id=='null'){
		alert('로그인이 필요합니다.');
	}else{				
	   BootPay.request({
	   price: roomPrice,
	   application_id: "5c4aa4c9b6d49c2262e2a9ae",
	   name: roomName,
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
	      this.transactionConfirm(data);
	  	var cn=document.getElementById("companyNum").value; 
		document.getElementById("company_num").value=cn;
		document.getElementById("room_num").value=roomNum;
		document.getElementById("price").value=roomPrice;
		document.searchRoom.action="joinBook"
		document.searchRoom.submit();
	   } else {
	      this.removePaymentWindow();
	   }
	}).close(function (data) {
	    console.log(data);
	}).done(function (data) {
	   console.log(data);
	});   
	}
   }
</script>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23983bae744f7dd4fb2f88c5d654a51e&libraries=services"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
	<script type="text/javascript">	
    function closeMap(){ 
			document.getElementById('maps').hidden = true;
	}
    var size=document.getElementById('roomSize').value;
    for(var i=0; i<size; i++){	
			document.getElementById('review'+i).hidden = true;				
	}
    function openReview(index, size){
    	for(var i=0; i<size; i++){
    		if(i==index){    			
    			document.getElementById('review'+index).hidden = false;
    		}else{
    			document.getElementById('review'+index).hidden = true;
    		}    		
    	}
    	document.getElementById('review'+index).hidden = false;
    }
    function closeReview(index){    	
    	document.getElementById('review'+index).hidden = true;
    }
	</script>
	<script type="text/javascript">
    document.getElementById('maps').hidden = true;
    function closeMap(){ 
			document.getElementById('maps').hidden = true;
	}
		function searchAddress() {
			document.getElementById('maps').hidden = false;
			var open = 1;
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);
			
			//주소입력내용 가져오기
			var address = document.getElementById('address').value;
			//업소명 가져오기
			var company = document.getElementById('name').value;;
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							address,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === daum.maps.services.Status.OK) {

									var coords = new daum.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new daum.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new daum.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">'
														+ company + '</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		}		
	</script>

	<script type="text/javascript">
 		function setComapnyNum() {
			var cn=document.getElementById("companyNum").value;
			document.getElementById("company_num").value=cn;
			document.searchRoom.action="searchRoom"
			document.searchRoom.submit();
		}
		function book(roomNum, price) {
			var cn=document.getElementById("companyNum").value;
			document.getElementById("company_num").value=cn;
			document.getElementById("room_num").value=roomNum;
			document.getElementById("price").value=price;
			document.searchRoom.action="joinBook"
			document.searchRoom.submit();
		}
	</script>

	<script>
		/* 달력 */
		$.datepicker.setDefaults({
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			weekHeader : "주",
			dateFormat : "yy-mm-d",
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : "년"
		})
		$("#datepicker1").datepicker({
			minDate : 0,
			/* to use in wix */
			onSelect : function(selected, event) {
				console.log(selected);
				/* 
				 * wix-send-messages from html component
				 * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
				 */
				window.parent.postMessage(selected, "*");
			}
		}).datepicker("setDate", document.getElementById("startDate").value);
		$("#datepicker2").datepicker({
			minDate : 0,
			/* to use in wix */
			onSelect : function(selected, event) {
				console.log(selected);
				/* 
				 * wix-send-messages from html component
				 * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
				 */
				window.parent.postMessage(selected, "*");
			}
		}).datepicker("setDate", document.getElementById("endDate").value);
	</script>
</body>
</html>