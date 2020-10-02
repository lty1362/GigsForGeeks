<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.gigsforgeeks.service.model.vo.Enquiry" %>
<%
	Enquiry enq = (Enquiry)request.getAttribute("enq");
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../views/common/header2.jsp" %>
	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminTableList.css">

	<title>회원 문의 상세보기 페이지</title>
	
	<style>
		#content_r_center_m{
			font-size: 15px;
		}
		
        #enquiryView{
            border: 10px solid rgb(23, 34, 59, 0.2);
            margin-left: 100px;
            margin-right: 100px;
            padding: 20px;
            color: rgb(23, 34, 59);
            border-radius: 10px;
            box-shadow: black 0px 0px 40px 1px;
        }

        #answerView{
            border: 10px solid rgba(0, 112, 211, 0.619);
            margin-left: 100px;
            margin-right: 100px;
            padding: 20px;
            color: rgba(0, 112, 211, 0.619);
            font-weight: bolder;
            border-radius: 10px;
            box-shadow: rgba(0, 112, 211, 0.619) 0px 0px 40px 0px;
        }
        
        #enqContent{
            width: 100%; 
        	height: 150px; 
        	border-radius: 5px;
        	border: 2px solid rgb(23, 34, 59, 0.2);
        }
        
        #ansContent{
        	width: 100%; 
        	height: 150px; 
        	border-radius: 5px;
        	border: 2px solid rgba(0, 112, 211, 0.619);
        }
	</style>
	
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
				
				<!-- ****************	여기서부터!!	***************** -->
				<!-- 우측 메인 -->
                <div id="content_r_center_h" style="padding-left: 30px; padding-top: 30px; font-size: 40px;">
			        <b>상세문의 조회</b>
			    </div>

                <div id="content_r_center_m">
	
                    <form action="answer.enq" method="POST">
                        <div id="enquiryView">
                        	<h3><b>문의내용</b></h3>
                        	<hr>
                        	<label>문의 번호 : <input type="text" disabled value="<%= enq.getEnquiryNo() %>" style="width: 50px; text-align: center;"></label>
                            <label>문의자 ID : <input type="text" disabled value="<%= enq.getUserId() %>" style="width: 100px; text-align: center;"></label>
                            <label>문의 유형 : <input type="text" disabled value="<%= enq.getEnquiryType() %>" style="width: 130px; text-align: center;"></label>
                            <p>문의 제목 : <input type="text" disabled value="<%= enq.getEnquiryTitle() %>" style="width: 100%;"></p>
                            <p>문의 내용</p>
                            <textarea name="enqContent" id="enqContent" disabled><%= enq.getEnquiryContent() %></textarea>
                            <br>
                        </div>

                        <br>

                        <div id="answerView">
                        	<h3><b>답장하기</b></h3>
                        	<hr>
                        	<input type="hidden" name="enqNo" value="<%= enq.getEnquiryNo() %>">
                            <p>답장 내용</p>
                            <textarea name="ansContent" id="ansContent" required maxlength="1000" placeholder="최대 1000글자까지 작성 가능합니다." ></textarea>
                            <br>
                        </div>

                        <br>
                        
                       	<div align="center">
	                        <button type="submit" class="btn btn-info">답장하기</button>
	                        <button type="reset" class="btn btn-danger">초기화</button>
	                        <button class="btn btn-secondary" type="button" onclick="history.back();">뒤로가기</button>
                       	</div>
                        
                    </form>



				</div>
                <!-- 복사 여기까지 끝 -->
	
			<!-- ****************	여기까지!! 	***************** -->
        	</div>
			
        </div>
    </div>
</body>
</html>