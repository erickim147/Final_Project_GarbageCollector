<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <div class="main-panel">    
			<div class="page-content">
				<div class="form-v10-content">
					<form class="form-detail" action="boardInsert" method="post" id="myform">
						<div class="form-left">
							<h2>Ploging Infomation</h2>
							<!-- session + -->
							<input type="hidden" name="bwriter" id="bwriter" value="${sessionScope.sessionID}">
							<div class="form-row">
								<input type="text" name="btitle" class="btitle" id="btitle" placeholder="제목" required>
							</div>
							<div class="form-group">
								<div class="form-row form-row-3">
									&nbsp<h4>참여 인원수</h4>
								</div>
							</div>
							
								<div class="form-row form-row-4">
									<select name="bmax">
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
      							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><input type="date" name="bdate"></p>   							
							</div>
							<div class="form-row">
								<input type="text" name="bplace" class="bplace" id="bplace" placeholder="플로깅 장소" required>
							</div>
							<div class="form-row">
								<input type="text" name="bemail" class="bemail" id="bemail" placeholder="email(일정변동 연락받을주소)" required>
							</div>
						</div>
						<div class="form-right">
							<h2>Ploging Content</h2>
							<div class="form-group">
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><textarea cols="55" rows="20" name="bcontent" class="bcontent" id="bcontent" placeholder="자세한 내용을 적어주세요"></textarea></p>
							</div>
							<div class="form-row-last">
								<input type="submit" name="register" class="register" value="플로깅 시작하기!">
							</div>
						</div>
					</form>
				</div>
			</div>	