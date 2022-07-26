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
                    <h2 class="movie_item"></h2>
                </div>
            </section>
        </div>
        <table>
            <thead>
                <tr>
                    <td>번호</td>
                    <td>노래커버</td>
                    <td>노래제목</td>
                    <td>노래파일</td>
                    <td>나이</td>
                   
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
                        <td>${item.mu_name}</td>
                        <td>
                            <button data-seq="${item.mu_seq}" class="mu_info">play</button>
                        </td>
                        <td>
                            <c:if test="${item.mu_age == 0}">전체</c:if>
                            <c:if test="${item.mu_age == 19}">성인</c:if>
                        </td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>