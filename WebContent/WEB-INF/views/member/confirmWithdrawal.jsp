<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <div class="main-panel"> 
	  <div class="container-scroller">
	    <div class="container-fluid page-body-wrapper full-page-wrapper">
	      <div class="content-wrapper d-flex align-items-center auth px-0">
	        <div class="row w-100 mx-0">
	          <div class="mx-auto modifyUser">
	            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	              <form class="pt-3" method="post" action="member_withdrawal">
	              <input type="hidden" name="mid" value="${sessionScope.sessionID}">
	                <div class="form-group">
	                <h3>���� ȸ��Ż���Ͻðڽ��ϱ�?</h3><br>
	                <h4>ȸ��Ż�� ���Ͻø� ��й�ȣ�� �Է����ּ���.</h4>
	                <span class="spanFont">Password</span>	
	                  <input type="password" class="form-control form-control-lg" id="mpwd" name="mpwd" placeholder="��й�ȣ�� �Է��ϼ���.">
	                </div>
	                <div class="mt-3">
	                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="ȸ��Ż��" style="background-color: red;">	
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
