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
						<input type="hidden" name="distance" value="">
						<input type="hidden" name="loc" value="">
						<input type="hidden" name="tt" value="">
						<input type="hidden" name="dd" value="">
						</form>
						<br><span id="dd"></span>
						<br><span id="centerAddr"></span>
						<span>����ð� : </span><span id="stopwatch">00:00:00</span> 
						<br><span>�̵��Ÿ�:</span><span id="distance"></span>
						
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
				<div class="">
					<button type="button" class="">����</button>
					<button type="button" onclick="button_event();">����</button>
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
/* -----------------------------------------------------------����ð� �˸� ��ũ��Ʈ------------------------------------------------------------ */
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

//�ð� ���� - ���ȣ��� �ݺ�����
function startClock() {
    printTime();
    stopClock();
    timerId = setTimeout(startClock, 1000);
}

//�ð� ����
function stopClock() {
    if (timerId != null) {
        clearTimeout(timerId);
    }
}

// �ð� �ʱ�ȭ
function resetClock() {
    stopClock()
    stopwatch.innerText = "00:00:00";
    time = 0;
}

// �ð�(int)�� ��, ��, �� ���ڿ��� ��ȯ
function getTimeFormatString() {
    hour = parseInt(String(time / (60 * 60)));
    min = parseInt(String((time - (hour * 60 * 60)) / 60));
    sec = time % 60;

    var tt = String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
    /* console.log(typeof(tt));
    console.log(tt); */
    $('input[name=tt]').attr('value',tt);  /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/
    return String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
}



var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dd = year + '-' + month  + '-' + day;
	console.log(typeof(dd));
	document.getElementById("dd").innerHTML=dd;
	$('input[name=dd]').attr('value',dd);
