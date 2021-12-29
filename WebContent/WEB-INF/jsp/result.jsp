<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mobile Start Page</title>
<!-- plugins:css -->
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="resources/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="resources/images/favicon.png" />
<!-- 파비콘 바꿔야함 -->


<style>
.main-panel {
	width: 100%;
	height: auto;
}

.start_ {
	text-align: center;
	margin-top: 15px;
	margin-bottom: 14px;
	font-size: 29px;
	font-weight: bold;
}

.table th, .jsgrid .jsgrid-table th, .table td, .jsgrid .jsgrid-table td
	{
	line-height: 5;
	white-space: nowrap;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="col-lg-12 stretch-card">
						<div class="card">
							<div class="card-body">
								<a class="start_" href="index_origin">다시 시작하기 </a> <br> <br>
								<h4 class="card-title">플로깅 결과 확인 !!</h4>
								<div class="table-responsive pt-3">
									<table class="table table-bordered" style="font-size: 16px;">
										<%-- forEach s --%>
										<c:forEach var="e" items="${list}">
											<tr>
												<th>일시</th>
												<td>${e.pldate }</td>
											</tr>
											<tr>
												<th>거리</th>
												<td>${e.pldistance}m</td>
											</tr>
											<tr>
												<th>시간</th>
												<td>${e.pltime }</td>
											</tr>
											<tr>
												<th>쓰줍 횟수</th>
												<td>${e.pltrashpick }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>




</body>

<script>
	function Mobile() {
		return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
				.test(navigator.userAgent);
	}

	if (Mobile()) {// 모바일일 경우 해당 페이지 머무름 

	} else {// 모바일 외인 경우 아래 JSP로 이동
		window.location.href = "qrpage_origin";
	}
</script>
</html>