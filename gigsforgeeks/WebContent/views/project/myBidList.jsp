<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, 
            com.gigsforgeeks.project.model.vo.Project" %>
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
    <script>
   	    // 세션 비우기
   	    sessionStorage.clear();
    </script>
	<!-- 페이지의 타이틀을 작성하세요 -->
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
			        <button class="btn btn-default setReqType e">고용주</button>
			        <button class="btn btn-primary setReqType f">프리랜서</button>
			    </div>
			</div>
        </section>
        <%-- End of Project Header --%>
        <%-- Project Navigator --%>
        <nav class="myProjectNav">
        	<a href="">입찰 작업</a> | 
        	<a href="" style="font-weight: bolder">현재 작업</a> | 
        	<a href="">과거 작업</a>
        </nav>
        <%-- End of Project Navigator --%>
        <%-- Project Table --%>
        <table class="projectTable">
            <thead>
                <tr>
                    <th>프로젝트명</th>
                    <th>고용주</th>
                    <th>낙찰가</th>
                    <th>종료일</th>
                    <th>실행 옵션</th>
                </tr>
            </thead>
            <tbody>
            	<% if(myProjectList.isEmpty()) { %>
            	<tr>
            		<td colspan="5">현재 진행하는 작업이 없습니다.</td>
            	</tr>
            	<% }else { %>
            		<% for(Project myProject : myProjectList) { %>
            			<% if(myProject.getProjectStatus().equals("START")) { %>
			                <tr>
			                    <td>
			                    	<a href=""><%= myProject.getProjectName() %></a>
			                    	<span style="visibility: hidden;"><%= myProject.getProjectId() %></span>
			                    </td>
			                    <td><%= myProject.getClientId() %></td>
			                    <td><%= myProject.getWinningBid() %></td>
			                    <td><%= myProject.getEndDate() %></td>
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
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=1';"> &lt;&lt; </button>
	        <!-- 이전페이지로 (<) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%--currentPage-1--%>';"> &lt; </button>
			<%-- <% for(int p=startPage; p<=endPage; p++) {%>
				<%if(p != currentPage){ %>
					<button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%=p%>';"><%= p %></button>
				<%}else{ %>
					<button class="btn btn-outline-info" disabled><%= p %></button>
				<%} %>
			<%} %> --%>
	        <!-- 다음페이지로 (>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%--currentPage+--%>';"> &gt; </button>
	        <!-- 맨 끝으로 (>>) -->
	        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%--maxPage--%>';"> &gt;&gt; </button>
	    </div>
	    <%-- End of Paging Section --%>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>