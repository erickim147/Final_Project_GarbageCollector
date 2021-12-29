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
						<h1 class="card-title1">��GingStaGram��</h1>
						<br>
						<h3 class="card-description1">� �������� ���� �����?
						</h3>
						<hr>
						<br>
						<!-- Ŀ�ٶ� �̹��� div ���� -->
						<div id="galleryDetailImgTotal"> 
								
								<!-- �̹��� �κн��� -->
								<div id="galleryDetailImgOne">
									<div id="galleryDetailImgDiv">
									<img src="resources/images/${dto.gfile }">
									<h5>${dto.gtitle }</h5>
									<hr>
									<p>${dto.gtext }</p>
									<a id="hashtag" href="https://search.naver.com/search.naver?where=nexearch&query=${dto.hashtag}" target="_blank">#${dto.hashtag}</a>
									</div>
								</div>
								<!-- �̹��� �κг�  -->
								
								<!-- ���̺�κн��� -->
								<div id="detailTable">
									<div id="detailTableBody">
									
									<!-- �������̹��� ���� -->
									<div id="profileImgdiv">
									<img src="resources/images/profileImg.jpg">
									</div>
																	
									<h1> ${dto.gwriter }���� ��</h1>
									<!-- �������̹��� ��-->
									
									<!-- �����ʿ� ������ div ���� -->
									<div class="detailrightDiv">
									<label>����</label>
									<p>${dto.gtitle }</p>
									<br><br><br><br><br>
									<label>����</label>
									<p>${dto.gtext }</p>
									<div id="bottomLine">
									<p id="galleryNumber"><strong>${dto.gno }</strong> ��° �Խù�<p>
									</div>									
									<p id="galleryDateHitLike">�ۼ����� : ${dto.gdate }&nbsp;&nbsp;&nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;&nbsp;&nbsp;
									��ȸ�� : ${dto.ghit }&nbsp;&nbsp;&nbsp;&nbsp;<strong>|</strong>&nbsp;&nbsp;&nbsp;&nbsp;
									���ƿ� �� : ${dto.glike }
									</p>
									
									<div id="buttonDiv">
									<c:choose>
									<c:when test="${sessionScope.sessionID == dto.gwriter }">
									<a href="galleryUpdateForm?gno=${dto.gno }"><button>Gallery<br>����</button></a>
									<a href="galleryDelete?gno=${dto.gno }"><button>Gallery<br>����</button></a>
									</c:when>
									<c:when test="${sessionScope.sessionID != dto.gwriter }">
									<a href="galleryList" onclick="alert('Ÿ���� �Խù��� �ǵ��� ����')"><button>Gallery<br>����</button></a>
									<a href="galleryList" onclick="alert('Ÿ���� �Խù��� �ǵ��� ����')"><button>Gallery<br>����</button></a>
									</c:when>
									
									</c:choose>
									</div>	
									</div>
									
									<!-- �����ʿ� ������ div �� -->
									
									
									
									</div>
								</div>
								<!-- ���̺�κг� -->
								
								
						</div>
						<!-- Ŀ�ٶ� �̹��� div ��   -->
					</div>

				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>
		</div>
	</div>
	

