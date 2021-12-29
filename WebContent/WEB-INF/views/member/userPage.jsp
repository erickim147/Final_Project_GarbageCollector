<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="urlPath" value="${pageContext.request.contextPath }/resources"/>
  <div class="main-panel"> 
	  <div class="container-scroller">
	    <div class="container-fluid page-body-wrapper full-page-wrapper">
	      <div class="content-wrapper d-flex align-items-center auth px-0">
	        <div class="row w-100 mx-0">
	          <div class="mx-auto modifyUser">
	            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	              <form class="pt-3" method="post" action="modify_process" enctype="multipart/form-data">
	              	<div class="form-group">
	              	  <div>
	              	  	<img src="${urlPath}/imgfiles/${mvo.mphoto}" alt="profile" id="profileImg"/>
	              	  </div>	
					  <input type="file" name="mfile" id="mfile" style="margin-top: 30px;">	
					  <input type="hidden" name="mphoto"  value="${mvo.mphoto}">		                  
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">ID</span>
	                  <input type="text" class="form-control form-control-lg" id="mid" name="mid" value="${mvo.mid}" readonly style="background-color: silver;">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Password</span>	
	                  <input type="password" class="form-control form-control-lg" id="mpwd" name="mpwd" value="${mvo.mpwd}">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Name</span>
	                  <input type="text" class="form-control form-control-lg" id="mname" name="mname" value="${mvo.mname}">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Birthday</span>
	                  <input type="text" class="form-control form-control-lg" id="mbirth" name="mbirth" value="${mvo.mbirth}">
	                </div>
	                <div class="form-group">
	                  <p class="spanFont">sex</p>
	                  <select name="msex" id="msex">
	                  <c:if test="${mvo.msex eq 'man'}">
	                  	<option value="man" selected>害失</option>
	                  	<option value="women">食失</option>
	                  </c:if>
	                  <c:if test="${mvo.msex eq 'women'}">
	                  	<option value="man">害失</option>
	                  	<option value="women" selected>食失</option>
	                  </c:if>
	                  </select>
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Address</span>
	                  <input type="text" class="form-control form-control-lg" id="maddr" name="maddr" value="${mvo.maddr}">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">PhoneNumber</span>
	                  <input type="text" class="form-control form-control-lg" id="mphone" name="mphone"  value="${mvo.mphone}" readonly style="background-color: silver;">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">E-mail</span>
	                  <input type="email" class="form-control form-control-lg" id="memail" name="memail"  value="${mvo.memail}" readonly style="background-color: silver;">
	                </div>
	                <div class="form-group">
	                  <p class="spanFont">Progging Level</p>
	                  <img src="resources/images/11111.PNG" alt="profile" id="proggingImg"/>
	                </div>
	                <div class="mt-3">
	                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Modify">	
	                </div>
	                <div class="mt-3">
	                  <a href="withdrawal_check">
	                  <input type="button" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Withdrawal"  style="background-color: red;">
	                  </a>	
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
	  <script>
		 document.getElementById("mfile").onchange = function () {
			    var reader = new FileReader();
	
			    reader.onload = function (e) {
			        // get loaded data and render thumbnail.
			        document.getElementById("profileImg").src = e.target.result;
			    };
	
			    // read the image file as a data URL.
			    reader.readAsDataURL(this.files[0]);
			};
	 </script>
