<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import ="com.gigsforgeeks.project.model.vo.Project,java.text.NumberFormat, java.util.Locale" %>
<%
	Project project = (Project)request.getAttribute("project");
%>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
<title>detail</title>
</head>
<body>

	<!-- 프로젝트 클릭시 보여지는 프로젝트 상세페이지-->
       <!-- content  -->
       <main id="contentMain">
   
           <!-- 프로젝트내의 카테고리 -->
           <div id="deatail_Category">
               <h1><%= project.getProjectName() %></h1> 
               <label align="center"><%= project.getProjectStatus() %></label>
               <br>
               <a href="${contextPath}/detailSelect.do?projectId=<%= project.getProjectId() %>">프로젝트 상세보기</a> 
               <!-- <a href="">이 프로젝트에 대한 제안들</a> -->
               <!-- <a href="">파일등록</a> | -->
               <!-- <a href="">프로젝트 재등록</a> | -->
               <!-- <a href="">프로젝트 삭제</a> -->
           </div>
           
           <!-- 프로젝트 상세보기 내용 -->
           <div id="detail" style="width:1500px; margin:auto;">
               <div id="detailProject">    
                   <div id="detail_Content">

                       <label id="detail_Title">프로젝트 관련 세부사항</label>  
                       <label id="price"><%= project.getMinBid() %>￦ - <%= project.getMaxBid() %>￦</label>
                       
                       <br><br><hr>
                       <p><%= project.getDescription() %></p>
                        
                       <br> 
                       <h4>작업기간</h4>
			                         예상 작업기간 : <span><%= project.getExpectStart() %> ~ <%= project.getExpectEnd() %></span>
                       <br><br>
                       
                       <h4>요구 기술</h4>
                       <label><%= project.getRequiredSkill().replace(",", " ") %></label>
   
                       <br><br>
                       <p style="font-size: small;">프로젝트 고유번호(ID) : <%= project.getProjectId() %></p>
                   </div>
   
                   <!-- 프로젝트 입찰견적서 -->
                   <div id="proposal">
                       <form action="${contextPath}/proposal.do" method="POST">
                           <h3>이 프로젝트에 대한 입찰견적서</h3>
                           <hr>
                           <p>입찰 견적서의 내용을 추가하시면 견적서는 고용주에게로 전달됩니다.</p>
                           <br>
   
                           <h4>입찰 관련 세부사항</h4>
                           <label>입찰 제안가 : </label>
                           <input type="hidden" name="projectId" value="${contextPath}/proposal.do?projectId=<%= project.getProjectId() %>">
                           <input type="number" name="proposalPrice" placeholder="￦200,000이상 입력해주세요." min="200000" style="width:250px" required> 
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <label>이 프로젝트의 작업 예상기간 : </label>
                           <input type="date" name="proposalStart" placeholder="날짜를 입력해주세요." required>
                           ~
                           <input type="date" name="proposalEnd" placeholder="날짜를 입력해주세요." required>
   
                           <br><br><br>
                           <h4>고객님의 입찰 견적서에 대한 설명</h4>
                           <textarea name="proposalInfo" id="proposalInfo" cols="125" rows="10" style="resize:none;"></textarea>

                           <br><br><br><br>
                           <button type="submit" id="submitBtn" class="btn btn-outline-info">프로젝트 내용 제출하기</button>
                           <br><br>
                       </form>
                   </div>
               </div>
   
   			   <!-- 고용주 소개 -->
               <div style="float:right">
                   <div id="employerInfo1" style="border: 1px solid black;">
                       <h3>고용주 소개</h3>
                       <hr>
                       <ul>
                           <li>Korea, Republic of South</li>
                           <li>1건의 프로젝트 완료</li>
                           <li>0.0 (0건의 리뷰)</li>
                           <li>가입일 : 2020-08-29</li>
                           <li>입찰 평균가: 2,000,000￦</li>
                       </ul>
   
                       <br>
                       <h3>고용주 인증상태</h3>
                       <hr>
                       <ul>
                           <li>지불상태 완료</li>
                           <li>입금 완료됨</li>
                           <li>이메일 주소 인증 완료</li>
                           <li>프로필 작성완료</li>
                           <li>전화번호 인증 완료</li>
                       </ul>
                       
                       <br>
                   </div>

                   <div id="employerInfo1" style="border: 1px solid black;">
                       <h3>입찰내역</h3>
                       <hr>
                       <p>- 입찰수 : <%= project.getCountBid() %></p>
                       <p>- 평균 입찰금액 : <%= project.getAverageBid() %>￦</p>
                   </div>
   
                   <div id="btnGroup">
                       <button type="button" class="btn btn-outline-info" style="width: 250px; height: 30px;">즐겨찾기 등록</button> 
                       <br><br>
                       <button type="button" class="btn btn-outline-info" style="width: 250px; height: 30px;">프로젝트 신고</button>
                   </div>
               </div>
           </div>
       </main>   
       
      <br style="clear:both">
      
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>