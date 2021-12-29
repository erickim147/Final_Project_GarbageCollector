<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
						<h1 class="card-title1">★GingStaGram★</h1>
						<br>
						<h3 class="card-description1">어떤 내용인지 같이 볼까요?
						</h3>
						<hr>
						<br>
						<!-- 커다란 이미지 div 시작 -->
						<div id="galleryDetailImgTotal"> 
								
								<!-- 이미지 부분시작 -->
								<div id="galleryDetailImgOne">
									<div id="galleryDetailImgDiv">
									<img src="resources/images/${dto.gfile }">
									<h5>${dto.gtitle }</h5>
									<hr>
									<p>${dto.gtext }</p>
									<a id="hashtag" href="https://search.naver.com/search.naver?where=nexearch&query=${dto.hashtag}" target="_blank">#${dto.hashtag}</a>
									</div>
								</div>
								<!-- 이미지 부분끝  -->
								
								<!-- 테이블부분시작 -->
								<div id="detailTable">
									<div id="detailTableBody">
									
									<!-- 프로필이미지 시작 -->
									<div id="profileImgdiv">
									<img src="resources/images/profileImg.jpg">
									</div>
																	
									<h1> ${dto.gwriter }님의 글</h1>
									<!-- 프로필이미지 끝-->
									
									<!-- 오른쪽에 나오는 div 시작 -->
									<div class="detailrightDiv">
									<label>제목</label>
									<p>${dto.gtitle }</p>
									<br><br><br><br><br>
									<label>내용</label>
									<p>${dto.gtext }</p>
									<div id="bottomLine">
									<p id="galleryNumber"><strong>${dto.gno }</strong> 번째 게시물<p>
									</div>									
									<p id="galleryDateHitLike">작성일자 : ${dto.gdate }&nbsp;&nbsp;&nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;&nbsp;&nbsp;
									조회수 : ${dto.ghit }&nbsp;&nbsp;&nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;&nbsp;&nbsp;
									좋아요 수 : ${dto.glike }
									</p>
									
									<div id="buttonDiv">
									<c:choose>
									<c:when test="${sessionScope.sessionID == dto.gwriter }">
									<a href="galleryUpdateForm?gno=${dto.gno }"><button>Gallery<br>수정</button></a>
									<a href="galleryDelete?gno=${dto.gno }"><button>Gallery<br>삭제</button></a>
									</c:when>
									<c:when test="${sessionScope.sessionID != dto.gwriter }">
									<a href="galleryList" onclick="alert('타인의 게시물은 건들지 말깅')"><button>Gallery<br>수정</button></a>
									<a href="galleryList" onclick="alert('타인의 게시물은 건들지 말깅')"><button>Gallery<br>삭제</button></a>
									</c:when>
									
									</c:choose>
									</div>	
									</div>
									
									<!-- 오른쪽에 나오는 div 끝 -->
									
									
									
									</div>
								</div>
								<!-- 테이블부분끝 -->
								
								
						</div>
						<!-- 커다란 이미지 div 끝   -->
					</div>

				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	

