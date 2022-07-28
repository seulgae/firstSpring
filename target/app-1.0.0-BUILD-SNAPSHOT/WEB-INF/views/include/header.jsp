<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Seulgae</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo"><a href="<c:url value='/'/>">SeulgaeToyProject</a></li>
    <li><a href="<c:url value='/'/>">소개</a></li>
    <li><a href="<c:url value='/board/list'/>">포트폴리오</a></li>
    <li><a href="<c:url value=''/>">방명록</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/login/registerform'/>">회원가입</a></li>
    <%--        <li><a href=""><i class="fa fa-search"></i></a></li>--%>
  </ul>
</div>
</body>
</html>
