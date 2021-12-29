<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!-- partial -->
<div class="main-panel">
   <div class="content-wrapper">
      <div class="content-wrapper">
         <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
               <div class="card">
                  <div class="card-body">
                  	<form action="info" method="post">
                  	<input type="hidden" name="ds" value="">
                  	<input type="hidden" name="loc" value="">
                  	<input type="hidden" name="distance" value="">
                  	<input type="hidden" name="time" value=''>
                     <h4 class="card-title1">�÷α� ���̺�</h4>
                     <div class="time_box" style="text-align: center;">
                        <span class="txt_lg" id="hours"></span> <span class="mark01">:</span>
                        <span class="txt_lg" id="min"></span> <span class="mark02">.</span>
                        <span class="txt_sm" id="sec"></span>
                     </div>
                     <div class="table-responsive">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>�Ͻ�</th>
                                 <th>���</th>
                                 <th>�÷α� �Ÿ�</th>
                                 <th>�÷α� �ð�</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td><span id="dateString"></span></td>
                                 <td><p id="output"></p></td>
                                 <td><p id="distance">�̵��Ÿ�</p>m</td>
                                 <td>
                                    <span>����ð� : </span><span id="stopwatch">00:00:00</span>
                                    <br>
                                    <br>���۽ð� : <span id="displayHours"></span>:<span id="displayMinutes"></span>:<span id="displaySeconds"></span>
                                    <br>����ð� : <span id="displayHours1"></span>:<span id="displayMinutes1"></span>:<span id="displaySeconds1"></span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <input type="submit" value="���۹�ư">
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="content-wrapper" style="margin-top: -100px;">
         <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
               <div class="card">
                  <div class="card-body">
                     <div id="map" style="width: 100%; height: 500px;"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
  </div>

    <script>

     
          
    </script>

<script>
window.onload = function() {
   var name = prompt("�÷��� ��Ҹ� �Է����ּ���");

   time++;
   stopwatch.innerText = getTimeFormatString();
   printTime();
   stopClock();
   timerId = setTimeout(startClock, 1000);
   var displayHours = document.getElementById('displayHours');
   var displayMinutes = document.getElementById('displayMinutes');
   var displaySeconds = document.getElementById('displaySeconds');

   var currentTime = new Date();

   displayHours.innerHTML = currentTime.getHours(); 
   displayMinutes.innerHTML = currentTime.getMinutes(); 
   displaySeconds.innerHTML = currentTime.getSeconds();
   document.getElementById('output').innerHTML = name;
   $('input[name=loc]').attr('value',name);
   $('input[name=time]').value=getTimeFormatString();
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

    return String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0');
}



var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + '-' + month  + '-' + day;

document.getElementById("dateString").innerHTML=dateString;
	$('input[name=ds]').attr('value',dateString);
</script>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70ad8ed1c2d044cbdec46aef4c0e6043"></script>
   <script>
      var clockStart = setInterval(function() {
         var today = new Date()
         var hh = addZero(today.getHours())
         var mm = addZero(today.getMinutes())
         var ss = addZero(today.getSeconds())
         document.getElementById('hours').innerText = hh
         document.getElementById('min').innerText = mm
         document.getElementById('sec').innerText = ss
         function addZero(num) {
            return (num < 10 ? '0' + num : '' + num)
         }
      }, 1000)
      
      
   </script>
   <script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 4 // ������ Ȯ�� ���� 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
if (navigator.geolocation) {
    
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // ����
            lon = position.coords.longitude; // �浵
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
            message = '<div style="padding:2px;">��� !!!(����)</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
        
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);
    
      });
    
    
    
} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation�� ����Ҽ� �����..'
        
    displayMarker(locPosition, message);
}

// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // ���������쿡 ǥ���� ����
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}    

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
            strokeWeight: 0, // ���� �β��Դϴ� 
            strokeColor: '#db4040', // ���� �����Դϴ�
            strokeOpacity: 0, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
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
	
	   var displayHours1 = document.getElementById('displayHours1');
	   var displayMinutes1 = document.getElementById('displayMinutes1');
	   var displaySeconds1 = document.getElementById('displaySeconds1');

	   var currentTime = new Date();

	   displayHours1.innerHTML = currentTime.getHours(); 
	   displayMinutes1.innerHTML = currentTime.getMinutes(); 
	   displaySeconds1.innerHTML = currentTime.getSeconds();
	
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
    document.getElementById("distance").innerHTML=distance;
    $('input[name=distance]').attr('value',distance);
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
</script>

<script>
		linePath = [];

		function setChanged(position) {
			if (count == 10000) { // clearWatch() �׽�Ʈ�� ���� 5���� ����
				navigator.geolocation.clearWatch(watchID); // �ݺ� ���� ����
				document.getElementById("msg").innerHTML = "��ġ ���� ����";
				return;
			}

			var lat = position.coords.latitude; // ����� ����
			var lon = position.coords.longitude // ����� �浵
			var text = count + ": (���� " + lat + "��, �浵 " + lon + "��)�� �����<br>";
			document.getElementById("msg").innerHTML = text; // ��ġ ���� ���

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