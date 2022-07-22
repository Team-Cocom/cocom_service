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
</head>
<body>
    <body>
        <main>
            <section class="movie_list_section">
            <div class="movieList openList on">
                    <h2 class="movie_item">
                        <div class="age_grade grade${list[0].ab_age}">
                            <c:if test="${list[0].ab_age == 0}">전체</c:if>
                            <c:if test="${list[0].ab_age != 0}">
                                성인
                            </c:if>
                        </div>
                        <div class="poster" style="background-image: url('/images/album_cover/${list[0].ab_img_file}');"><span class="ab_title">
                        </span>
                        <p class="movie_name">${list[0].ab_name}</p>
                        </div>
                        <div class="ab_like">
                            <p>
                                <i class="fas fa-thumbs-up">121</i>
                            </p>
                        </div>
    
                        <div class="movie_item_txt">
                            <p>발매사 <span>${list[0].rci_name}</span></p>
                            <p>기획사 <span>${list[0].ent_name}</span></p>
                            <p class="opening_dt">
                                발매일<fmt:formatDate value="${list[0].ab_re_dt}" pattern="yyyy.MM.dd"/>
                            </p>
                        </div>
                    </h2>    
            </div>
        </section>
            <table>
                <thead>
                    <button id="delete_music">노래 삭제</button>
                    <tr>
                        <td>번호</td>
                        <td>노래커버</td>
                        <td>제목</td>
                        <td>장르</td>
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
                                <div class="poster_img"
                                style="background-image:url('/images/music_cover/${item.mu_img_file}');
                                width:60px; height:80px; background-size: auto 100%;
                                background-repeat: no-repeat;">
                                </div>
                            </td>
                            <td>${item.mu_name}</td>
                            <td>${item.gr_name}</td>
                            <td>
                                <audio src="/images/music/${item.mu_music_file}" controls></audio>
                            </td>
                            <td>
                                <c:if test="${item.mu_age == 0}">전체</c:if>
                                <c:if test="${item.mu_age == 19}">성인</c:if>
                            </td>
                            <td>
                                <input type="checkbox" class="music_check" data-seq="${item.mu_seq}" filename="${item.mu_music_file}">
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </main>
    </body>
    </html>