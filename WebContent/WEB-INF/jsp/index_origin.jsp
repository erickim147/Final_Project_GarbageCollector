<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MobilePage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 1000px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}
</style>
</head>
<body>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
						<form action="info" method="post" id="frm">		
						<input type="hidden" name="pldistance" value="">      	<!--  거리 컨트롤러로 전송 -->
						<input type="hidden" name="pltime" value="">     		    <!--  경과시간 컨트롤러로 전송 -->
						<input type="hidden" name="pldate" value="">     		    <!--  날짜 컨트롤러로 전송 -->
						<input type="hidden" name="pltrashpick" value="0">      			<!--  줍기 횟수 컨트롤러로 전송 추가!! -->
						</form>
						<br><span id="dd"></span>										<!-- 해당 내용을 화면에 보여주지 않고 보내줘도 될 것같긴한데 종종 오류나는 경우가 있어서 한번 더 확인하고 살릴지 없앨지 선택해야할것 같습니다. -->
						<br><span id="centerAddr"></span>
						<span>실행시간 : </span><span id="stopwatch">00:00:00</span> 
						<br><span>이동거리:</span><span id="distance">0</span>
						<br><span>쓰래기 갯수:</span><span id="tp">0</span>                <!--  줍기 횟수 화면에보여주기 추가!! -->
						
							<!-- 다음페이지인 결과 페이지에 올릴예정
							<h4 class="card-title1">플로깅 테이블</h4>
							</div>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>목록</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>일시</td>
											<td>날짜넣기</td>
										</tr>
										<tr>
											<td>장소</td>
											<td><span id="centerAddr"></span></td>
										</tr>
										<tr>
											<td>거리</td>
											<td>100m</td>
										</tr>
										<tr>
											<td>시간</td>
											<td>00:10:24</td>
										</tr>
									</tbody>
								</table>

							</div>
							삭제예정 !!!!!
							 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 grid-margin stretch-card">

			<div class="col-lg-12 stretch-card">
				<div id="map" style="width: 100%; height: 550px;"></div>
				<div class="">
					<button type="button" id="gBtn">줍줍</button>
					<button type="button" onclick="button_event();">종료</button>
				</div>
			</div>
		</div>

	</div>
	<div id="map"></div>
</div>
	</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b55f6186af7265f2eeff26a4791525d"></script>
<script>
/* -----------------------------------------------------------경과시간 알림 스크립트------------------------------------------------------------ */
</script>
<script>
window.onload = function() {
   time++;
   stopwatch.innerText = getTimeFormatString();
   printTime();
   stopClock();
   timerId = setTimeout(startClock, 1000);
};
</script>
<script src="./stopwatch.js" type="text/javascript"></script>

<script>
let timerId;
let time = -2;
const stopwatch = document.getElementById("stopwatch");
let  hour, min, sec;


function printTime() {
    time++;
    stopwatch.innerText = getTimeFormatString();
}

//시계 시작 - 재귀호출로 반복실행
function startClock() {
    printTime();
    stopClock();
    timerId = setTimeout(startClock, 1000);
}

//시계 중지
function stopClock() {
    if (timerId != null) {
        clearTimeout(timerId);
    }
}

// 시계 초기화
function resetClock() {
    stopClock()
    stopwatch.innerText = "00:00:00";
    time = 0;
}

// 시간(int)을 시, 분, 초 문자열로 변환
function getTimeFormatString() {
    hour = parseInt(String(time / (60 * 60)));
    min = parseInt(String((time - (hour * 60 * 60)) / 60));
    sec = time % 60;

    var tt = String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
    /* console.log(typeof(tt));
    console.log(tt); */
    $('input[name=pltime]').attr('value',tt);  /* ----------------------------input hidden 으로 결과창에 값 전송 -------------------------------*/
    return String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
}
/* -----------------------------------------------------------경과시간 알림 스크립트------------------------------------------------------------ */
/* -----------------------------------------------------------오늘 날짜  스크립트------------------------------------------------------------ */

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dd = year + '-' + month  + '-' + day;
	console.log(typeof(dd));
	document.getElementById("dd").innerHTML=dd;
	$('input[name=pldate]').attr('value',dd);
	/* -----------------------------------------------------------오늘 날짜  스크립트------------------------------------------------------------ */
