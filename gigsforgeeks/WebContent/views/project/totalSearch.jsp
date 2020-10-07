<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>

<%
	ArrayList<Project> pList = (ArrayList<Project>)request.getAttribute("list");
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("list");

%>
<%-- Template HTML 1 : 일반 화면용 --%>
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
	<title>totalSearch</title>
</head>
<body>

    <%-- Content --%>
    <main id="contentMain">
	      <div id="totalSearch">
        <br>
        <h1>채용 정보 찾아보기</h1>
        <br>
        <form action="" method="GET">
            <div id="project">
                <span class="search">프로젝트 검색 : &nbsp;
                    <input type="text" name="proejctSearch">
                </span>
                <button type="submit" class="btn btn-outline-info">검색</button>
                <br><hr>
                <div>
                    <label class="title">프로젝트1 이름</label>
                    <label class="price">200,000￦ - 500,000￦</label>
                    <p>프로젝트의 내용입니다 1</p><br>
                    <li>프로젝트 마감일자 : 2020-09-16</li>
                    <li>프로젝트 기술 : JAVA, PHP, WordPress, HTML</li>
                    <li>입찰수 : 0</li>
                </div>    
            </div>
        </form>

        <br>
        <form action="" method="GET">
            <div onclick="location.href='${contextPath}/freelancerDetail.do?userId=user01';" id="freelancer">
                <span class="search">프리랜서 검색 : &nbsp;
                    <input type="text" name="freelancer">
                </span>
                <button type="submit" class="btn btn-outline-info">검색</button>
                <br><hr>
                <div>
                    <label class="title">프리랜서 user01</label>
                    <label class="price">희망시급 : 80,000￦</label>
	                <p>프리랜서의 자기소개 내용입니다 1</p><br>
	                <li>우수 프리랜서 : Y</li>
	                <li>프리랜서 기술 : JAVA, JavaScript, PHP, CSS</li>
                    <li>지역 : 서울</li>
	                
                </div>
            </div>
        </form>
    </div>

    </main>	
    
   <br style="clear:both"><br><br><br><br><br><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>