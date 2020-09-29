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
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/service.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Insert title here</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
    
        <div class="wrap" align="center">
        
        <h1 align="center">무엇을 도와드릴까요?</h1>
        <br>

        <div id="question">
	        <form action="${contextPath}/enq.do" method="POST">
	            <input id="question1" type="text" placeholder="무엇을 도와드릴까요?">
	            <button id="question2">검색</button>
            </form>
        </div>

        <hr>
        
        <div class="btn-group" id="jobType" role="group">
            <button type="button" class="btn btn-default">고용주</button>
            <button type="button" class="btn btn-default">프리랜서</button>
        </div>
        
        <br><br>

        <div class="content">
            <div class="detailMenu">일반 문의</div>
            <p>Freelancer 란 무엇입니까?</p>
            
            <div class="detailMenu">프로젝트 문의</div>
            <p>Freelancer 란 무엇입니까?</p>

            <div class="detailMenu">지불관련 문의</div>
            <p>Freelancer 란 무엇입니까?</p>
            
            <div class="detailMenu">멤버십 관련 문의</div>
            <p>Freelancer 란 무엇입니까?</p>
            
            <div class="detailMenu">프로필 관련 문의</div>
            <p>Freelancer 란 무엇입니까?</p>
        </div>
        
        <br><br>
        
        <a id="buttonENQ" href="${contextPath}/views/service/detailEnquiry.jsp">문 의 하 기</a>
        
    </div>

    <script>
        $(function(){
            $(".detailMenu").click(function(){

                var $p = $(this).next();

                if($p.css("display") == "none"){

                    $(this).siblings("p").slideUp();
                    $p.slideDown(); 

                }else{
                    $p.slideUp();

                }

            });
        });
    </script>
    
    
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>