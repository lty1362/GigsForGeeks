<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*"%>

<%
	ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Project project = (Project)request.getAttribute("project");
	
	String projectId = project.getProjectId();
	String projectName = project.getProjectName();
	String projectStatus = project.getProjectStatus();
	String description = project.getDescription();
	

	int listCount = pi.getListCount();
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
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>searchListProject</title>
</head>
<body>
    
    <!--  Content  -->
    <main id="contentMain">
        <div id="searchContent">

            <!-- 좌측 검색필터 카테고리 -->
            <div id="projectCategory">
                <form id="feelterbar" action="" method="POST">
                    <div class="feelter_main">프로젝트</div> <br>
                    <div class="feelter_main">프리랜서</div> <br>
                    <div class="feelter_main">우수 프리랜서</div>
                    <br>
             
                    <div id="feelter_sub">
                        <p>기술 :</p>
                        <input type="checkbox" name="requiredSkill" id="JAVA">
                        <label for="Java">JAVA</label>
                        <input type="checkbox" name="requiredSkill" id="PHP">
                        <label for="PHP">PHP</label>
                        <br>
                        <input type="checkbox" name="requiredSkill" id="HTML">
                        <label for="html">HTML</label>
                        <input type="checkbox" name="requiredSkill" id="CSS">
                        <label for="CSS">CSS</label>
                        <br>
                        <input type="checkbox" name="requiredSkill" id="Python">
                        <label for="Python">Python</label>
                        <input type="checkbox" name="requiredSkill" id="AJAX">
                        <label for="AJAX">AJAX</label>
                        <br>
                        <input type="checkbox" name="requiredSkill" id="JavaScript">
                        <label for="JavaScript">JavaScript</label>
                        <input type="checkbox" name="requiredSkill" id="MySQL">
                        <label for="MySQL">MySQL</label>
                        <br>
                        <input type="checkbox" name="requiredSkill" id="WordPress">
                        <label for="WordPress">WordPress</label>
                        <input type="checkbox" name="requiredSkill" id="etc">
                        <label for="etc">기타</label>
                        
                    <br><br><br>
                        <label>프로젝트 최소가격대 </label>&nbsp;
                        <select name="payProject">
	                        <option value="200000">200,000₩</option>
							<option value="300000">300,000₩</option>
							<option value="400000">400,000₩</option>
							<option value="500000">500,000₩</option>
							<option value="600000">600,000₩</option>
							<option value="700000">700,000₩</option>
                        </select><br><br>
                        <label>프로젝트 최대가격대</label>&nbsp;
                        <select name="payProject">
	                        <option value="1000000">1,000,000₩</option>
							<option value="2000000">2,000,000₩</option>
							<option value="3000000">3,000,000₩</option>
							<option value="4000000">4,000,000₩</option>
							<option value="5000000">5,000,000₩</option>
                        </select>
                        
                        <br><br>
                        <label><b>지역 </b></label>&nbsp;
                        <select name="location">
                            <option value="selectNo">선택안함</option>
                            <option value="seoul">서울특별시</option>
                            <option value="gyeonggi">경기도</option>
                            <option value="gangwon">강원도</option>
                            <option value="busan">부산광역시</option>
                            <option value="incheon">인천광역시</option>
                            <option value="daegu">대구광역시</option>
                            <option value="gwangju">광주광역시</option>
                        </select>
                    </div>
                    <!-- <button type="submit" style="float: right;" class="btn btn-outline-info">필터검색</button> -->
                </form>
			<script>
			$('.feelter_main').on('click', function() {
			     $(this).addClass('active');
			});
			</script>
            </div>

            <!-- 검색필터 적용시 보이는 프로젝트 목록 -->
            <div id="searchProject">
                <form action="${contextPath}/searchList.do" method="POST">
                    <input type="text" name="search" placeholder="프로젝트 검색" style="width:500px; height:40px;">
                    <button type="button" class="btn btn-outline-info">검색</button><br><hr>
                </form>

                <br>
                
                <!-- 리스트가 비어있을 경우 -->
                <% if(list.isEmpty()) { %>
					<p align="center">일치하는 프로젝트를 찾을 수 없습니다.</p>
          		<% }else { %>
          		<!-- 리스트가 비어있지 않을 경우 -->
                <% for(Project p : list) { %>
                <div onclick="location.href='${contextPath}/views/project/detailProject.jsp'" id="searchprojectList">
                    <input type="hidden" value=<%= p.getProjectId() %>>
                    <label id="projectTitle">프로젝트명1</label> 
                    <label id="price">700,000￦ - 2,000,000￦</label><br>
                    <p>
			                        내 웹사이트에 두 가지 기능을 추가해야 하는데, 
			                        하나는 고객이 체육관을 위한 평면도를 만들 수 있는 페이지를 만드는 것이다.
                    </p>
                    <br>
                    <li>마감 5일 전 - 85건의 입찰</li>
                    <li>100건의 리뷰(5.0)</li>
                    <li>JAVA, PHP, HTML, WebsiteDesign</li>
                </div>
            </div>
            	<div class="pagingArea" align="center">
	            <!-- 페이징 바(paging bar) 만들기! -->
	            <% if(currentPage != 1){ %>
		            <!-- 맨 처음으로 (<<) 1번페이지 요청-->
		            <button onclick="location.href='${ContextPath}/list.bo?currentPage=1';"> &lt;&lt;</button>
		            <!-- 이전페이지로 (<) 현재페이지의 -1 페이지 요청 -->
		            <button onclick="location.href='${ContextPath}/list.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
				<% } %>
				
				<% for(int p=startPage; p<=endPage; p++) { %>
					<% if(p != currentPage){ %>
	            	<button onclick="loaction.href='${ContextPath}/list.bo?currentPage=<%= p%>';"><%= p %></button>
	            	<% }else { %>
	            	<button disabled><%= p %></button>
	            	<% } %>
	     		<% } %>
	     	
	     		<%if(currentPage != maxPage){ %>
		            <!-- 다음 페이지로 (>) 현재페이지의 +1페이지 요청-->
		            <button onclick="location.href='${ContextPath}/list.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
		            <!-- 맨 끝으로 (>>) 제일마지막 페이지 요청-->
		            <button onclick="location.href='${ContextPath}/list.bo?currentPage=<%=maxPage%>';"> &gt;&gt;</button>
				<% } %>

        		</div>
        </div>

    </main>	
    
    
    <br style="clear:both"><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
    
    
    
</body>
</html>