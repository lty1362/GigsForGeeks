<%-- EL 활성화 및 JSTL 설정  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ContextPath 변수 선언 및 초기화 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- EL 활성화 / JSTL 설정 / ContextPath 변수 선언 및 초기화 끝 --%>

<%@ page import="com.gigsforgeeks.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	// > 로그인 전 : null
	// > 로그인 후 : 로그인성공한 회원정보들이 담겨있는 객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	// > 서비스요청 전 : null
	// > 서비스요청 성공 후 : alert 띄워줄 메세지 문구
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/png" href="${contextPath}/resources/images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>
    <script>
    	/* jQuery에서 사용할 contextPath 변수 선언 및 초기화 */
    	var $contextPath = "${contextPath}";
    	
    	/* 사용자 요청 성공시 alert 메시지 띄워주는 script */
    	window.onload = function() {
    		var msg = "${alertMsg}";
    		
    		if(msg != "null" && msg != "") {
    			alert(msg);
    		}
    	}
    </script>
    <c:remove var="alertMsg" scope="session" />
    <style>
        #trigger{float: right; width: 80px; height: 25px;}
        div.modal-content{width: 350px; height: 450px; position: absolute; right: 10px;} 
        div.modal-content>table{width: 100%; height: 100%; box-sizing: border-box;}
        div.modal-header{width: 100%; height: 100%; box-sizing: border-box;}
        div.modal-dialog{ position: absolute; right: 10px;}
        div#trigger>img#test2{width: 25px; height: 25px; p}
        div.modal-content>table>tfoot, tbody{text-align: right;}
        #trigger:hover{cursor: pointer;}
        div.modal-content>table>thead{text-align: center;}
        div#trigger>a#myAccount{font-size: 10px;} 
    </style>
