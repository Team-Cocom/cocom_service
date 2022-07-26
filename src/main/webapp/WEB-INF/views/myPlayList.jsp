<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/myPlayList.css">
    <script src="/assets/js/music_detail.js"></script>
    <script src="/assets/js/myPlayList.js"></script>
</head>
<body>
    <main>
        <section class="member_list_section">
            <div class="memberList openList on">
                    <h2 class="member_item">
                        <div class="poster" style="background-image: url('/images/music_cover/${list[0].mu_img_file}');"><span class="ab_title">
                        </span>
                        <p class="member_name">${user.mi_name}</p>
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
                        <td>노래파일</td>
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
                            <td>
                                <button data-seq="${item.mu_seq}" class="mu_info">play</button>
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