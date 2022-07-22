<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/header.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
        integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css"
        integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css"
        integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="/assets/js/common/util.js"></script>
    <script src="/assets/js/header.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
        let now_playing = 0;
        let total = ${playList.size()}
    </script>
    <title>Document</title>
    </head>
<body>
    <header>
        <div class="header_area">
            <div class="header_left_area">
                <a href="/">
                    <img src="/assets/images/cocom_logo.png">
                </a>
                <a href="#">내보관함</a>
                <a href="/pass">이용권</a>
                <div class="search_box">
                    <form action="#" method="get">
                        <input type="text" name="keyword" value="${keyword}" placeholder="     검색어를 입력하세요.">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="header_right_area">
                <a href="#">공지사항</a>
                <c:if test="${user != null}">
                    <a href="/logout">로그아웃</a>
                    <a href="/myinfo/modify"></a>
                </c:if>
                <c:if test="${user == null}">
                    <a href="/login">로그인</a>
                </c:if>
                <a href="/join">회원가입</a>
            </div>
        </div>
        <div class="music_play_area">
            <div class="music_play_list">
                <p class="play_music_img"></p>
                <span class="play_music_name"></span>
                <p class="play_music_artist"></p>
                <audio id="play_music" controls src="/sample.mp3"></audio>
                <button class="music_inventory_button">
                    <i class="fas fa-bars">
                    </i>
                </button>
            </div>
        </div>
        <div class="music_inventory_area">
            <h1>재생목록</h1>
            <c:if test="${user != null}">
            <div class="music_inventory_item">
                    <c:forEach items="${playList}" var="item">
                        <div class="music_item">
                        <div class="music_inventory">
                        <p class="music_img_play" style="background-image: url('/images/music_cover/${item.mu_img_file}'); "></p>
                        <input type="text" class="img" value="/images/music_cover/${item.mu_img_file}" hidden>
                        <input type="text" class="music" value="/images/music/${item.mu_music_file}" hidden>
                        <input type="text" class="music_name_input" value="${item.mu_name}" hidden>
                        <input type="text" class="artist_input" value="${item.ai_name}" hidden>
                        <p class="music_name_play">${item.mu_name}</p>
                        <p class="artist">${item.ai_name}</p>
                        </div>
                        <div class="music_button_area">
                        <button>삭제</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        </div>
    </header>
</body>

</html>