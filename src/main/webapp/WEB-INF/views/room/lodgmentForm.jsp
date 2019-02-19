<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
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
	<div id="wrapper">
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


		<section id="content">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">

						<div class="col-lg-3">
							<div class="box">
								<div class="box-gray aligncenter">
									<h4>체크인</h4>
								</div>
								<div class="box-bottom">
									<input type="text" id="datepicker1" name="checkIn"
										placeholder="체크인 날짜" readonly="readonly" /> <i
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
									<input type="text" id="datepicker2" name="checkOut"
										placeholder="체크아웃 날짜" readonly="readonly" /> <i
										class="ion-calendar"></i>
								</div>
							</div>
						</div>
						<form name="searchCompany" id="searchCompany"
							action="searchCompany" method="POST">
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>지역</h4>
									</div>
									<div class="box-bottom">

										<input type="text" id="region" name="region"
											value="${region }">
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
										<input type="submit" value="검색">
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


		<div id="maps">
			<div id="map" style="width: 50%; height: 350px;"></div>
			<input type="button" onclick="closeMap()" value="닫기">
		</div>

		<form name="searchRoom" id="searchRoom" method="post">
			<!-- 전송데이터 -->
			<input type="hidden" id="company_num" name="company_num"> <input
				type="hidden" id="checkin" name="checkin"> <input
				type="hidden" id="checkout" name="checkout"> <input
				type="hidden" id="companyScore" name="companyScore">
		</form>

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<section id="projects">
						<ul id="thumbs" class="portfolio">
							<!-- Item Project and Filter Name -->
							<c:forEach var="co" items="${companyList}" varStatus="cnt">
								<!-- ajax 데이터 -->
								<input type="hidden" name="address${cnt.index}"
									id="address${cnt.index}" value="${co.COMPANY_ADDRESS }">
								<input type="hidden" name="name${cnt.index}"
									id="name${cnt.index}" value="${co.COMPANY_NAME}">
								<input type="hidden" id="company_num${cnt.index}"
									value="${co.COMPANY_NUM }">
								<li class="col-lg-3 design" data-id="id-0" data-type="web">
									<div class="item-thumbs">
										<h1>${co.COMPANY_NAME}<a href="#"
												class="btn btn-warning btn-rounded"
												onclick="test(${cnt.index})">방보기</a>
										</h1>
										<c:if test="${co.COMPANY_IMAGENAME ne null}">
											<a class="hover-wrap fancybox"> </a>
											<img src="./resources/companyImage/${co.COMPANY_IMAGENAME}">
										</c:if>
										<h4>
											<span class="star-rating"> <span
												style="width:  ${score.get(cnt.index)*20 }%"></span>
											</span> ${score.get(cnt.index) }
										</h4>
										<input type="hidden" id="score${cnt.index }"
											value=" ${score.get(cnt.index) }"> <span>
											${co.COMPANY_ADDRESS }</span> <a href="#"
											class="btn btn-success btn-rounded"
											onclick="searchAddress(${cnt.index})">지도</a>

									</div>
								</li>
							</c:forEach>
							<!-- End Item Project -->
						</ul>
					</section>

					<div class="row">
						<div class="col-lg-12">
							<div class="solidline"></div>
						</div>
					</div>
					<!--페이지  -->
					<div style="width: 340px; margin: auto;">
						<c:if test="${pageVO.page>=1 }">
							<c:choose>
								<c:when test="${pageVO.page<=1 }">
									<input type="button" value="[이전]" disabled>
								</c:when>
								<c:when test="${pageVO.page>1 }">
									<input type="button" onclick="movePage(${pageVO.page-1 })"
										value="[이전]">
								</c:when>
							</c:choose>

							<!-- 페이지 번호 -->
							<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
								varStatus="cnt">
								<c:if test="${pageVO.page == cnt.count }">
									<input type="button" onclick="movePage(${cnt.count })"
										value="${cnt.count }" disabled>
								</c:if>
								<c:if test="${pageVO.page != cnt.count }">
									<input type="button" onclick="movePage(${cnt.count })"
										value="${cnt.count }">
								</c:if>
							</c:forEach>

							<!-- 다음 -->
							<c:choose>
								<c:when test="${pageVO.page>=pageVO.maxPage }">
									<input type="button" value="[다음]" disabled>
								</c:when>
								<c:when test="${pageVO.page<pageVO.maxPage }">
									<input type="button" onclick="movePage(${pageVO.page+1 })"
										value="[다음]">
								</c:when>
							</c:choose>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
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


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23983bae744f7dd4fb2f88c5d654a51e&libraries=services"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>

	<script type="text/javascript">
	function movePage(page){
		document.getElementById("page").value = page;
		document.searchCompany.action="searchCompany"
		document.searchCompany.submit();
	}
	</script>
	<!-- 지도 -->
	<script type="text/javascript">
	function test(index){
		console.log(index);
		var d1=$("#datepicker1").datepicker("getDate");
		var d2=$("#datepicker2").datepicker("getDate");
		if(d1>d2){
			alert('체크아웃이 체크인보다 뒤에있습니다.');			
		}else{
			var checkIn=d1.getFullYear() + "-" + ("00" + (d1.getMonth() + 1)).slice(-2) + "-" + ("00" + d1.getDate()).slice(-2);
			var checkOut=d2.getFullYear() + "-" + ("00" + (d2.getMonth() + 1)).slice(-2) + "-" + ("00" + d2.getDate()).slice(-2);
			document.getElementById("checkin").value = checkIn;
			document.getElementById("checkout").value = checkOut;
			var companyNum=document.getElementById('company_num'+index).value;
			var score=document.getElementById('score'+index).value;
			document.getElementById("companyScore").value = score;
			document.getElementById('company_num').value=companyNum;
			document.searchRoom.action="searchRoom"
			document.searchRoom.submit();
		}		
	}
	document.getElementById('maps').hidden = true;
	function closeMap(){
		document.getElementById('maps').hidden = true;
	}	
	function searchAddress(index) {
			document.getElementById('maps').hidden = false;
			console.log(index);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);
			
			console.log(index);
			//주소입력내용 가져오기
			var address = document.getElementById('address'+index).value;
			//업소명 가져오기
			var company = document.getElementById('name'+index).value;;
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
	<script>/* 달력 */
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
			dateFormat : "yy-mm-dd",			
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : "년"
		})
		$("#datepicker1").datepicker({
			minDate : 0,
			dateFormat : "yy-mm-dd",
			onSelect : function(selected, event) {
				console.log(selected);
				/* 
				 * wix-send-messages from html component
				 * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
				 */
				window.parent.postMessage(selected, "*");
			}
		}).datepicker("setDate", "0");
		$("#datepicker2").datepicker({
			minDate : document.getElementById("datepicker1").value,
			dateFormat : "yy-mm-dd",
			onSelect : function(selected, event) {
				console.log(selected);				
				window.parent.postMessage(selected, "*");
			}
		}).datepicker("setDate", "0");
	</script>
</body>
</html>