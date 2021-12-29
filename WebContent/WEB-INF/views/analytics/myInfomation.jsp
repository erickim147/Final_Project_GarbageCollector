<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          
          <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">봉사량/운동량 데이터 테이블</h4>
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered">
                      <thead>
                        <tr class="table-warning">
                         <th>
							회차
                          </th>
                          <th>
                           	일시
                          </th>
                          <th>
                           	거리
                          </th>
                          <th>
                           	시간
                          </th>
                          <th>
                           	쓰레기 갯수
                          </th>
                          <th>
                           	플로깅여부
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                         <tbody>
                       <%-- forEach s --%>
		         <c:forEach var="e" items="${list}">
		         <tr >
		            <td>${e.plno }</td>
		            <td>${e.pldate }</td>
		            <td>${e.pldistance }m</td>
		            <td>${e.pltime }</td>
		            <td>${e.pltrashpick }개</td>
		            <c:choose>
		            	<c:when test="${e.plstatus eq 'y'}" >
		            		<td>Plogging!</td>
		            	</c:when>
		            	<c:otherwise>
		            		<td>Just Exercise!</td>
		            	</c:otherwise>
		            </c:choose>
		         </tr>
		         </c:forEach>
		         <%-- forEach e --%>
                      </tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
