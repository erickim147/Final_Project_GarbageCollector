<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin logoBox"
				style="display: flex; justify-content: center;">
				<a class="navbar-brand brand-logo mr-5" href="/garbagecollector"><img
					src="resources/images/logologologo.gif" class="mr-2" alt="logo" /></a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
				<div class="card tale-bg">
					<div class="card-people mt-auto">
						<img src="resources/images/dashboard/people.png" alt="people">
						<div class="weather-info">
							<div class="d-flex">
								<div >
									<h3 class="location font-weight-normal">Team Mission</h3>
									<c:set var="total" value="${tm }" />
									<c:choose>
										<c:when test="${total ge 100000 }">
											<h3 class="font-weight-normal">&nbsp &nbspSuccess!</h3>
										</c:when>
									</c:choose>
								</div>
								<div>
									<h1 class="mb-0 font-weight-normal">
										<!--<i class="icon-sun mr-2"> </i>-->${tm/1000}/ 100km<sup></sup>
									</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 grid-margin transparent">
				<div class="row" style="margin-bottom: 23px;">
					<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
						<div class="card card-light-blue">
							<div class="card-body" style="text-align: center;">
								<h3 class="mb-4">오늘의 봉사왕</h3>
								<p style="font-size: 20px; margin-bottom: 20px;">아이디 : ${avoV.getPluserId() }</p>
								<p style="font-size: 20px;">주운쓰레기량 : ${avoV.getPltrashpick() }개</p>
								
								<c:choose>
									<c:when test="${evoV.getPloggingemb() == 'G'}">
										<p><img alt="" src="resources/emblem/PLOGGING3.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:when>
									<c:when test="${evoV.getPloggingemb() == 'S'}">
										<p><img alt="" src="resources/emblem/PLOGGING2.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:when>
									<c:otherwise>
										<p><img alt="" src="resources/emblem/PLOGGING1.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
						<div class="card card-light-danger">
							<div class="card-body" style="text-align: center;">
								<h3 class="mb-4">오늘의 운동왕</h3>
								<p style="font-size: 20px; margin-bottom: 20px;">아이디 : ${avoD.getPluserId() }</p>
								<p style="font-size: 20px;">일일 운동거리 : ${avoD.getPldistance()}m</p>
								<c:choose>
									<c:when test="${evoD.getSoloemb() == 'G'}">
										<p><img alt="" src="resources/emblem/GOLD.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:when>
									<c:when test="${evoD.getSoloemb() == 'S'}">
										<p><img alt="" src="resources/emblem/SILVER.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:when>
									<c:otherwise>
										<p><img alt="" src="resources/emblem/BRONZE.png" style="width: 70px; height: 70px; margin-top: 10px;" ></p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
						<div class="card card-light-danger">
							<div class="card-body">
								<h3 class="mb-4">오늘의 날씨</h3>
									<div style="text-align: center"  class="weather">
									<p style="font-size: 50px; " class="CurrIcon"></p>
									<span style="font-size: 20px; " class="City"></span>&nbsp&nbsp
									<span style="font-size: 30px; " class="CurrTemp"></span>	
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
						<div class="card card-light-danger">
							<div class="card-body" style="text-align: center;">
								<h3 class="mb-4">전체 플로깅 거리</h3>
								<p style="font-size: 25px;"> ${maindistance }m</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 100%;">
			<div class="grid-margin">
				<div class="card" style="width: 100%;">
					<div class="card-body" style="width: 100%;">
						<p class="card-title">주간 운동/플로깅 차트</p>
						<p class="card-title" id="weekEx" style="margin-left: 20px;"></p>
						<div id="curve_chart" style="height: 400px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 100%;">
			<div class="grid-margin">
				<div class="card" style="width: 100%;">
					<div class="card-body" style="width: 100%;">
						<p class="card-title">주간 쓰레기 수거량</p>
						<p class="card-title" id="weekVl" style="margin-left: 20px;"></p>
						<div id="barchart_material" style="height: 400px;"></div>
					</div>
				</div>
			</div>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
    	var chart1;
    	var chart2;
    	$(function(){
	         $.ajax({
	            url: "chartData",// 서버의  url 과 param
	            cache : false, // Ajax 통신중 캐시를 삭제
	            dataType:'json',
	            data: {"paramList" : today},
	            success:function(data){ // 콜백 
	            	chart1 = data['chart1'];
	            	chart2 = data['chart2'];
	            	console.log(chart2);
	            	console.log(chart1);
	            }
	        });
	 	});
    </script>
    <script type="text/javascript">
    function getToday(){
        var date = new Date();
		var dateArr = [];
        for(var i=0; i<8; i++){
        	var year = date.getFullYear();
            var month = ("0" + (1 + date.getMonth())).slice(-2);
            var day = ("0" + (date.getDate()-i)).slice(-2);
        	dateArr.push(year+"-"+month + "-" + day);
        }
        return dateArr;
    };
    var today = getToday();
    var weekText = document.getElementById('weekEx');
    weekText.innerHTML = "기간: "+today[7]+" ~ "+today[0];
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable(chart1);

        var options = {
          curveType: 'function',
          legend: { position: 'bottom' },
          width: '100%'
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
      
    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      
      var weekText = document.getElementById('weekVl');
      weekText.innerHTML = "기간: "+today[7]+" ~ "+today[0];

      console.log(chart1);
      function drawChart() {
        var data = google.visualization.arrayToDataTable(chart2);

        var options = {
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    <script>
function showLocation(position) {
	var weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
			};
	
	  var latitude = position.coords.latitude 
	  var longitude = position.coords.longitude


	  
	  var apiKey = "cc6665565d2778b5bb1755caca6dd9b2"
	  var weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
	                + "&lon=" + longitude 
	                + "&appid=" + apiKey; 


	  var options = { method: 'GET' }
		$(function(){
			var temp = document.querySelector("#temp");
			var name = document.querySelector("#name");
		         $.ajax({
		            url: weatherUrl,// 서버의  url 과 param
		            cache : false, // Ajax 통신중 캐시를 삭제 
		            success:function(data){ // 콜백 
		            	var $Icon = (data.weather[0].icon).substr(0,2);
		    			var $Temp = (Math.floor(data.main.temp)-273) + ' ºc';
		    			var $city = data.name;
		    				$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
		    				$('.CurrTemp').prepend($Temp);
		    				$('.City').append($city);
		            }
		            });
		         });
	}

	function showError(event) {
	  alert("위치 정보를 얻을 수 없습니다.")
	}

	window.addEventListener('load', () => { 
	  if(window.navigator.geolocation) {
	     window.navigator.geolocation.getCurrentPosition(showLocation,showError)
	  }

	})
</script>

