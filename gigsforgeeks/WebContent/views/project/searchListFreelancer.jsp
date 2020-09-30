<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
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
	<title>searchListFreelancer</title>
</head>
<body>

 <!--  Content  -->
    <main id="contentMain">
        <div id="searchContent2">

            <!-- 좌측 검색필터 카테고리 -->
            <div id="freelancerCategory">
                <form id="feelterbar" action="" method="POST">
                    <div class="feelter_main">프로젝트</div> <br>
                    <div class="feelter_main">프리랜서</div> <br>
                    <div class="feelter_main">우수 프리랜서</div>
                    <br>
             
                    <div id="feelter_sub">
                        <p>프리랜서 유형:</p>
                        <input type="checkbox" name="freelancerType" id="online">
                        <label for="online">온라인 프리랜서만</label>
                        <br><br>
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
                    <br>
                    <button type="submit" style="float: right;" class="btn btn-outline-info">필터검색</button>
                </form>

            </div>

            <!-- 검색필터 적용시 보이는 프로젝트 목록 -->
            <div id="searchFreelancer">
                <form action="" method="POST">
                    <input type="text" name="search" placeholder="프리랜서 찾기" style="width:500px; height:40px;">
                    <button type="button" class="btn btn-outline-info">검색</button><br><hr>
                </form>

                <br>
                <div onclick="location.href='${contextPath}/views/member/myAccount.jsp'" id="searchFreelancerList">
                    <label id="freelancerTitle">프리랜서 클라이언트 이름</label> 
                    <label id="price">500,000￦ - 1,000,000￦</label><br>
                    <p>
			                        내 웹사이트에 두 가지 기능을 추가해야 하는데, 
			                        하나는 고객이 체육관을 위한 평면도를 만들 수 있는 페이지를 만드는 것이다.
                    </p>
                    <br>
                    <li>평점 5.0(100건의 리뷰)</li>
                    <li>서울</li>
                    <li>JAVA, PHP, HTML, WebsiteDesign</li>
                    <!-- <button class="btn btn-outline-info">고용해주세요!</button>-->
                </div>
            </div>
        </div>

        <!-- 검색필터 적용시 일치하는 프로젝트를 못찾을때 보이는 화면(조건문)-->
        <!-- <p align="center">일치하는 프로젝트를 찾을 수 없습니다.</p> -->
    </main>	
    
    
    <br style="clear:both"><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
    
</body>
</html>