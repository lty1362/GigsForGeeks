<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList, com.gigsforgeeks.service.model.vo.Enquiry" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	ArrayList<Enquiry> list = (ArrayList<Enquiry>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>    

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../views/common/header2.jsp" %>
	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminTableList.css">

	<title>관리자 메인페이지 = 회원전체조회 페이지</title>
	
	<style>
		#content_r_center_m{
			padding: 40px;
			font-size: 15px;
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
                <div id="content_r_center_h" style="padding: 30px; font-size: 40px;">
			        <b>1:1 문의 관리</b>
			    </div>

                <div id="content_r_center_m">

                    <!-- <div class="btn-group" id="jobType" role="group" style="float: right;">
                        <button type="button" class="btn btn-default">고용주</button>
                        <button type="button" class="btn btn-default">프리랜서</button>
                    </div> -->

                    <br>

					<!-- 테이블 리스트 -->
                    <table class="table table-hover, listArea">
                        <thead>
                            <tr>
                                <th width="50">No</th>
                                <th width="100">문의자 ID</th>
                                <th width="100">문의유형</th>
                                <th width="250">문의 제목</th>
                                <th width="100">문의 날짜</th>
                                <th width="100">답변 여부</th>
                                <th width="100">답장 날짜</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<% if(list.isEmpty()) { %>
                            <tr>
                                <td colspan="7">조회된 리스트가 없습니다.</td>
                            </tr>
                        	<% } else {%>
                        		<% for(Enquiry enq : list) { %>
	                            <tr>
	                             	<td><%= enq.getEnquiryNo() %></td>
	                                <td><%= enq.getUserId() %></td>
	                                <td><%= enq.getEnquiryType() %></td>
	                                <td><%= enq.getEnquiryTitle() %></td>
	                                <td><%= enq.getEnquiryDate() %></td>
	                                <td><%= enq.getEnquiryState() %></td>
	                                <% if(enq.getAnswerDate() == null) { %>
	                                	<td>-</td>
	                                <% } else { %>
	                                	<td><%= enq.getAnswerDate() %></td>
	                                <% } %>
	                            </tr>
                            	<% } %>
                           <% } %>
                        </tbody>
                    </table>
                    
                    <script>
			        	$(function(){
			        		$(".listArea>tbody>tr").click(function(){
			        			location.href = "${contextPath}/detail.enq?nno=" + $(this).children().eq(0).text();
			        			
			        			/* var nno = $(this).children().eq(0).text();
				    			location.href = "${contextPath}/detail.enq?nno=" + nno; */
			        		});									
			        	});
			        </script>
			
			        <br><br>
			
			        <div class="pagingArea" align="center">
						<% if(currentPage != 1){ %>
				            <!-- 맨 처음으로 (<<) -->
				            <button class="btn btn-info" onclick="location.href='${contextPath}/enqlist.bo?currentPage=1';"> &lt;&lt; </button>
				            <!-- 이전페이지로 (<) -->
				            <button class="btn btn-info" onclick="location.href='${contextPath}/enqlist.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++){ %>
							<% if(p != currentPage){ %>
			            	<button class="btn btn-info" onclick="location.href='${contextPath}/enqlist.bo?currentPage=<%=p%>';"><%= p %></button>
			            	<% }else{ %>
			            	<button class="btn btn-info" disabled><%= p %></button>
			            	<% } %>
			            <% } %>
						
						<% if(currentPage != maxPage){ %>
				            <!-- 다음페이지로 (>) -->
				            <button class="btn btn-info" onclick="location.href='${contextPath}/enqlist.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
				            <!-- 맨 끝으로 (>>) -->
				            <button class="btn btn-info" onclick="location.href='${contextPath}/enqlist.bo?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
						<% } %>
              	 	</div>
				</div>
                <!-- 복사 여기까지 끝 -->
	
			<!-- ****************	여기까지!! 	***************** -->
        	</div>
			
        </div>
    </div>
</body>
</html>