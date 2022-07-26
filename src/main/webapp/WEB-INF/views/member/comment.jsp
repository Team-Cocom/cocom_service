<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="/assets/js/member/comments_info.js"></script>
    <link rel="stylesheet" href="/assets/css/member/comment.css">
</head>
<body>
    <main>
        <div class="comment_wrap">
            <h1>댓글 평점 관리</h1>
            <p>총 ${totalCnt}건</p>
            <div class="comment_list">
            <c:forEach items="${list}" var="item">
                <div class="comment_item">
                    <div class="album_info">
                        <a href="/album/detail?album_no=${item.acom_ab_seq}" target="_blank">${item.ab_name}</a>
                    </div>
                    <div class="comment_and_score">
                        <div class="info1">
                            <div class="score">
                                <img src="/assets/images/star_bg.png">
                                <div class="progress" style="width:${item.acom_star_score*10}%"></div>
                            </div>
                            <div class="reg_dt">
                                <fmt:formatDate value="${item.acom_reg_dt}" pattern="yyyy.MM.dd HH:mm"/>
                            </div>
                            <c:if test="${item.acom_reg_dt != item.acom_mod_dt}">
                                <div class="mod_dt">
                                    <fmt:formatDate value="${item.acom_mod_dt}" pattern="yyyy.MM.dd HH:mm"/>
                                </div>
                            </c:if>
                        </div>
                        <div class="info2">
                            <div class="content">
                                <p>${item.acom_text}</p>
                            </div>
                            <div class="like"><i class="fas fa-thumbs-up"></i><span>${item.like_cnt}</span></div>
                        </div>
                        <div class="buttons">
                            <button id="delete" data-seq="${item.acom_seq}">삭제</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
            <div class="pager_area">
                <c:forEach begin="1" end="${pageCnt}" var="i">
                    <a href="/member/comment?page=${i}" class="pager">${i}</a>
                </c:forEach>
            </div>
        </div>
    </main>
</body>
</html>
    