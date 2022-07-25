<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="/assets/css/reset.css">
        <link rel="stylesheet" href="/assets/css/member/login.css">
        <script src="/assets/js/common/util.js"></script>
        <script src="/assets/js/login.js"></script>
    </head>
<body>
    <div class="login_area">
        <div class="login_box">
            <div class="login_box_wrap">
                <div class="login_box_area">
                <h1>사용자 로그인</h1>
                <input type="text" id="user_id" placeholder="아이디를 입력해주세요">
                <input type="password" id="user_pwd" placeholder="비밀번호를 입력해주세요">
                <p>
                    <button id="login_btn">로그인</button>
                    <button id="join_btn">
                        <a href="/join">회원가입</a>
                    </button>
                </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>