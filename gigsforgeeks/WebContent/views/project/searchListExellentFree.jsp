<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
	<title>searchListFreelancer</title>
</head>
<body>

 <!--  Content  -->
    <main id="contentMain">
        <div id="searchContent2">
            <!-- 좌측 검색필터 카테고리 -->
            <div id="freelancerCategory">
                <form id="feelterbar" action="" method="POST">
                    <a href="${contextPath}/projectList.do" class="feelter_main">프로젝트</a> <br><br>
                    <a href="${contextPath}/freelancerList.do" class="feelter_main">프리랜서</a> <br><br>
                    <a href="${contextPath}/excellent.do" class="feelter_main">우수 프리랜서</a><br>
                    <br><br>
             
                    <div id="feelter_sub">
                        <p>프리랜서 유형:</p>
                        <input type="checkbox" name="freelancerType" id="online">
                        <label for="online">온라인 프리랜서만</label>
                        <br><br>
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
                        <label>희망가격 : </label>&nbsp;
                        <input type="text" name="freelancerPay" placeholder="가격을 입력하세요.">&nbsp;￦
                       
                        <br><br>
                        <label>평점 :</label>&nbsp;
                        <select name="payProject">
	                        <option value="excellent">5.0 ~ 4.0</option>
							<option value="great">4.0 ~ 3.0</option>
							<option value="good">3.0 ~ 2.0</option>
                            <option value="notgood">2.0 ~ 1.0</option>
                            <option value="bad">1.0 ~ 0.0</option>
                        </select>

                        <br><br>
                        <label><b>지역 : </b></label>&nbsp;
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
                </form>

            </div>

            <!-- 검색필터 적용시 보이는 프로젝트 목록 -->
            <div id="searchFreelancer">
                <form action="${contextPath}/freelancerList.do" method="get">
                    <input type="text" name="search" placeholder="프리랜서 찾기" style="width:500px; height:40px;">
                    <button type="button" class="btn btn-outline-info">검색</button><br><hr>
                </form>
                <!-- 리스트가 비어있을 경우 -->
                <% if(list.isEmpty()) { %>
						<p align="center">일치하는 프리랜서를 찾을 수 없습니다.</p>
	          		<% }else { %>
	          		<!-- 리스트가 비어있지 않을 경우 -->
	                <% for(Member m : list) { %>
	                	<div onclick="location.href='${contextPath}/views/member/myAccount.jsp'" id="searchFreelancerList">
	                    <label><img alt="" src="${contextPath}/resources/images/avatar.png" style="width: 50px; height: 50px;"><%= m.getProfileImage() %></label>
	                    <label id="freelancerTitle"><%= m.getUserId() %></label> 
	                    <label id="price">희망시급 : <%= m.getPayRate() %>￦</label><br>
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
    </main>	
    
    
    <br style="clear:both"><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
    
</body>
</html>