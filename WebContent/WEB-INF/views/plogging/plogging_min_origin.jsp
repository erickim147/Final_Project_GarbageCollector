<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
</style>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title1">플로깅 테이블</h4>
							<div class="time_box" style="text-align: center;">
								<span class="txt_lg" id="hours"></span> <span class="mark01">:</span>
								<span class="txt_lg" id="min"></span> <span class="mark02">.</span>
								<span class="txt_sm" id="sec"></span>
							</div>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>일시</th>
											<th>장소</th>
											<th>플로깅 거리</th>
											<th>플로깅 시간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>ㄹ</td>
											<td><span id="centerAddr"></span></td>
											<td>28.76%</td>
											<td></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 grid-margin stretch-card">

			<div class="col-lg-12 stretch-card">
				<div id="map" style="width: 100%; height: 600px;"></div>
				<div class="hAddr">
					<button type="button" class="btn btn-outline-primary btn-fw">시작</button>
					<button type="button" class="btn btn-outline-primary btn-fw">줍줍</button>
					<button type="button" class="btn btn-outline-primary btn-fw">종료</button>
				</div>
			</div>
		</div>

	</div>
	<h3>watchPosition()으로 반복 위치 서비스</h3>
	<hr>
	<div id="msg">이곳에 위치 정보 출력</div>
	<div id="map"></div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70ad8ed1c2d044cbdec46aef4c0e6043&libraries=services"></script>
	<script>
		/*------------------------------ 지도 생성----------------------------------------- */

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		/*------------------------------ 현재 위치 나타내기 시작----------------------------------------- */

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
						break;
					}
				}
			}
		}

		/* ------------------------------ 현재 위치 나타내기 끝-----------------------------------------  */
	</script>



	<script>
		linePath = [];

		function setChanged(position) {
			if (count == 10000) { // clearWatch() 테스트를 위해 5번만 서비스
				navigator.geolocation.clearWatch(watchID); // 반복 서비스 종료
				document.getElementById("msg").innerHTML = "위치 서비스 종료";
				return;
			}

			var lat = position.coords.latitude; // 변경된 위도
			var lon = position.coords.longitude // 변경된 경도
			var text = count + ": (위도 " + lat + "°, 경도 " + lon + "°)로 변경됨<br>";
			document.getElementById("msg").innerHTML = text; // 위치 정보 출력

			var markerPosition = new kakao.maps.LatLng(lat, lon);

			linePath.push(markerPosition);

			// 지도에 표시할 선을 생성합니다
			var polyline = new kakao.maps.Polyline({
				path : linePath, // 선을 구성하는 좌표배열 입니다
				strokeWeight : 5, // 선의 두께 입니다
				strokeColor : '#FFAE00', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다
			});

			// 지도에 선을 표시합니다 
			polyline.setMap(map);
			// 지도 이미지 갱신
			//	    new kakao.maps.LatLng(lat, lon)
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
				enableHighAccuracy : false,
				timeout : 5000,
				maximumAge : 0
			};
			var img = new Image();
			var count = 0;
			var watchID;

			// changed() 콜백 함수를 등록하고, 반복 위치 서비스 시작
			watchID = navigator.geolocation.watchPosition(changed, null,options);

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);

			var markerPosition = new kakao.maps.LatLng(lat, lon);

		}
	</script>