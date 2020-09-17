<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="enrollProject">
        
        <div id="enrollcontent">
        
            <form action="<%= contextPath %>/enroll.pro" method="POST" enctype="multipart/form-data">
            <p class="title">프로젝트의 대한 이름을 선택해주세요.</p>
            <input type="text" name="enrollProjectName" style="width:800px;" placeholder="예) 웹사이트 구축이 필요합니다.">
            <br><br>
            
            <p class="title">프로젝트에 대하여 좀 더 자세히 알려주세요.</p>
            <textarea name="enrollProjectContent" cols="110" rows="20" placeholder="프로젝트에 대한 상세설명을 여기에 적어주세요." style="resize:none;"></textarea>
            <br><br>

            <p class="title">프로젝트의 예정 진행 기간을 정해주세요.</p>
            <input type="text" list="startSchedule" placeholder="프로젝트 개시일" style="width:200px;">
            <datalist input="text" id="startSchedule">
                <option value="s1"></option>
                <option value="s2"></option>
                <option value="s3"></option>
                <option value="s4"></option>
            </datalist>
            ~
            <input type="text" list="endSchedule" placeholder="프로젝트 완료일" style="width:200px;">
            <datalist input="text" id="endSchedule">
                <option value="e1"></option>
                <option value="e2"></option>
                <option value="e3"></option>
                <option value="e4"></option>
            </datalist>
            <br><br>

            <p class="title">어떤 기술항목을 요구사항으로 하시겠어요?</p>
            <div>
		                프로젝트를 가장 잘 설명할 수 있는 기술 항목 최대를 5건까지 입력하세요. 
		                각 프리랜서는 이 기술 항목을 이용해 자신이 관심을 갖고있거나 전문 기술이 있는 프로젝트를 검색합니다.
            </div>
            <br>
            <input type="checkbox" name="skill" id="JAVA">
            <label for="Java">JAVA</label>
            <input type="checkbox" name="skill" id="HTML">
            <label for="html">HTML</label>
            <input type="checkbox" name="skill" id="PHP">
            <label for="PHP">PHP</label>
            <input type="checkbox" name="skill" id="CSS">
            <label for="CSS">CSS</label>
            <br>
            <input type="checkbox" name="skill" id="Python">
            <label for="Python">Python</label>
            <input type="checkbox" name="skill" id="WebsiteDesign">
            <label for="WebsiteDesign">Website Design</label>
            <input type="checkbox" name="skill" id="GraphicDesign">
            <label for="GraphicDesign">Graphic Design</label>
            <br>
            <input type="checkbox" name="skill" id="JavaScript">
            <label for="JavaScript">JavaScript</label>
            <input type="checkbox" name="skill" id="AJAX">
            <label for="AJAX">AJAX</label>
            <input type="checkbox" name="skill" id="MySQL">
            <label for="MySQL">MySQL</label>
            <input type="checkbox" name="skill" id="WordPress">
            <label for="WordPress">WordPress</label>
            <br>
            <input type="checkbox" name="skill" id="MobileDevelopment">
            <label for="MobileDevelopment">Mobile Development</label>
            <input type="checkbox" name="skill" id="WebeDevelopment">
            <label for="WebDevelopment">Web Development</label>

            <input type="checkbox" name="skill" id="etc">
            <label for="etc">기타</label>
            
            <br><br>

            <p class="title">지불 수단과 예상 금액을 말씀해주세요.</p>
            <input type="radio" id="fixedPay" name="payment">
            <label for="fixedPay">급여고정식</label>
            <input type="radio" id="hourPay" name="payment">
            <label for="hourPay">시급제</label>
            <select name="payProject">
                <option value="초소형">초소형프로젝트 (200,000￦ ~ 700,000￦)</option>
                <option value="중간형">중간형프로젝트 (700,000￦ ~ 2,000,000￦)</option>
                <option value="대형">대형프로젝트 (2,000,000￦ ~ 그이상)</option>
            </select>

            <br><br>

            <p class="title">관련 파일첨부</p>
            <input type="file" name="upfile">
            
            </form>
        </div>
    
    </div>
    <br><br><br><br><br>
   
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>