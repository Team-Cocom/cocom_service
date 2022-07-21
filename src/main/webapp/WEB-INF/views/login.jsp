<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="/assets/css/reset.css">
        <script src="/assets/js/common/util.js"></script>
        <script src="/assets/js/login.js"></script>
    </head>
<body>
    <div class="login_area">
        <h1>사용자 로그인</h1>
        <p>User Login</p>
        <table>
            <tbody>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" id="user_id">
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" id="user_pwd">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button id="login_btn">로그인</button>
                        <a href="/join">회원가입</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>