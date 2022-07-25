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
    <link rel="stylesheet" href="/assets/css/genre_detail.css">
</head>

<body>
    <main>
        <div class="music_title_area">
            <h1>${list[0].gr_name} 음악</h1>
            <section class="movie_list_section">
                <div class="movieList openList on">
                    <h2 class="movie_item">
                        <div class="ab_like">
                            <p>
                                <i class="fas fa-thumbs-up">121</i>
                            </p>
                        </div>
                    </h2>
                </div>
            </section>
        </div>
        <table>
            <thead>
                <tr>
                    <td>번호</td>
                    <td>노래커버</td>
                    <td>노래파일</td>
                    <td>나이</td>
                    <td>
                        <input type="checkbox" id="all_checkbox_check">
                    </td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="item" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td>
                            <div class="poster_img" style="background-image:url('/images/music_cover/${item.mu_img_file}');
                            width:60px; height:80px; background-size: auto 100%;
                            background-repeat: no-repeat;">
                            </div>
                        </td>
                        <td>
                            <audio src="/images/music/${item.mu_music_file}" controls></audio>
                        </td>
                        <td>
                            <c:if test="${item.mu_age == 0}">전체</c:if>
                            <c:if test="${item.mu_age == 19}">성인</c:if>
                        </td>
                        <td>
                            <input type="checkbox" class="music_check" data-seq="${item.mu_seq}"
                                filename="${item.mu_music_file}">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>