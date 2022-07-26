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
    <link rel="stylesheet" href="/assets/css/album.css">
</head>
<body>
    <main>
        <section class="album_list_section">
        <div class="albumList openList on">
                <h2 class="album_item">
                    <div class="poster" style="background-image: url('/images/album_cover/${list[0].ab_img_file}');"><span class="ab_title">
                    </span>
                    <p class="album_name">${list[0].ab_name}</p>
                    </div>
                    <div class="ab_like">
                        <p>
                            <i class="fas fa-thumbs-up">121</i>
                        </p>
                    </div>
                    <div class="album_item_txt">
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
                <tr>
                    <td>번호</td>
                    <td>노래커버</td>
                    <td>제목</td>
                    <td>장르</td>
                    <td>노래파일</td>
                    <td>나이</td>
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