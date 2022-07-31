<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/css/registerform.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <title>회원가입</title>
</head>
<body>
<c:import url="../views/include/header.jsp" charEncoding="UTF-8" />
<div id="wrap">
<form action="<c:url value="/register/add"/>" method="post" onsubmit="return formCheck(this)">
    <div class="title">회원가입</div>
    <div id="msg" class="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>
    <label>아이디</label>
    <input class="input-field" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합">
    <label>비밀번호</label>
    <input class="input-field" type="password" name="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
    <label>이름</label>
    <input class="input-field" type="text" name="name" placeholder="길태형">
    <label>이메일</label>
    <input class="input-field" type="text" name="email" placeholder="test1234@naver.com">
    <label>생일</label>
    <input class="input-field" type="text" name="birth" placeholder="1996/08/16">
    <button>회원 가입</button>
</form>
</div>
<c:import url="../views/include/footer.jsp" charEncoding="UTF-8" />
<script>
    function formCheck(frm) {
        let msg ='';
        if(frm.id.value.length<3) {
            setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
            return false;
        }
        if(frm.pwd.value.length<3) {
            setMessage('pwd의 길이는 3이상이어야 합니다.', frm.pwd);
            return false;
        }

        return true;
    }
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
        if(element) {
            element.select();
        }
    }
</script>
</body>
</html>