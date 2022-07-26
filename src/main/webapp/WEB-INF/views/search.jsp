<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/search.css">
</head>
<body>
    <main>
        <h1>'${keyword}' 검색결과</h1>
        <section class="music_summary_list_section">
            <h1>'${keyword}' 검색 음악</h1>
            <c:forEach items="${musicList}" var="item">
                <a href="/music/detail?music_no=${item.mu_seq}" class="music_summary_item">
                    <div class="music_summary_detail">
                        <div class="music_summary_img"
                            style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                        </div>
                        <div class="music_summary_txt">
                            <p class="music_summary_name">${item.mu_name}</p>
                            <p class="music_summary_ainame">${item.ai_name}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </section>
        <section class="artist_summary_list_section">
            <h1>'${keyword}' 검색 아티스트</h1>
            <c:forEach items="${artistList}" var="item">
                <div class="artist_summary_item">
                    <div class="artist_summary_detail">
                        <div class="artist_summary_img"
                            style="background-image: url('/images/profile/${item.ai_img_file}');">
                        </div>
                        <div class="artist_summary_txt">
                            <p class="artist_summary_name">${item.ai_name}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>
        <section class="lyrics_summary_list_section">
            <h1>'${keyword}' 가사 검색</h1>
            <table class="lyrics_summary_list_item">
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>곡/가사</td>
                        <td></td>
                        <td>아티스트</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lyricsList}" var="item" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td style="background-image: url('/images/music_cover/${item.mu_img_file}'); width: 60px; height: 60px; background-position: center;
                        background-repeat: no-repeat;"></td>
                        <td>
                            ${item.mu_name}<br>${item.mu_lyrics}
                        </td>
                        <td>
                            ${item.ai_name}
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>