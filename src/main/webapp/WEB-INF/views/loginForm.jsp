<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="<c:url value='/css/loginform.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<c:import url="../views/include/header.jsp" charEncoding="UTF-8" />
<div id="wrap">
  <form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">로그인</h3>
    <div id="msg">
      <c:if test="${not empty param.msg}">
        <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
      </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="이메일 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
      <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
      <a href="<c:url value='/login/registerform'/>">회원가입</a>
    </div>
  </form>
</div>
<c:import url="../views/include/footer.jsp" charEncoding="UTF-8" />
<script>
    function formCheck(frm) {
      let msg ='';
      if(frm.id.value.length==0) {
        setMessage('id를 입력해주세요.', frm.id);
        return false;
      }
      if(frm.pwd.value.length==0) {
        setMessage('password를 입력해주세요.', frm.pwd);
        return false;
      }
      return true;
    }
    function setMessage(msg, element){
      document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
      if(element) {
        element.select();
      }
    }
  </script>
</form>
</body>
</html>