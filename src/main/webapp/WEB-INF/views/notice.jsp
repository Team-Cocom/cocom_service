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
    <link rel="stylesheet" href="/assets/css/notice.css">
</head>
<body>
    <main>
        <div class="search_box">
            <form action="/notice" method="get">
                <input type="text" name="keyword" placeholder="공지 검색" value="${keyword}">
                <button type="submit">검색</button>
            </form>
        </div>
        <div class="notice_list_area">
            <table class="item_list">
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>공지타이틀</td>
                        <td>등록일</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item" varStatus="stat">
                        <tr>
                            <td>${stat.count}</td>
                            <td>
                                <a href="/notice/detail?post_no=${item.ni_seq}">${item.ni_title}</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${item.ni_reg_dt}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="pager_area">
            <c:forEach begin="1" end="${pageCount}" var="i">
                <a href="/notice?page=${i}&keyword=${keyword}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>