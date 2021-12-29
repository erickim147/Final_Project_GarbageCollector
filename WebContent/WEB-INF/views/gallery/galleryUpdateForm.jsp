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
						<h1 class="card-title1">������ ���� ����</h1>
						<!-- Update �� ���� -->
						<div class="GalleryUpForm">
						
						<div class="GalleryUpFormInner">
						<form action="galleryUpdate" method="post" name="updateForm">
						<input type="hidden" name="gno" id="gno" value="${dto.gno }">
							 <input type="file" name="gfile" id="gfile" value="${dto.gfile }"><br>
							 <input type="text" name="gwriter" id="gwriter" value="${dto.gwriter }" readonly="readonly"><br>
							 <input type="text" name="gtitle" id="gtitle" value="${dto.gtitle }" placeholder="������ �Է����ּ���."><br>
							 <textarea name="gtext" id="gtext" rows="7" cols="20" placeholder="������ �Է����ּ���.">${dto.gtext }</textarea>
							 <input type="text" name="hashtag" value="${dto.hashtag }" placeholder="�ؽ��±׸� �Է����ּ���">
							<input type="submit" value="UPDATE" id="submit">
								
						</form>
						</div>
						</div>
						<!-- Update �� ����-->
					</div>
				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	
	
