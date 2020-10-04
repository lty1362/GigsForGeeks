<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.gigsforgeeks.project.model.vo.Project,
    		java.text.NumberFormat,
			java.util.Locale" %>
<% 
	Project myProject = (Project)request.getAttribute("myProject"); 
	
	String minBid = NumberFormat.getCurrencyInstance(Locale.KOREA).format(myProject.getMinBid());
	String maxBid = NumberFormat.getCurrencyInstance(Locale.KOREA).format(myProject.getMaxBid());
	String winningBid = NumberFormat.getCurrencyInstance(Locale.KOREA).format(myProject.getWinningBid());
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>프로젝트 상세보기</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
		<h2 id="contentTitle"><%= myProject.getProjectName() %></h2>
		<nav class="myProjectNav">
			<a href="" style="font-weight: bolder;">상세보기</a> | 
			<a href="">제안들</a> | 
			<a href="">파일</a> | 
			<a href="">프로젝트 재등록</a> | 
			<a href="">프로젝트 삭제</a>
		</nav>
		<section>
			<form action="${contextPath}/postProject.do" method="post" class="projectForm">
				<section>
					<p><b>프로젝트 예상 입찰가</b>: <%= minBid %>~<%= maxBid %></p>
				</section>
				<section>
					<p><b>프로젝트의 예정 진행 기간</b>: <%= myProject.getExpectStart() %>~<%= myProject.getExpectEnd() %></p>
				</section>
				<section>
					<p><b>프로젝트 상세내용</b></p>
					<textarea name="description" cols="100" rows="10" readonly><%= myProject.getDescription() %></textarea>
				</section>
				<section>
					<p><b>요구 기술</b>: <%= myProject.getRequiredSkill().replace(",", " ") %></p>
				</section>
			</form>
		</section>
	</main>
	 <%-- End Of Content --%>
	
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>