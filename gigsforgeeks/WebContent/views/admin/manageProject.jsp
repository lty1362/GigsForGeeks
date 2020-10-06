<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.member.model.vo.Member" %>
<%@ page import="com.gigsforgeeks.project.model.vo.*" %>
<%
	ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String contextPath = request.getContextPath();
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>    
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
				<div id="content_r_center_h" style="padding: 30px; font-size: 40px;">
			        <b>프로젝트 조회</b>
			    </div>
				<!-- 회원조회 영역 -->
		        <table class="table table-hover, listArea">
		            <thead align="center">
		                <tr>
		                    <th style="width: 100px;">번호</th>
		                    <th style="width: 100px;">ID</th>
		                    <th style="width: 150px;">진행상태</th>
		                    <th style="width: 150px;">낙찰가</th>
		                    <th style="width: 200px;">프로젝트명</th>
		                    <th style="width: 100px;">마감일자</th>
		                </tr>
		            </thead>
		            <tbody align="center">
		            	<% if(list.isEmpty()){ %>
		            	<tr>
		            		<td colspan="6">조회된 리스트가 없습니다.</td>
		            	</tr>
		            	<% }else { %>
	            			<% for(Project pjt : list) { %>
		                <tr>
		                    <td><%= pjt.getProjectId() %></td>
		                    <td><%= pjt.getClientId() %></td>
		                    <td><%= pjt.getProjectStatus() %></td>
		                    <td><%= pjt.getWinningBid() %></td>
		                    <td><%= pjt.getProjectName() %></td>
		                    <td><%= pjt.getEndDate() %></td>
		                </tr>
			               <% } %>
		            	<% } %>
		            </tbody>
		        </table>
		        <!-- 테이블 리스트 끝 -->
				
				<br><br>
				
		        <div class="pagingArea" align="center">
					<% if(currentPage != 1){ %>
			            <!-- 맨 처음으로 (<<) -->
			            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/ProjectList.bo?currentPage=1';"> &lt;&lt; </button>
			            <!-- 이전페이지로 (<) -->
			            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/ProjectList.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++){ %>
						<% if(p != currentPage){ %>
		            	<button class="btn btn-info" onclick="location.href='<%=contextPath%>/ProjectList.bo?currentPage=<%=p%>';"><%= p %></button>
		            	<% }else{ %>
		            	<button class="btn btn-info" disabled><%= p %></button>
		            	<% } %>
		            <% } %>
					
					<% if(currentPage != maxPage){ %>
			            <!-- 다음페이지로 (>) -->
			            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/ProjectList.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
			            <!-- 맨 끝으로 (>>) -->
			            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/ProjectList.bo?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
					<% } %>
          	 	</div>

        	</div>
        </div>
    </div>
</body>
</html>