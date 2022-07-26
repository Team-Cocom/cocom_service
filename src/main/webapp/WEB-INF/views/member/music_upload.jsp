<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/member/music_upload.css">
    <script src="/assets/js/member/music_upload.js"></script>
</head>

<body>
    <main>
        <div class="mypage_wrap">
            <div class="mypage_item">
                <div class="header_subindex">
                    <!-- Cocom 로고-->
                </div>
                <div class="profile_area">
                    <div class="profile_img_mark">
                        <div class="profile_img"
                            style="background-image: url('/images/profile/${user.mi_profile_img}');"></div>
                    </div>
                </div>
                <div class="gnb_area">
                    <a href="#" class="gnb_title">
                        <h1 class="text">
                            <span class="blind">개인정보</span>
                        </h1>
                    </a>
                </div>
                <div class="playlist_keeping_area">
                    <div class="playlist_inner">
                        <a href="#">
                            <div class="music_cover_file">리스트에오</div>
                        </a>
                    </div>
                </div>
                <div class="lnb_area">
                    <a href="#" class="lnb_item">
                        <span class="lnb_text">유료멤버쉽</span>
                    </a>
                    <a href="/music/upload">노래 업로드</a>
                </div>
            </div>

            <div class="join_area">
                <h1>Basic Info</h1>
                <div class="member_join_box">
                    <table>
                        <tbody>
                            <tr>
                                <form id="music_img_form">
                                    <input type="file" name="file" id="music_img_upload" hidden>
                                </form>
                                <button id="music_img_save"
                                    onclick="document.getElementById('music_img_upload').click()">커버 이미지</button>
                            </tr>
                            <tr>
                                <td>노래 파일</td>
                                <td>
                                    <td class="music_file_area">

                                    </td>
                                    <td class="music_upload_area">
                                    <form id="music_file_form">
                                        <input type="file" name="file" id="music_file_upload" hidden>
                                    </form>
                                        <button id="music_file_upload_button"
                                            onclick="document.getElementById('music_file_upload').click()">노래 파일</button>
                                    </td>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td>
                                    <input type="text" id="mu_name" placeholder="노래제목">
                                </td>
                            </tr>
                            <tr>
                                <td>장르</td>
                                <td>
                                    <select id="mu_gr_seq">
                                        <c:forEach items="${genreList}" var="item">
                                        <option value="${item.gr_seq}">${item.gr_name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>아티스트</td>
                                <td>
                                    <input type="text" id="ai_seq" value="${memberList.ai_name}" data-seq="${memberList.ai_seq}">
                                </td>
                            </tr>
                            <tr>
                                <td>청취 연령</td>
                                <td>
                                    <select id="mu_age">
                                        <option value="0">전체</option>
                                        <option value="19">청소년 불가</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>청취시간</td>
                                <td>
                                    <input type="number" id="mu_time">
                                </td>
                            </tr>
                            <tr hidden>
                                <td>아티스트 국적</td>
                                <td>
                                    <select id="mu_cr_seq">
                                        <option value="${memberList.ai_cr_seq}" selected></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>가사</td>
                                <td>
                                    <textarea id="mu_lylic" cols="30" rows="10" placeholder="가사입력"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>노래설명</td>
                                <td>
                                    <textarea id="mu_explain_txt" cols="30" rows="10" placeholder="노래 설명"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="music_img_explain">커버 이미지</div>
                    <div class="music_img_area">

                    </div>
                    <div class="button_area">
                        <button id="add_music">업로드 신청</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>