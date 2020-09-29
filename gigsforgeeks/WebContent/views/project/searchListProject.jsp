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
                        
                    <br><br>
                        <p>프로젝트 가격대</p>
                        <select name="payProject">
	                        <option value="2000000-5000000">대형 프로젝트 (2,000,000₩~5,000,000₩)</option>
							<option value="1000000-2000000">중형 프로젝트 (1,000,000₩~2,000,000₩)</option>
							<option value="500000-1000000">소형 프로젝트 (500,000₩~1,000,000₩)</option>
							<option value="200000-500000">초소형 프로젝트 (200,000₩~500,000₩)</option>
                        </select>
                        
                        <br><br><br>
                        <label><b>지역 : </b></label>
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
                </form>

            </div>

            <!-- 검색필터 적용시 보이는 프로젝트 목록 -->
            <div id="searchProjectList">
                <form action="" method="POST">
                    <input type="text" name="search" placeholder="프로젝트 검색" style="width:500px; height:40px;">
                    &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-outline-info">검색</button>
                    
                    <!-- 넣을지 안넣을지 고민중
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	 분류기준 : <select name="searchStandard">
                                <option value="bid_large">입찰다수순</option>
                                <option value="bid_small">입찰소수순</option>
                                <option value="pay_large">최다금액</option>
                                <option value="pay_small">최저금액</option>
                                <option value="time">시간순</option>
                             </select>
                      -->
                    <br>
                    <hr>
                </form>

                <br>
                <div id="searchprojectList">
                    <label id="projectTitle">프로젝트명1</label> 
                    <label id="price">700,000￦ - 2,000,000￦</label><br><br>
                    <p>
			                        내 웹사이트에 두 가지 기능을 추가해야 하는데, 
			                        하나는 고객이 체육관을 위한 평면도를 만들 수 있는 페이지를 만드는 것이다.
                    </p>
                    
                    <br>
                    <table>
                        <tr>
                            <li> 마감 5일 전 - 85건의 입찰</li> <br>
                            <li>100건의 리뷰(5.0)</li><br>
                            <li>JAVA, PHP, HTML, WebsiteDesign</li>
                        </tr>
                    </table>
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