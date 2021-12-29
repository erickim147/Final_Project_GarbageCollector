<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div class="main-panel">  
	  <div class="container-scroller">
	    <div class="container-fluid page-body-wrapper full-page-wrapper">
	      <div class="content-wrapper d-flex align-items-center auth px-0">
	        <div class="row w-100 mx-0">
	          <div class="col-lg-4 mx-auto">
	            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	              <h4>Hello! let's get started</h4>
	              <form class="pt-3" method="post" action="loginProcess">
	                <input type="hidden" id="mobile" name="mobile" value="${mobile}">
	                <div class="form-group">
	                  <input type="text" class="form-control form-control-lg" id="mid" name="mid" placeholder="UserID">
	                </div>
	                <div class="form-group">
	                  <input type="password" class="form-control form-control-lg" id="mpwd" name="mpwd" placeholder="Password">
	                </div>
	                <div class="mt-3">
	                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="SING IN">
	                </div>
	                <div class="my-2 d-flex justify-content-between align-items-center">
	                  <a href="#" class="auth-link text-black">Forgot password?</a>
	                </div>
	                <div class="text-center mt-4 font-weight-light">
	                  Don't have an account? <a href="register.html" class="text-primary">Create</a>
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
