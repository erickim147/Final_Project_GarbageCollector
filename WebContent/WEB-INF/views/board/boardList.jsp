<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h1 class="card-title1">�����Խ���</h1>

						<p class="card-description1">�����е��� �ǰ��� �����Ӱ� ������ �ּ��� !!</p>
						<div class="table-responsive pt-3">
							<table class="table table-bordered" style="text-align: center;">
								<thead>
									<tr>
										<th>��ȣ</th>
										<th>����</th>
										<th>�ۼ���</th>
										<th>�÷α� ��¥</th>
										<th>�ۼ� ��¥</th>
										<th>��û�ο�</th>
										<th>��ȸ��</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${list }">
										<tr>
											<td>${e.bno }</td>
											<td><a href="boardDetail?no=${e.bno}">${e.btitle }</a></td>
											<td>${e.bwriter }</td>
											<td>${e.bdate }</td>
											<td>${e.wdate }</td>
											<c:if test="${e.brec != e.bmax}">
												<td>${e.brec }/ ${e.bmax }</td>

											</c:if>
											<c:if test="${e.brec == e.bmax}">
												<td>�����Դϴ�.</td>

											</c:if>
											<td>${e.bhit }</td>

										</tr>
									</c:forEach>
								</tbody>
								 <tfoot>
         							<tr><th colspan="7"> <%@include file="pageProcess.jsp"%></th></tr>
        						</tfoot>
							</table>
							<div class="search_box">
								<div class="selectbox">
									<form action="search" method="post" class="form">
										<div class="input-group">
											<select id="ex_select" name="ex_select">
												<option value="���հ˻�">���հ˻�</option>
												<option value="����">����</option>
												<option value="���̵�">���̵�</option>
											</select>
											<!--<input type="search" name="searchValue" value="" placeholder="�˻�� �Է��ϼ���" class="search-field" />-->
											<input type="search" class="form-control" name="searchValue" value="" placeholder="�˻�� �Է��ϼ���" aria-label="�˻�� �Է��ϼ���">
												
											<div class="input-group-append">
												<button type="submit" class="btn btn-md btn-primary">search</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- session x no click and go login page -->
						<c:choose>
						<c:when test="${sessionScope.sessionID == null }">
						<div class="freeboard_btn">
							<a onclick="alert('�α����� �ʿ��մϴ�');" href="loginForm">
							<input type="button" class="btn btn-outline-primary btn-fw" value="�÷α� ��û">
							</a>			
						</c:when>
						<c:when test="${sessionScope.sessionID != null }">
						<div class="freeboard_btn">
							<a href="write"><input type="button"
								class="btn btn-outline-primary btn-fw" value="�÷α� ��û"></a>
								</div>
						</c:when>
						</c:choose>
						</div>
					</div>

				</div>
			</div>
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card"></div>
			</div>
			<div class="col-lg-12 stretch-card"></div>