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
    </head>
<body>
    <main>
        <h1>회원 정보 수정</h1>
        <div class="member_join_box">
            <table>
                <tbody>
                    <tr>
                        <td>아이디</td>
                        <td>${list.mi_id}</td>
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
                            <td>${list.mi_name}</td>
                        </td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>
                            <input type="text" id="mi_nickname" value="${list.mi_name}" >
                        </td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>
                            <select id="mi_gen">
                                <option value="1"<c:if test="${list.mi_gen == 1}">selected</c:if> >남자</option>
                                <option value="2"<c:if test="${list.mi_gen == 2}">selected</c:if> >여자</option>
                                <option value="3"<c:if test="${list.mi_gen == 3}">selected</c:if> >선택안함</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td>
                            <fmt:formatDate value="${list.mi_birth}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>${list.mi_phone}</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <td>${list.mi_addr}</td>
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
                        <td></td>
                            <form id="profile_img_form">
                                <input type="file" name="file" id="profile_img"  hidden accept = "image/gif, image/jpeg, image/png">
                            </form>

                        <button id="profile_img_save" onclick="document.getElementById('profile_img').click()">프로필
                            이미지 업로드</button>
                        <td>
                            <input type="checkbox" value="1" class="isAlrim" id="alrim">
                            <label>알림수신</label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="profile_explain">프로필 이미지</div>
            <div class="profile_img_area" filename="${mi_profile_img}">
            </div>
            <div class="button_area">
                <button id="modify_btn">회원정보 수정</button>
                <button id="cancel">취소</button>
            </div>
        </div>
    </main>
</body>
</html>