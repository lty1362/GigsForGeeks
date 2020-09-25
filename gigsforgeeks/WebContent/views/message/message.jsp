<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="/views/message/messagenavi.jsp" flush="true"></jsp:include>
            
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