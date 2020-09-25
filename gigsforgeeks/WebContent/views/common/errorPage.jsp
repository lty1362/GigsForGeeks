<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String errorMsg = (String)session.getAttribute("errorMsg");	 %>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>ErrorPage</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    	<br>
     <div align="center" id="error">
        <h1 style="color: rgb(23, 192, 169);">죄송합니다.</h1>
    	<h1 style="color: rgb(23, 192, 169);"><%= errorMsg %></h1>
    	<img src="${contextPath}/resources/images/404error.png">
    </div>
    
    <div align="center">
    		<h2>혹시 하시려던 작업이 이런것 입니까?</h2>
    	 	<table>
    			<tr>
    				<td><a href="${contextPath}/views/project/post.jsp" class="btn btn-outline-info">프로젝트 등록</a>&nbsp;&nbsp;<td>
    				<td><a href="${contextPath}/views/project/search.jsp" class="btn btn-outline-info">탐색</a></td>
    			</tr>
    		</table>
    		<br>
    	
    		<h2>아니시면, 여기 몇 가지 도움을 들이고자 준비되어 있습니다.</h2>
    		<table>
    			<tr>
    			    <td><button type="button" class="btn btn-outline-info" onclick="history.back();">이전페이지로</button>&nbsp;&nbsp;</td>
    				<td><a href="" class="btn btn-outline-info">자주 묻는 질문들</a>&nbsp;&nbsp;</td>
    				<td><a href="" class="btn btn-outline-info">문의하기</a>&nbsp;&nbsp;</td>
    				<td><a href="${contextPath}"class="btn btn-outline-info">메인페이지</a></td>
    			</tr>
    		</table>
   			<br>
	 </div>
    <br><br>
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>