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
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
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
    <c:remove var="alertMsg" scope="session" />
</head>
<body>
    <header id="header">
    	<%-- 로고 이미지 --%>
        <a href="${contextPath}"><img src="${contextPath}/resources/images/gigsforgeeks_logo.png" alt="Gigs For Geeks" id="letterMark"></a>
            <%-- 로그인 전에 보여지는 main 시작 --%>
            <% if(loginUser == null) { %>
                <main id="headerMain">
                    <nav id="headerMainNav">
                        <a href="${contextPath}/views/project/search.jsp">탐색</a>
                        <a href="${contextPath}/views/project/post.jsp">프로젝트 등록</a>
                    </nav>
                    <aside id="headerAside">
                        <a href="${contextPath}/views/member/login.jsp">로그인</a>
                        <a href="${contextPath}/views/member/signUp.jsp">회원가입</a>
                    </aside>
                </main>
	        <% } else { %>
            <%-- 로그인 전에 보여지는 main 끝 --%>
            
            <%-- 로그인 후에 보여지는 main 시작 --%>
	            <main id="headerMain">
                    <nav id="headerMainNav">
                        <a href="${contextPath}/views/project/search.jsp">탐색</a>
                        <a href="${contextPath}/views/project/myProject.jsp">내 프로젝트</a>
                        <a href="${contextPath}/list.ms">메시지</a>
                        <a href="">업데이트</a>
                    </nav>
                    <aside id="headerAside">
                        <a href="${contextPath}/views/project/post.jsp">프로젝트 게시하기</a>
                        <a href="${contextPath}/LoadingUser.load">내 계정</a>
                    </aside>
                </main>
	        <% }%>
            <%-- 로그인 후에 보여지는 main 끝 --%>
    </header>
</body>
</html>