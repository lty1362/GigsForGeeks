<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- Header --%>
<%@ include file="../../views/common/header.jsp"%>
<!-- 필요한 외부 파일은 여기서 불러오세요 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">
<%-- End Of Header --%>
<!-- 페이지의 타이틀을 작성하세요 -->
<title>이메일 인증 페이지</title>
<style>
input[type=password] {
	border-radius: 7%;
	border: 1px solid skyblue;
	height: 30px;
}

input[type=text] {
	border-radius: 7%;
	border: 1px solid skyblue;
	height: 30px;
}

label {
	font-size: 18px;
	margin-top: 5px;
	margin-bottom: 5px;
}

span {
	font-size: 10px;
	margin: 5px;
}

#buttonPlace {
	width: 100px;
	height: 50px;
	position: absolute;
	right: 1px;
}

input[type="checkbox"] {
	height: 20px;
	line-height: 24px;
}
</style>
</head>
<body>
	<%-- Content --%>
	<!-- 여기서부터 내용 작성하면 됩니다. -->
	<main id="contentMain">

	<section>
		<form action="" method="POST">
			<h1>이메일 인증 페이지</h1>
			<hr>
			<h2>이메일 인증</h2>


			<span>인증 받을 이메일 기재</span><br> <input type="text"
				placeholder="이메일을 입력해주세요" style="width: 400px;">
			<button class="btn btn-outline-info">인증번호 전송</button>
			<br>
			<br> <span>인증번호 입력</span> <br> <input type="text">
			<button class="btn btn-outline-info">제출</button>
			<br>
			<br>
			<hr>

		</form>

	</section>
	</main>
	<%-- End Of Content --%>

	<%-- Footer --%>
	<jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
	<%-- End Of Footer --%>
</body>
</html>