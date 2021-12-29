<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Mobile Start Page</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="resources/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/images/favicon.png" /> <!-- 파비콘 바꿔야함 -->


<style>
.main-panel{
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


</style>
<title>Insert title here</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
		
			<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card" style="margin-top: 220px;">
					<img src="https://as2.ftcdn.net/v2/jpg/02/75/37/39/1000_F_275373942_dpsirE1SksQJIZ7Rbk3H3zFjZwvGQVot.jpg">
						<a class="start_" href="index_origin">시작하기 </a>
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

	if (Mobile()) {// 모바일일 경우

	} else {// 모바일 외
		window.location.href = "qrpage_origin";
	}
</script> 
</html>