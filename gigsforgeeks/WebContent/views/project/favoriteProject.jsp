<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>favoriteProject</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
        <div id="favoriteCategory">
            <a href="">내가 즐겨찾는 프로젝트</a>&nbsp;&nbsp;&nbsp;
            <a href="${contextPath}/projectList.do">프로젝트 탐색</a>
        </div>
        <br><br>
        
        <div id="favoriteProject">
            <h3>내가 즐겨찾는 프로젝트</h2><br>
            <table>
                <tr>
                    <th scope="row">프로젝트 명</th>
                    <th>입찰수</th>
                    <th>입찰시작일</th>
                    <th>가격대</th>
                </tr>
                <tr>
                    <td scope="row">
                        <input type="checkbox" name="favoriteProject1">&nbsp;&nbsp;&nbsp;프로젝트1
                    </td>
                    <td>100</td>
                    <td>2020.09.15</td>
                    <td>700,000￦ - 2,000,000￦</td>
                </tr>
                <tr>
                    <td scope="row">
                        <input type="checkbox" name="favoriteProject2">&nbsp;&nbsp;&nbsp;프로젝트2
                    </td>
                    <td>100</td>
                    <td>2020.09.15</td>
                    <td>700,000￦ - 2,000,000￦</td>
                </tr>
            </table>
            <br>
            <div style="float:right; width:170px;">
            <button class="btn btn-outline-info">지금 입찰하기</button><br><br>
            <button type="button" class="btn btn-outline-info">즐겨찾기 삭제</button>
            </div>
        </div>
    </main>	
    
    <br style="clear:both"><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
    
</body>
</html>