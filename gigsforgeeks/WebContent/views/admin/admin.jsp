<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList, com.gigsforgeeks.member.model.vo.Member" %>
<%@ page import="com.gigsforgeeks.project.model.vo.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
    <%@ include file="../../views/common/header2.jsp" %>

	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminTableList.css">
	<!-- <link rel="stylesheet" href="${contextPath}/resources/css/common.css">  -->
	
	<title>관리자 메인페이지 = 회원전체조회 페이지</title>
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
				<div id="content_r_center">
				    <div id="content_r_center_h" style="padding: 30px; font-size: 40px;">
				        <b>전체 회원 보기</b>
				    </div>
				
				    <!--1. 상세검색
				    <div id="content_r_center_m">
						
						검색필터
						<div id="content_r_center_filter">
					        <form action="searchMember.do" method="GET">
					            <table>
					                <tr style="height: 50px;">
					                    <th width="150px">- 구분</th>
					                    <td width="200px">
					                        <select name="" id="searchList">
					                            <option value="selectMember">전체회원</option>
					                            <option value="normalMember">일반회원</option>
					                            <option value="excellantMember">우수회원</option>
					                            <option value="membershipMember">멤버십회원</option>
					                            <option value="탈퇴회원">탈퇴회원</option>
					                        </select>
					                    </td>
					                </tr>
					                <tr style="height: 50px;">
					                    <th>- 가입/탈퇴일</th>
					                    <td><input id="enrollDate" type="date" name="enrollDate"></td>
					                    <td style="width: 50px; text-align: center;"><b>~</b></td>
					                    <td><input id="outrollDate" type="date" name="outrollDate"></td>
					                </tr>
					                <tr style="height: 50px;">
					                    <th>- 검색어</th>
					                    <td>
					                        <select name="" id="searchList">
					                            <option value="selectAll">전체</option>
					                            <option value="usdrId">회원 ID</option>
					                            <option value="email">Email</option>
					                        </select>
					                    </td>
					                    <td></td>
					                    <td><input type="text" id="searchContent" placeholder="내용을 입력해주세요."></td>
					                </tr>
					            </table>
					            <br>
					            <button type="button" class="btn btn-primary" style="width: 15%; ">검색</button>
					            <button type="reset" class="btn btn-info" style="width: 15%; ">초기화</button>
					        </form>
						</div>
						검색필터끝 -->
						
				   	 	<!-- 회원조회 영역 -->
				        <table class="table table-hover, listArea">
				            <thead align="center">
				                <tr>
				                    <th style="width: 50px;">No</th>
				                    <th style="width: 200px;">회원 ID</th>
				                    <th style="width: 300px;">Email</th>
				                    <th style="width: 200px;">가입일</th>
				                    <th style="width: 200px;">블랙리스트</th>
				                </tr>
				            </thead>
				            <tbody align="center">
				            	<% if(list.isEmpty()){ %>
				            	<tr>
				            		<td colspan="6">조회된 리스트가 없습니다.</td>
				            	</tr>
				            	<% }else { %>
				            		<%int count = 1; %>
			            			<% for(Member m : list) { %>
				                <tr>
				                    <td><%= count++ %></td>
				                    <td><%= m.getUserId() %></td>
				                    <td><%= m.getUserEmail() %></td>
				                    <td><%= m.getEnrollDate() %></td>
				                    <td><%= m.getBlackList() %></td>
				                </tr>
					               <% } %>
				            	<% } %>
				            </tbody>
				        </table>
				        <!-- 테이블 리스트 끝 -->
				
						<br><br>
						
				        <div class="pagingArea" align="center">
							<% if(currentPage != 1){ %>
					            <!-- 맨 처음으로 (<<) -->
					            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberList.bo?currentPage=1';"> &lt;&lt; </button>
					            <!-- 이전페이지로 (<) -->
					            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberList.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++){ %>
								<% if(p != currentPage){ %>
				            	<button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberList.bo?currentPage=<%=p%>';"><%= p %></button>
				            	<% }else{ %>
				            	<button class="btn btn-info" disabled><%= p %></button>
				            	<% } %>
				            <% } %>
							
							<% if(currentPage != maxPage){ %>
					            <!-- 다음페이지로 (>) -->
					            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberList.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
					            <!-- 맨 끝으로 (>>) -->
					            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/memberList.bo?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
							<% } %>
	              	 	</div>
					</div>
				    <!-- 끝 -->
				</div>
			<!-- ****************	여기까지!! 	***************** -->
        	</div>
			
        </div>
    </div>
</body>
</html>