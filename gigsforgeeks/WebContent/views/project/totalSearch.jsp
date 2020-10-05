<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>

<%
	ArrayList<Project> pList = (ArrayList<Project>)request.getAttribute("list");
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("list");

%>
<%-- Template HTML 1 : 일반 화면용 --%>
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
	<title>totalSearch</title>
</head>
<body>

    <%-- Content --%>
    <main id="contentMain">
	    <div id="totalSearch">
	    	<br>
	        <h1>통합검색</h1>
	        <br>
	        <form action="${contextPath}/projectList.do" method="GET">
	            <div id="project">
	                <span class="search">프로젝트 찾기 : &nbsp;
	                    <input type="text" name="proejctSearch">
	                </span>
	                <button type="submit" class="btn btn-outline-info">검색</button>
	                <br><hr><br>
	            <div>
	            <!-- 리스트가 비어있을 경우 -->
                <% if(pList.isEmpty()) { %>
					<p align="center">일치하는 프로젝트를 찾을 수 없습니다.</p>
	          	<% }else { %>
	          		<!-- 리스트가 비어있지 않을 경우 -->
	                <% for(Project p : pList) { %>
	                <div onclick="location.href='${contextPath}/detailSelect.do'" id="searchprojectList">
	                    <label class="title"><%= p.getProjectName() %></label> 
	                    <label class="price"><%= p.getMinBid() %>￦ - <%= p.getMaxBid() %>￦</label><br>
	                    <p><%= p.getDescription() %></p><br>
	                    <li>입찰 마감일 : <%=p.getEndBid() %></li>
	                    <li>입찰수 : <%= p.getCountBid() %></li>
	                </div>
	        		<hr>
                	<% } %>
	       		 <% } %> 
	   
	                </div>    
	            </div>
	        </form>
	
	        <br>
	        <form action="${contextPath}/freelancerList.do" method="GET">
	            <div id="freelancer">
	                <span class="search">프리랜서 찾기 : &nbsp;
	                <input type="text" name="freelancer">
	                </span>
	                <button type="submit" class="btn btn-outline-info">검색</button>
	                <br><hr><br>
	                <div>                
	                <!-- 리스트가 비어있을 경우 -->
	                <% if(mList.isEmpty()) { %>
							<p align="center">일치하는 프리랜서를 찾을 수 없습니다.</p>
		          		<% }else { %>
		          		<!-- 리스트가 비어있지 않을 경우 -->
		                <% for(Member m : mList) { %>
		                	<div onclick="location.href='${contextPath}/views/member/myAccount.jsp'" id="searchFreelancerList">
		                    <label><img alt="" src="${contextPath}/resources/images/avatar.png" style="width: 50px; height: 50px;"><%= m.getProfileImage() %></label>
		                    <label class="title"><%= m.getUserId() %></label> 
		                    <label class="price">희망시급 : <%= m.getPayRate() %>￦</label><br>
		                    <p><%= m.getSelfIntroduction() %></p>
		                    <br>
		                    <li>우수 프리랜서 : <%= m.getExcellentFreelance() %></li>
		                    <li>지역 : <%= m.getLocation() %></li>
		                    <li>기술 : <%= m.getSkill() %></li>
		                    <!-- <button class="btn btn-outline-info">고용해주세요!</button>-->
		                </div>
		                <hr>
	                	<% } %>
		       		 <% } %> 
	                </div>
	            </div>
	        </form>
	    </div>
    </main>	
    
   <br style="clear:both"><br><br><br><br><br><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>