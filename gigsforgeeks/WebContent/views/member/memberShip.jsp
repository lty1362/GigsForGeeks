<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/member.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Member Ship</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
	<div id="memberShip">
		<h1>GFG 맴버쉽 가입 이용</h1>
		<b> 프리랜서로서의 성공과 수입 확대를 최대화하고자 하는 목적으로 설계되어 있습니다! <br> 연간 멤버십
			가입 비용에서 최대 20%까지 할인해 드리고 있습니다. <br> 언제든지 멤버십을 변경하실 수 있고, 각각에 따른
			조건이 적용됩니다. <br> FAQ(자주 묻는 질문) 자료를 함께 참고하여 주십시오.
		</b>
		<div id="money">
			<p>10,000₩</p>
			<button type="button" class="btn btn-outline-info">멤버쉽 등록</button>
		</div>
		<div id="memberShipImg" align="center">
			<table>
				<tr>
					<td><img src="${contextPath}/resources/images/message.png" alt=""> <br>
						<p>
							<b>전용 초대장</b> <br>
							<br> 멤버쉽의 경우에는 저희 고객지원에서 매일 최상위 프로젝트를 선별하여, 이에 입찰하실 수
							있도록 개별적으로 초대해 드리고 있습니다.
						</p></td>
					<td><img src="${contextPath}/resources/images/money.png" alt=""> <br>
						<p>
							<b>고가 입찰</b> <br>
							<br> 고액 프로젝트에 입찰할 수 있는 실력과 함께 프리랜서 일을 본격적으로 시작해 보세요.
						</p></td>
					<td><img src="${contextPath}/resources/images/FunctionTitle.png" alt=""> <br>
						<p>
							<b> 선불 수수료는 지불 NO!</b> <br>
							<br> 멤버쉽의 경우에는 수수료 지불 방식에서도 혜택이 주어집니다.
						</p></td>
					</tr>
			</table>
		</div>
			<h2>FAQ(자주 찾는 질문)</h2>
			<div id="faq1" align="center">
			<table id="faq">
				<tr>
					<td>
						<p>
							왜 업그레이드해야 하나요? <br> <b>- 베이직, 플러스, 프로페셔널 또는 프리미어 회원이 되시면
								더 많은 수입을 올리실 수 있습니다. <br> 프로젝트에 더 많이 입찰하고, 더 많은 기술을 추가하세요. <br>
								프로젝트를 게시할 때 업그레이드 할인을 받을 뿐 아니라 특별 리워드도 잠금해제가 가능합니다! <br>
							<br>
							</b> 멤버십을 변경할 수 있나요? <br> <b> - 당연하죠! 추가 혜택을 바로 받으실 수 있도록 멤버십
								플랜을 언제든지 업그레이드하세요. <br> 또는 멤버십을 다운그레이드하는 경우, 현재 멤버십이 만료되어 낮은
								멤버십으로 전환될 때까지 그 혜택을 계속 누리실 수 있습니다.
							</b>
						</p>
					</td>
					<td>
						<p>
							선호 프리랜서 프로그램이란 무엇인가요? <br> <b> - 선호 프리랜서 프로그램과 함께 최고의
								프로젝트에 전용 액세스하실 수 있습니다. <br>
							<br>
							</b> 내 멤버쉽을 취소할 수 있습니까? <br> <b> - 예, 추가 비용없이 언제든지 멤버십을 취소하실
								수 있습니다. </b>
						</p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>