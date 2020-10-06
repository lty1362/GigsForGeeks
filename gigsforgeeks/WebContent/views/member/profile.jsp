<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- EL 활성화 / JSTL 설정 / ContextPath 변수 선언 및 초기화 끝 --%>

<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	// > 로그인 전 : null
	// > 로그인 후 : 로그인성공한 회원정보들이 담겨있는 객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	// > 서비스요청 전 : null
	// > 서비스요청 성공 후 : alert 띄워줄 메세지 문구
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member.css">
    <script src="${contextPath}/resources/js/common.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    	/* 사용자 요청 성공시 alert 메시지 띄워주는 script */
    	window.onload = function() {
    		var msg = "${alertMsg}";
    		
    		if(msg != "null" && msg != "") {
    			alert(msg);
    		}
    	}
    </script>
<body onload="showClock()">
	<form action="updateProfile.up" method="POST" id="profileform" enctype="multipart/form-data">
		<div class="wrap" align="center">

			
				<div id="profilePhoto" >
					<img src="${contextPath}/resources/images/avatar.png"
						style="width: 100%; height: 100%;" id="profileDefault">
				</div>
				
				<div id="profileWrap">
				<input type="file" name="profileimg" id="profileimg" onchange="loading(this);">
				</div>
				<script>
					$(function(){
						$("#profileWrap").hide();

						$("#profileDefault").click(function(){
							$("#profileimg").click();
						});

					});

					function loadImg(inputfile){
						if(inputfile.files.length == 1){
							var reader = new FileReader();

							reader.readAsDataURL(inputfile.files[0]);

							reader.onload = function(e){
								$("#profileDefault").attr("src", e.target.result);
							}
						}else{
							$("#profileDefault").attr("src","${contextPath}/resources/images/avatar.png")
					}
					};
				</script>
				
				
				<div id="location" >
					희망 시급 : <input type="range" min="0" max="20000" step="100" name="pay-rate" 
					oninput="document.getElementById('value1').innerHTML=this.value;"> <span id="value1"></span>원

					<br> <select name="location">
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="충청도">충청도</option>
						<option value="강원도">강원도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
						<option value="해외거주">해외거주</option>
					</select>
					<div id="divClock"></div>
					가입일 : 20<%= loginUser.getEnrollDate() %>
				</div>


				<div id="userName" >
					<%= loginUser.getUserId() %><br> /@<input type="text" placeholder="회사명"
						id="userCompany" name="userCompany"><br> /<input
						type="text" placeholder="직급명" id="jobTitle" name="jobTitle">
				</div>
				<div id="workship" >워크쉽(리뷰기반)</div>
				<div id="userContent" >
					<textarea name="self-Introduction" id="self-Introduction" cols="30"
						rows="7" style="resize: none;" placeholder="간략한 자기 소개를 써주세요">
                            </textarea>
				</div>
				<div id="hirePositionButton">
					<button type="submit">수정</button><button type="reset">리셋</button>
				</div>


			

			<script language="javascript">
				function showClock() {
					var currentDate = new Date();
					var divClock = document.getElementById("divClock");

					var msg = "현재 시간:" + currentDate.getHours() + "시"
					msg += currentDate.getMinutes() + "분";

					divClock.innerText = msg;
					setTimeout(showClock, 1000);
				}
			</script>
		</div>
	</form>


</body>
</html>