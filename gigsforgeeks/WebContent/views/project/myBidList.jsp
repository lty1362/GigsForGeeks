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
			        <a href="/list.proj" class="btn btn-primary">고용주</a>
			        <a href="/list.proj" class="btn btn-default">프리랜서</a>
			    </div>
			</div>
        </section>
        
        <%-- Project Navigator --%>
        <nav class="myProjectNav">
        	<a style="font-weight: bolder">입찰 작업</a> | 
        	<a href="">현재 작업</a> | 
        	<a href="">과거 작업</a>
        </nav>
        
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
                	<% if(myProjectList.isEmpty()) { %>
                	<tr>
                		<td colspan="5">입찰 중인 프로젝트가 없습니다.</td>
                	</tr>
                	<% }else { %>
                		<% for(Project myProject : myProjectList) { %>
	                    <tr>
	                        <td><%= myProject.getProjectName() %></td>
	                        <td><%= myProject.getWinnerId() %></td>
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