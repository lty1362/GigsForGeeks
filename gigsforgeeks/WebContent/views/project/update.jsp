<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,
    		com.gigsforgeeks.project.model.vo.*,
    		java.text.NumberFormat,
			java.util.Locale" %>
<% 
	ArrayList<Project> myProjectList = (ArrayList<Project>)request.getAttribute("myProjectList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int boardCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
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
	<title>Update</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain" class="project">
    	<%-- Project Header --%>
        <section class="myProjectHeader">
	        <h2 id="contentTitle" class="project">업데이트</h2>
	    </section>
        <%-- Project Table --%>
        <table class="projectTable update">
            <thead>
                <tr>
                    <th>프로젝트명</th>
                    <th>입찰</th>
                    <th>평균입찰가</th>
                    <th>입찰마감일</th>
                    <th>실행옵션</th>
                </tr>
            </thead>
            <tbody>
            	<% if(myProjectList.isEmpty()) { %>
            	<tr>
            		<td colspan="5">업데이트된 프로젝트가 없습니다.</td>
            	</tr>
            	<% }else { %>
            		<% for(Project myProject : myProjectList) { %>
		                <tr>
		                    <td>
		                    	<a href=""><%= myProject.getProjectName() %></a>
		                    	<span style="visibility: hidden;"><%= myProject.getProjectId() %></span>
		                    </td>
		                    <td><%= myProject.getCountBid() %></td>
		                    <td><%= NumberFormat.getCurrencyInstance(Locale.KOREA).format(myProject.getAverageBid()) %></td>
		                    <td><%= myProject.getExpectEnd() %></td>
		                    <td>
		                        <select name="projectStatus">
		                            <option value="process"><%= myProject.getProjectStatus() %></option>
		                        </select>
		                    </td>
		                </tr>
	                <% } %>
                <% } %>
            </tbody>
        </table>
        <%-- End of Project Table --%>
        <%-- Paging Section --%>
        <div class="pagingArea" align="center">
	        <!-- 맨 처음으로 (<<) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/update.proj?currentPage=1';">&lt;&lt;</button>
	        <!-- 이전페이지로 (<) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/update.proj?currentPage=<%= currentPage-1 %>';">&lt;</button>
	        	<% for(int p=startPage; p<endPage; p++) { %>
	        		<% if(p != currentPage){ %>
					<button class="btn btn-outline-info" onclick="location.href='${contextPath}/update.proj?currentPage=<%= p %>';"><%= p %></button>
	        		<% }else { %>
					<button class="btn btn-outline-info" disabled><%= p %></button>
	        		<% } %>
				<% } %>
	        <!-- 다음페이지로 (>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/update.proj?currentPage=<%= currentPage+1 %>';">&gt;</button>
	        <!-- 맨 끝으로 (>>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/update.proj?currentPage=<%= maxPage %>';">&gt;&gt;</button>
	    </div>
	    <%-- End of Paging Section --%>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>