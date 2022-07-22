<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="/assets/js/post/notice_detail.js"></script>
    <link rel="stylesheet" href="/assets/css/notice_detail.css">
</head>

<body>
    <main>
        <div class="notice_detail_area">
            <table class="item_list">
                <thead>
                    <tr >
                        <td>제목</td>
                        <td>내용</td>
                        <td>작성일</td>
                        <td>수정일</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${noticeList.ni_title}</td>
                        <td class="post_img_area">
                            <c:if test="${noticeList.ni_img_file != ''}">
                                <img src="/images/notice_img/${noticeList.ni_img_file}" class="ni_detail_info"
                                data-seq="${noticeList.ni_seq}" data-name="{${noticeList.ni_img_file}}">
                                <span>${noticeList.ni_ex_text}</span>
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${noticeList.ni_reg_dt}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>
                            <fmt:formatDate value="${noticeList.ni_mod_dt}" pattern="yyyy-MM-dd" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="return_page_area">
        <a href="/notice">돌아가기</a>
    </div>
    </main>
</body>

</html>