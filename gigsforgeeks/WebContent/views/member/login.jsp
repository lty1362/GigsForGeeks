<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
</head>
<body>
	<!-- 로그인 관련 -->
    <div class="loginArea">
        <!-- 1. 로그인 전에 보여지는 로그인 form-->
            <form id="loginForm" action="" method="post">
            <table>
                <tr>
                    <td><h1>Gigs for Geeks</h1></td>
                </tr>
                <tr>
                    <td><h3 class="model-title">로그인</h3></td>
                </tr>
                <tr>
                    <td><input type="text" id="userId" name="userId" required placeholder="이메일 또는 사용자 계정(ID)"></td> 
                </tr>
                <tr>
                    <td><input type="password" id="userPwd" name="userPwd" required placeholder="비밀번호를 입력하세요."></td> 
                </tr>
                <tr>
                    <td><button type="submit"  class="btn btn-outline-info">로그인</button></td>
                </tr>
                <tr>
                    <td>
                    <input type="checkbox" id="email" name="remamber" value="이메일 유지">
                    <label for="email" style="font-size: 10px;">이메일 유지</label>
                    &nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" style="font-size: 10px;">비밀번호 찾기</a>
                    </td>
                </tr>
                <tr>
                    <td> <button type="button" class="btn btn-outline-info">이메일 회원가입</button></td>
                </tr>
            </table>
            </form>
        </div>
</body>
</html>