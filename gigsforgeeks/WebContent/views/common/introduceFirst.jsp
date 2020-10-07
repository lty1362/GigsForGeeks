<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	
    <style>
        div{
            /* border: 1px solid springgreen; */
            box-sizing: border-box;
        }
        #introduceFirst{
            height: 900px;
            text-align: center;
            font-size: 20px;
            line-height: 35px;;
        }
        
        #introduceTitle{
        	height: 150px;
        }
        
        #introduceFirst_0>div{
            height: 650px;
            float: left;
        }
        
        #introduceFirst_1{width: 33%; height: 100%;}
        #introduceFirst_2{width: 34%; height: 100%;}
        #introduceFirst_3{width: 33%; height: 100%;}
        
        #introduceFirst_0>div>p{
        	padding-left:10%;
        	padding-right:10%;
        	padding-top:5%;
        }
    </style>
    
</head>
<body>

	<div id="introduceFirst">
		<div id="introduceTitle">
			<br>
			<h1>처리할 일이 있으신가요?</h1>
			<br>
		</div>
		
		<div id="introduceFirst_0">
		    <div id="introduceFirst_1">
		        <img alt="일자리 등록 관련 아이콘" class="NeedWorkDone-image" src="https://www.f-cdn.com/assets/img/homepage/icons/need-work-done/post-a-job-eaf3f61f.svg">
		        <br><br>
		        <h1>작업 게시</h1>
		        <p><b>어렵지 않습니다. 일처리가 필요한 부분에 대한 일자리를 등록하시는 것만으로, 몇 분이 지나지도 않아서 관심있는 프리랜서들이 경쟁력 높은 입찰 견적서를 보내 오기 시작합니다.</b></p>
		    </div>
		    <div id="introduceFirst_2">
		        <img alt="프리랜서 선정 아이콘" class="NeedWorkDone-image" src="https://www.f-cdn.com/assets/img/homepage/icons/need-work-done/choose-freelancers-c7d9fb04.svg">
		        <br><br>
		        <h1>프리랜서 선정</h1>
		        <p><b>어떤 유형의 일거리를 갖고 계시든, 거기에 맞는 프리랜서를 찾으실 수 있습니다. 여기에는, 웹 디자인, 스마트폰 앱 개발, 가상 비서, 제품 생산, 그래픽 디자인, 그리고 그 외에도 매우 많은 예가 있습니다.</b></p>
		    </div>
		    <div id="introduceFirst_3">
		    	<img alt="안전 결제 관련 아이콘" class="NeedWorkDone-image" src="https://www.f-cdn.com/assets/img/homepage/icons/need-work-done/pay-safely-8f390ac2.svg">
		        <br><br>
		        <h1>안전한 지불</h1>
		        <p><b>Freelancer.com 서비스에서는 안전한 결제 시스템과 수 천 명 수준의 전문가를 준비해 두고 있어서 인터넷 상에서 가장 간편하고 안전한 방법으로 일을 처리하실 수 있습니다.</b></p>
		    </div>
		</div>
	    
	</div>
		 
</body>
</html>