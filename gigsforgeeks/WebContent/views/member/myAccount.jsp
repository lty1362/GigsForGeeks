<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.gigsforgeeks.member.model.vo.Publication"%>
<%@page import="com.gigsforgeeks.member.model.vo.Certificate"%>
<%@page import="com.gigsforgeeks.member.model.vo.Education"%>
<%@page import="com.gigsforgeeks.member.model.vo.Portfolio"%>
<%@page import="com.gigsforgeeks.member.model.vo.Career"%>
<%@page import="java.sql.Date"%>
<%@page import="com.gigsforgeeks.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- Header --%>
<%@ include file="../../views/common/header.jsp"%>
<!-- 필요한 외부 파일은 여기서 불러오세요 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/member.css">
<%-- End Of Header --%>
<!-- 페이지의 타이틀을 작성하세요 -->
<title>마이페이지</title>
</head>
<body onload="showClock()">

	<%
		
		String userId = loginUser.getUserId();
		int payRate = (loginUser.getPayRate() == 0) ? 0 : loginUser.getPayRate();
		String location = (loginUser.getLocation() == null) ? "입력하지 않으셨습니다." : loginUser.getLocation();
		String enrollDate = loginUser.getEnrollDate();
		String company = (loginUser.getCompany() == null) ? "COMPANY" : loginUser.getCompany();
		String jobTitle = (loginUser.getJobTitle() == null) ? "입력하지 않으셨습니다." : loginUser.getJobTitle();
		String selfIntroduction = (loginUser.getSelfIntroduction() == null) ? "" : loginUser.getSelfIntroduction();
		String profileOmage = loginUser.getProfileImage();

		Career userCareer = (Career) session.getAttribute("career");
		Portfolio userPortfolio = (Portfolio) session.getAttribute("portfolio");
		Education userEducation = (Education) session.getAttribute("education");
		Certificate userCertificate = (Certificate) session.getAttribute("certificate");
		Publication userPublication = (Publication) session.getAttribute("publication");

		/*포트폴리오*/
		String PortfolioTilte = (userPortfolio.getPortfolioTitle() == null)
				? "등록된 포트폴리오가 없습니다."
				: userPortfolio.getPortfolioTitle();
		String PortfolioContent = (userPortfolio.getPortfolioContent() == null)
				? ""
				: userPortfolio.getPortfolioContent();
		String PortfolioLink = (userPortfolio.getPortfolioLink() == null) ? "" : userPortfolio.getPortfolioLink();
		String PortfolioSkill = (userPortfolio.getPortfolioSkill() == null)
				? ""
				: userPortfolio.getPortfolioSkill();
		String Start = (userPortfolio.getPortfolioStart() == null) ? "" : userPortfolio.getPortfolioStart();
		String End = (userPortfolio.getPortfolioEnd() == null) ? "" : userPortfolio.getPortfolioEnd();

		/*경력정보*/
		String CompanyInfo = (userCareer.getCompanyInfo() == null) ? "회사정보" : userCareer.getCompanyInfo();
		String CareerTitle = (userCareer.getCareerTitle() == null) ? "직급명" : userCareer.getCareerTitle();
		String CareerInfo = (userCareer.getCareerInfo() == null) ? "" : userCareer.getCareerInfo();
		String Hire = (userCareer.getHireDate() == null) ? "" : userCareer.getHireDate();
		String Retire = (userCareer.getRetireDate() == null) ? "" : userCareer.getRetireDate();
		String CareerStatus = userCareer.isCareerStatus();

		/*교육정보*/
		String University = (userEducation.getUniversity() == null) ? "대학명" : userEducation.getUniversity();
		String Major = (userEducation.getMajor() == null) ? "전공명" : userEducation.getMajor();
		String Degree = (userEducation.getDegree() == null) ? "전공명" : userEducation.getDegree();
		String EduEnrollDate = (userEducation.getEnrollDate() == null)
				? ""
				: userEducation.getEnrollDate();
		String EduGrauatedDate = (userEducation.getGrauatedDate() == null) ? "" : userEducation.getGrauatedDate();

		/*자격증 정보*/
		String CetificateName = (userCertificate.getcetificateName() == null)
				? "자격증 이름"
				: userCertificate.getcetificateName();
		String CetificateAuth = (userCertificate.getcetificateAuth() == null)
				? "주최 기관 "
				: userCertificate.getcetificateAuth();
		String CetificateDate = (userCertificate.getcetificateDate() == null)
				? "취득 날짜 "
				: userCertificate.getcetificateDate();

		/*출판물 정보*/
		String BookName = (userPublication.getBookName() == null) ? "출판물 제목" : userPublication.getBookName();
		String BookInfo = (userPublication.getBookInfo() == null) ? "출판물 내용" : userPublication.getBookInfo();
		String Publisher = (userPublication.getPublisher() == null) ? "출판사" : userPublication.getPublisher();
		String BookDate = (userPublication.getBookDate() == null) ? "출판 날짜" : userPublication.getBookDate();
	%>


	<%-- Content --%>
	

	<section>


		<form action="<%=request.getContextPath()%>/myAccountModify.me"
			id="myPageForm" method="POST" enctype="multipart/form-data">

			<div class="wrap" align="center">

				<div id="profile" >
					<div id="profilePhoto" >
						<img alt="" src="${contextPath}/resources/images/avatar.png"
							style="width: 100%; height: 100%;">
					</div>
					<div id="location" >
						희망시급 : <%=payRate%>원 <br>
						거주지역 : <%=location%>
						<div id="divClock"></div>
						
					</div>
					<div id="userName"  align="left">
						<br><br>
						<span style="font-size: 16px; font-weight: bold;"><%=userId%>@
						<%=company%>
						<br><br>
						<%=jobTitle%>
						</span></div>
					<div id="workship" >워크쉽(리뷰기반)</div>
					<div id="userContent" ><%=selfIntroduction%></div>
					<div id="hirePositionButton" >
						<input type="button" value="정보 수정" id="profileButton">
					</div>
					<script >
						function showClock() {
							var currentDate = new Date();
							var divClock = document.getElementById("divClock");

							var msg = "현재 시간:" + currentDate.getHours() + "시"
							msg += currentDate.getMinutes() + "분";

							divClock.innerText = msg;
							setTimeout(showClock, 1000);

						};
					</script>
					<script>
						$("#profileButton").click(function() {
							$("#profile").load("views/member/profile.jsp")

						});
					</script>

				</div>







				<div id="portpolyo" >
					<h1 align="left">포트폴리오 항목</h1>
					<h2><%=PortfolioTilte%></h2>
					<span id="portpolioLink" ><a><%=PortfolioLink%></a></span>
					<br> <br>
					<div id="portpolioContent" ><%=PortfolioContent%></div>
					<br> <span id="portpolioTime" >
						시작시간 : <%=Start%> &nbsp; 완료시간 : <%=End%>

					</span> <br> <span id="portpolioSkill" >사용
						기술 : <%=PortfolioSkill%></span>


					<div id="portpolioModifiy" >
						<input type="button" value="정보수정" id="portfolioButton"></input>
					</div>

				</div>

				<script>
					$("#portfolioButton").click(function() {
						$("#portpolyo").load("views/member/portfolio.jsp")

					});
				</script>


				<div id="review" >
					<h1 align="left">리뷰 항목</h1>
					<h2>리뷰 제목(기입)</h2>
					<span id="reviewScore" >리뷰 점수(기입)</span><br>
					<span id="reviewLink" ><a>리뷰 하이퍼링크(기입)</a></span>
					<br> <br>
					<div id="reviewContent" >리뷰 내용(기입)</div>

					<span id="reviewTime">작업시간(기입)</span>

					<div id="reviewModifiy" >

						<span id="reviewReward" >리뷰한 프로젝트의
							보상액(기입)</span>
					</div>
				</div>

				<div id="career" >
					<h1 align="left">경력 항목</h1>
					<h2><%=CompanyInfo%></h2>

					<div id="careerContent" ><%=CareerTitle%></div>
					<br> <span id="careerTime" >입사일 : <%= Hire %>
						&nbsp; / &nbsp;퇴사일 : <%= Retire %> &nbsp; </span>

					<div id="careerModifiy" >
						<input type="button" id="careerButton" value="정보 수정">
					</div>

				</div>
				<script>
					$("#careerButton").click(function() {
						$("#career").load("views/member/career.jsp")

					});
				</script>



				<div id="education" >
					<h1 align="left">교육 항목</h1>
					<h2><%=University%></h2>

					<div id="educationContent" ><%=Major%>/<%=Degree%></div>
					<br> <span id="educationTime">입학년도&nbsp; : <%= EduEnrollDate %> 
						/&nbsp; 졸업년도  : <%= EduGrauatedDate %></span>

					<div id="educationModifiy" >
						<input type="button" id="educationButton" value="정보 수정">
					</div>

				</div>
				<script>
					$("#educationButton").click(function() {
						$("#education").load("views/member/education.jsp")

					});
				</script>

				<div id="cartification" >
					<h1 align="left">자격증 항목</h1>
					<h2><%=CetificateName%></h2>

					<div id="cartificationContent" >
						<%=CetificateAuth%></div>
					<br> <span id="cartificationTime" >
						<%=CetificateDate%>
					</span>

					<div id="cartificationModifiy" >
						<input type="button" id="certificationButton" value="정보 수정">
					</div>
				</div>
				<script>
					$("#certificationButton").click(
							function() {
								$("#cartification").load(
										"views/member/certification.jsp")

							});
				</script>

				<div id="publication" >
					<h1 align="left">출판물 항목</h1>
					<h2><%=BookName%></h2>
					

					<div id="publicationContent" >
						<%=BookInfo%>
					</div>
					<span id="publisher"> <%--Publisher--%></span> <br>
					<br> <span id="publicationTime" >
						<%=BookDate%></span>



					<div id="publicationModifiy" >
						<input type="button" id="publicationButton" value="정보수정">
					</div>
				</div>
				<script>
					$("#publicationButton").click(function() {
						$("#publication").load("views/member/publication.jsp")

					});
				</script>
			</div>


		</form>




	</section>
	
	<%-- End Of Content --%>

	<%-- Footer --%>
	<jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
	<%-- End Of Footer --%>
</body>
</html>