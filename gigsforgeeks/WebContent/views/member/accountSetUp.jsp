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
<title>계정 설정</title>
<style>
body form{
	margin: 15px;
}	
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
button{
	position: absolute;
	right: 15px;
}


input[type="checkbox"]{
 height: 15px;
 line-height: 25px;
}
input[type="radio"]{
	height: 15px;
	line-height:25px;
}
</style>
</head>
<body>
	<%-- Content --%>
	<!-- 여기서부터 내용 작성하면 됩니다. -->
	
	<section>
		<form action="" method="POST">
			<h2>사용자 설정</h2>
			<label>이름 </label> <br> <input type="text"
				placeholder="이름을 입력해주세요"><br><br>
			<button class="btn btn-primary">저장</button>
			<br><br>
			<hr>
			<label>주소</label> <br> <span style="font-size: 10px;">상세주소</span>
			<br> <input type="text" style="width: 400px;"> <br>
			<br> <input type="text" style="width: 400px;"> <br>
			<br> <span style="font-size: 10px;">우편번호</span> <br> <input
				type="text" style="width: 100px;"> <br>
			<br> <span style="font-size: 10px;">국가</span> <br> 
			<input
				type="text" style="width: 100px;"> 
			

			<button class="btn btn-primary">저장</button>
			
			<hr>

			<label>이메일</label> <br>
			<br> <span style="font-size: 10px;">변경할 이메일 주소</span> <br>
			<input type="text" style="width: 250px;"
				placeholder="변경할 이메일 주소를  써주세요"> <br>
			<br> <span>비밀번호 확인</span> <br> <input type="password"
				placeholder="현재 비밀번호를 입력해주세요" style="width:250px;"> <br>
			<br>
			<button class="btn btn-primary">저장</button>
			<br>
			<br>
			<hr>
			<label>비밀번호 변경</label> <br>
			<br> <span>현재 비밀번호</span> <br> <input type="password"
				style="width: 250px;" placeholder="현재 비밀번호를 입력해주세요"> <br>
			<br> <span>변경할 비밀번호</span> <br> <input type="password"
				style="width: 250px;" placeholder="변경할 비밀번호를 입력해주세요"> <br>
				<br>
				<span>변경할 비밀번호 확인</span><br>
				<input type="password" style="width: 250px;" placeholder="비밀번호를 확인해주세요"><br>
			
			<button class="btn btn-primary">저장</button>
			<br><br>
			<hr>
			<div>
				<label>알림 설정</label> <br> <input type="checkbox" id="chk1" ><label for="chk1" style="font-size: 13px;"> 게시한
				프로젝트에 입찰이 제출/업데이트/취소될시 </label><br>
				<br> <input type="checkbox" id="chk2"> <label for="chk2" style="font-size: 13px;">고객님이 즐겨찾기한 프로젝트에 입찰이 성공했을
				경우</label>
			</div>
			<br>

			<button type="button" class="btn btn-primary">저장</button>

			<br>
			<br>
			<hr>
			<label>계정 유형</label> <br>
			<br>
			<div>
				<label><input type="radio" name="optradio">구인</label>
				<label><input type="radio" name="optradio">구직</label>
			</div>
			<br>
			<br>
			<button type="button" class="btn btn-primary">저장</button>

			<br>
			<br>
			<hr>

			<label>계정 탈퇴</label> <br>
			<br>

			<div>
				<span style="font-size: 12px; font-weight: bolder;">떠나는 이유를
					말씀해 주시겠습니까?</span> <br>
				<br>
				<input type="checkbox" id="chkb1"><label for="chkb1" style="font-size: 13px;"> 개인정보 보호에 대해 염려됩니다.</label> <br>
				<input type="checkbox" id="chkb2"><label for="chkb2" style="font-size: 13px;"> 너무 많은 알림을 받습니다. </label><br>
				<input type="checkbox" id="chkb3"><label for="chkb3" style="font-size: 13px;"> 사이트 이용방법을 이해하지 못하겠습니다.</label> <br>
				<input type="checkbox" id="chkb4"><label for="chkb4" style="font-size: 13px;"> 잠시 중단했다가 다시 이용할겁니다.</label> <br>
				<input type="checkbox" id="chkb5"><label for="chkb5" style="font-size: 13px;"> 도움이 되지않습니다.</label> <br>
				<input type="checkbox" id="chkb6"><label for="chkb6" style="font-size: 13px;"> 기타 사유</label>


			</div>
			<br>
			<br> <span style="font-weight: bolder; font-size: 12px;">저희
				사이트에 대한 피드백을 부탁드리겠습니다.</span> <br>
			<textarea cols="30" rows="5" style="resize: none;"></textarea>


			<h3>계정 종료의 의미 :</h3>
			<h4>
				사용자의 프로필및 게시목록이 사라집니다. <br>
				<br> 더이상 알림을 받지 않게됩니다. <br>
				<br> 사이트에 다시 로그인 할수 없습니다.
			</h4>
			<button type="button" class="btn btn-danger">계정 탈퇴</button>
			<br><br><br>
		</form>
	</section>
	
	<%-- End Of Content --%>

	<%-- Footer --%>
	<jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
	<%-- End Of Footer --%>
</body>
</html>