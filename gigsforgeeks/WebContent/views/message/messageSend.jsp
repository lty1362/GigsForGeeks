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
        <div id="con">           
            <div id="content_1">
                <div id="naviMain"><a href="${contextPath}/views/message/message.jsp">전체메세지</a></div>
                <div id="naviNotRead"><a href="${contextPath}/views/message/messageNotRead.jsp">읽지않음(갯수)</a></div>
                <div id="naviKeep"><a href="${contextPath}/views/message/messageKeep.jsp">보관 메세지</a></div>
                <div id="naviAdmin"><a href="${contextPath}/views/message/messageAdmin.jsp">고객 지원팀</a></div>
            </div>
        </div>
            
        <div id="main">
        <!-- 내용변경할곳 -->
        <!-- 메세지작성 -->
		 <div id="messageSend">
	        <h1>메세지 보내기</h1>
	        <br>
	        
	        <b>받는사람 : </b>
	        <input type="text" id="meUserId" name="meUserId" placeholder="회원의 아이디를 입력해주세요." required>
	        <br><br>
	        
	        <b>제목 : </b> 
	        <input type="text" id="meTitle" name="meTitle" placeholder="제목을 입력해주세요." required>
	        <button type="submit" class="btn btn-outline-info">메세지 보내기</button>
	        <br><br>
	        
	        <textarea id="meContent" name="meContent" placeholder="내용을 입력해주세요." required  cols="210" rows="30" ></textarea>
   		 </div>
       </div>
      </div> 
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>