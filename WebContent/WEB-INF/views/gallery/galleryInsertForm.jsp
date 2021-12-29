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
						<h1 class="card-title1">������ ���ε� ����</h1>
						<p class="card-description1">������ ��� �������� ���ܺ�����!!
						</p>
						<!-- ���ε� �� ���� -->
						<div class="GalleryUpForm">
						
						<div class="GalleryUpFormInner">
						<form action="galleryInsert" method="post" name="insertForm" enctype="multipart/form-data">
							 <input type="file" name="gphoto" id="gphoto"><br>
							 <input type="text" name="gwriter" id="gwriter" value="${sessionScope.sessionID }"><br>
							 <input type="text" name="gtitle" id="gtitle" placeholder="������ �Է��ϼ���"><br>
							 <textarea name="gtext" id="gtext" rows="7" cols="20" placeholder="������ �Է��ϼ���.."></textarea>
							 <input type="text" name="hashtag" placeholder="�ؽ��±׸� �Է��ϼ���."><br>
								<p>
									<input type="submit" value="UPLoad" id="submit">
								</p>
						</form>
						</div>
						
						</div>
						<!-- ���ε� �� ����-->
						
					</div>
				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	<script>
		 document.getElementById("gphoto").onchange = function () {
			    var reader = new FileReader();
	
			    // read the image file as a data URL.
			    reader.readAsDataURL(this.files[0]);
			};
	 </script>
	
	
