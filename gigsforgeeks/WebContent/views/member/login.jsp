<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Template HTML 2 : 헤더 없는 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header2.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/member.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Login</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <!-- 로그인 관련 -->
    <div class="loginAll">
        <div class="loginArea">
        
        <!-- 1. 로그인페이지로 들어왔을때 보여지는 로그인 form-->
            <form id="loginForm" action="<%= request.getContextPath()%>/loginMe.me" method="post">
            <br><br><br><br>
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
                    <input type="checkbox" id="remamber" name="remamber" value="이메일 유지">
                    <label for="email" style="font-size: 10px;">이메일 유지</label>
                    &nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn" data-toggle="modal" data-target="#pwdFindForm" style="font-size: 10px;">비밀번호 찾기</button>
                    </td>
                </tr>
                <tr>
                    <td> <a href="${contextPath}/signUp.me" type="button" class="btn btn-outline-info">이메일 회원가입</a></td>
                </tr>
            </table>
            </form>
        </div>
    </div>

	<!-- 비밀번호찾기 Modal -->
	<div class="modal" id="pwdFindForm">
    <div class="modal-dialog">
    <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
            <table>
	                <tr>
	                    <td><h1>Gigs for Geeks</h1></td>
	                </tr>
	                <tr>
	                    <td><h4 class="model-title" style="text-align: center;">비밀번호 찾기</h4></td>
	                </tr>
	            </table>
        </div>     
		<!-- Modal body -->
		<div class="modal-body" align="center">
		   	<p><b>비밀번호가 기억나지 않으십니까?</b></p>
		       	<form action="" method="post">
		
		          <table>
		              <tr>
		                  <td>&nbsp;&nbsp;가입된 이메일을 써주십시오.</td>
		              </tr>
		              <tr>
		                  <td>
		                   <input type="email" id="email" name="email" required placeholder="이메일 기입">
		                   <button class="btn btn-outline-info">인증번호 전송</button> 
		                  </td>
		              </tr>
		              <tr>
		                  <td>&nbsp;&nbsp;인증번호 입력</td>
		              </tr>
		              <tr>
		                  <td>
		                   <input type="text" id="certification" name="certification" required placeholder="인증번호">
		                   <button class="btn btn-outline-info">제출</button> <br><br>
		                  </td>
		              </tr>
		          </table>    
		           <div class="modal-footer">
		               <p><b>주의! 인증번호를 입력하시면 비밀번호가 해당 이메일로 선송됩니다. 보안에 주의해주십시오.</b></p>
		           </div>
		           </form> 
		       </div>
    	 </div>
	</div>
</div>
    <%-- End Of Content --%>
</body>
</html>