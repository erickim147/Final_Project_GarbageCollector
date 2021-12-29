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
	position: inherit;
	left: 10px;
	top: 10px;
	border-radius: 2px;
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
	
.search-btn {
  position: fixed;
  top: 1rem;
  right: 1rem;
  border: none;
  background: url( "https://cdn.icon-icons.com/icons2/602/PNG/512/Trash_icon-icons.com_55793.png" ) no-repeat;
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
							<!-- ������������ ��� �������� �ø�����
							<h4 class="card-title1">�÷α� ���̺�</h4>
							</div>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>���</th>
											<th>����</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>�Ͻ�</td>
											<td>��¥�ֱ�</td>
										</tr>
										<tr>
											<td>���</td>
											<td><span id="centerAddr"></span></td>
										</tr>
										<tr>
											<td>�Ÿ�</td>
											<td>100m</td>
										</tr>
										<tr>
											<td>�ð�</td>
											<td>00:10:24</td>
										</tr>
									</tbody>
								</table>

							</div>
							 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 grid-margin stretch-card">

			<div class="col-lg-12 stretch-card">
				<div id="map" style="width: 100%; height: 550px;"></div>
				<div class="hAddr">
					<button type="button" class="btn btn-outline-primary btn-fw">����</button>
					<button type="button" class="btn btn-outline-primary btn-fw">����</button>
				</div>
			</div>
		</div>

	</div>
	<div id="msg"></div>
	<div id="map"></div>
</div>
	</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70ad8ed1c2d044cbdec46aef4c0e6043&libraries=services"></script>
	<script>
	

		/*------------------------------ ���� ����----------------------------------------- */

		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			level : 1
		// ������ Ȯ�� ����
		};

		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		/*------------------------------ ���� ��ġ ��Ÿ���� ����----------------------------------------- */

		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new kakao.maps.services.Geocoder();

		// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// ��ǥ�� ������ �ּ� ������ ��û�մϴ�
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// �������� region_type ���� 'H' �̹Ƿ�
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}

		/* ------------------------------ ���� ��ġ ��Ÿ���� ��-----------------------------------------  */
	</script>



	<script>
		linePath = [];

		function setChanged(position) {
			if (count == 10000) { // clearWatch() �׽�Ʈ�� ���� 5���� ����
				navigator.geolocation.clearWatch(watchID); // �ݺ� ���� ����
				return;
			}

			var lat = position.coords.latitude; // ����� ����
			var lon = position.coords.longitude // ����� �浵
			var text = count + ": (���� " + lat + "��, �浵 " + lon + "��)�� �����<br>";

			var markerPosition = new kakao.maps.LatLng(lat, lon);

			linePath.push(markerPosition);

			// ������ ǥ���� ���� �����մϴ�
			var polyline = new kakao.maps.Polyline({
				path : linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
				strokeWeight : 5, // ���� �β� �Դϴ�
				strokeColor : '#FFAE00', // ���� �����Դϴ�
				strokeOpacity : 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
				strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
			});

			// ������ ���� ǥ���մϴ� 
			polyline.setMap(map);
			// ���� �̹��� ����
			//	    new kakao.maps.LatLng(lat, lon)
			//  if(count == 0) // ó���̸� ���� ���� �̹��� ����
			//    document.getElementById("map").appendChild(img); // ���� �̹��� ����
			count++; // ���� ȸ�� ����
		}

		function changed(position) {
			setInterval(setChanged(position), 5000);
		}

		// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {

			// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // ����
				lon = position.coords.longitude; // �浵

				var locPosition = new kakao.maps.LatLng(lat, lon); // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�

				// ��Ŀ�� ���������츦 ǥ���մϴ�
				displayMarker(locPosition);

			});
			var options = { // watchPosition()�� ������ �Ű� ������ ����
				enableHighAccuracy : false,
				timeout : 5000,
				maximumAge : 0
			};
			var img = new Image();
			var count = 0;
			var watchID;

			// changed() �ݹ� �Լ��� ����ϰ�, �ݺ� ��ġ ���� ����
			watchID = navigator.geolocation.watchPosition(changed, null,options);

		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation�� ����Ҽ� �����..'

			displayMarker(locPosition, message);
		}

		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition, message) {

			// ��Ŀ�� �����մϴ�
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			// ���� �߽���ǥ�� ������ġ�� �����մϴ�
			map.setCenter(locPosition);

			var markerPosition = new kakao.maps.LatLng(lat, lon);

		}
	</script>

</html>