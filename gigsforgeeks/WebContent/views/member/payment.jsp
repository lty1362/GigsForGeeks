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
	<title>Payment Account</title>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
       <h1>결제정보 등록</h1>
        <div id="accountInfor">
            <table id="accountIn">
                <tr>
                    <th><h3>계좌 설정</h3></th>
                </tr>
                <tr>
                    <td colspan="2">
                        	계좌번호 <br>
                        <input type="text" name="account" id="account" placeholder="계좌번호를 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <td>
                       	 은행 <br>
                        <select name="bank" id="bank">
                            <option value="kn">NH농협</option>
                            <option value="kb">KB국민</option>
                            <option value="sinhan">신한</option>
                            <option value="woori">우리</option>
                            <option value="hana">하나</option>
                            <option value="ibk">IBK기업</option>
                            <option value="sc">SC제일</option>
                            <option value="citi">씨티</option>
                            <option value="kfcc">새마을</option>
                            <option value="epostbank">우체국</option>
                        </select>
                    </td>                  
                    <td>
                       	 예금주 <br>
                        <input type="text" name="Name" id="Name" placeholder="예금주명을 입력해주세요.">
                    </td>
                </tr>
            </table>
            <div>
               <button id="bankBtn" class="btn btn-outline-info">제출</button>
            </div>
        </div>
        
        <br>

        <div id="cardInfor">
            <table id="cardIn">
                <tr>
                    <th><h3>신용카드 설정</h3></th>
                </tr>
                <tr>
                    <td colspan="2">
                       	 카드번호 <br>
                        <input type="text" name="card" id="card" placeholder="카드번호를 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <td>
                        cvc (보안카드) <br>
                        <input type="text" name="cvc" id="cvc">
                    </td>
                    <td>
                        	유효기간 <br>
                        <input type="month" name="validity" id="validity">
                    </td>
                    <td>
                        	은행 <br>
                        <select name="bank" id="bank">
                            <option value="kn">NH농협</option>
                            <option value="kb">KB국민</option>
                            <option value="sinhan">신한</option>
                            <option value="woori">우리</option>
                            <option value="hana">하나</option>
                            <option value="ibk">IBK기업</option>
                            <option value="sc">SC제일</option>
                            <option value="citi">씨티</option>
                            <option value="kfcc">새마을</option>
                            <option value="epostbank">우체국</option>
                        </select>
                        
                    </td>
                </tr>
            </table>
            <div>
              <button id="cardBtn" class="btn btn-outline-info">제출</button>
            </div>
        </div>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>