</script>
	<script>
		/*---------------------------------------------------- ���� ����--------------------------------------------------------------- */

		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			level : 1
		// ������ Ȯ�� ����
		};

		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		/*---------------------------------------------------- ���� ��ġ ��Ÿ���� ����--------------------------------------------------------------- */

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
						var loc1 = result[i].address_name;
						var loc = String(loc1)
						$('input[name=loc]').attr('value',loc);  /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/
						break;
					}
				}
			} 
			
		}
		
		/* ---------------------------------------------------- ���� ��ġ ��Ÿ���� ��---------------------------------------------------------------  */
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
	<script>
	var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
	var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
	var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
	var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
	var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.

	// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
	// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

	    // ���콺�� Ŭ���� ��ġ�Դϴ� 
	    var clickPosition = mouseEvent.latLng;

	    // ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�
	    if (!drawingFlag) {

	        // ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�
	        drawingFlag = true;
	        
	        // ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�
	        deleteClickLine();
	        
	        // ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�
	        deleteDistnce();

	        // ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
	        deleteCircleDot();
	    
	        // Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
	        clickLine = new kakao.maps.Polyline({
	            map: map, // ���� ǥ���� �����Դϴ� 
	            path: [clickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
	            strokeWeight: 3, // ���� �β��Դϴ� 
	            strokeColor: '#db4040', // ���� �����Դϴ�
	            strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
	        });
	        
	        // ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
	        moveLine = new kakao.maps.Polyline({
	            strokeWeight: 3, // ���� �β��Դϴ� 
	            strokeColor: '#db4040', // ���� �����Դϴ�
	            strokeOpacity: 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�    
	        });
	    
	        // Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
	        displayCircleDot(clickPosition, 0);

	            
	    } else { // ���� �׷����� �ִ� �����̸�

	        // �׷����� �ִ� ���� ��ǥ �迭�� ���ɴϴ�
	        var path = clickLine.getPath();

	        // ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
	        path.push(clickPosition);
	        
	        // �ٽ� ���� ��ǥ �迭�� �����Ͽ� Ŭ�� ��ġ���� ���� �׸����� �����մϴ�
	        clickLine.setPath(path);
	        
	        var distance = Math.round(clickLine.getLength());
	        displayCircleDot(clickPosition, distance);
	    }
	});
	    
	// ������ ���콺���� �̺�Ʈ�� ����մϴ�
	// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

	    // ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
	    if (drawingFlag){
	        
	        // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
	        var mousePosition = mouseEvent.latLng; 

	        // ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
	        var path = clickLine.getPath();
	        
	        // ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
	            content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�
	        
	        // �Ÿ������� ������ ǥ���մϴ�
	        showDistance(content, mousePosition);   
	    }             
	});                 

	// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
	// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
	kakao.maps.event.addListener(map, 'dblclick', function (mouseEvent) {

		if (timerId != null) {
	        clearTimeout(timerId);
	    }
	
		
	    // ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
	    if (drawingFlag) {
	        
	        // ���콺����� �׷��� ���� �������� �����մϴ�
	        moveLine.setMap(null);
	        moveLine = null;  
	        
	        // ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
	        var path = clickLine.getPath();
	    
	        // ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
	        if (path.length > 1) {

	            // ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
	            if (dots[dots.length-1].distance) {
	                dots[dots.length-1].distance.setMap(null);
	                dots[dots.length-1].distance = null;    
	            }

	            var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
	                content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�
	                document.getElementById("distance").innerHTML=distance;
	                $('input[name=distance]').attr('value',distance); /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/
	                
	            // �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
	            showDistance(content, path[path.length-1]);  
	             
	        } else {

	            // ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
	            // ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();

	        }
	        
	        // ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
	        drawingFlag = false;          
	    }  
	    
	});    

	// Ŭ������ �׷��� ���� �������� �����ϴ� �Լ��Դϴ�
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}

	// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
	// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
	function showDistance(content, position) {
	    
	    if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�
	        
	        // Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
	        distanceOverlay.setPosition(position);
	        distanceOverlay.setContent(content);
	        
	    } else { // Ŀ���� �������̰� �������� ���� �����̸�
	        
	        // Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
	        distanceOverlay = new kakao.maps.CustomOverlay({
	            map: map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
	            content: content,  // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
	            position: position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 3  
	        });      
	    }
	}

	// �׷����� �ִ� ���� �ѰŸ� ������ 
	// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
	function deleteDistnce () {
	    if (distanceOverlay) {
	        distanceOverlay.setMap(null);
	        distanceOverlay = null;
	    }
	}

	// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
	// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
	function displayCircleDot(position, distance) {

	    // Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });

	    // ������ ǥ���մϴ�
	    circleOverlay.setMap(map);

	    if (distance > 0) {
	        // Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
	        var distanceOverlay = new kakao.maps.CustomOverlay({
	            content: '<div class="dotOverlay">�Ÿ� <span class="number">' + distance + '</span>m<br>��������!</div>',
	            position: position,
	            yAnchor: 1,
	            zIndex: 2
	        });

	        // ������ ǥ���մϴ�
	        distanceOverlay.setMap(map);
	    }

	    // �迭�� �߰��մϴ�
	    dots.push({circle:circleOverlay, distance: distanceOverlay});
	}

	// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
	function deleteCircleDot() {
	    var i;

	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }

	        if (dots[i].distance) {
	            dots[i].distance.setMap(null);
	        }
	    }

	    dots = [];
	}

	// ���콺 ����Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
	// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
	// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
	function getTimeHTML(distance) {

	    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
	    var content = '<ul class="dotOverlay distanceInfo">';
	    content += '    <li>';
	    content += '        <span class="label">�������ݱ� <br>����!<br>�ѰŸ�</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    return content;
	}
	
	function button_event(){
		  if (confirm("�����Ͻðڽ��ϱ�??") == true){    //Ȯ��
			  document.location.href="info";
			  document.getElementById('frm').submit();
		  }else{   //���
		      return;
		  };
		};
	</script>

</html>