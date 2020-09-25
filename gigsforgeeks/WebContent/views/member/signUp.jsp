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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/member.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>SignUP</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    	 <div class="signUpAll">
        <div class="signUpArea">
        <!-- 1. 회원가입 form-->
            <form id="signUpForm" action="<%= request.getContextPath()%>/insert.me" method="post">
            <br><br>
            <input type="hidden" name="userType" id="userType" value="">
            <table>
                <tr>
                    <td><h1>Gigs for Geeks</h1></td>
                </tr>
                <tr>
                    <td><h3 class="model-title">회원가입</h3></td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="userId" name="userId" required placeholder="사용할 아이디 입력">
                        <a type="button" class="btn btn-outline-info" id="btn">중복확인</a>
                    </td> 
                </tr>
                <tr>
                    <td><input type="email" id="email" name="email" required placeholder="이메일 주소"></td> 
                </tr>
                <tr>
                    <td><input type="password" id="userPwd" name="userPwd" maxlength="15" required placeholder="비밀번호를 입력"></td> 
                </tr>
                <tr>
                    <td> <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#userTypeForm">회원가입</button></td>
                </tr>
                <tr>
                    <td>
                        <div class="modal-footer">
                            <p>이미  계정을 가지고 계십니까?</p>
                            <a href="">로그인</a>
                          </div>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
	<!-- 계정유형설정 Modal -->
	<div class="modal" id="userTypeForm">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	              <table>
	                 <tr>
	                    <td><h1>Gigs for Geeks</h1></td>
	                 </tr>
	                 <tr>
	                    <td><h4 class="model-title">계정 유형 설정</h4></td>
	                 </tr>
	              </table>
	        </div>
	        <!-- Modal body -->
	        <div class="modal-body"  align="center">
	                <p> 
			                    심각하게 고민 하지 않으셔도 됩니다. <br>
			                    언제든지 계정 설정 페이지에서 변경 하실수 있습니다.
	                </p>
	                <table>
	                <tr>
	                    <td>
	                      <button type="button" class="btn btn-outline-info btn-lg" id="freelancer">
	                          <img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프리랜서"> 
	                         <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          	 일자리를 알아보고자 합니다.</b>
	                        </button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <br>
	                        <button type="button" class="btn btn-outline-info btn-lg" id="employer"> 
	                           <img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="고용주"> 
	                           <b>프리랜서를 채용하고자 합니다.</b>
	                        </button>
	                    </td>
	                </tr>
	                </table>
	                <br><br>
	        	</div>
	     	</div>
	    </div>
	</div>
	
	<script>
		$('#freelancer').click(function(){
			$('#userType').val('F');
			$("#signUpForm").submit();
		});
		
		$('#employer').click(function(){
			$('#userType').val('E');
			$("#signUpForm").submit();
		});
	</script>
    <%-- End Of Content --%>
</body>
</html>