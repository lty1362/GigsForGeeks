<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- EL 활성화 / JSTL 설정 / ContextPath 변수 선언 및 초기화 끝 --%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/member.css">
<script src="${contextPath}/resources/js/common.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	/* 사용자 요청 성공시 alert 메시지 띄워주는 script */
	window.onload = function() {
		var msg = "${alertMsg}";

		if (msg != "null" && msg != "") {
			alert(msg);
		}
	}
</script>
<body onload="showClock()">
	<form action="updatePortfolio.up" method="POST">
		<div class="wrap" align="left">


			
				<h1 align="left">포트폴리오 항목</h1>
				<span id="portpolyoTitle" > 포트폴리오 제목 : <input
					type="text" name="PortTitle">
				</span> <br> <br> <span id="portpolyoLink" >
					포트폴리오 링크 : <input type="text" placeholder="https://"
					name="PortLink">
				</span> <br>
				
				<div id="portpolyoContent" >
					포트폴리오 내용 :
					<textarea cols="40" rows="3"></textarea>
				</div>
				<span id="portpolyoTime" > 포트폴리오 제작날짜 :
					시작 <input type="date" name="PortStart"> 종료:<input
					type="date" name="PortEnd">
				</span>

				<fieldset id="portpolyoSkill" name="portpolyoSkill"
					style="border: none;">
					요구 기술 : <input type="checkbox" name="portSkill" value="SQL">SQL 
					     	<input type="checkbox" name="portSkill" value="java" checked>JAVA
							<input type="checkbox" name="portSkill" value="PYTHON">PYTHON 
							<input type="checkbox" name="portSkill" value="JavaSciropt">JavaScript
							<input type="checkbox" name="portSkill" value="HTML">HTML
							<input type="checkbox" name="portSkill" value="CSS">CSS
							<input type="checkbox" name="portSkill" value="AJAX">AJAX
							<input type="checkbox" name="portSkill" value="WordPress">WordPress 
						
				</fieldset>


				<div id="portpolyoModifiy" >
					<button type="submit">저장</button><button type="reset">리셋</button>
				</div>

			
		</div>
	</form>


</body>
</html>