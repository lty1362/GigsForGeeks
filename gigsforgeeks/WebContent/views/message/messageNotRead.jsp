<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.message.model.vo.*" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%
	ArrayList<Message> notRead = (ArrayList<Message>)request.getAttribute("notRead");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	PageInfo p = (PageInfo)request.getAttribute("p");
	
	int NotReadCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

	int keepCount = p.getKeepCount();
	int adminCount = p.getAdminCount();
	int fullCount = p.getFullCount();
%>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/message.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Message NOtRead</title>
</head>
<body>
  
    <%-- Content --%>
    <!--메세지 화면-->
    <div id="content">
        <!-- 메뉴바 -->
        <div id="con">           
            <div id="content_1">
                <div id="naviMain"><a href="${contextPath}/list.ms?currentPage=1">전체메세지(<%=fullCount%>) </a></div>
                <div id="naviNotRead"><a href="${contextPath}/notRead.ms?currentPage=1">읽지않음 (<%=NotReadCount%>)</a></div>
                <div id="naviKeep"><a href="${contextPath}/keepList.ms?currentPage=1">보관 메세지 (<%=keepCount%>)</a></div>
                <div id="naviAdmin"><a href="${contextPath}/admin.ms?currentPage=1">고객 지원팀 (<%=adminCount%>)</a></div>
            </div>
        </div>

        
        <div id="main">
        <!-- 내용변경할곳 -->
        <!-- 읽지않은 메세지 -->
		<!--검색창-->
        <div id="cont">
       		<br>
	          <h3>읽지않은 메세지 (<%=NotReadCount%>)</h3>
	            <div id="content_2" align="right">
                	<div id="search_form">
                		<input type="hidden" name="messageReceiver" id="messageReceiver" value="">
	                    <div id="search_text">
	                        <input class="form-control mr-sm-2" type="text" placeholder="회원ID">
	                    </div>
	                    
                   	 	<div id="search_btn1">
	                        <a href="${contextPath}/send.ms" id="btn1" class="btn btn-outline-info">메세지 보내기</a>
	                	</div>
                   </div>
               </div>
	            <div id="content_3" align="center">
		            <div id="search_btn2">
				   	 	<form id="keepbutton" action="<%= request.getContextPath()%>/keepNotRead.ms" method="post">
							<button type="submit" id="btn2" class="btn btn-outline-info">보관하기</button>
								<br><br>
						            <table class="messageNotRead">
								        <thead>
								            <tr>
								            	<th style="display:none;"></th>
								            	<th width="15"><input type="checkbox"></th>
								                <th width="30">번호</th>
								                <th width="200">제목</th>
								                <th width="10">보낸회원</th>
								                <th width="20">받은날짜</th>
								            </tr>
								            <tr><td colspan="5"><div class="modal-footer"></div></td></tr>  
								        </thead>
								        <tbody>
								            <%if(notRead.isEmpty()){ %>
								        		<tr>
								        			<td colspan="5">조회된 메세지가 없습니다.</td>
								        		</tr>
								        	<%} else{ %>
								        		<%int count = 1; %>
								        		  <%for(Message m : notRead){%>
										        	<tr>
										        		<td style="display:none;"><%=m.getMessageNo() %></td>
										        		<td><input type="checkbox" name="keeps" id="keeps" value="<%=m.getMessageNo()%>"></td>
										                <td><%=count++%></td>
										                <td class="title">
										               	 	<a><%= m.getMessageTitle()%></a>
										               	 	<span style="display:none;"><%=m.getMessageNo() %></span>
										                </td>
										                <td><%= m.getMessageRecepient()%></td>
										                <td><%= m.getMessageReceiveTime()%></td>
										            </tr>
										           <% } %>
								        	  <% } %>	  
								        </tbody>
								    </table>
							    </form>
							</div>
						   <script>
				    			$(function(){
						    		
				    				$(".messageNotRead>tbody>tr>td>a").click(function(){	
				
					    				var nno = $(this).next().text();
					    				$(this).attr("href","${contextPath}/detail.ms?nno="  + nno);
						
					                		});
					               });
					        </script>
						    <div align="right" style="width:98%;">
				       		 	<button class="btn btn-outline-info" data-toggle="modal" data-target="#message_delete">메세지 삭제</button>
				        	 	<br><br>
				   			</div>
				   			 <div class="pagingArea" align="center">
						
						        <!-- 맨 처음으로 (<<) -->
						        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/notRead.ms?currentPage=1';"> &lt;&lt; </button>
						        <!-- 이전페이지로 (<) -->
						        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/notRead.ms?currentPage=<%=currentPage-1%>';"> &lt; </button>
						        
							<% for(int m=startPage; m<=endPage; m++) {%>
								<%if(m != currentPage){ %>
				          			<button class="btn btn-outline-info" onclick="location.href='${contextPath}/notRead.ms?currentPage=<%=m%>';"><%= m %></button>
				          		<%}else{ %>
				          			<button class="btn btn-outline-info" disabled><%= m %></button>
				          		<%} %>
				          <%} %>
						
						        <!-- 다음페이지로 (>) -->
						        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/notRead.ms?currentPage=<%=currentPage+1%>';"> &gt; </button>
						        <!-- 맨 끝으로 (>>) -->
						        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/notRead.ms?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
						    </div>  
						 </div>
				      </div>
					
				      
			         <!-- The Modal -->
				        <div class="modal" id="message_delete">
				            <div class="modal-content">
				              <div class="modal-body" align="center">
				             	<button type="button" class="close" data-dismiss="modal" style="font-family:sans-serif;">&times;</button> <br>
				                <p>메세지를 정말로 삭제하시겠습니까?</p>
				                <button id="btn4" class="btn btn-outline-info">OK</button>
				                <button class="btn btn-outline-info">Cancel</button>
				              </div>
				            </div>
				        </div>
				      </div>    
				 </div>
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>