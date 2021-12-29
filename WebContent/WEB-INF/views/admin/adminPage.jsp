<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- partial -->
<div class="main-panel">
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
						
						<!--차트시작  -->
						<!-- https://codepen.io/jlalovi/details/bIyAr -->
<div class="container">
  <!-- DONUT CHART BLOCK (LEFT-CONTAINER) --> 
  <div class="donut-chart-block block2"> 
                    <h2 class="titular">네이버 컨텐츠 비율</h2>
                    <div class="donut-chart">
                    <div id="keywordList">
                    <ul>
                    <li>블로그 : 19,685건</li>
                    <li>카페 : 8,686건</li>
                    <li>지식인 : 83건</li>
                    </ul>
                    </div>
 <!-- PORCIONES GRAFICO CIRCULAR
      ELIMINADO #donut-chart
      MODIFICADO CSS de .donut-chart -->
      <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
     <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
     <div id="porcion3" class="recorte"><div class="quesito win" data-rel="39"></div></div>
     <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
 <!-- FIN AÑADIDO GRÄFICO -->
                            <p class="center-date"><br><span class="scnd-font-color"></span></p>        
                    </div>
                    <ul class="os-percentages horizontal-list">
                        <li>
                            <p class="ios os scnd-font-color">블로그</p>
                            <p class="os-percentage">70.2<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="mac os scnd-font-color">카페</p>
                            <p class="os-percentage">29.5<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="linux os scnd-font-color">지식인</p>
                            <p class="os-percentage">0.3<sup>%</sup></p>
                        </li>
                        
                    </ul>
                </div>
  <!-- <div class="donut-chart-block block"> 
                    <h4 class="titular">네이버 블로그 컨텐츠 유형비율</h4>
                    <div class="donut-chart">
 PORCIONES GRAFICO CIRCULAR
      ELIMINADO #donut-chart
      MODIFICADO CSS de .donut-chart
     <div id="porcion4" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
     <div id="porcion5" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
     <div id="porcion6" class="recorte"><div class="quesito win" data-rel="39"></div></div>
     <div id="porcionFin2" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
 FIN AÑADIDO GRÄFICO
                    </div>
                    <ul class="os-percentages horizontal-list">
                        <li>
                            <p class="ios2 os scnd-font-color">정보형</p>
                            <p class="os-percentage">21<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="mac2 os scnd-font-color">경험형</p>
                            <p class="os-percentage">39<sup>%</sup></p>
                        </li>
                        <li>
                            <p class="linux2 os scnd-font-color">정보+경험형</p>
                            <p class="os-percentage">40<sup>%</sup></p>
                        </li>
                    </ul>
                </div> -->
                
                <div class="donut-chart-block block"> 
                    <h4 class="titular">네이버블로그 상위노출</h4>
                    
                    <ul class="os-percentages2 horizontal-list">
                        <li>
                            <p class="ios os scnd-font-color">순위</p>
                            <p class="os-percentage2">1<sup>ST</sup></p>
                        </li>
                        <li>
                            <p class="mac os scnd-font-color">유형</p>
                            <p class="os-percentage2">blog</p>
                        </li>
                        <li>
                            <p class="linux os scnd-font-color">제목</p>
                            <p>불광천 플로깅 008</p>
                            <hr style="background-color: white;">
                        </li>
                        <li>
                            <p>요약</p>
                            <p>이렇게 쓰줍에서 시작해서 담소로 불광천 플로깅 8회차를 끝마쳤다. 아쉬운 마음에... 그래도 실천하고 지내시는 모든 분들에게 존경을~ 오늘 플로깅 데이 이렇게 끝!!!...</p>
                        </li>
                    </ul>
                </div>
                
                <div class="donut-chart-block block"> 
                    <h4 class="titular">1위 _WORD CLOUD_</h4>
                    <div class="wordCnt">
                    <img src="resources/images/1st.png">
                    </div>
                    
                </div>
                <div class="donut-chart-block block"> 
                    <h4 class="titular">네이버블로그 상위노출</h4>
                    
                    <ul class="os-percentages2 horizontal-list">
                        <li>
                            <p class="ios os scnd-font-color">순위</p>
                            <p class="os-percentage2">2<sup>ST</sup></p>
                        </li>
                        <li>
                            <p class="mac os scnd-font-color">유형</p>
                            <p class="os-percentage2">blog</p>
                        </li>
                        <li>
                            <p class="linux os scnd-font-color">제목</p>
                            <p>남해바래길, '바다노을길' 걸으며 플로깅하러 다녀왔어요!</p>
                            <hr style="background-color: white;">
                        </li>
                        <li>
                            <p>요약</p>
                            <p>남해 바래길, 많이들 걸어보셨나요? 바래길을 다 걸으면 남해도 한 바퀴 다 돌 수... 저는 쓰레기봉투를 챙겨서 플로깅과 병행했는데요. 비교적 여유 있게 걸었는데도...</p>
                        </li>
                    </ul>
                </div>
                
                <div class="donut-chart-block block"> 
                    <h4 class="titular">2위 _WORD CLOUD_</h4>
                    <div class="wordCnt">
                    <img src="resources/images/2nd.png">
                    </div>
                    
                </div>
                <div class="donut-chart-block block"> 
                    <h4 class="titular">네이버블로그 상위노출</h4>
                    
                    <ul class="os-percentages2 horizontal-list">
                        <li>
                            <p class="ios os scnd-font-color">순위</p>
                            <p class="os-percentage2">3<sup>ST</sup></p>
                        </li>
                        <li>
                            <p class="mac os scnd-font-color">유형</p>
                            <p class="os-percentage2">blog</p>
                        </li>
                        <li>
                            <p class="linux os scnd-font-color">제목</p>
                            <p>서울 산에서 주운 온갖 쓰레기 (플로깅 이야기하려다가 소련...</p>
                            <hr style="background-color: white;">
                        </li>
                        <li>
                            <p>요약</p>
                            <p>눈 속에 꽁꽁 얼어붙어 있던 온갖 쓰레기들이 거리에 흉물스럽게 나뒹구는, 장화가... 청계산에서 주운 쓰레기로 완성한 정크 아트 대형 쓰레기 산에서 쓰레기를 줍고...</p>
                        </li>
                    </ul>
                </div>
                
                <div class="donut-chart-block block"> 
                    <h4 class="titular">3위 _WORD CLOUD_</h4>
                    <div class="wordCnt">
                    <img src="resources/images/3rd.png">
                    </div>
                    
                </div>
 <!-- LINE CHART BLOCK (LEFT-CONTAINER) -->
 <div class="line-chart-block block2">
     <div class="line-chart">
       <div class='grafico'>
      	<p>네이버 블로그</p>
      	<p>플로깅 연관 단어 랭크 TOP 10</p>
      	
       </div>
     </div>
     	<br>
          <p>1위 : 동시</p>
          <hr>
          <p>2위 : 의미</p>
          <hr>
          <p>3위 : 뜻</p>
          <hr>
          <p>4위 : 실천</p>
          <hr>
          <p>5위 : 방법</p>
          <hr>
          <p>6위 : 관심</p>
          <hr>
          <p>7위 : 이벤트</p>
          <hr>
          <p>8위 : 단어</p>
          <hr>
          <p>9위 : 중립</p>
          <hr>
          <p>10위 : 헤이</p>
    </div>
</div>
						<!--차트 끝 -->
					</div>

				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>


