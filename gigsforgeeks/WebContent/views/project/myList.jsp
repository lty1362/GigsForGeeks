<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,
    		com.gigsforgeeks.project.model.vo.*,
    		java.text.NumberFormat,
			java.util.Locale" %>
<% ArrayList<Project> myProjectList = (ArrayList<Project>)request.getAttribute("myProjectList"); %>
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
	<script>
   	    // 세션 비우기
   	    sessionStorage.clear();
    </script>
	<title>내 프로젝트</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain" class="project">
    	<%-- Project Header --%>
        <section class="myProjectHeader">
	        <h2 id="contentTitle" class="project">내 프로젝트</h2>
			<div class="bs-example" data-example-id="simple-button-group">
			    <div class="btn-group" role="group" aria-label="Basic example">
			        <button class="btn btn-primary setReqType e">고용주</button>
			        <button class="btn btn-default setReqType f">프리랜서</button>
			    </div>
			</div>
        </section>
        <%-- End of Project Header --%>
        <%-- Project Navigator --%>
        <nav class="myProjectNav">
        	<a href="">열린 프로젝트</a> | 
        	<a style="font-weight: bolder;">시작 프로젝트</a> | 
        	<a href="">피드백</a> | 
        	<a href="">과거 프로젝트</a>
        </nav>
        <%-- End of Project Navigator --%>
        <%-- Project Table --%>
        <table class="projectTable">
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
            		<td colspan="5">입찰 중인 프로젝트가 없습니다.</td>
            	</tr>
            	<% }else { %>
            		<% for(Project myProject : myProjectList) { %>
            			<% if(myProject.getProjectStatus().equals("START") || myProject.getProjectStatus().equals("PROCESS") || myProject.getProjectStatus().equals("HOLD")) { %>
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
                <% } %>
            </tbody>
        </table>
        <%-- End of Project Table --%>
        <%-- Paging Section --%>
        <div class="pagingArea" align="center">
	        <!-- 맨 처음으로 (<<) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.proj?currentPage=1';">&lt;&lt;</button>
	        <!-- 이전페이지로 (<) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.proj?currentPage=<%= 1-1 %>';">&lt;</button>
				<%-- <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.proj?currentPage=<%= 1 %>';">1</button> --%>
				<button class="btn btn-outline-info" disabled><%= 1 %></button>
	        <!-- 다음페이지로 (>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.proj?currentPage=<%= 1+1 %>';">&gt;</button>
	        <!-- 맨 끝으로 (>>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.proj?currentPage=<%= 2 %>';">&gt;&gt;</button>
	    </div>
	    <%-- End of Paging Section --%>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>