<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<<<<<<< HEAD

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <script src="/assets/js/common/util.js"></script>
    <script src="/assets/js/index.js"></script>
    <link rel="stylesheet" href="/assets/css/index.css">
=======
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="/assets/css/reset.css">
        <script src="/assets/js/common/util.js"></script>
<<<<<<< HEAD
        <script src="/assets/js/index.js"></script>
=======
>>>>>>> doodo_work
        <link rel="stylesheet" href="/assets/css/index.css">
>>>>>>> develop
</head>

<body>
    <main>
<<<<<<< HEAD
        <div class="swiper main_banner">
            <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="recommend_list_wrap fist">
                    <section class="recommend_list_area">
                        <div class="recommend_list_item">
                            <div class="recommend_img"
                                style="background-image: url('/images/music_cover/${recommend_list[0].mu_img_file}');">
                            </div>
                            <p class="recommend_title">${recommend_list[0].ard_title} <span class="music_count">총${Cnt[0]}곡</span></p>
                        </div>
                        <div class="music_list_item">
                            <div class="music_list">
                                <c:forEach items="${music_list_frist}" var="item">
                                    <div class="music_detail_item">
                                        <div class="music_list_detail">
                                            <a href="/music/detail?music_no=${item.mu_seq}">
                                                <div class="music_img"
                                                    style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                                                </div>
                                                <span class="music_name">${item.mu_name}
                                                    <span class="artis_name">${item.ai_name}</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
=======
<<<<<<< HEAD
        <div class="recommend_list_wrap">
            <section class="recommend_list_area">
                <div class="recommend_list_item">
            <div class="recommend_img" style="background-image: url('/images/music_cover/${recommend_list.mu_img_file}');"></div>
            <p class="recommend_title">${recommend_list.ard_title} <span class="music_count">총 1곡</span></p>
        </div>
        <div class="music_list_item">
            <div class="music_list">
                    <c:forEach items="${music_list}" var="item">
                        <div class="music_detail_item">
                        <div class="music_list_detail">
                    <a href="/music/detail?music_no=${item.mu_seq}">
                    <div class="music_img" style="background-image: url('/images/music_cover/${item.mu_img_file}');"></div>
                    <span class="music_name">${item.mu_name}
                        <span class="artis_name">${item.ai_name}</span>
                    </span>
                </a>
>>>>>>> develop
                </div>
            </div>
            <div class="swiper-slide">
                <div class="recommend_list_wrap second">
                    <section class="recommend_list_area">
                        <div class="recommend_list_item">
                            <div class="recommend_img"
                                style="background-image: url('/images/music_cover/${recommend_list[1].mu_img_file}');">
                            </div>
                            <p class="recommend_title">${recommend_list[1].ard_title} <span class="music_count">총${Cnt[1]}곡</span></p>
                        </div>
                        <div class="music_list_item">
                            <div class="music_list">
                                <c:forEach items="${music_list_second}" var="item">
                                    <div class="music_detail_item">
                                        <div class="music_list_detail">
                                            <a href="/music/detail?music_no=${item.mu_seq}">
                                                <div class="music_img"
                                                    style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                                                </div>
                                                <span class="music_name">${item.mu_name}
                                                    <span class="artis_name">${item.ai_name}</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="recommend_list_wrap third">
                    <section class="recommend_list_area">
                        <div class="recommend_list_item">
                            <div class="recommend_img"
                                style="background-image: url('/images/music_cover/${recommend_list[2].mu_img_file}');">
                            </div>
                            <p class="recommend_title">${recommend_list[2].ard_title} <span class="music_count">총${Cnt[2]}곡</span></p>
                        </div>
                        <div class="music_list_item">
                            <div class="music_list">
                                <c:forEach items="${music_list_third}" var="item">
                                    <div class="music_detail_item">
                                        <div class="music_list_detail">
                                            <a href="/music/detail?music_no=${item.mu_seq}">
                                                <div class="music_img"
                                                    style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                                                </div>
                                                <span class="music_name">${item.mu_name}
                                                    <span class="artis_name">${item.ai_name}</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="recommend_list_wrap fourth">
                    <section class="recommend_list_area">
                        <div class="recommend_list_item">
                            <div class="recommend_img"
                                style="background-image: url('/images/music_cover/${recommend_list[3].mu_img_file}');">
                            </div>
                            <p class="recommend_title">${recommend_list[3].ard_title} <span class="music_count">총${Cnt[3]}곡</span></p>
                        </div>
                        <div class="music_list_item">
                            <div class="music_list">
                                <c:forEach items="${music_list_fourth}" var="item">
                                    <div class="music_detail_item">
                                        <div class="music_list_detail">
                                            <a href="/music/detail?music_no=${item.mu_seq}">
                                                <div class="music_img"
                                                    style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                                                </div>
                                                <span class="music_name">${item.mu_name}
                                                    <span class="artis_name">${item.ai_name}</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="recommend_list_wrap fifth">
                    <section class="recommend_list_area">
                        <div class="recommend_list_item">
                            <div class="recommend_img"
                                style="background-image: url('/images/music_cover/${recommend_list[4].mu_img_file}');">
                            </div>
                            <p class="recommend_title">${recommend_list[4].ard_title} <span class="music_count">총${Cnt[4]}곡</span></p>
                        </div>
                        <div class="music_list_item">
                            <div class="music_list">
                                <c:forEach items="${music_list_fifth}" var="item">
                                    <div class="music_detail_item">
                                        <div class="music_list_detail">
                                            <a href="/music/detail?music_no=${item.mu_seq}">
                                                <div class="music_img"
                                                    style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                                                </div>
                                                <span class="music_name">${item.mu_name}
                                                    <span class="artis_name">${item.ai_name}</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
        <section class="music_summary_list_section">
            <h1>오늘 발매 음악🔔</h1>
            <c:forEach items="${list}" var="item">
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
        <section class="music_summary_list_section">
            <h1>장르별 추천 리스트😎</h1>
            <c:forEach items="${music_genre_list}" var="item">
                <a href="/music/genre/detail?genre_no=${item.gr_seq}" class="music_summary_item">
                    <div class="music_summary_detail">
                        <div class="music_summary_img"
                            style="background-image: url('/images/music_cover/${item.mu_img_file}');">
                        </div>
                        <div class="music_summary_txt">
                            <p class="music_genre_name">${item.gr_name}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </section>
        <section class="music_summary_list_section">
            <h1>최신 앨범🔔</h1>
            <c:forEach items="${album_list}" var="item">
                <a href="/album/detail?album_no=${item.ab_seq}" class="music_summary_item">
                    <div class="music_summary_detail">
                        <div class="music_summary_img"
                            style="background-image: url('/images/album_cover/${item.ab_img_file}');">
                        </div>
                        <div class="music_summary_txt">
                            <p class="album_name">${item.ab_name}</p>
                            <p class="music_summary_ainame">${item.ai_name}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </section>
<<<<<<< HEAD
    </main>
    <script>
        const swiper = new Swiper('.swiper', {
            loop: true,
            autoplay: {
                delay:7000,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            }
        });
    </script>
=======
=======
        
>>>>>>> doodo_work
    </main>
>>>>>>> develop
</body>

</html>