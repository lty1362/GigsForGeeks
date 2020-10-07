<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int NotReadCount = pi.getNotReadCount();
	int KeepCount = pi.getFullCount();
	int adminCount = pi.getAdminCount();
%>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/message.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Message</title>
</head>
<body>
  
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <!--메세지 화면-->
    <div id="content">
        <!-- 메뉴바 -->
        <div id="con">           
            <div id="content_1">
                <div id="naviMain"><a href="${contextPath}/list.ms?currentPage=1">전체메세지 (<%=listCount%>)</a></div>
                <div id="naviNotRead"><a href="${contextPath}/notRead.ms?currentPage=1">읽지않음 (<%=NotReadCount%>)</a></div>
                <div id="naviKeep"><a href="${contextPath}/keepList.ms?currentPage=1">보관 메세지 (<%=KeepCount%>)</a></div>
                <div id="naviAdmin"><a href="${contextPath}/admin.ms?currentPage=1">고객 지원팀 (<%=adminCount%>)</a></div>
            </div>
        </div>
            
        <div id="main">
        <!-- 내용변경할곳 -->
        <!-- 전체메세지 -->
		<jsp:include page="/views/message/messageFull.jsp" flush="true"></jsp:include>
    	</div>
       </div>
       
       

    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>