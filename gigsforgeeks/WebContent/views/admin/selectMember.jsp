<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	// > 로그인 전 : null
	// > 로그인 후 : 로그인성공한 회원정보들이 담겨있는 객체
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 회원 조회 페이지</title>
	

	<!-- SelectMember 추가영역 -->
    <style>
        #content_r_center_l{
            widows: 900px;;
            padding: 50px;  
        }
        .listArea{
            text-align:center;
        }
        .listArea>tbody>tr:hover{
            background:rgb(23, 34, 59, 0.2);
            cursor:pointer;
        }

        #content_r_center_m{
            font-size: 17px;
            padding-left: 40px;
            padding-top: 20px;
            margin: 30px;
            border: 1px solid black;;
        }

        #searchList, #enrollDate, #outrollDate, #searchContent{
            width: 200px;
        }

        #content_r_center_m>tr{
            height: 100px;
        }

        #content_r_center_m>table{
            height: 50px;
        }
    </style>
    <!-- 여기까지 -->
    
</head>
<body>

	<!-- 우측 상단 헤더 -->
	<div id="content_r_header">
	    <div id="content_r_header_l"></div>
	    <div id="content_r_header_m">
	        <div style="font-size: 20px; margin-top: 50px; font-weight: 700;"> HOME > MAIN > 회원관리</div>
	    </div>
	
	    <!-- 우측상단 로고 -->
	    <div id="content_r_header_r" style="text-align: right; padding-right: 20px;">
	        <b style="font-size: 60px;">G</b><b style="font-size: 37px;">igs for Geeks</b>
	    </div>
	</div>
	
	<!-- 우측 메인 : 회원조회 -->
	<div id="content_r_center">
	    <div id="content_r_center_h" style="padding: 30px; font-size: 40px;">
	        <b>전체 회원 보기</b>
	    </div>
	
	    <!-- 상세검색 -->
	    <div id="content_r_center_m">
	
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
	
	    <!-- 회원조회 영역 -->
	    <div id="content_r_center_l">
	        <table class="table table-hover, listArea" align="center">
	            <thead>
	                <tr>
	                    <th style="width: 50px;">No</th>
	                    <th style="width: 200px;">회원 ID</th>
	                    <th style="width: 300px;">Email</th>
	                    <th style="width: 200px;">가입일</th>
	                    <th style="width: 200px;">상세보기</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<%-- <% if(list.isEmpty()){ %>
	            	<tr>
	            		<td colspan="6">조회된 리스트가 없습니다.</td>
	            	</tr>
	            	<% }else { %>
            			<% for(Member m : list) { %> --%>
	                <tr>
	                    <td>1</td> <!-- 회원No 컬럼없어서 자바문으로 만들어줘야할듯! -->
	                    <td><%= loginUser.getUserId() %></td>
	                    <td><%= loginUser.getUserEmail() %></td>
	                    <td><%= loginUser.getEnrollDate() %></td>
	                    <td><button type="button" class="btn btn-success">상세보기</button></td>
	                </tr>
		               <%--  <% } %>
	            	<% } %> --%>
	            </tbody>
	        </table>
	
	        <br><br>
	
	        <div class="container" style="width: max-content;">
	            <div class="row">
	                <div class="col">
	                    <ul class="pagination">
	                        <li class="page-item"><a class="page-link" href="#">맨처음</a></li>
	                        <li class="page-item"><a class="page-link" href="#">이전</a></li>
	                        <li class="page-item"><a class="page-link" href="#">1</a></li>
	                        <li class="page-item"><a class="page-link" href="#">2</a></li>
	                        <li class="page-item"><a class="page-link" href="#">3</a></li>
	                        <li class="page-item"><a class="page-link" href="#">4</a></li>
	                        <li class="page-item"><a class="page-link" href="#">5</a></li>
	                        <li class="page-item"><a class="page-link" href="#">다음</a></li>
	                        <li class="page-item"><a class="page-link" href="#">맨마지막</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- 끝 -->
	
	</div>
	<!-- 우측화면 끝 -->
	
</body>
</html>