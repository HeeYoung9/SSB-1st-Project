<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="navbar navbar-expand navbar-light navbar-bg">
	<a class="sidebar-toggle js-sidebar-toggle">
	  <i class="hamburger align-self-center"></i>
    </a>
    
    <!--  -->
	<c:if test="${sessionScope.adminId == null }">
      <a href="./AdminLogin.ad">
		<img class="log-button" alt="login" src="./img/icons/login.png" width="25" height="25">
 	  </a>   
	</c:if>
	<c:if test="${sessionScope.adminId != null }">
      <a href="./AdminLogout.ad">
		<img class="log-button" alt="logout" src="./img/icons/logout.png" width="25" height="25">
 	  </a>   
	</c:if>
</header>