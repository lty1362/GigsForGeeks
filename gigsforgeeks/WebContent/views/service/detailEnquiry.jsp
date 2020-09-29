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
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Insert title here</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
    
    <div class="wrap" style="width: 1000px;">
        <div class="wrapSize" style="padding-left: 50%;">
            <h1><b>문의 하기</b></h1>
            <hr>
            <br>
            <h2><b>우리에게 문의하세요!</b></h2>
            <br>
            <form action="insert.enq" method="POST">
            	<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
                <div class="form-group">
                    <label for="enqType">문의 유형</label><br>
                    <select name="enqType" id="enqType">
                        <option value="10">일반</option>
                        <option value="20">프로젝트</option>
                        <option value="30">지불</option>
                        <option value="40">멤버십</option>
                        <option value="50">프로필</option>
                        <option value="60">기타</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">문의 제목</label>
                    <input type="text" name="title" class="form-control" id="title" required maxlength="100" placeholder="제목을 입력해주세요.">
                </div>
                <div class="form-group">
                    <label for="content">문의 내용</label>
                    <br>
                    <textarea name="content" id="content" cols="67" rows="7" maxlength="1000" placeholder="최대 1000글자까지 작성 가능합니다." style="border-radius: 10px;"></textarea>
                </div>
                
                <button type="submit" class="btn btn-info">제출하기</button>
                <button type="reset" class="btn btn-secondary">초기화</button>
                
            </form>
        </div>
    </div>
	    
    
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>