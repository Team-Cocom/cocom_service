<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/member/mypage.css">
    <script src="/assets/js/common/util.js"></script>
    <script src="/assets/js/member/myinfo.js"></script>
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
                            style="background-image: url('/images/profile/${list.mi_profile_img}');"></div>
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
                    <a href="/music/upload?member_no=${user.mi_seq}">노래 업로드</a>
                </div>
                <div class="comment_area">
                    <a href="/member/comment">댓글·좋아요 관리</a>
                </div>
            </div>

            <div class="member_join_box">
                <table class="member_list">
                    <tbody>
                        <tr>
                            <td>아이디</td>
                            <td>${list.mi_id}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" id="mi_pwd" placeholder="비밀번호(16자이내)">
                            </td>
                            <td></td>

                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" id="mi_pwd_confirm" placeholder="비밀번호 확인">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>${list.mi_name}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td>
                                <input type="text" id="mi_nickname" value="${list.mi_nickname}">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <select id="mi_gen" value="{list.mi_gen}">
                                    <option value="1" <c:if test="${list.mi_gen == 1}">selected</c:if> >남자</option>
                                    <option value="2" <c:if test="${list.mi_gen == 2}">selected</c:if> >여자</option>
                                    <option value="3" <c:if test="${list.mi_gen == 3}">selected</c:if> >선택안함</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td>
                                <fmt:formatDate value="${list.mi_birth}" pattern="yyyy-MM-dd" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td class="phone_area">
                                ${list.mi_phone}
                            </td>
                            <td class="phone_mod_btn_area">
                                <button id="phone_mod_btn">전화번호 수정</button>
                            </td>
                            <td class="phone_mod_area">
                                <input type="text" id="mi_phone" value="${list.mi_phone}">
                            <td>
                                <button id="phone_dup_chk" hidden>전화인증</button>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" id="mi_addr" value="${list.mi_addr}">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>가입유형</td>
                            <td>
                                <select id="mi_role" value="${list.mi_role}">
                                    <option value="1" <c:if test="${list.mi_role == 1}">selected</c:if> >일반</option>
                                    <option value="2" <c:if test="${list.mi_role == 2}">selected</c:if> >아티스트</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="checkbox" value="1" class="isAlrim" id="alrim">
                                <label>알림수신</label>
                            </td>
                            <td></td>
                        </tr>
                        
                    </tbody>
                </table>
                <tr>
                    <div class="profile_prev_area">
                        <div class="profile_prev_img_mark">
                            <div class="profile_img"
                                style="background-image: url('/images/profile/${list.mi_profile_img}');"></div>
                        </div>
                    </div>
                    <td colspan="2">
                    <form id="profile_img_mod_form">
                        <input type="file" name="file" id="profile_mod_img" hidden
                            accept="image/gif, image/jpeg, image/png">
                    </form>
                    <button id="profile_img_mod_save" onclick="document.getElementById('profile_mod_img').click()">
                        프로필 이미지 변경</button>
                    </td>
                    <td>
                        <div class="profile_img_mod_area" filename="${mi_profile_img}">
                        </div>
                </tr>
                <div class="button_area">
                    <button id="modify_btn" data-seq="${list.mi_seq}">회원정보 수정</button>
                    <button id="cancel">취소</button>
                </div>
            </div>
        </div>
    </main>
</body>

</html>