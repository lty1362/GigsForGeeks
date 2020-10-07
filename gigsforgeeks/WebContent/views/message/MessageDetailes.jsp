<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.message.model.vo.*" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%
	Message m = (Message)request.getAttribute("m");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int NotReadCount = pi.getNotReadCount();
	int keepCount = pi.getKeepCount();
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
	<title>Message</title>
</head>
<body>
  
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <!--메세지 화면-->
    <div id="content">
        <!-- 메뉴바 -->
        <div id="con">           
            <div id="content_1">
                <div id="naviMain"><a href="${contextPath}/list.ms?currentPage=1">전체메세지</a></div>
                <div id="naviNotRead"><a href="${contextPath}/notRead.ms?currentPage=1">읽지않음 (<%=NotReadCount%>)</a></div>
                <div id="naviKeep"><a href="${contextPath}/keepList.ms?currentPage=1">보관 메세지 (<%=keepCount%>)</a></div>
                <div id="naviAdmin"><a href="${contextPath}/admin.ms?currentPage=1">고객 지원팀</a></div>
            </div>
        </div>
            
        <div id="main">
        <!-- 내용변경할곳 -->
        <!-- 메세지 상세보기 -->
			<div id="messageDetailes" align="center">
	        	<br><br>
	         	<div align="right">
	        		<button type="button" class="btn btn-outline-info" id="deletems" data-toggle="modal" data-target="#message_delete">삭제하기</button>
	        	</div>
	         	<br>
	         	<div class="detail">
	         	  <table class="table table-hover, listArea" id="detailMe" style="border: 1px solid black">
	         	  		<tr>
	         	  			<th width="400" height="50" colspan="2"><%=m.getMessageTitle()%></th>
	         	  			<th width="400" height="50" colspan="2"><%=m.getMessageReceiveTime()%></th>
	         	  		</tr>
	         	  		<tr>
	         	  			<td>받는 사람 : </td>
							<td><%=m.getMessageReceiver()%></td>
	         	  			<td>보낸 사람 : </td>
							<td><%=m.getMessageRecepient() %></td>
	         	  		</tr>
	         	  
	         	  
	         	  
	<%-- 	            <tr>
		                <th id="t2" ><%=m.getMessageTitle()%></th>
		                <td id="t1" colspan="3"><%=m.getMessageReceiveTime()%></td>
		            </tr>
		            <tr id="t3">
		                <th>받는 사람</th>
		                <td><%=m.getMessageReceiver()%></td>
		                <th>보낸 사람</th>
		                <td><%=m.getMessageRecepient() %></td>
		            </tr>
		            <tr>
		                <td colspan="4">
		                    <p><%=m.getMessageContent()%></p>
		                </td>
		            </tr> --%>
	         	  </table>
	         	</div>
		        	<br><br>
			        <div align="center">
			            <a onclick="history.back();" class="btn btn-secondary">확인</a>
			        </div>
		         </div>
	        </div>
	   </div>

	   	<!-- 메세지 삭제하기 -->
		   <div class="modal" id="message_delete">
	          <div class="modal-dialog">
	              <div class="modal-content">
				      <!-- Modal body -->
				      <div class="modal-body">
				         <button type="button" class="close" data-dismiss="modal" style="font-family:sans-serif;">&times;</button> <br>
				         <h3>메세지 삭제</h3> <br>
				         	<b>메세지를 정말로 삭제하시겠습니까?</b>
				         	<br>            
	                     	<a href="${contextPath}/delete.ms?nno=<%=m.getMessageNo()%>" class="btn btn-info">OK</a>
		                 	<button type="button" class="btn btn-outline-info">Cancel</button>
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