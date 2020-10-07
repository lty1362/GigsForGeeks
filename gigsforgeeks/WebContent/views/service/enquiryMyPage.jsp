<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList, com.gigsforgeeks.service.model.vo.Enquiry" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%-- Template HTML 1 : 일반 화면용 --%>
<%
	ArrayList<Enquiry> list = (ArrayList<Enquiry>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String contextPath = request.getContextPath();
	
   	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/service.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/myEnquieyPage.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>내 문의내역 페이지</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain" align="center">
    
        <h1 align="center">'<%= loginUser.getUserId() %>' 님의 문의내역</h1>
        <hr>
        <div class="tableView">
        
	        <br>
	        
	        <table class="table table-hover, listArea" id="myEnqList">
	            <thead>
	                <tr>
	                    <th width="100">문의 번호</th>
	                    <th width="100">문의 유형</th>
	                    <th width="300">문의 제목</th>
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
						<tr>
				            <td colspan="6">
				            	<div class="detailView">
					            	<div class="myEnqDetailView">
					                <h4><b>문의내용</b></h4>
					                	<div class="myEnqDetailContent">
							                <b><%= enq.getEnquiryContent() %></b>
					                	</div>
					            	</div>
					            	
					            	<div class="myAnsDetailView">
					            	<h4><b>답장내용</b></h4>
					            		<div class="myEnqDetailContent">
						            	<% if(enq.getAnswerContent() == null) { %>
				                       		<b>아직 답장이 안왔습니다.</b>
					   					<% } else { %>
						                	<b><%= enq.getAnswerContent() %></b>
				                        <% } %>
			                        	</div>
			                        </div>
		                        </div>
				            </td>
				        </tr>
                    	<% } %>
                    	
					<% } %>
                    </tbody>
                    
	        </table>
	    </div>
	    
	    <!-- 페이징 -->
      	<div class="pagingArea" align="center">
 			<% if(currentPage != 1){ %>
	           <!-- 맨 처음으로 (<<) -->
	           <button class="btn btn-outline-info" onclick="location.href='<%=contextPath%>/enquiryMyPage?currentPage=1';"> &lt;&lt; </button>
	           <!-- 이전페이지로 (<) -->
	           <button class="btn btn-outline-info" onclick="location.href='<%=contextPath%>/enquiryMyPage?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<% } %>
			
			<% for(int p=startPage; p<=endPage; p++){ %>
				<% if(p != currentPage){ %>
	          	<button class="btn btn-outline-info" onclick="location.href='<%=contextPath%>/enquiryMyPage?currentPage=<%=p%>';"><%= p %></button>
	          	<% }else{ %>
	          	<button class="btn btn-outline-info" disabled><%= p %></button>
	          	<% } %>
          	<% } %>
			
			<% if(currentPage != maxPage){ %>
	           <!-- 다음페이지로 (>) -->
	           <button class="btn btn-outline-info" onclick="location.href='<%=contextPath%>/enquiryMyPage?currentPage=<%=currentPage+1%>';"> &gt; </button>
	           <!-- 맨 끝으로 (>>) -->
	           <button class="btn btn-outline-info" onclick="location.href='<%=contextPath%>/enquiryMyPage?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
			<% } %>
        </div>
        
        <br><br>
        <h4>문의를 원하시면 아래 버튼을 클릭해주시기 바랍니다.</h4>
        <a class="btn btn-success btn-lg" href="${contextPath}/enquiryEnrollForm">문의하기</a>
        <button class="btn btn-secondary btn-lg" type="button" onclick="history.back();">뒤로가기</button>
        
        
        <!-- 테이블 클릭시 조회 -->
        <script>
    		$(document).ready(function () {
	            $("#myEnqList tr:odd").addClass("odd");
	            
	            $("#myEnqList tr:not(.odd)").hide();	// 처음화면 숨기기 기능
	            $("#myEnqList tr:first-child").show(); 	// 열머리글 보여주기
	
	            $("#myEnqList tr.odd").click(function () {
	                $(this).next("tr").toggle(300);
	                $(this).find(".arrow").toggleClass("up");
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