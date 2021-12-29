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
						<h1 class="card-title1">인증샷 수정 공간</h1>
						<!-- Update 폼 시작 -->
						<div class="GalleryUpForm">
						
						<div class="GalleryUpFormInner">
						<form action="galleryUpdate" method="post" name="updateForm">
						<input type="hidden" name="gno" id="gno" value="${dto.gno }">
							 <input type="file" name="gfile" id="gfile" value="${dto.gfile }"><br>
							 <input type="text" name="gwriter" id="gwriter" value="${dto.gwriter }" readonly="readonly"><br>
							 <input type="text" name="gtitle" id="gtitle" value="${dto.gtitle }" placeholder="제목을 입력해주세요."><br>
							 <textarea name="gtext" id="gtext" rows="7" cols="20" placeholder="내용을 입력해주세요.">${dto.gtext }</textarea>
							 <input type="text" name="hashtag" value="${dto.hashtag }" placeholder="해시태그를 입력해주세요">
							<input type="submit" value="UPDATE" id="submit">
								
						</form>
						</div>
						</div>
						<!-- Update 폼 시작-->
					</div>
				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	
	