</head>
<body>
    <header id="header">
    	<%-- 로고 이미지 --%>
        <a href="${contextPath}"><img src="${contextPath}/resources/images/gigsforgeeks_logo.png" alt="Gigs For Geeks" id="letterMark"></a>
            <%-- 로그인 전에 보여지는 main 시작 --%>
            <% if(loginUser == null) { %>
                <main id="headerMain">
                    <nav id="headerMainNav">
                        <a style="cursor:pointer" id="searchSelect">탐색</a>
                        
                        <script>
                        $(document).ready(function(){
                    	    $("#searchSelect").mouseenter(function(){
                    	        $("#popupLayer").modal();
                    	    });
                    	 
                    	  $(document).ready(function(){
                    		    $("#searchSelect").mouseleave(function(){
                    		        $("#popupLayer").modal();
                    		});
                        </script>
                        
                        <!-- 탐색 팝업폼 레이어  -->
                        <div id="popupLayer" style="height:320px;">
                            <div>
                                <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
                            </div>
                                <!-- 레이어 안의 내용 -->
                                <form action="" method="GET">
                                    <input type="text" name="totalSearch" id="searchInput" placeholder="채용 정보 찾아보기">
                                    <button type="submit" onclick="window.open('${contextPath}/views/project/totalSearch.jsp')" class="btn btn-info">검색</button>
                                </form>
                                <br>
                                <a href="${contextPath}/projectList.do?currentPage=1">
                                <img src="${contextPath}/resources/images/project.png">프로젝트</a>
                                <label><small>일할만한 프로젝트 탐색</small></label>
                                <br><br>
                                <a href="${contextPath}/freelancerList.do">
                                <img src="${contextPath}/resources/images/freelancer.png">프리랜서</a>
                                <label><small>프리랜서 탐색</small></label>
                                <br><br>
                                <a href="${contextPath}/excellent.do">
                                <img src="${contextPath}/resources/images/greatFreelancer.png">우수 프리랜서</a>
                                <label><small>평점이 높은 프리랜서 탐색</small></label>
                                <br><br>
                        </div>
                        
                        <script>
                        function closeLayer( obj ) {
                        	$(obj).parent().parent().hide();
                        }

                        $(function(){

                        	$('#searchSelect').click(function(e)
                        	{
                        		var sWidth = window.innerWidth;
                        		var sHeight = window.innerHeight;

                        		var oWidth = $('#popupLayer').width();
                        		var oHeight = $('#popupLayer').height();

                        		var divLeft = e.clientX + 10;
                        		var divTop = e.clientY + 5;

                        		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
                        		if( divTop + oHeight > sHeight ) divTop -= oHeight;

                        		if( divLeft < 0 ) divLeft = 0;
                        		if( divTop < 0 ) divTop = 0;

                        		$('#popupLayer').css({
                        			"top": divTop,
                        			"left": divLeft,
                        			"position": "absolute"
                        		}).show();
                        	});
                        });

                        </script>
                        <!-- 탐색 팝업폼 레이어 끝  -->

                        <a href="${contextPath}/post.proj">프로젝트 등록</a>
                        <a href="${contextPath}/faq?currentPage=1">문의하기</a>
                    </nav>
                    <aside id="headerAside">
                        <a href="${contextPath}/login.me">로그인</a>
                        <a href="${contextPath}/signUp.me">회원가입</a>
                    </aside>
                </main>
	        <% } else { %>
            <%-- 로그인 전에 보여지는 main 끝 --%>
            
            <%-- 로그인 후에 보여지는 main 시작 --%>
	            <main id="headerMain">
                    <nav id="headerMainNav">
                        <a style="cursor:pointer" id="searchSelect">탐색</a>
                        <script>
                        $(document).ready(function(){
                    	    $("#searchSelect").mouseenter(function(){
                    	        $("#popupLayer").modal();
                    	    });
                    	 
                    	  $(document).ready(function(){
                    		    $("#searchSelect").mouseleave(function(){
                    		        $("#popupLayer").modal();
                    		});
                        </script>
                        
                        <!-- 탐색 팝업폼 레이어  -->
                        <div id="popupLayer">
                            <div>
                                <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
                            </div>
                                <!-- 레이어 안의 내용 -->
                                <form action="" method="GET">
                                    <input type="text" name="totalSearch" id="searchInput" placeholder="채용 정보 찾아보기">
                                    <button type="submit" onclick="window.open('${contextPath}/views/project/totalSearch.jsp')" class="btn btn-info">검색</button>
                                </form>
                                <br>
                                <a href="${contextPath}/projectList.do?currentPage=1">
                                <img src="${contextPath}/resources/images/project.png">프로젝트</a>
                                <label><small>일할만한 프로젝트 탐색</small></label>
                                <br><br>
                                <a href="${contextPath}/freelancerList.do">
                                <img src="${contextPath}/resources/images/freelancer.png">프리랜서</a>
                                <label><small>프리랜서 탐색</small></label>
                                <br><br>
                                <a href="${contextPath}/excellent.do">
                                <img src="${contextPath}/resources/images/greatFreelancer.png">우수 프리랜서</a>
                                <label><small>평점이 높은 프리랜서 탐색</small></label>
                                <br><br>
                                <a href="${contextPath}/views/project/favoriteProject.jsp">
                                <img src="${contextPath}/resources/images/favorite.png">즐겨찾기</a>
                                <label><small>내가 즐겨찾기한 프로젝트 탐색</small></label>
                        </div>
                        
                        <script>
                        function closeLayer( obj ) {
                        	$(obj).parent().parent().hide();
                        }

                        $(function(){

                        	$('#searchSelect').click(function(e)
                        	{
                        		var sWidth = window.innerWidth;
                        		var sHeight = window.innerHeight;

                        		var oWidth = $('#popupLayer').width();
                        		var oHeight = $('#popupLayer').height();

                        		var divLeft = e.clientX + 10;
                        		var divTop = e.clientY + 5;

                        		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
                        		if( divTop + oHeight > sHeight ) divTop -= oHeight;

                        		if( divLeft < 0 ) divLeft = 0;
                        		if( divTop < 0 ) divTop = 0;

                        		$('#popupLayer').css({
                        			"top": divTop,
                        			"left": divLeft,
                        			"position": "absolute"
                        		}).show();
                        	});
                        });

                        </script>
                        <!-- 탐색 팝업폼 레이어 끝  -->
                        
                        <a href="${contextPath}/list.proj">내 프로젝트</a>
                        <a href="${contextPath}/list.ms?currentPage=1">메시지</a>
                        <a href="${contextPath}/update.proj?currentPage=1">업데이트</a>
                        <a href="${contextPath}/faq?currentPage=1">문의하기</a>
                    </nav>
                    <aside id="headerAside">
                        <a href="${contextPath}/post.proj">프로젝트 게시하기</a>
                        <div id="trigger" align="center">
                            <img src="${contextPath}/resources/images/avatar.png" id="test2"  data-toggle="modal" data-target="#myModal" ></img>
                            
                            <a id="myAccount" data-toggle="modal" data-target="#myModal" style="color: white;font-size: 15px;">내 계정</a>
                        </div>
                        <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>재정현황</th>
                                                <th>계정</th>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><hr style="border: double 1px blue;"></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                                <tr>
                                                <td><a href="" style="color: black;"></a></td>
                                                <td><a href="${contextPath}/LoadingUser.load" style="color: black;">내 프로필</a></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><a href="${contextPath}/memberShip.me" style="color: black;">맴버쉽</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="" style="color: black;"></a></td>
                                                <td><a href="" style="color: black;"></a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="" style="color: black;"></a></td>
                                                <td><a href="${contextPath}/faq?currentPage=1" style="color: black;">고객지원 요청</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="" style="color: black;"></a></td>
                                                <td><a href="${contextPath}/setup.set" style="color: black;">계정설정</a></td>
                                            </tr>
                                            <tr>
                                                <td><a href="${contextPath}/payment.me" style="color: black;">재정설정</a></td>
                                                <td><a href="${contextPath}/logout.me" style="color: black;">로그아웃</a></td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td></td>
                                                <td><a href="${contextPath}/email.con" style="color: black;">인증페이지</a></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
  
                            </div>
                        </div>
                    </aside>
                </main>
	        <% }%>
            <%-- 로그인 후에 보여지는 main 끝 --%>
    </header>
</body>
</html>