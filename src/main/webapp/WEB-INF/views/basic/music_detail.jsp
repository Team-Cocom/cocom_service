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
</head>
<body>
        <main>
            <div class="music_detail_area">
                <table>
                    <thead>
                        <tr>
                            <td>노래제목</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${list.mu_name}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
</body>
</html>