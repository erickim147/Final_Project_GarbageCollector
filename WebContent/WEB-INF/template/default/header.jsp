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
                <li class="nav-item"> <a class="nav-link" href="loginForm" onclick="alert('�α����� �ʿ��մϴ�.')">���/���緮</a></li>
                <li class="nav-item"> <a class="nav-link" href="loginForm" onclick="alert('�α����� �ʿ��մϴ�.')">����������</a></li>
                </c:when>
                <c:when test="${sessionScope.sessionID != null }"> 
                <li class="nav-item"> <a class="nav-link" href="myInfomation">���/���緮</a></li>
                <li class="nav-item"> <a class="nav-link" href="modify_permission">����������</a></li>
                <li class="nav-item"><a class="nav-link" href="myEmblem">����</a></li>                 
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
                <li class="nav-item"><a class="nav-link" href="boardList">�÷α�Խ���</a></li>
                <li class="nav-item"><a class="nav-link" href="schedule">���� �÷α� ��Ȳ</a></li>
                <li class="nav-item"><a class="nav-link" href="galleryList">�뽺Ÿ�׷�</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="mobile/">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">plogging</span>
            </a>
          </li>
          	<!-- �α��� ���̵� master�̸� ������ �������� ���ϼ� �ְ� ������ �κ� ����--> 
          <c:choose>
          <c:when test="${sessionScope.sessionID == 'master' }">
          <li class="nav-item">
            <a class="nav-link" href="adminPage">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">������ ������</span>
            </a>
          </li>
          </c:when>
          <c:when test="${sessionScope.sessionID != 'master' or sessionScope.sessionID == null}">
          </c:when>
          </c:choose>
          <!-- �α��� ���̵� master�̸� ������ �������� ���ϼ� �ְ� ������ �κ� ��--> 
        </ul>
      </nav>
