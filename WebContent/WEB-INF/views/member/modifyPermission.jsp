<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <div class="main-panel"> 
	  <div class="container-scroller">
	    <div class="container-fluid page-body-wrapper full-page-wrapper">
	      <div class="content-wrapper d-flex align-items-center auth px-0">
	        <div class="row w-100 mx-0">
	          <div class="mx-auto modifyUser">
	            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	              <form class="pt-3" method="post" action="permission_process">
	                <div class="form-group">
	                <h3>인증이 필요한 페이지입니다.</h3>
	                  <span class="spanFont">Password</span>	
	                  <input type="password" class="form-control form-control-lg" id="mpwd" name="mpwd" placeholder="비밀번호를 입력하세요.">
	                </div>
	                <div class="mt-3">
	                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="확인">	
	                </div>
	              </form>
	            </div>
	          </div>
	        </div>
	      </div>
	      <!-- content-wrapper ends -->
	    </div>
	    <!-- page-body-wrapper ends -->
	  </div>
