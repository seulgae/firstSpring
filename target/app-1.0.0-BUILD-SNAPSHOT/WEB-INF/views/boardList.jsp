<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<c:import url="../views/include/header.jsp" charEncoding="UTF-8" />
<script>
    let msg = "${msg}";
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
</script>
<div style="text-align:center">
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="boardDto" items="${list}">
            <tr>
                <td>${boardDto.bno}</td>
                <td><a href="<c:url value="/board/read?bno=${boardDto.bno}&page=${page}&pageSize=${pageSize}"/>">${boardDto.title}</a>
                <td>${boardDto.writer}</td>
                <td>${boardDto.reg_date}</td>
                <td>${boardDto.view_cnt}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <c:if test="${ph.showPrev}">
            <a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value='/board/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
        </c:if>
    </div>
</div>
</body>
</html>