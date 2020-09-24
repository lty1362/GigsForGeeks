<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detailproject</title>
</head>
<body>

	<!-- 프로젝트 클릭시 보여지는 프로젝트 상세페이지-->
       
     <!-- hedaer -->
     <%@ include file="../../views/common/header.jsp" %>
     <link rel= "stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
     
       
       <!-- content  -->
       <Main id="contentMain">
   
           <!-- 프로젝트내의 카테고리 -->
           <div id="deatail_Category">
               <h1>프로젝트명1 </h1> 
               <label align="center">입찰중</label>
               <br>
               <a href="">프로젝트 상세보기</a> |
               <a href="">이 프로젝트에 대한 제안들</a> |
               <!-- <a href="">파일등록</a> | -->
               <!-- <a href="">프로젝트 재등록</a> | -->
               <!-- <a href="">프로젝트 삭제</a> -->
           </div>
           
           <!-- 프로젝트 상세보기 내용 -->
           <div id="detail" style="width:1500px; margin:auto;">
               <div id="detailProject">    
                   <div id="detail_Content">
                       
                       <label id="detail_Title">프로젝트 관련 세부사항</label>  
                       <label id="price">700,000￦ - 1,500,000￦</label>
                       
                       <br><br><hr>
                       <p>
				                        작고 때까지 노년에게서 불어 내는 아름다우냐. 산야에 청춘의 하였으며, 착목한는 간에 뛰노는 소리다.
				                        이것은 용감하고 있으랴? 풀이 것이 그들의 그와 꾸며 길지 청춘은 있는 것이다. 
                       </p>
                        
                       <br> 
                       <h4>작업기간</h4>
                       <h4>작업기간</h4>
			                         예상 작업일자 : <span>2020-09-14 ~ 2020-09-19</span><br>
			                         총 예상 작업일수 : <span>총 5일</span>
                       <br><br>
                       
                       <h4>요구 기술</h4>
                       <label class="projectSkill">JavaScript</label>
                       <label class="projectSkill">HTML</label>
                       <label class="projectSkill">CSS</label>
   
                       <br><br><br>
                       <p style="font-size: small;">프로젝트 고유번호(ID) : 27155438</p>
                       
                       <hr>
                       <h4>첨부자료</h4>
                       <input type="file" name="attachment">
                   </div>
   
                   <!-- 프로젝트 입찰견적서 -->
                   <div id="proposal">
                       <form action="<%= request.getContextPath()%>/proposal.do" method="POST">
                           <h3>이 프로젝트에 대한 입찰견적서</h3>
                           <hr>
                           <p>입찰 견적서의 내용을 추가하시면 견적서는 고용주에게로 전달됩니다.</p>
                           <br>
   
                           <h4>입찰 관련 세부사항</h4>
                           <label>입찰 제안가 : </label>
                           <input type="number" name="proposalPrice" placeholder="￦금액을 입력해주세요." required> 
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <label>이 프로젝트의 작업 예상기간 : </label>
                           <input type="date" name="proposalDate" placeholder="날짜를 입력해주세요.">
   
                           <br><br>
                           <h4>고객님의 입찰 견적서에 대한 설명</h4>
                           <textarea name="proposalInfo" id="proposalInfo" cols="125" rows="10" style="resize:none;"></textarea>

                           <br><br><br><br>

						   <!-- 프로젝트 멤버십 -->
                           <h3>멤버십 추가</h3>
                           <hr>
                           <p>
					                         프로젝트로서의 성공과 수입 확대를 최대화하고자 하는 목적으로 설계되어 있습니다. <br>
					                         멤버십에 가입하시면 최대 20%까지 할인해 드리고 있습니다.
                           </p>
                           <br>
                           <h4>멤버십 금액</h4>
                           <h2>100,000￦</h2>
                           <br>
                           <h4>멤버십을 추가하시겠습니까?</h4>
                           <input type="radio" name="addmembership" id="membership1"> 
                           <label for="membership1">멤버십 추가</label>
                           <input type="radio" name="addmembership" id="membership2"> 
                           <label for="membership2">멤버십 추가안함</label>
                           </form>

                           <br>
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
                           <li>지불수단 인증 완료</li>
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
                       <p>- 입찰수 : 1건</p>
                       <p>- 평균 입찰금액 : 5,000,000￦</p>
                   </div>
   
                   <div id="btnGroup">
                       <button type="button" class="btn btn-outline-info" style="width: 250px; height: 30px;">즐겨찾기 등록</button> 
                       <br><br>
                       <button type="button" class="btn btn-outline-info" style="width: 250px; height: 30px;">프로젝트 신고</button>
                   </div>
               </div>
           </div>
       </main>   
      
       <!-- footer -->
       <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
</body>
</html>