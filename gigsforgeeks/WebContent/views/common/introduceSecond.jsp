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
           /*  border: 1px solid springgreen; */
            box-sizing: border-box;
        }
    	
    	#contentMain{
    		padding: 0px;
    	}
    	
    	
    	#introduceSecond{
    		background: #F7F7F7;
    		height: 1000px;
    		text-align: center;
            font-size: 20px;
            line-height: 35px;
            padding-left: 10%; 
            padding-right: 10%; 
    	}
    	
        #introduceTitle{
        	height: 200px;
        }
        
        #introduceSecond_0>div{
            text-align: left;
            float : left;
            height: 350px;
            background: white;
            border: 20px solid #F7F7F7;
        }
        
        #introduceSecond_0 img{
        	width: 100%;
        }
        
        #projectDetail{
        	background: white;
        }
    	
        #projectDetail p{
        	padding-left:2%;
        	padding-top:5%;
        	font-size:25px;
        	font-weight: bold;
        }
        
        #projectDetail h4{
        	padding-left:2%;
        	font-size:18px;
        	font-weight: bold;
			color:gray;
        }
        
    	#introduceSecond_1{width: 33%; height: 100%; float: left;}
    	#introduceSecond_2{width: 33%; height: 100%; float: left;}
    	#introduceSecond_3{width: 33%; height: 100%; float: left;}
    	#introduceSecond_4{width: 33%; height: 100%; float: left;}
    	#introduceSecond_5{width: 33%; height: 100%; float: left;}
    	#introduceSecond_6{width: 33%; height: 100%; float: left;}
    	
		
    </style>
    
</head>
<body>

	<div id="introduceSecond">
		<div id="introduceTitle">
			<br><br>
			<h1>다수가 즐겨 찾는 것들입니다!</h1>
			<h3 style="color:gray;">- 다음 몇 가지는 가장 인기가 많은 프로젝트입니다. -</h3>
			<br><br>
		</div>
		
		<div id="introduceSecond_0">
		    <div id="introduceSecond_1">
		    	<img class="ProjectShowcase-image" alt="웹사이트 개발 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/website-development-c6d8d791.png">
		        <br>
		        <div id="projectDetail">
			        <p>웹사이트 개발</p>
			        <h4>최저기준 : $300 USD</h4>
		        </div>
		    </div>
		    
		    <div id="introduceSecond_2">
			    <img width="100%" class="ProjectShowcase-image" alt="그래픽 디자인 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/graphic-design-686eadbd.png">
		        <br>
		        <div id="projectDetail">
			        <p>그래픽 디자인</p>
			        <h4>최저기준 : $100 USD</h4>
			    </div>
		    </div>
		    
		    <div id="introduceSecond_3">
		    	<img class="ProjectShowcase-image" alt="로고 디자인 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/logo-design-412a8c64.png">
		        <br>		        
		        <div id="projectDetail">
			        <p>로고 디자인</p>
			        <h4>최저기준 : $50 USD</h4>
		        </div>
		    </div>
		    
		    <div id="introduceSecond_4">
		    	<img class="ProjectShowcase-image" alt="마케팅 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/marketing-98b6075d.png">
		        <br>
		        <div id="projectDetail">
			        <p>마케팅</p>
			        <h4>최저기준 : $150 USD</h4>
		        </div>
		    </div>
		    
		    <div id="introduceSecond_5">
		    	<img class="ProjectShowcase-image" alt="문서 작성 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/writing-d8782fdf.png">
		        <br>
		        <div id="projectDetail">
			        <p>쓰기</p>
			        <h4>최저기준 : $50 USD</h4>
		        </div>
		    </div>
		    
		    <div id="introduceSecond_6">
		    	<img class="ProjectShowcase-image" alt="스마트폰 앱 관련 모범 사례" src="https://www.f-cdn.com/assets/img/homepage/showcase/mobile-app-6c06de77.png">
		        <br>
		        <div id="projectDetail">
			        <p>모바일 앱</p>
			        <h4>최저기준 : $50 USD</h4>
		        </div>
		    </div>
		    
		</div>
	    
	</div>

</body>
</html>