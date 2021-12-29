<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-panel">
<input type="hidden" value="${vo.bplace }" id="place">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div>
							<h2 class="card-title">${vo.btitle }${dvo.srec }</h2>
							<p class="card-description two">${vo.wdate}</p>
						</div>
						<div>
							<p class="card-description one">${vo.bwriter}</p>
							<p class="card-description two">��ȸ�� : ${vo.bhit}</p>
						</div>
						<form class="form-sample">
							<div class="card-body">
								<blockquote class="blockquote">
									�÷α� ��� - ${vo.bplace }
									<div id="map" style="width:100%;height:300px; margin-bottom:20px;"></div>
									<p class="mb-0">${vo.bcontent}</p>
								</blockquote>
								<ul class="list-star">
									<li>�÷α� ��¥ - ${vo.bdate}</li>
									<li>���� ��Ȳ - ${vo.brec }/${vo.bmax }</li>
									<!-- session id == bwriter -->
									<c:if test="${sessionScope.sessionID == vo.bwriter }">
									<li>��û ���̵� -
									<c:forEach var="a" items="${svo}">
									 ${a.srec}
									 <input type="hidden" name="sno" value="${a.sno }">
									</c:forEach>
									</li>
									</c:if>
								</ul>
								<!-- session == srec cancel, session != srec  and go mypage -->
								<c:if test="${sessionScope.sessionID != vo.bwriter }">
								
								<c:choose>
									<c:when test="${sessionScope.sessionID != null}">
									<c:if test="${vo.brec != vo.bmax }">
									<button type="button" class="btn btn-light">
										<a onclick="alert('���� ��û �Ǿ����ϴ�.');" href="app?no=${vo.bno }&id=${sessionScope.sessionID}">�÷α� �����ϱ�</a>
									</button>
									</c:if>
									<c:if test="${vo.brec == vo.bmax }">
									�����Դϴ�.
									</c:if>
									</c:when>
									
									<c:when test="${sessionScope.sessionID == null}">
									<c:if test="${vo.brec != vo.bmax }">
									<button type="button" class="btn btn-light">
										<a onclick="alert('�α����� �ʿ��մϴ�');" href="loginForm">�÷α� �����ϱ�</a>
									</button>
									</c:if>
									<c:if test="${vo.brec == vo.bmax }">
									�����Դϴ�.
									</c:if>
									</c:when>
								</c:choose>
								
								<c:forEach var="c" items="${svo }">
								<c:if test="${sessionScope.sessionID == c.srec}">
									<button type="button" class="btn btn-light">
										<a onclick="alert('��� �Ǿ����ϴ�.');" href="can?sno=${vo.bno }&srec=${sessionScope.sessionID}">���� ���</a>
									</button>
								</c:if>
								</c:forEach>
								</c:if>
								</div>
							<!-- session insert == bwriter -->
							<c:if test="${sessionScope.sessionID == vo.bwriter }">
							<button type="button" class="btn btn-primary mr-2">
								<a href="modify?no=${vo.bno }">����</a>
							</button>
							<button type="button" class="btn btn-light">
								<a href="delete?no=${vo.bno }">����</a>
							</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b55f6186af7265f2eeff26a4791525d&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 
    mapOption = {
        //center: new kakao.maps.LatLng($('#lat').val(), $('#log').val()), // 
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3 // 
    };

// 
var map = new kakao.maps.Map(mapContainer, mapOption);

// 
var geocoder = new kakao.maps.services.Geocoder();
//var temp = document.getElementById('vo')
//console.log(temp)
//console.log(mapContainer)
// 
geocoder.addressSearch('${vo.bplace}', function(result, status) {
	
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">�÷α� ���</div>'
        });
        infowindow.open(map, marker);

        map.setCenter(coords);
    }
});
</script>
<!-- <script>
var mapContainer = document.getElementById('map');
var mapOption = {
		center: new daum.maps.LatLng(37.450701, 126.570667),
	    level: 14
};  

var map = new daum.maps.Map(mapContainer, mapOption); 

var geocoder = new daum.maps.services.Geocoder();
var listData = [
    '����Ư����ġ�� ���ֽ� ÷�ܷ� 242', 
    '����Ư����ġ�� ���ֽ� ÷�ܷ� 241', 
    '����Ư���� ���ı� ���ݷ�13�� 8',
    '����Ư���� ���ı� �ø��ȷ� 25',
    '����Ư���� ������ ���Ϸ�18�� 80',
    '����Ư���� ���α� ������ 25',
    '����Ư���� ���ϱ� ���̷� 73',
    '������ ��õ�� ��õ��310���� 26',
    '���� ������ ��굿 1081',
    '��� �ܾ籺 �ܾ��� õ���� �� 9-1',
    '����Ư����ġ�� �ݳ��� ���縮 �� 31',
    '��� û���� ȭ���� ���� �� 79-2',
    '���󳲵� ���ֽ� ��ȸ� �л���� 104-1'
];

listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>',
                disableAutoPan: true
            });
            infowindow.open(map, marker);
        } 
    });
});
</script> -->