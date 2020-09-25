<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>프로젝트 게시하기</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
		<h2 id="contentTitle">프로젝트를 등록해주세요</h2>
		<section>
			<form action="${contextPath}/postProject.do" method="post" class="projectForm">
				<section>
					<p>프로젝트에 대한 이름을 선택해주세요.</p>
					<input type="text" name="projectName" required>
				</section>
				<section>
					<p>프로젝트에 대하여 좀 더 자세히 알려주세요.</p>
					<textarea name="description" cols="100" rows="10" required></textarea>
				</section>
				<section>
					<p>프로젝트의 예정 진행 기간을 정해주세요</p>
					<input type="date" name="expectStart" required> ~ <input type="date" name="expectEnd" required>
				</section>
				<section>
					<p>
						프로젝트에 요구되는 기술사항을 모두 체크해주세요. <br>
						프로젝트를 가장 잘 설명할 수 있는 기술 항목 최대를 5건까지 입력하세요. <br>
	                    각 프리랜서는 이 기술 항목을 이용해 자신이 관심을 갖고있거나 전문 기술이 있는 프로젝트를 검색합니다. <br>
					</p>
					<input type="checkbox" name="requriedSkill" id="java" value="Java" required>
					<label for="java">JAVA</label>
				</section>
				<section>
					<p>지불 수단과 예상 금액을 말씀해주세요.</p>
					<input type="radio" name="meansOfPayment" value="CREDIT" id="credit" required>
					<label for="credit">신용카드</label>
					<input type="radio" name="meansOfPayment" value="ACCOUNT" id="account" required>
					<label for="account">계좌이체</label>
					<select name="bidding">
						<option value="2000000-5000000">대형 프로젝트 (2,000,000₩~5,000,000₩)</option>
					</select>
				</section>
				<section>
					<p>관련 파일 업로드</p>
					<input type="file" name="file">
				</section>
				<section>
					<p>입찰 마감일을 정해주세요</p>
					<input type="date" name="endBid" required>
				</section>
				<section>
					<input type="submit" value="프로젝트 등록하기">
					<input type="reset" value="새로고침">
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