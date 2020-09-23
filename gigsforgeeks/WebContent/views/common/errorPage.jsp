<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String errorMsg = (String)session.getAttribute("errorMsg");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
    <%-- Header --%>
    <jsp:include page="/views/common/header.jsp" flush="true"></jsp:include>
    <%-- End Of Header --%>
    
 	<%-- Content --%>
 	<br>
     <div align="center" id="error">
        <h1 style="color: rgb(23, 192, 169);">죄송합니다.</h1>
    	<h1 style="color: rgb(23, 192, 169);"><%= errorMsg %></h1>
    	<img src="<%=contextPath %>/resources/images/404error.png">
    </div>
    
    <div align="center">
    		<h2>혹시 하시려던 작업이 이런것 입니까?</h2>
    	 	<table>
    			<tr>
    				<td><a href="<%=contextPath %>/views/project/post.jsp" class="btn btn-outline-info">프로젝트 등록</a>&nbsp;&nbsp;<td>
    				<td><a href="<%=contextPath %>/views/project/search.jsp" class="btn btn-outline-info">탐색</a></td>
    			</tr>
    		</table>
    		<br>
    	
    		<h2>아니시면, 여기 몇 가지 도움을 들이고자 준비되어 있습니다.</h2>
    		<table>
    			<tr>
    			    <td><button type="button" class="btn btn-outline-info" onclick="history.back();">이전페이지로</button>&nbsp;&nbsp;</td>
    				<td><a href="" class="btn btn-outline-info">자주 묻는 질문들</a>&nbsp;&nbsp;</td>
    				<td><a href="" class="btn btn-outline-info">문의하기</a>&nbsp;&nbsp;</td>
    				<td><a href="<%=contextPath%>"class="btn btn-outline-info">메인페이지</a></td>
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