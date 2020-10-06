<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.gigsforgeeks.service.model.vo.FAQ" %>
<%
	FAQ faq = (FAQ)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../views/common/header2.jsp" %>
	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminTableList.css">
		
	<title>FAQ추가하기</title>
	
</head>

<body>
    <div class="wrap">
        <div id="content">
        
        	<!-- 좌측 메뉴바 -->
        	<div id="content_l">
			    <jsp:include page="/views/admin/adminMenubar.jsp" flush="true"></jsp:include>
        	</div>
        	
        	<!-- 우측 메인 : 회원조회 -->
        	<div id="content_r">
        		<!-- 우측 상단 헤더 -->
				<div id="content_r_header">
				    <jsp:include page="/views/admin/adminHeaderbar.jsp" flush="true"></jsp:include>
				</div>
				
				<!-- 우측 메인 -->
                <div id="content_r_center_h" style="padding-left: 30px; padding-top: 30px; font-size: 40px;">
			        <b>FAQ 추가</b>
			        <hr>
			    </div>
				<!-- ****************	여기서부터!!	***************** -->

				<div class="wrapSize" style="padding-left: 10%;">
					<br>
		            <br>
		            <h3><b>추가하고싶은 FAQ분야, 제목, 내용을 입력해주세요.</b></h3>
		            <br>
		            <form action="insert.faq" method="POST">
		                <div class="form-group">
		                    <label for="enqType">FAQ 유형</label><br>
		                    <select name="enqType" id="enqType">
		                        <option value="일반">일반</option>
		                        <option value="프로젝트">프로젝트</option>
		                        <option value="지불">지불</option>
		                        <option value="멤버쉽">멤버쉽</option>
		                        <option value="프로필">프로필</option>
		                        <option value="기타">기타</option>
		                    </select>
		                </div>
		                <div class="form-group">
		                    <label for="title">FAQ 제목</label>
		                    <input type="text" name="title" class="form-control" id="title" required maxlength="100" placeholder="제목을 입력해주세요." style="width: 500px;">
		                </div>
		                <div class="form-group">
		                    <label for="content">FAQ 내용</label>
		                    <br>
		                    <textarea name="content" id="content" cols="67" rows="7" required maxlength="1000" placeholder="최대 1000글자까지 작성 가능합니다." style="border-radius: 10px;"></textarea>
		                </div>
		                
		                <button type="submit" class="btn btn-info btn-lg">제출하기</button>
		                <button type="reset" class="btn btn-danger btn-lg">초기화</button>
		                <button class="btn btn-secondary btn-lg" type="button" onclick="history.back();">뒤로가기</button>
		                
		            </form>
		        </div>

			<!-- ****************	여기까지!! 	***************** -->
        	</div>
			
        </div>
    </div>
</body>
</html>