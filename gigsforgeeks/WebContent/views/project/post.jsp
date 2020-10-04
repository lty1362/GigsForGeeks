<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="${contextPath}/insert.proj" method="post" class="projectForm">
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
					<input type="checkbox" name="requriedSkill" id="java" value="Java">
					<label for="java">JAVA</label>
					<input type="checkbox" name="requriedSkill" id="python" value="Python">
					<label for="python">PYTHON</label>
					<input type="checkbox" name="requriedSkill" id="php" value="PHP">
					<label for="php">PHP</label>
					<input type="checkbox" name="requriedSkill" id="javascript" value="JavaScript">
					<label for="javascript">JavaScript</label>
					<input type="checkbox" name="requriedSkill" id="nodejs" value="Node.js">
					<label for="nodejs">Node.js</label>
					<input type="checkbox" name="requriedSkill" id="apache" value="Apache">
					<label for="apache">Apache</label>
					<input type="checkbox" name="requriedSkill" id="nginx" value="Nginx">
					<label for="nginx">Nginx</label>
					<input type="checkbox" name="requriedSkill" id="tomcat" value="Tomcat">
					<label for="tomcat">Tomcat</label>
					<input type="checkbox" name="requriedSkill" id="iis" value="IIS">
					<label for="iis">IIS</label>
					<input type="checkbox" name="requriedSkill" id="sql" value="SQL">
					<label for="sql">SQL</label>
					<input type="checkbox" name="requriedSkill" id="nosql" value="NoSQL">
					<label for="nosql">NoSQL</label>
					<input type="checkbox" name="requriedSkill" id="aws" value="AWS">
					<label for="aws">AWS</label>
					<input type="checkbox" name="requriedSkill" id="azure" value="Azure">
					<label for="azure">Azure</label>
				</section>
				<section>
					<p>지불 수단과 예상 금액을 말씀해주세요.</p>
					<input type="radio" name="meansOfPayment" value="CREDIT" id="credit" required>
					<label for="credit">신용카드</label>
					<input type="radio" name="meansOfPayment" value="ACCOUNT" id="account" required>
					<label for="account">계좌이체</label>
					<select name="bidding">
						<option value="2000000-5000000">대형 프로젝트 (2,000,000₩~5,000,000₩)</option>
						<option value="1000000-2000000">중형 프로젝트 (1,000,000₩~2,000,000₩)</option>
						<option value="500000-1000000">소형 프로젝트 (500,000₩~1,000,000₩)</option>
						<option value="200000-500000">초소형 프로젝트 (200,000₩~500,000₩)</option>
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