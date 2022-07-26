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
    <script>
        let album_seq = '${list[0].ab_seq}';
        let user_seq = '${user.mi_seq}';
    </script>
    <link rel="stylesheet" href="/assets/css/album.css">
    <script src="/assets/js/music_detail.js"></script>
    <script src="/assets/js/album/comment.js"></script>
</head>
<body>
    <main>
        <section class="album_list_section">
        <div class="albumList openList on">
                <h2 class="album_item">
                    <div class="age_grade grade${list[0].ab_age}">
                        <c:if test="${list[0].ab_age == 0}">전체</c:if>
                        <c:if test="${list[0].ab_age != 0}">
                            성인
                        </c:if>
                    </div>
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
        <div class="comment_area">
            <h1>댓글/평점</h1>
        </div>
        <div class="input_comment_area">
            <c:if test="${data.user_comment != null}">
                <h1>내 댓글/평점</h1>
                <div class="score_input">
                    <div class="score_btn">
                        <img src="/assets/images/star_bg.png">
                        <c:forEach begin="1" end="10" varStatus="stat">
                            <span class="score_box_click" style="left:${(stat.count-1)*12}px"></span>
                        </c:forEach>
                        <c:forEach begin="1" end="${data.user_comment.acom_star_score}">
                            <span class="score_box" style="background-color: skyblue;"></span>
                        </c:forEach>
                        <c:forEach begin="${data.user_comment.acom_star_score + 1}" end="10">
                            <span class="score_box"></span>
                        </c:forEach>
                    </div>
                    <p class="final_score">${data.user_comment.acom_star_score}</p>
                    <script>
                        score = '${data.user_comment.acom_star_score}'
                    </script>
                </div>
                <textarea id="input_comment" cols="30" rows="10">${data.user_comment.acom_text}</textarea>
                <button id="modify_comment" data-seq="${data.user_comment.acom_seq}">댓글/평점 수정</button>
                <button id="delete_comment" data-seq="${data.user_comment.acom_seq}">댓글/평점 삭제</button>
            </c:if>
            <c:if test="${data.user_comment == null}">
                <h1>댓글/평점 입력</h1>
                <div class="score_input">
                    <div class="score_btn">
                        <img src="/assets/images/star_bg.png">
                        <c:forEach begin="1" end="10" varStatus="stat">
                            <span class="score_box_click" style="left:${(stat.count-1)*12}px"></span>
                        </c:forEach>
                        <c:forEach begin="1" end="10">
                            <span class="score_box" style="background-color: skyblue;"></span>
                        </c:forEach>
                    </div>
                    <p class="final_score">10</p>
                </div>
                <c:if test="${user != null}">
                    <textarea id="input_comment" cols="30" rows="10"></textarea>
                    <button id="save_comment">평점 등록</button>
                </c:if>
                <c:if test="${user == null}">
                    <textarea cols="30" rows="10" disabled>로그인 후 사용 가능합니다.</textarea>
                    <button disabled>평점 등록</button>
                </c:if>
            </c:if>
        </div>
    </main>
    <div class="comment_report_popup">
        <div class="comment_report">
            <h1>댓글 신고</h1>
            <div class="comment_content">
                <p class="content"></p>
            </div>
            <p>신고 사유</p>
            <div class="reasons">
                <input type="radio" value="1" name="reason" id="reason1" checked>
                <label for="reason1">욕설 및 비방글 입니다.</label>
                <input type="radio" value="2" name="reason" id="reason2">
                <label for="reason1">음란물입니다.</label>
                <input type="radio" value="3" name="reason" id="reason3">
                <label for="reason1">불법 광고 및 홍보글 입니다.</label>
                <input type="radio" value="4" name="reason" id="reason4">
                <label for="reason1">타인의 명예를 훼손할 수 있습니다.</label>
            </div>
            <button id="report">신고하기</button>
            <button id="report_cancel">취소</button>
        </div>
    </div>
</body>
</html>