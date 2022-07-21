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
</head>
<body>
        <main>
            <div class="music_detail_area">
                <div class="music_basic_info">
                <div class="music_title_img" style="background-image: url('/images/album_cover/${list.ab_img_file}'); width: 240px; height: 240px;">
                </div>
                <div class="music_list_add">
                    <button> 재생리스트 추가</button>
                    <button> 내리스트 추가 </button>
                </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <td>노래제목</td>
                            <td>앨범이름</td>
                            <td>장르</td>
                            <td>발매일</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${list.mu_name}</td>
                            <td>${list.ab_name}
                                <a href="/album/detail?album_no=${list.ab_seq}"></a>
                            </td>
                            <td>
                                <c:choose>
                                <c:when test="${list.mu_gr_seq == 1}">락</c:when>
                                <c:when test="${item.mu_gr_seq == 3}">발라드</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <span><fmt:formatDate value="${list.mu_reg_dt}" pattern="yyyy.MM.dd"/></span>
                        <td>
                           
                        </td>
                        </tr>
                    </tbody>
                </table>
                <div class="lyrics_area">가사</div>
                <div class="lyrics_detail">${list.mu_lyrics}</div>
            </div>
        </main>
</body>
</html>