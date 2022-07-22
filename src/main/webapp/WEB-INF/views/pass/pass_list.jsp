<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/pass.css">
    <script src="/assets/js/pass.js"></script>
</head>

<body>
    <div class="pass_list_wrap">
        <div class="pass_button_area">
            <button class="pass_all">ALL</button>
            <button class="pass_vip">VIP</button>
            <button class="pass_VVIP">VVIP</button>
        </div>
        <h1>ALL USERS</h1>
        <c:forEach items="${list}" var="item">
            <section class="pass_list_area">
                <div class="pass_list_item">
                    <div class="pass_img" style="background-image: url('/images/pass_img/${item.ps_img_file}');"></div>
                    <p>${item.ps_name}</p>
                    <p>가격</p>
                    <p>${item.ps_price}원</p>
                    <p>기간</p>
                    <p>${item.ps_period}분</p>
                    <button class="pass_nomal_button" user-seq="${user.mi_seq}" data-seq="${item.ps_seq}">구매</button>
                </div>
            </section>
        </c:forEach>
    </div>
</body>

</html>