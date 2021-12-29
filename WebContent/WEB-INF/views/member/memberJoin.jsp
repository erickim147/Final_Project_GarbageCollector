<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
  <div class="main-panel"> 
	  <div class="container-scroller">
	    <div class="container-fluid page-body-wrapper full-page-wrapper">
	      <div class="content-wrapper d-flex align-items-center auth px-0">
	        <div class="row w-100 mx-0">
	          <div class="mx-auto modifyUser">
	            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	              <form class="pt-3" method="post" action="memberJoin" enctype="multipart/form-data">
	              	<div class="form-group">
	              	  <div>
	              	  	<img src="resources/images/faces/face1.jpg" alt="profile" id="profileImg"/>
	              	  </div>	
					  <input type="file" name="mfile" id="mfile" style="margin-top: 30px;">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">ID</span>
	                  <input type="text" class="form-control form-control-lg" id="mid" name="mid" placeholder="ID�� �Է��ϼ���">
	                  <span style="display:none;" id="target" ></span>
	                  <button type="button" id="btnIdChk" class="pass_check">�ߺ�Ȯ��</button>
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Password</span>	
	                  <input type="password" class="form-control form-control-lg" id="mpwd" name="mpwd" placeholder="��й�ȣ�� �Է��ϼ���">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Name</span>
	                  <input type="text" class="form-control form-control-lg" id="mname" name="mname" placeholder="�̸��� �Է��ϼ���">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Birthday</span>
	                  <input type="text" class="form-control form-control-lg" id="mbirth" name="mbirth" placeholder="��������� �Է��ϼ���">
	                </div>
	                <div class="form-group">
	                  <p class="spanFont">sex</p>
	                  <select name="msex" id="msex">
	                  	<option value="man">����</option>
	                  	<option value="women">����</option>
	                  </select>
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">Address</span>
	                  <input type="text" class="form-control form-control-lg" id="maddr" name="maddr" placeholder="�ּҸ� �Է��ϼ���">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">PhoneNumber</span>
	                  <input type="text" class="form-control form-control-lg" id="mphone" name="mphone" placeholder="��ȭ��ȣ�� �Է��ϼ���">
	                </div>
	                <div class="form-group">
	                  <span class="spanFont">E-mail</span>
	                  <input type="email" class="form-control form-control-lg" id="memail" name="memail" placeholder="email�� �Է��ϼ���">
	                </div>
	                <div class="mt-3">
	                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="SIGN UP">	
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
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	 <script>
		 $(function(){
		      $('#btnIdChk').click(function() {
		         var id = $('#mid').val();
		         $.ajax({
		            url: "idcheck?mid="+id,// ������  url �� param
		            cache : false, // Ajax ����� ĳ�ø� ���� 
		            success:function(data){ // �ݹ� 
		               var resMsg = "";
		               if (data === "1") {
		                  resMsg = "<p style='color:red'>�̹� ������Դϴ�.</p>";
		                  $('#mid').val('');
		               } else {
		                  resMsg = "<p style='color:gray'>��� ������ ���̵� �Դϴ�.</p>";
		               }
		               $('#target').css('display','block').html(resMsg);
		            }
		            });
		         });
		 	});
	 </script>
