<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.service.model.vo.FAQ" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	FAQ f = (FAQ)request.getAttribute("FAQ");
	
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
</head>
<body>
    <div class="wrap">
        <div id="content">
        
        	<!-- 좌측 메뉴바 -->
        	<div id="content_l">
			    <jsp:include page="/views/admin/adminMenubar.jsp" flush="true"></jsp:include>
        	</div>
        	
        	<!-- 우측 회원조회 -->
        	<div id="content_r">
				<div id="content_r_center_h" style="padding: 30px; font-size: 40px;">
			        <b>FAQ 관리</b>
			        
			        <br>
			        <button class="btn btn-success" style="float: right;" onclick="location.href='${contextPath}/faqInsert';">FAQ추가</button>
			    </div>

			    <br>

				<!-- 테이블 리스트 -->
	            <table class="table table-hover, listArea" id="detailFaq">
	                <thead align="center">
	                    <tr>
	                        <th width="50">No</th>
	                        <th width="100">카테고리</th>
	                        <th width="200">제목</th>
	                        <th width="100">최초 등록일</th>
	                        <th width="100">업데이트 날짜</th>
	                        <th width="100">등록 상태</th>
	                    </tr>
	                </thead>
	
	                <tbody align="center">
	                	<% if(list.isEmpty()) { %>
	                    <tr>
	                        <td colspan="5">조회된 리스트가 없습니다.</td>
	                    </tr>
	                	<% } else {%>
	                		<% for(FAQ faq : list) { %>
	                     <tr>
	                      	 <td><%= faq.getFaqNo() %></td>
	                         <td><%= faq.getFaqCategory() %></td>
	                         <td><%= faq.getFaqTitle() %></td>
	                         <td><%= faq.getFaqRegister() %></td>
	                         <td><%= faq.getFaqUpdate() %></td>
	                         <td><%= faq.getFaqState() %></td>
	                     </tr>
	                     <tr>
	                     	<td colspan="6" style="border: 2px solid grey;">
	                     		<form action="update.faq" method="POST">
		                     		<h3>세부 내용</h3>
		                     		<input type="hidden" name="faqNo" value="<%= faq.getFaqNo() %>">
		                     		<button class="btn btn-primary">등록하기</button>
		                     		<br><hr>
					        	    <%= faq.getFaqContent() %>
	                     		</form>
	                     	</td>
	                     </tr>
	                    	<% } %>
	                   <% } %>
	                </tbody>
	            </table>

				<!-- 테이블 클릭시 조회 -->
		        <script>
		    		$(document).ready(function () {
			            $("#detailFaq tr:odd").addClass("odd");
			            
			            $("#detailFaq tr:not(.odd)").hide();	// 처음화면 숨기기 기능
			            $("#detailFaq tr:first-child").show(); 	// 열머리글 보여주기
			
			            $("#detailFaq tr.odd").click(function () {
			                $(this).next("tr").toggle(300);
			                $(this).find(".arrow").toggleClass("up");
			            });
			        });
			    </script>
		                   
		        <br><br>
		
		        <div class="pagingArea" align="center">
					<% if(currentPage != 1){ %>
			            <!-- 맨 처음으로 (<<) -->
			            <button class="btn btn-outline-info" onclick="location.href='${contextPath}/faqList.bo?currentPage=1';"> &lt;&lt; </button>
			            <!-- 이전페이지로 (<) -->
			            <button class="btn btn-outline-info" onclick="location.href='${contextPath}/faqList.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++){ %>
						<% if(p != currentPage){ %>
		            	<button class="btn btn-outline-info" onclick="location.href='${contextPath}/faqList.bo?currentPage=<%=p%>';"><%= p %></button>
		            	<% }else{ %>
		            	<button class="btn btn-outline-info" disabled><%= p %></button>
		            	<% } %>
		            <% } %>
					
					<% if(currentPage != maxPage){ %>
			            <!-- 다음페이지로 (>) -->
			            <button class="btn btn-outline-info" onclick="location.href='${contextPath}/faqList.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
			            <!-- 맨 끝으로 (>>) -->
			            <button class="btn btn-outline-info" onclick="location.href='${contextPath}/faqList.bo?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
					<% } %>
          	 	</div>
        	</div>
        </div>
    </div>
</body>
</html>