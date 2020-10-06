<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.message.model.vo.*" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- EL 활성화 / JSTL 설정 / ContextPath 변수 선언 및 초기화 끝 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Full</title>
</head>
<body>
		<!--검색창-->
        <div id="cont">
        	<br>
        	<h3>전체 메세지</h3>
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
		   	 	<form id="keepbutton" action="<%= request.getContextPath()%>/keep.ms" method="post">
					<button type="submit" id="btn2" class="btn btn-outline-info">보관하기</button>
						<br>
		            	<table class="messageFull">
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
					        	<%if(list.isEmpty()){ %>
					        		<tr>
					        			<td colspan="5">조회된 메세지가 없습니다.</td>
					        		</tr>
					        	<%} else{ %>
					        		<%int count = 1; %>
					        		  <%for(Message m : list){%>
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
			    		
	    				$(".messageFull>tbody>tr>td>a").click(function(){	
	
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
			        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=1';"> &lt;&lt; </button>
			        <!-- 이전페이지로 (<) -->
			        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%=currentPage-1%>';"> &lt; </button>
			        
				<% for(int p=startPage; p<=endPage; p++) {%>
					<%if(p != currentPage){ %>
	          			<button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%=p%>';"><%= p %></button>
	          		<%}else{ %>
	          			<button class="btn btn-outline-info" disabled><%= p %></button>
	          		<%} %>
	          <%} %>
			
			        <!-- 다음페이지로 (>) -->
			        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%=currentPage+1%>';"> &gt; </button>
			        <!-- 맨 끝으로 (>>) -->
			        <button class="btn btn-outline-info" onclick="location.href='${contextPath}/list.ms?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
			    </div>  
			 </div>
	      </div>

	       <!-- The Modal -->
	        <div class="modal" id="message_delete">
	            <div class="modal-content">
	              <div class="modal-body" align="center">
	             	<button type="button" class="close" data-dismiss="modal" style="font-family:sans-serif;">&times;</button> <br>
	                <p>메세지를 정말로 삭제하시겠습니까?</p>
	                <button type="submit" id="btn4" class="btn btn-outline-info">OK</button>
	                <button type="button" class="btn btn-outline-info" onclick="history.back();">Cancel</button>
	              </div>
	            </div>
	        </div>
</body>
</html>