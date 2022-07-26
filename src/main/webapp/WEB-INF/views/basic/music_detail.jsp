<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/music.css">
    <script src="/assets/js/music_detail.js"></script>
</head>

<body>
    <main>
        <div class="music_detail_wrap">
            <section class="music_basic_info_area">
                <div class="music_title_img_item">
                    <div class="music_title_img"
                        style="background-image: url('/images/album_cover/${list.ab_img_file}'); width: 220px; height: 240px;">
                    </div>
                </div>
                <div class="music_basic_info_item">
                    <div class="music_summary_area">
                        <p class="music_album_name_area">${list.ab_name}</p>
                        <p class="music_title_name_area">${list.mu_name}</p>
                        <p class="music_title_artist_name_area">${list.ai_name}</p>
                        <div class="music_release_area">
                            <span>
                                <fmt:formatDate value="${list.mu_reg_dt}" pattern="yyyy.MM.dd" /></span>
                        </div>
                        <div class="music_list_add">
                            <button data-seq="${list.mu_seq}" user-seq="${user.mi_seq}" class="mu_like"><i class="fas fa-thumbs-up">${Like}</i></button>
                            <button data-seq="${list.mu_seq}" class="mu_info"></button>
                            <button class="add_list_btn"> 내리스트 추가 </button>
                        </div>
                    </div>
            </section>
        </div>
        <div class="lyrics_detail_area">
            <div class="lyrics_area">가사</div>
            <div class="lyrics_detail">${list.mu_lyrics}</div>
        </div>
        </div>
    </main>
</body>

</html>