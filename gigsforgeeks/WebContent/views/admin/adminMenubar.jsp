<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	// > 로그인 전 : null
	// > 로그인 후 : 로그인성공한 회원정보들이 담겨있는 객체
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminMenubar</title>
</head>

	<style type="text/css">
 	a:link { text-decoration:none; color:#ffffff;}
 	a:visited { text-decoration:none;color:#ffffff;}
 	a:active {text-decoration:none; color:#ffffff; }
 	a:hover { text-decoration:none; color:#EDA900;}
	</style>

<body>
	
	<!-- 화면 좌측 -->
    <div id="content_l_high">관리자 페이지</div>
    <div id="content_l_mid">
        <label id="adminId" style="font-size: 30px; font-weight: 600;"><%= loginUser.getUserId() %></label>
        <label style="color:lightslategray; font-size: 14px; font-weight: 600;">님 반갑습니다.</label>
            
        <br><br>
        
        <a href="${contextPath}/logout.me" class="btn btn-secondary">로그아웃</a>
        
    </div>

    <!-- 좌측 상세메뉴 -->
    <div id="content_l_navi">
        <div id="navi_main">회원관리</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/admin'">전체회원 보기</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/premiumMember.jsp'">우수 프리랜서</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/membershipMember.jsp'">멤버십 회원</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/reportMember.jsp'">신고 내역</div>
        <div id="navi_main">프로젝트 관리</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/manageProject.jsp'">프로젝트 관리</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/endProject.jsp'">마감된 프로젝트</div>
        <div id="navi_main">고객지원 관리</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/views/admin/faqManage.jsp'">FAQ 관리</div>
        <div id="navi_sub" OnClick="location.href ='${contextPath}/adminEnquiry'">1:1 문의</div>
    </div>
</body>
</html>

