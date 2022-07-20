<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="/assets/css/reset.css">
        <link rel="stylesheet" href="/assets/css/join.css">
        <script src="/assets/js/common/util.js"></script>
        <script src="/assets/js/member/join.js"></script>
    </head>
<body>
    <main>
        <div class="join_area">
        <h1>회원가입</h1>
            <div class="member_join_box">
                <table>
                    <tbody>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" id="mi_id" placeholder="아이디(16자 이내)">
                            </td>
                            <td>
                                <button id="id_dup_chk">중복체크</button>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" id="mi_pwd" placeholder="비밀번호(16자이내)">
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" id="mi_pwd_confirm" placeholder="비밀번호 확인">
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" id="mi_name" placeholder="이름(50자 이내)">
                            </td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td>
                                <input type="text" id="mi_nickname" placeholder="닉네임(16자 이내)">
                            </td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <select id="mi_gen">
                                    <option value="1">남자</option>
                                    <option value="2">여자</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td>
                                <input type="text" id="mi_birth" placeholder="생년월일 (yyyy-MM-dd)" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                <input type="text" id="mi_phone" placeholder="-를 뺴고 입력하세요.">
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <textarea id="mi_addr" cols="30" rows="10" placeholder="주소입력"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>가입유형</td>
                            <td>
                                <select id="mi_role">
                                    <option value="1">일반</option>
                                    <option value="2">아티스트</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>프로필 이미지</td>
                                <form id="profile_img_form">
                                    <input type="file" name="file" id="profile_img"  hidden accept = "image/gif, image/jpeg, image/png">
                                </form>
                            <td class="profile_img_area" filename="${mi_profile_img}">
                            </td>
                            <button id="profile_img_save" onclick="document.getElementById('profile_img').click()">프로필
                                이미지 업로드</button>
                            <td>
                                <input type="checkbox" value="1" class="isAlrim">
                                <label>알림수신</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button id="join">회원가입</button>
                <button id="cancel">들어가기</button>
            </div>
        </div>
    </main>
</body>
</html>