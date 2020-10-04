<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Template HTML 1 : 일반 화면용 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/message.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>Message Keep</title>
</head>
<body>
  
    <%-- Content --%>
    <!--메세지 화면-->
    <div id="content">
        <!-- 메뉴바 -->
        <div id="con">           
            <div id="content_1">
                <div id="naviMain"><a href="${contextPath}/list.ms?currentPage=1">전체메세지</a></div>
                <div id="naviNotRead"><a href="${contextPath}/notRead.ms?currentPage=1">읽지않음(갯수)</a></div>
                <div id="naviKeep"><a href="${contextPath}/views/message/messageKeep.jsp">보관 메세지</a></div>
                 <div id="naviAdmin"><a href="${contextPath}/admin.ms?currentPage=1">고객 지원팀</a></div>
            </div>
        </div>
            
        <div id="main">
        <!-- 내용변경할곳 -->
        <!-- 보관 메세지 -->
		<!--검색창-->
        <div id="cont">
        <br>
        <h3>보관 메세지</h3>
            <div id="content_2" align="right">
                <form action="" id="search_form">
	                    <div id="search_text">
	                        <input class="form-control mr-sm-2" type="text" placeholder="회원ID">
	                    </div>
	                    
	                    <div id="search_btn1">
	                        <a href="${contextPath}/views/message/messageSend.jsp" id="btn1" class="btn btn-outline-info" type="submit">메세지 보내기</a>
	                	</div>
	                	<div id="search_btn2">
	                    	<a href="" id="btn2" class="btn btn-outline-info" type="submit">보관하기</a>
	                	</div>
                </form>
            </div>

            <div id="content_3">
            <table align="center" class="messageKeep">
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
		                <td>6</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-09-02</td>
		            </tr>
		            <tr>
		                <td>5</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-08-30</td>
		            </tr>
		            <tr>
		                <td>4</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-08-22</td>
		            </tr>
		            <tr>
		                <td>3</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-08-12</td>
		            </tr>
		            <tr>
		                <td>2</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_2.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-09-25</td>
		            </tr>
		            <tr>
		                <td>1</td>
		                <td><input type="checkbox"></td>
		                <td><img src="${contextPath}/resources/images/gigsforgeeks_usertype_1.png" alt="프로필"></td>
		                <td>보관메세지 제목자리</td>
		                <td>user01</td>
		                <td>2020-09-02</td>
		            </tr>
		       
		        </tbody>
		    </table>
		
		    <br><br>
		    
		    <div align="right" style="width:98%;">
       		 <button class="btn btn-outline-info" data-toggle="modal" data-target="#message_delete">보관메세지 삭제</button>
        	 <br><br>
   			</div>  
		
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
       <!-- The Modal -->
        <div class="modal" id="message_delete">
          <div class="modal-dialog">
            <div class="modal-content">
              
              <!-- Modal body -->
              <div class="modal-body" align="center">
             	<button type="button" class="close" data-dismiss="modal" style="font-family:sans-serif;">&times;</button> <br>
                <p>메세지를 정말로 삭제하시겠습니까?</p>
                <button id="btn4" class="btn btn-outline-info">OK</button>
                <button class="btn btn-outline-info">Cancel</button>
              </div>
            </div>
          </div>
        </div>
    </div>
 </div>
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>