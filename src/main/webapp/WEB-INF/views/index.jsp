<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seulgae</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<c:import url="../views/include/header.jsp" charEncoding="UTF-8" />
<div id="slide">
    <div class="swiper-container">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <c:forEach var="cnt" begin="1" end="4" >
                <!-- Slides -->
                <div class="swiper-slide"><img src="<c:url value='/img/slide/slide${cnt}.jpg'/>" width="1500px" height="800px"></div>
            </c:forEach>
        </div>

        <!-- If we need pagination 페이지 네이션을 제공-->
        <!-- <div class="swiper-pagination"></div> -->

        <!-- If we need navigation buttons 버튼기능 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        <!-- If we need scrollbar 스크롤 기능-->
        <div class="swiper-scrollbar"></div>
    </div>
    <!-- 슬라이드쇼 방향키 시작 -->
</div>
<%--<c:import url="../views/include/footer.jsp" charEncoding="UTF-8" />--%>
<div class="jumbotron text-center mt-0 mb-0">
    <h3 class="text-secondary">SeulgaeHomePage</h3>
    <p><a href="https://github.com/seulgae">GitHub</a> / <a href="https://doltae.tistory.com/">Blog</a><span class="text-primary"></span> / Designed by <span class="text-primary">Seulgae</span></p>
</div>
<script>
    const swiper = new Swiper('.swiper-container', {
        //기본 셋팅
        //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
        direction: 'horizontal',
        //한번에 보여지는 페이지 숫자
        slidesPerView: 1,
        //페이지와 페이지 사이의 간격
        spaceBetween: 30,
        //드레그 기능 true 사용가능 false 사용불가
        debugger: true,
        //마우스 휠기능 true 사용가능 false 사용불가
        mousewheel: true,
        //반복 기능 true 사용가능 false 사용불가
        loop: true,
        //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
        centeredSlides: true,
        // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
        // effect: 'fade',

        //자동 스크를링
        autoplay: {
            //시간 1000 이 1초
            delay: 4000,
            disableOnInteraction: false,
        },

        //페이징
        pagination: {
            //페이지 기능
            el: '.swiper-pagination',
            //클릭 가능여부
            clickable: true,
        },
        //방향표
        navigation: {
            //다음페이지 설정
            nextEl: '.swiper-button-next',
            //이전페이지 설정
            prevEl: '.swiper-button-prev',
        },
        /*   breakpoints: {
                1280: {
                    slidesPerView: 1,
                    slidesPerGroup: 1,
                },
                720: {
                    slidesPerView: 1,
                    slidesPerGroup: 1,
                },
            } */
    });
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>