</script>

	<script>
		/*---------------------------------------------------- 지도 생성--------------------------------------------------------------- */

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var linePath = [];
		
		var trashPick = $('#tp').val();
		
		$('#gBtn').click( function() {
			   trashPick++;
			   var imageSrc = 'resources/images/trash.png', // 마커이미지의 주소입니다    
			    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(30, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    document.getElementById("tp").innerHTML=trashPick;
			    $('input[name=pltrashpick]').attr('value',trashPick);
			    
			   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			       markerPosition = new kakao.maps.LatLng(linePath[linePath.length-1].Ma, linePath[linePath.length-1].La); // 마커가 표시될 위치입니다
			   
			   // 마커를 생성합니다
			   var marker = new kakao.maps.Marker({
			       position: markerPosition, 
			       image: markerImage // 마커이미지 설정 
			   });
			   
			   // 마커가 지도 위에 표시되도록 설정합니다
			   marker.setMap(map);  
			   
			   
			} ); 
		
		

		/*---------------------------------------------------- 현재 위치 나타내기 시작(작동 안됨)--------------------------------------------------------------- */

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				
				var infoDiv = document.getElementById('centerAddr');
				
				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
/* 						var loc1 = result[i].address_name;
						var loc = String(loc1)
						$('input[name=loc]').attr('value',loc);  /* ----------------------------input hidden 으로 결과창에 값 전송 -------------------------------*/ 
						break;
					}
				}
			} 
			
		}
		
		/* ---------------------------------------------------- 현재 위치 나타내기 끝(작동 안됨)---------------------------------------------------------------  */
	</script>



	<script>
	/* ---------------------------------------------------- 실시간 현재 위치 나타내기 스크립트---------------------------------------------------------------  */
	var totalDist = 0;
	
	function setChanged(position) {
		   if(count == 500000) { // clearWatch() 테스트를 위해 5번만 서비스
		        navigator.geolocation.clearWatch(watchID); // 반복 서비스 종료
		        document.getElementById("msg").innerHTML = totalDist;
		        return;
		    }
		    
		    var lat = position.coords.latitude; // 변경된 위도
		    var lon = position.coords.longitude // 변경된 경도
		    
		    var markerPosition  = new kakao.maps.LatLng(lat, lon);
		    if(linePath.length >= 1){
		       totalDist = totalDist+getDistance(linePath[linePath.length-1].Ma, linePath[linePath.length-1].La,markerPosition.Ma,markerPosition.La)
		    }
		    document.getElementById("distance").innerHTML=totalDist;
		    $('input[name=pldistance]').attr('value',totalDist); /* ----------------------------input hidden 으로 결과창에 값 전송 -------------------------------*/
		    linePath.push(markerPosition);
		    
		 // 지도에 표시할 선을 생성합니다
		    var polyline = new kakao.maps.Polyline({
		        path: linePath, // 선을 구성하는 좌표배열 입니다
		        strokeWeight: 5, // 선의 두께 입니다
		        strokeColor: '#FFAE00', // 선의 색깔입니다
		        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'solid' // 선의 스타일입니다
		    });
		   
		    // 지도에 선을 표시합니다 
		    polyline.setMap(map);  
		    // 지도 이미지 갱신
//		    new kakao.maps.LatLng(lat, lon)
		  //  if(count == 0) // 처음이면 구글 지도 이미지 부착
		    //    document.getElementById("map").appendChild(img); // 지도 이미지 부착
		    count++; // 갱신 회수 증가
		}

		function changed(position) {
		   setInterval(setChanged(position), 5000);
		}

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		   
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition);
		            
		      });
		    var options = { // watchPosition()의 마지막 매개 변수로 전달
		            enableHighAccuracy: true,
		            timeout: 5000,
		            maximumAge: 0 };
		        var count=0;
		        var watchID;
		     
		        // changed() 콜백 함수를 등록하고, 반복 위치 서비스 시작
		        watchID = navigator.geolocation.watchPosition(changed, null, options);
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);   
		        
		    displayMarker(locPosition);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    
		/* ---------------------------------------------------- 실시간 현재 위치 나타내기 스크립트---------------------------------------------------------------  */
		/* ---------------------------------------------------- 이동거리 측정---------------------------------------------------------------  */
		
		function getDistance(lat1, lon1, lat2, lon2) {
		    if ((lat1 == lat2) && (lon1 == lon2))
		        return 0;

		    var radLat1 = Math.PI * lat1 / 180;
		    var radLat2 = Math.PI * lat2 / 180;
		    var theta = lon1 - lon2;
		    var radTheta = Math.PI * theta / 180;
		    var dist = Math.sin(radLat1) * Math.sin(radLat2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radTheta);
		    if (dist > 1)
		        dist = 1;

		    dist = Math.acos(dist);
		    dist = dist * 180 / Math.PI;
		    dist = dist * 60 * 1.1515 * 1.609344 * 1000;
		    if (dist < 100) dist = Math.round(dist / 10) * 10;
		    else dist = Math.round(dist / 100) * 100;

		    return dist;
		   
		}
		/* ---------------------------------------------------- 이동거리 측정---------------------------------------------------------------  */

	</script>
	<script>
	/* ---------------------------------------------------- 종료 버튼 ---------------------------------------------------------------  */

	function button_event(){
		  if (confirm("종료하시겠습니까??") == true){    //확인
			  document.getElementById('frm').submit();
		  }else{   //취소
		      return;
		  };
		};
		/* ---------------------------------------------------- 종료 버튼 ---------------------------------------------------------------  */

	</script>
	
	 <script>
 
	function Mobile() {
		return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
				.test(navigator.userAgent);
	}

	if (Mobile()) {// 모바일일 경우 해당 페이지에 머무름

	} else {// 모바일 외인 경우 아래의 주소 JSP로 이동 됨
		window.location.href = "qrpage_origin";
	}
</script> 

</html>