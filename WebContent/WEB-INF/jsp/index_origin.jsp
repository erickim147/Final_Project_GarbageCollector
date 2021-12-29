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
						<input type="hidden" name="pldistance" value="">      	<!--  �Ÿ� ��Ʈ�ѷ��� ���� -->
						<input type="hidden" name="pltime" value="">     		    <!--  ����ð� ��Ʈ�ѷ��� ���� -->
						<input type="hidden" name="pldate" value="">     		    <!--  ��¥ ��Ʈ�ѷ��� ���� -->
						<input type="hidden" name="pltrashpick" value="0">      			<!--  �ݱ� Ƚ�� ��Ʈ�ѷ��� ���� �߰�!! -->
						</form>
						<br><span id="dd"></span>										<!-- �ش� ������ ȭ�鿡 �������� �ʰ� �����൵ �� �Ͱ����ѵ� ���� �������� ��찡 �־ �ѹ� �� Ȯ���ϰ� �츱�� ������ �����ؾ��Ұ� �����ϴ�. -->
						<br><span id="centerAddr"></span>
						<span>����ð� : </span><span id="stopwatch">00:00:00</span> 
						<br><span>�̵��Ÿ�:</span><span id="distance">0</span>
						<br><span>������ ����:</span><span id="tp">0</span>                <!--  �ݱ� Ƚ�� ȭ�鿡�����ֱ� �߰�!! -->
						
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
							�������� !!!!!
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
					<button type="button" id="gBtn">����</button>
					<button type="button" onclick="button_event();">����</button>
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
    $('input[name=pltime]').attr('value',tt);  /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/
    return String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
}
/* -----------------------------------------------------------����ð� �˸� ��ũ��Ʈ------------------------------------------------------------ */
/* -----------------------------------------------------------���� ��¥  ��ũ��Ʈ------------------------------------------------------------ */

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dd = year + '-' + month  + '-' + day;
	console.log(typeof(dd));
	document.getElementById("dd").innerHTML=dd;
	$('input[name=pldate]').attr('value',dd);
	/* -----------------------------------------------------------���� ��¥  ��ũ��Ʈ------------------------------------------------------------ */
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
		
		var linePath = [];
		
		var trashPick = $('#tp').val();
		
		$('#gBtn').click( function() {
			   trashPick++;
			   var imageSrc = 'resources/images/trash.png', // ��Ŀ�̹����� �ּ��Դϴ�    
			    imageSize = new kakao.maps.Size(30, 30), // ��Ŀ�̹����� ũ���Դϴ�
			    imageOption = {offset: new kakao.maps.Point(30, 30)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
			    document.getElementById("tp").innerHTML=trashPick;
			    $('input[name=pltrashpick]').attr('value',trashPick);
			    
			   // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
			   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			       markerPosition = new kakao.maps.LatLng(linePath[linePath.length-1].Ma, linePath[linePath.length-1].La); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
			   
			   // ��Ŀ�� �����մϴ�
			   var marker = new kakao.maps.Marker({
			       position: markerPosition, 
			       image: markerImage // ��Ŀ�̹��� ���� 
			   });
			   
			   // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			   marker.setMap(map);  
			   
			   
			} ); 
		
		

		/*---------------------------------------------------- ���� ��ġ ��Ÿ���� ����(�۵� �ȵ�)--------------------------------------------------------------- */

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
/* 						var loc1 = result[i].address_name;
						var loc = String(loc1)
						$('input[name=loc]').attr('value',loc);  /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/ 
						break;
					}
				}
			} 
			
		}
		
		/* ---------------------------------------------------- ���� ��ġ ��Ÿ���� ��(�۵� �ȵ�)---------------------------------------------------------------  */
	</script>



	<script>
	/* ---------------------------------------------------- �ǽð� ���� ��ġ ��Ÿ���� ��ũ��Ʈ---------------------------------------------------------------  */
	var totalDist = 0;
	
	function setChanged(position) {
		   if(count == 500000) { // clearWatch() �׽�Ʈ�� ���� 5���� ����
		        navigator.geolocation.clearWatch(watchID); // �ݺ� ���� ����
		        document.getElementById("msg").innerHTML = totalDist;
		        return;
		    }
		    
		    var lat = position.coords.latitude; // ����� ����
		    var lon = position.coords.longitude // ����� �浵
		    
		    var markerPosition  = new kakao.maps.LatLng(lat, lon);
		    if(linePath.length >= 1){
		       totalDist = totalDist+getDistance(linePath[linePath.length-1].Ma, linePath[linePath.length-1].La,markerPosition.Ma,markerPosition.La)
		    }
		    document.getElementById("distance").innerHTML=totalDist;
		    $('input[name=pldistance]').attr('value',totalDist); /* ----------------------------input hidden ���� ���â�� �� ���� -------------------------------*/
		    linePath.push(markerPosition);
		    
		 // ������ ǥ���� ���� �����մϴ�
		    var polyline = new kakao.maps.Polyline({
		        path: linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
		        strokeWeight: 5, // ���� �β� �Դϴ�
		        strokeColor: '#FFAE00', // ���� �����Դϴ�
		        strokeOpacity: 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
		        strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
		    });
		   
		    // ������ ���� ǥ���մϴ� 
		    polyline.setMap(map);  
		    // ���� �̹��� ����
//		    new kakao.maps.LatLng(lat, lon)
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
		            enableHighAccuracy: true,
		            timeout: 5000,
		            maximumAge: 0 };
		        var count=0;
		        var watchID;
		     
		        // changed() �ݹ� �Լ��� ����ϰ�, �ݺ� ��ġ ���� ����
		        watchID = navigator.geolocation.watchPosition(changed, null, options);
		    
		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);   
		        
		    displayMarker(locPosition);
		}

		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition) {

		    // ��Ŀ�� �����մϴ�
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    
		    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
		    map.setCenter(locPosition);      
		}    
		/* ---------------------------------------------------- �ǽð� ���� ��ġ ��Ÿ���� ��ũ��Ʈ---------------------------------------------------------------  */
		/* ---------------------------------------------------- �̵��Ÿ� ����---------------------------------------------------------------  */
		
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
		/* ---------------------------------------------------- �̵��Ÿ� ����---------------------------------------------------------------  */

	</script>
	<script>
	/* ---------------------------------------------------- ���� ��ư ---------------------------------------------------------------  */

	function button_event(){
		  if (confirm("�����Ͻðڽ��ϱ�??") == true){    //Ȯ��
			  document.getElementById('frm').submit();
		  }else{   //���
		      return;
		  };
		};
		/* ---------------------------------------------------- ���� ��ư ---------------------------------------------------------------  */

	</script>
	
	 <script>
 
	function Mobile() {
		return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
				.test(navigator.userAgent);
	}

	if (Mobile()) {// ������� ��� �ش� �������� �ӹ���

	} else {// ����� ���� ��� �Ʒ��� �ּ� JSP�� �̵� ��
		window.location.href = "qrpage_origin";
	}
</script> 

</html>