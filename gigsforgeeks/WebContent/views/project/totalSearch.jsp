<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	        <h1>통합검색</h1>
	        <br>
	        <form action="" method="GET">
	            <div id="project">
	                <span class="search">프로젝트 검색 : &nbsp;
	                    <input type="text" name="proejctSearch">
	                </span>
	                <button type="submit" class="btn btn-outline-info">검색</button>
	                <br><hr><br>
	                <div>
	                    <label class="title">프로젝트1 제목</label>
	                    <label class="price">프로젝트 가격￦</label>
	                    <p>프로젝트1 내용</p><br>
	                    <p>프로젝트 마감일자(열기 6일전-85건의 입찰)</p>
	                    <p>프로젝트 기술(PHP, WordPress, html, java)</p>
	                </div>    
	            </div>
	        </form>
	
	        <br>
	        <form action="" method="GET">
	            <div id="freelancer">
	                <span class="search">프리랜서 검색 : &nbsp;
	                    <input type="text" name="freelancer">
	                </span>
	                <button type="submit" class="btn btn-outline-info">검색</button>
	                <br><hr><br>
	                <div>
	                    <label class="title">프리랜서 이름</label>
	                    <label class="price">프리랜서 가격￦</label>
	                    <p>프리랜서1 내용</p><br>
	                    <p>프리랜서 평점(90건의 리뷰)</p>
	                    <p>프리랜서 기술(html, 웹사이트 디자인, PHP, 워드프레스, CSS</p>
	                </div>
	            </div>
	        </form>
	    </div>
    </main>	
    
   <br style="clear:both"><br><br><br><br><br><br><br><br>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>