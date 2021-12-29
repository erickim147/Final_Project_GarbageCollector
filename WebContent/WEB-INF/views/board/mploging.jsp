<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <div class="main-panel">    
			<div class="page-content">
				<div class="form-v10-content">
					<form class="form-detail" action="updateForm" method="post" id="myform">
					<input type="hidden" id="bno" name="bno" value="${vo.bno }">
						<div class="form-left">
							<h2>Ploging Infomation</h2>
							<div class="form-row">
								<input type="text" name="btitle" class="btitle" id="btitle" value="${vo.btitle}" required>
							</div>
							<div class="form-group">
								<div class="form-row form-row-3">
									&nbsp<h4>현재 모집 인원수</h4>
								</div>
							</div>
								<div class="form-row form-row-4">
									<select name="bmax">
										<option value=${vo.bmax } selected="selected" hidden="hidden">${vo.bmax }</option>
									    <option value="2">2</option>
									    <option value="3">3</option>
									    <option value="4">4</option>
									    <option value="5">5</option>
									    <option value="6">6</option>
									</select>
									<span class="select-btn">
									  	<i class="zmdi zmdi-chevron-down"></i>
									</span>
								
							</div>
							<div class="form-group">
      							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h4>플로깅 일자<h4>   							
							</div>
							<div class="form-group">
      							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><input type="date" name="bdate" value="${vo.bdate}"></p>   							
							</div>
							<div class="form-row">
								<input type="text" name="bplace" class="bplace" id="bplace" value="${vo.bplace}" required>
							</div>
							<div class="form-row">
								<input type="text" name="bemail" class="bemail" id="bemail" value="${vo.bemail}" required>
							</div>
						</div>
						<div class="form-right">
							<h2>Ploging Content</h2>
							<div class="form-group">
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><textarea cols="55" rows="20" name="bcontent" id="bcontent" >${vo.bcontent}</textarea></p>
							</div>
							<div class="form-row-last">
								<tr><input type="submit" name="register" class="register" value="수정"></tr>
							</div>
						</div>
					</form>
				</div>
			</div>	