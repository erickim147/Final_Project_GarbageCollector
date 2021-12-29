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
						
						<p class="card-description1">사진을 찍어 인증샷을 남겨보세요!!
						<!-- 버튼시작 -->
						<div class="freeboard_btn">
						<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
							<a href="loginForm"><input type="button" class="btn btn-outline-primary btn-fw" value="인증하깅" onclick="alert('로그인이 필요합니다.')"></a>
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
							<a href="galleryInsertForm"><input type="button" class="btn btn-outline-primary btn-fw" value="인증하깅"></a>
						</c:when>
						</c:choose>
						</div>
						
						<!-- 버튼끝 -->
						</p>
						<br>
						<!-- 이미지 div 시작 -->
						
						<div id="galleryImgTotal"> 
							<c:forEach var="i" items="${list }">
							<input type="hidden" value="${i.gno }" id="gallerydetailgnoNum">
								<div id="galleryImgOne">
									<div id="galleryImgDiv">
									<a href="gallerydetail?gno=${i.gno }"><img src="resources/images/${i.gfile }"></a>
									<div class="heartbutton" onclick="likeValidation(this)"></div>
									<h5>${i.gtitle }</h5>
									<hr>
									<p>${i.gtext }</p>
									<p style="margin-left: 325px; margin-top: 20px;"><div id="likeDiv"></div></p>
									<div id="likeNum">${i.glike }</div>
									</div>
									<a id="hashtag" href="https://search.naver.com/search.naver?where=nexearch&query=${i.hashtag}" target="_blank">#${i.hashtag}</a>
								</div>
							</c:forEach>
						</div>
						
						<!-- 이미지 div 끝   -->
						
					</div>

				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
	
	function likeValidation(obj){
		console.log("Hello there !!");
		obj = $(obj).parent().parent().prev();
		var gno = $(obj).val();
		console.log('gno:'+gno);
		like(gno);
	}
	function like(gno){
		$.ajax({
			url : "galleryLike",
			data : {"gno" : gno},
			cache : false,
			type : 'POST',
			success:function(){
			$('#galleryImgTotal').load(location.href + " #galleryImgTotal");
		}
		})
	}
	
	
	/* function like(documentId){
		$.ajax({
			url : "/galleryLike",
			type : 'GET',
			
			success:function(data){
			$('#likeDiv').html(data);
		}
		})
	} */
	</script>

