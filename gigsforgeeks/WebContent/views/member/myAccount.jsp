<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/myAccount.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <!--header-->
    <%@ include file="../common/header.jsp" %>
    
    <form action="/**/" id="myPageForm" method="POST"> 
    <!--로그인 전에 보이는 메뉴-->
   <!--   if(/*로그인관련 서블릿 필요*/) { %>-->
    <div class="wrap" align="center">
        
        <div id="profile" name="profile">
            <div id="profilePhoto" name="profilePhoto">프로필 사진(이미지링크)</div>
            <div id="location" name="location">희망시급/지역/현재시각/가입일</div>
            <div id="userName" name="userName">유저아이디/@회사명/직급명</div>
            <div id="workship" name="workship">워크쉽(리뷰기반)</div>
            <div id="userContent" name="userContent">자기소개</div>
            <div id="hirePositionButton" name="hireButton"><button type="button" class="btn btn-primary">고용주측의 프로필 확인</button></div>
            
            
        </div>
        
        
        <div id="portpolyo" name="portpolyo">
            <h1 align="left">포트폴리오 항목</h1>
            <span id="portpolyoTitle" name="portpolyoTitle"><h2>포트폴리오 제목(기입)</h2></span>
            <span id="portpolyoLink" name="portpolyoLink" ><a>포트폴리오 하이퍼링크(기입)</a></span>
            <br><br>
            <div id="portpolyoContent" name="portpolyoContent">포트폴리오 내용(기입)</div>
            <br>
            <span id="portpolyoTime" name="portpolyoTime">작업시간(기입)</span>
            <span id="portpolyoSkill" name="portpolyoSkill">사용기술(기입)</span>
            

            <div id="portpolyoModifiy" name="portpolyoModifiy"><button type="button" class="btn btn-primary">관리</button></div>

        </div>
        
        
        <div id="review" name="review">
            <h2 align="left">리뷰 항목</h2>
            <span id="reviewTitle" name="reviewTitle"><h3>리뷰 제목(기입)</h3></span>
            <span id="reviewScore" name="reviewScore">리뷰 점수(기입)</span><br>
            <span id="reviewLink" name="reviewLink" ><a>리뷰 하이퍼링크(기입)</a></span>
            <br><br>
            <div id="reviewContent" name="reviewContent">리뷰 내용(기입)</div>
            
            <span id="reviewTime" name="Time">작업시간(기입)</span>

            <div id="reviewModifiy" name="reviewModifiy">
                
                <span id="reviewReward" name="reviewReward">리뷰한 프로젝트의 보상액(기입)</span>
            </div>
        </div>

        <div id="career" name="career">
            <h2 align="left">경력 항목</h2>
            <span id="careerTitle" name="careerTitle"><h3>경력 제목(기입)</h3></span>

            <div id="careerContent" name="careerContent">경력 설명(기입)</div>
            <br>
            <span id="careerTime" name="careerTime">입사일/퇴사일(기입)</span>

            <div id="careerModifiy" name="careerModifiy"><button type="button" class="btn btn-primary">관리</button></div>

        </div>

        <div id="education" name="education">
            <h2 align="left">교육 항목</h2>
            <span id="educationTitle" name="educationTitle"><h3>대학명(기입)</h3></span>

            <div id="educationContent" name="educationContent">전공/학위(기입)</div>
            <br>
            <span id="educationTime" name="educationTime">입학년도/졸업년도(기입)</span>

            <div id="educationModifiy" name="educationModifiy"><button type="button" class="btn btn-primary">관리</button></div>

        </div>

        <div id="cartification" name="cartification">
            <h2 align="left">자격증 항목</h2>
            <span id="cartificationTitle" name="cartificationTitle"><h3>자격증 이름(기입)</h3></span>

            <div id="cartificationContent" name="cartificationContent">주최 기관(기입)</div>
            <br>
            <span id="cartificationTime" name="cartificationTime">취득년도(기입)</span>

            <div id="cartificationModifiy" name="cartificationModifiy"><button type="button" class="btn btn-primary">관리</button></div>
        </div>

        <div id="publication" name="publication">
            <h2 align="left">출판물 항목</h2>
            <span id="publicationTitle" name="publicationTitle"><h3>출판물 제목(기입)</h3></span>

            <div id="publicationContent" name="publicationContent">출판물 내용(기입)</div>
            <span id="publisher" name="publisher">출판사</span>
            <br><br>
            <span id="publicationTime" name="publicationTime">출판날짜(기입)</span>

            <div id="publicationModifiy" name="cartificationModifiy"><button type="button" class="btn btn-primary">관리</button></div>
        </div>
    </div>
    <!--로그인 이후 보이는 화면--> 
    
    <!-- 임시로 화면 구현

   	 < }else{ %> 
        <div class="wrap" align="center">
        
            <div id="profile" name="profile">
                <div id="profilePhoto" name="profilePhoto">프로필 사진(이미지링크)</div>
                <div id="location" name="location">희망시급/지역/현재시각/가입일</div>
                <div id="userName" name="userName">유저아이디/@회사명/직급명</div>
                <div id="workship" name="workship">워크쉽(리뷰기반)</div>
                <div id="userContent" name="userContent">자기소개</div>
                <div id="hirePositionButton" name="hireButton"><button>고용주측의 프로필 확인</button></div>
                
                
            </div>
            
            
            <div id="portpolyo" name="portpolyo">
                <h1 align="left">포트폴리오 항목</h1>
                <span id="portpolyoTitle" name="portpolyoTitle"><h2>포트폴리오 제목(기입)</h2></span>
                <span id="portpolyoLink" name="portpolyoLink" ><a>포트폴리오 하이퍼링크(기입)</a></span>
                <br><br>
                <div id="portpolyoContent" name="portpolyoContent">포트폴리오 내용(기입)</div>
                <br>
                <span id="portpolyoTime" name="portpolyoTime">작업시간(기입)</span>
                <span id="portpolyoSkill" name="portpolyoSkill">사용기술(기입)</span>
                
    
                <div id="portpolyoModifiy" name="portpolyoModifiy"><button>관리</button></div>
    
            </div>
            
            
            <div id="review" name="review">
                <h1 align="left">리뷰 항목</h1>
                <span id="reviewTitle" name="reviewTitle"><h2>리뷰 제목(기입)</h2></span>
                <span id="reviewScore" name="reviewScore">리뷰 점수(기입)</span><br>
                <span id="reviewLink" name="reviewLink" ><a>리뷰 하이퍼링크(기입)</a></span>
                <br><br>
                <div id="reviewContent" name="reviewContent">리뷰 내용(기입)</div>
                
                <span id="reviewTime" name="Time">작업시간(기입)</span>
    
                <div id="reviewModifiy" name="reviewModifiy">
                    
                    <span id="reviewReward" name="reviewReward">리뷰한 프로젝트의 보상액(기입)</span>
                </div>
            </div>
    
            <div id="career" name="career">
                <h1 align="left">경력 항목</h1>
                <span id="careerTitle" name="careerTitle"><h2>경력 제목(기입)</h2></span>
    
                <div id="careerContent" name="careerContent">경력 설명(기입)</div>
                <br>
                <span id="careerTime" name="careerTime">입사일/퇴사일(기입)</span>
    
                <div id="careerModifiy" name="careerModifiy"><button>관리</button></div>
    
            </div>
    
            <div id="education" name="education">
                <h1 align="left">교육 항목</h1>
                <span id="educationTitle" name="educationTitle"><h2>대학명(기입)</h2></span>
    
                <div id="educationContent" name="educationContent">전공/학위(기입)</div>
                <br>
                <span id="educationTime" name="educationTime">입학년도/졸업년도(기입)</span>
    
                <div id="educationModifiy" name="educationModifiy"><button>관리</button></div>
    
            </div>
    
            <div id="cartification" name="cartification">
                <h1 align="left">자격증 항목</h1>
                <span id="cartificationTitle" name="cartificationTitle"><h2>자격증 이름(기입)</h2></span>
    
                <div id="cartificationContent" name="cartificationContent">주최 기관(기입)</div>
                <br>
                <span id="cartificationTime" name="cartificationTime">취득년도(기입)</span>
    
                <div id="cartificationModifiy" name="cartificationModifiy"><button>관리</button></div>
            </div>
    
            <div id="publication" name="publication">
                <h1 align="left">출판물 항목</h1>
                <span id="publicationTitle" name="publicationTitle"><h2>출판물 제목(기입)</h2></span>
    
                <div id="publicationContent" name="publicationContent">출판물 내용(기입)</div>
                <span id="publisher" name="publisher">출판사</span>
                <br><br>
                <span id="publicationTime" name="publicationTime">출판날짜(기입)</span>
    
                <div id="publicationModifiy" name="cartificationModifiy"><button>관리</button></div>
            </div>
        </div>-->
     
         <br><br><br><br><br><br><br><br><br><br><br><br><br>
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
         <br><br><br><br><br><br><br><br>
    <!--footer-->
    <%@ include file="../common/footer.jsp" %>   
     
    </form>
    

</body>
</html>