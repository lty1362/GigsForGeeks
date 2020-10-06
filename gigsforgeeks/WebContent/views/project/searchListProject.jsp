<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*"%>

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
	<title>searchListProject</title>
</head>
<body>
    
    <!--  Content  -->
    <main id="contentMain">
        <div id="searchContent">

            <!-- 좌측 검색필터 카테고리 -->
            <div id="projectCategory">
                <form id="feelterbar" action="" method="POST">
                    <a href="${contextPath}/projectList.do" class="feelter_main">프로젝트</a> <br><br>
                    <a href="${contextPath}/freelancerList.do" class="feelter_main">프리랜서</a> <br><br>
                    <a href="${contextPath}/freelancerList.do" class="feelter_main">우수 프리랜서</a><br>
                    <br><br>
             
                    <div id="feelter_sub">
                        <p>기술 :</p>
                        <input type="checkbox" name="requiredSkill" id="JAVA">
                        <label for="Java">JAVA</label>
                        <input type="checkbox" name="requiredSkill" id="PHP">
                        <label for="PHP">SPRING</label>
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
                <form action="${contextPath}/projectList.do" method="get">
                    <input type="text" name="search" placeholder="프로젝트 검색" style="width:500px; height:40px;">
                    <button type="button" class="btn btn-outline-info">검색</button><br><hr>
                </form>
                <!-- 리스트가 비어있을 경우 -->
                <% if(list.isEmpty()) { %>
					<p align="center">일치하는 프로젝트를 찾을 수 없습니다.</p>
	          		<% }else { %>
	          		<!-- 리스트가 비어있지 않을 경우 -->
	                <% for(Project p : list) { %>
	                <div onclick="location.href='${contextPath}/detailSelect.do?projectId=<%= p.getProjectId() %>';" id="searchprojectList">
	                    <label id="projectTitle"><%= p.getProjectName() %></label> 
	                    <label id="price"><%= p.getMinBid() %>￦ - <%= p.getMaxBid() %>￦</label><br>
	                    <p><%= p.getDescription() %></p>
	                    <br>
	                    <ul>
		                    <li>입찰 마감일 : <%=p.getEndBid() %></li>
		                    <li>요구되는 기술 : <%= p.getRequiredSkill() %></li>
		                    <li>입찰수 : <%= p.getCountBid() %></li>
		                    
	                    </ul>
	                </div>
	        		<hr>
                	<% } %>
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