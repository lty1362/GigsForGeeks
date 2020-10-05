<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../views/common/header2.jsp" %>

	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
	<title>관리자 메인페이지 = 회원전체조회 페이지</title>
</head>
<body>
    <div class="wrap">
        <div id="content">
        
        	<!-- 좌측 메뉴바 -->
        	<div id="content_l">
			    <jsp:include page="/views/admin/adminMenubar.jsp" flush="true"></jsp:include>
        	</div>
        	
        	<!-- 우측 회원조회 -->
        	<div id="content_r">
        	
        	</div>
        </div>
    </div>
</body>
</html>