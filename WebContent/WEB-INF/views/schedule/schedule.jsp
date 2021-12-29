<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        	<div style="display: flex; justify-content: center;">
	        	<div style="width: 100%">
	        		<div id="map" style="width:100%;height:700px; background-color: #c9ffc6;">MAP API 연동</div>
	        		<a href="write"><input type="button" class="scheduleBtn btn" value="일정등록"></a>
	        		
			    </div>
        	</div>
       
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b55f6186af7265f2eeff26a4791525d&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map');
var mapOption = {
		center: new kakao.maps.LatLng(36.03553753065589, 127.8753735604779),
	    level: 13
};  

var map = new kakao.maps.Map(mapContainer, mapOption); 

var geocoder = new kakao.maps.services.Geocoder();
var listData = ${strList};

listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            var listBoard= ${nList};
            console.log(listBoard[index]);
            
            var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;"><a href="boardDetail?no='+listBoard[index]+'">'+ listData[index] + '</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            	iwRemoveable = true;
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable : iwRemoveable,
                disableAutoPan: true
            });
            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, marker);
        });
        }
    });
});
</script>
