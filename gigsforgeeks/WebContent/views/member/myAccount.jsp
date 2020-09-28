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
<title>Insert title here</title>
</head>
<body onload="showClock()">

	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시");
		String userId = loginUser.getUserId();
		int payRate = (loginUser.getPayRate() == 0) ? 0 : loginUser.getPayRate();
		String location = (loginUser.getLocation() == null) ? "입력하지 않으셨습니다." : loginUser.getLocation();
		Date enrollDate = loginUser.getEnrollDate();
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
		/*String Start = (sdf.format(userPortfolio.getPortfolioStart()) == null) ? ""
				: sdf.format(userPortfolio.getPortfolioStart());
		String End = (sdf.format(userPortfolio.getPortfolioEnd()) == null) ? ""
				: sdf.format(userPortfolio.getPortfolioEnd());*/

		/*경력정보*/
		String CompanyInfo = (userCareer.getCompanyInfo() == null) ? "회사정보" : userCareer.getCompanyInfo();
		String CareerTitle = (userCareer.getCareerTitle() == null) ? "직급명" : userCareer.getCareerTitle();
		String CareerInfo = (userCareer.getCareerInfo() == null) ? "" : userCareer.getCareerInfo();
		/*String Hire = (sdf.format(userCareer.getHireDate()) == null) ? "" : sdf.format(userCareer.getHireDate());
		String Retire = (sdf.format(userCareer.getRetireDate()) == null) ? ""
				: sdf.format(userCareer.getRetireDate()); */
		String CareerStatus = userCareer.isCareerStatus();

		/*교육정보*/
		String University = (userEducation.getUniversity() == null) ? "대학명" : userEducation.getUniversity();
		String Major = (userEducation.getMajor() == null) ? "전공명" : userEducation.getMajor();
		String Degree = (userEducation.getDegree() == null) ? "전공명" : userEducation.getDegree();
		/*String EduEnrollDate = (sdf.format(userEducation.getEnrollDate()) == null) ? ""
				: sdf.format(userEducation.getEnrollDate());
		String EduGrauatedDate = (sdf.format(userEducation.getGrauatedDate()) == null) ? ""
				: sdf.format(userEducation.getGrauatedDate());*/

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
	<main id="contentMain">

	<section>


		<form action="<%=request.getContextPath()%>/myAccountModify.me"
			id="myPageForm" method="POST" encottype="multipart/form-data">

			<div class="wrap" align="center">

				<div id="profile" name="profile">
					<div id="profilePhoto" name="profilePhoto">
						<img alt="" src="">
					</div>
					<div id="location" name="location">
						<%=payRate%>원
						<br><%=location%>
						<div id="divClock" ></div>
						<%=enrollDate%>
					</div>
					<div id="userName" name="userName" align="left">
						<span><%=userId%></span>@
						<%=company%>
						/<%=jobTitle%></div>
					<div id="workship" name="workship">워크쉽(리뷰기반)</div>
					<div id="userContent" name="userContent"><%=selfIntroduction%></div>
					<div id="hirePositionButton" name="hireButton">
						<button>고용주측의 프로필 확인</button>
					</div>
					<script language="javascript">
						function showClock() {
							var currentDate = new Date();
							var divClock = document.getElementById("divClock");

							var msg = "현재 시간:" + currentDate.getHours() + "시"
							msg += currentDate.getMinutes() + "분";
							

							divClock.innerText = msg;
							setTimeout(showClock, 1000);
						}
					</script>




				</div>


				<div id="portpolyo" name="portpolyo">
					<h1 align="left">포트폴리오 항목</h1>
					<span id="portpolioTitle" name="portpolioTitle"><h2><%=PortfolioTilte%></h2></span>
					<span id="portpolioLink" name="portpolioLink"><a><%=PortfolioLink%></a></span>
					<br> <br>
					<div id="portpolioContent" name="portpolioContent"><%=PortfolioContent%></div>
					<br> <span id="portpolioTime" name="portpolioTime">
						시작시간 : &nbsp; 완료시간 : </span> <br> <span id="portpolioSkill"
						name="portpolioSkill">사용 기술 : <%=PortfolioSkill%></span>


					<div id="portpolioModifiy" name="portpolioModifiy">
						<button>관리</button>
					</div>

				</div>


				<div id="review" name="review">
					<h1 align="left">리뷰 항목</h1>
					<span id="reviewTitle" name="reviewTitle"><h2>리뷰 제목(기입)</h2></span>
					<span id="reviewScore" name="reviewScore">리뷰 점수(기입)</span><br>
					<span id="reviewLink" name="reviewLink"><a>리뷰 하이퍼링크(기입)</a></span>
					<br> <br>
					<div id="reviewContent" name="reviewContent">리뷰 내용(기입)</div>

					<span id="reviewTime" name="Time">작업시간(기입)</span>

					<div id="reviewModifiy" name="reviewModifiy">

						<span id="reviewReward" name="reviewReward">리뷰한 프로젝트의
							보상액(기입)</span>
					</div>
				</div>

				<div id="career" name="career">
					<h1 align="left">경력 항목</h1>
					<span id="careerTitle" name="careerTitle"><h2><%=CompanyInfo%></h2></span>

					<div id="careerContent" name="careerContent"><%=CareerTitle%></div>
					<br> <span id="careerTime" name="careerTime">입사일 :
						&nbsp; / &nbsp;퇴사일 ></span>

					<div id="careerModifiy" name="careerModifiy">
						<button>관리</button>
					</div>

				</div>

				<div id="education" name="education">
					<h1 align="left">교육 항목</h1>
					<span id="educationTitle" name="educationTitle"><h2><%=University%></h2></span>

					<div id="educationContent" name="educationContent"><%=Major%>/<%=Degree%></div>
					<br> <span id="educationTime" name="educationTime">입학년도&nbsp;
						/&nbsp; 졸업년도 </span>

					<div id="educationModifiy" name="educationModifiy">
						<button>관리</button>
					</div>

				</div>

				<div id="cartification" name="cartification">
					<h1 align="left">자격증 항목</h1>
					<span id="cartificationTitle" name="cartificationTitle"><h2>
							<%=CetificateName%></h2></span>

					<div id="cartificationContent" name="cartificationContent">
						<%=CetificateAuth%></div>
					<br> <span id="cartificationTime" name="cartificationTime">
						<%=CetificateDate%>
					</span>

					<div id="cartificationModifiy" name="cartificationModifiy">
						<button>관리</button>
					</div>
				</div>

				<div id="publication" name="publication">
					<h1 align="left">출판물 항목</h1>
					<span id="publicationTitle" name="publicationTitle">
						<h2>
							<%=BookName%>
						</h2>
					</span>

					<div id="publicationContent" name="publicationContent">
						<%=BookInfo%>
					</div>
					<span id="publisher" name="publisher"> <%--Publisher--%></span> <br>
					<br> <span id="publicationTime" name="publicationTime">
						<%=BookDate%></span>



					<div id="publicationModifiy" name="cartificationModifiy">
						<button>관리</button>
					</div>
				</div>
			</div>


		</form>




	</section>
	</main>
	<%-- End Of Content --%>

	<%-- Footer --%>
	<jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
	<%-- End Of Footer --%>
</body>
</html>