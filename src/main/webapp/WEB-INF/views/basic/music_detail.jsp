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
    <script src="/assets/js/music_detail.js"></script>
</head>
<body>
        <main>
            <div class="music_detail_area">
                <table>
                    <thead>
                        <tr>
                            <td>노래제목</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${list.mu_name}</td>
                            <td><button data-seq="${list.mu_seq}" class="mu_info">play</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
</body>
</html>