<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- EL 활성화 / JSTL 설정 / ContextPath 변수 선언 및 초기화 끝 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!--검색창-->
        <div id="cont">
            <div id="content_2" align="right">
                <form action="" id="search_form">
	                    <div id="search_text">
	                        <input class="form-control mr-sm-2" type="text" placeholder="회원ID">
	                    </div>
	                    
	                    <div id="search_btn1">
	                        <a href="" id="btn1" class="btn btn-outline-info" type="submit">메세지 보내기</a>
	                	</div>
	                	<div id="search_btn2">
	                    	<a href="" id="btn2" class="btn btn-outline-info" type="submit">보관하기</a>
	                	</div>
                </form>
            </div>

            <div id="content_3">
            
            <table align="center" class="messageFull">
		        <thead>
		            <tr>
		                <th width="70"></th>
		                <th width="70"></th>
		                <th width="70"></th>
		                <th width="300"></th>
		                <th width="100"></th>
		                <th width="100"></th>
		            </tr>
		        </thead>
		        <tbody>
		         	<tr>
		                <td>7</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-09-25</td>
		            </tr>
		            <tr>
		                <td>6</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-09-02</td>
		            </tr>
		            <tr>
		                <td>5</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-08-30</td>
		            </tr>
		            <tr>
		                <td>4</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-08-22</td>
		            </tr>
		            <tr>
		                <td>3</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-08-12</td>
		            </tr>
		            <tr>
		                <td>2</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-09-25</td>
		            </tr>
		            <tr>
		                <td>1</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>제목자리</td>
		                <td>user01</td>
		                <td>2020-09-02</td>
		            </tr>
		       
		        </tbody>
		    </table>
		
		    <br><br>
		
		    <div class="pagingArea" align="center">
		
		        <!-- 맨 처음으로 (<<) -->
		        <button class="btn btn-outline-info"> &lt;&lt; </button>
		        <!-- 이전페이지로 (<) -->
		        <button class="btn btn-outline-info"> &lt; </button>
		
		        <button class="btn btn-outline-info">1</button>
		        <button class="btn btn-outline-info">2</button>
		        <button class="btn btn-outline-info">3</button>
		        <button class="btn btn-outline-info">4</button>
		        <button class="btn btn-outline-info">5</button>
		        <button class="btn btn-outline-info">6</button>
		        <button class="btn btn-outline-info">7</button>
		        <button class="btn btn-outline-info">8</button>
		        <button class="btn btn-outline-info">9</button>
		        <button class="btn btn-outline-info">10</button>
		
		        <!-- 다음페이지로 (>) -->
		        <button class="btn btn-outline-info"> &gt; </button>
		        <!-- 맨 끝으로 (>>) -->
		        <button class="btn btn-outline-info"> &gt;&gt; </button>
		
		    </div>
        </div> 
   </div>   
</body>
</html>