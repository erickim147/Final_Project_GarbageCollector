<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="urlPath" value="${pageContext.request.contextPath }/resources"/>

<!-- Header Section Begin -->
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <c:choose>
            <c:when test="${sessionScope.sessionID != null }">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${urlPath}/imgfiles/${sessionScope.sessionPhoto}" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="logoutProcess">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
              <a class="dropdown-item" href="modify_permission">
                <i class="ti-power-off text-primary"></i>
                MyPage
              </a>
            </c:when>
            <c:when test="${sessionScope.sessionID == null }">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="resources/images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="loginForm">
                <i class="ti-power-off text-primary"></i>
                Login
              </a>
              <a class="dropdown-item" href="memberJoinForm">
                <i class="ti-user text-primary"></i>
                Join
              </a>
            </c:when>
            </c:choose>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="/garbagecollector">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">HOME</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">My Information</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <c:choose>
                <c:when test="${sessionScope.sessionID == null }"> 
                <li class="nav-item"> <a class="nav-link" href="loginForm" onclick="alert('로그인이 필요합니다.')">운동량/봉사량</a></li>
                <li class="nav-item"> <a class="nav-link" href="loginForm" onclick="alert('로그인이 필요합니다.')">마이페이지</a></li>
                </c:when>
                <c:when test="${sessionScope.sessionID != null }"> 
                <li class="nav-item"> <a class="nav-link" href="myInfomation">운동량/봉사량</a></li>
                <li class="nav-item"> <a class="nav-link" href="modify_permission">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="myEmblem">엠블럼</a></li>                 
                </c:when>
                </c:choose>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Community</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="boardList">플로깅게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="schedule">전국 플로깅 현황</a></li>
                <li class="nav-item"><a class="nav-link" href="galleryList">깅스타그램</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="mobile/">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">plogging</span>
            </a>
          </li>
          	<!-- 로그인 아이디가 master이면 관리자 페이지가 보일수 있게 구현한 부분 시작--> 
          <c:choose>
          <c:when test="${sessionScope.sessionID == 'master' }">
          <li class="nav-item">
            <a class="nav-link" href="adminPage">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">관리자 페이지</span>
            </a>
          </li>
          </c:when>
          <c:when test="${sessionScope.sessionID != 'master' or sessionScope.sessionID == null}">
          </c:when>
          </c:choose>
          <!-- 로그인 아이디가 master이면 관리자 페이지가 보일수 있게 구현한 부분 끝--> 
        </ul>
      </nav>
