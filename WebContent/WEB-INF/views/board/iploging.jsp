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
								<input type="text" name="btitle" class="btitle" id="btitle" placeholder="����" required>
							</div>
							<div class="form-group">
								<div class="form-row form-row-3">
									&nbsp<h4>���� �ο���</h4>
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
      							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h4>�÷α� ����<h4>   							
							</div>
							<div class="form-group">
      							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><input type="date" name="bdate"></p>   							
							</div>
							<div class="form-row">
								<input type="text" name="bplace" class="bplace" id="bplace" placeholder="�÷α� ���" required>
							</div>
							<div class="form-row">
								<input type="text" name="bemail" class="bemail" id="bemail" placeholder="email(�������� ���������ּ�)" required>
							</div>
						</div>
						<div class="form-right">
							<h2>Ploging Content</h2>
							<div class="form-group">
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<p><textarea cols="55" rows="20" name="bcontent" class="bcontent" id="bcontent" placeholder="�ڼ��� ������ �����ּ���"></textarea></p>
							</div>
							<div class="form-row-last">
								<input type="submit" name="register" class="register" value="�÷α� �����ϱ�!">
							</div>
						</div>
					</form>
				</div>
			</div>	