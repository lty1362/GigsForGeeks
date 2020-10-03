<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, 
            com.gigsforgeeks.project.model.vo.Project" %>
<% ArrayList<Project> myProject = (ArrayList<Project>)request.getAttribute("myProject"); %>
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
	<title>내 프로젝트</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
        <h2 id="contentTitle">프로젝트</h2>
        <section>
            <table class="projectTable">
                <thead>
                    <tr>
                        <th>프로젝트명</th>
                        <th>프리랜서</th>
                        <th>낙찰가</th>
                        <th>종료일</th>
                        <th>실행옵션</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(myProject.isEmpty()) { %>
                	<tr>
                		<td colspan="5">입찰 중인 프로젝트가 없습니다.</td>
                	</tr>
                	<% }else { %>
                		<% for(Project project : myProject) { %>
	                    <tr>
	                        <td><%= project.getProjectName() %></td>
	                        <td><%= project.getWinnerId() %></td>
	                        <td><%= project.getWinningBid() %></td>
	                        <td><%= project.getEndDate() %></td>
	                        <td>
	                            <select name="projectStatus">
	                                <option value="process"><%= project.getProjectStatus() %></option>
	                            </select>
	                        </td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </section>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>