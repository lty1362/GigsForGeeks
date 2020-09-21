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
 
 
 <!--header자리-->
   <%@ include file="../common/header.jsp" %>
    <form action="" method="POST">
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
            <span id="portpolyoTitle" name="portpolyoTitle">
                포트폴리오 제목 : <input type="text">
            </span>
            <br>
            <br>

            <span id="portpolyoLink" name="portpolyoLink" >
                포트폴리오 링크 : <input type="link" placeholder="https://">
            </span>
            <br><br>
            <div id="portpolyoContent" name="portpolyoContent">
                포트폴리오 내용 :
                <textarea cols="40" rows="3"></textarea>
            </div>
            <br>
            <span id="portpolyoTime" name="portpolyoTime">
                포트폴리오 제작날짜 : 시작 <input type="month"> 종료:<input type="month">
            </span>
            <br>
            <span id="portpolyoSkill" name="portpolyoSkill">
                요구 기술 : <input type="checkbox">css
            </span>
            

            <div id="portpolyoModifiy" name="portpolyoModifiy"><button type="submit">저장</button></div>

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
            <span id="careerTitle" name="careerTitle">기업 이름 : <input type="text"></span>
            <br><br>

            <div id="careerContent" name="careerContent">회사 설명 : <textarea cols="50" rows="5"></textarea></div>
            <br>
            <span id="careerTime" name="careerTime">
                입사일 : <input type="month">

                퇴사일 : <input type="month">
            </span>
            <br>
            퇴사 여부 : <input type="checkbox">

            <div id="careerModifiy" name="careerModifiy"><button type="submit">저장</button></div>

        </div>

        <div id="education" name="education">
            <h1 align="left">교육 항목</h1>
            <span id="educationTitle" name="educationTitle">대학 이름 : <input type="text"></span>
            <br><br>
            <div id="educationContent" name="educationContent">
                전공명 : <input type="text">
                <br><br>
                학위 : <input type="text">
            </div>
            <br>
            <span id="educationTime" name="educationTime">
                입학 : <input type="month"> 
                졸업 : <input type="month"></span>
                <br><br>
                졸업여부 : <input type="checkbox">
            <div id="educationModifiy" name="educationModifiy"><button type="submit">저장</button></div>

        </div>

        <div id="cartification" name="cartification">
            <h1 align="left">자격증 항목</h1>
            <span id="cartificationTitle" name="cartificationTitle">자격증 이름 : <input type="text"></h2></span>
            <br><br><br>
            <div id="cartificationContent" name="cartificationContent">주최기관 : <input type="text"></div>
            <br><br>
            <span id="cartificationTime" name="cartificationTime">취득년도: <input type="month"></span>

            <div id="cartificationModifiy" name="cartificationModifiy"><button type="submit">저장</button></div>
        </div>

        <div id="publication" name="publication">
            <h1 align="left">출판물 항목</h1>
            <span id="publicationTitle" name="publicationTitle">출판물 제목 : <input type="text"></span>
            <br><br>
            <div id="publicationContent" name="publicationContent">출판물 내용 : <textarea cols="50" rows="4"></textarea></div>
            <br>
            <span id="publisher" name="publisher">출판사 : <input type="text"></span>
            <br><br>
            <span id="publicationTime" name="publicationTime">출판날짜 : <input type="month"></span>

            <div id="publicationModifiy" name="cartificationModifiy"><button type="submit">저장</button></div>
        </div>
    </div>

    </form>





    <!--footer자리-->
    <%@ include file="../common/footer.jsp" %>

</body>
</html>