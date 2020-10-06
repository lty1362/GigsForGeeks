<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Template HTML 1 : 일반 화면용 --%>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.project.model.vo.*" %>
<%@ page import="java.util.ArrayList, com.gigsforgeeks.service.model.vo.FAQ" %>
<%	
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String contextPath = request.getContextPath();
	
   	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%-- Header --%>
	<%@ include file="../../views/common/header.jsp" %>
	<!-- 필요한 외부 파일은 여기서 불러오세요 -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/service.css">
	<%-- End Of Header --%>
	<!-- 페이지의 타이틀을 작성하세요 -->
	<title>문의하기 상세 페이지</title>
	
<style type="text/css">
	
    /* 상단 카테고리 스타일 */
    #faqCategory{
    	padding:5px;
        list-style-type: none;
    }

    #faqCategory>li{
        float:left;
        width: 20%;
        text-align: center;
        vertical-align: middle;
    }

    #faqCategory a{
        text-decoration: none;
        background: #28a745;;
        color: white;
        font-size: 18px;
        font-weight: 900;
        display: block; 
        line-height: 50px;
    }

    #faqCategory a:hover{
        color: black;
        font-size:20px;
        font-weight: 900;
    }
    
    
    /* 테이블 리스트 스타일 */
	.tableView{
		padding: 30px;
		font-size: 15px;
	}
	
	th {background:rgb(0, 255, 125, 0.2); font-size:20px;}

	div.modal-content>table>tfoot, tbody {
	   	text-align: center;
	}
	
	.listArea{
        text-align:center;
    }
    .listArea>tbody>tr:hover{
        background:rgb(23, 34, 59, 0.1);
        cursor:pointer;
    }
	
	.detailView{
		width: 100%;
		height: 150px;
	}
	
	/* 문의내역 내 스타일 */
	.faqDetailContent{
		text-align:left;
		width: 100%;
		height: 100%;
		border-radius: 3px;
		border: 2px solid rgb(23, 34, 59, 0.2);
	}
	
	.faqDetailView{
		width: 100%;
		height: 100%;
		float:left; 
		padding: 10px;
		margin:10px;
		color: rgb(23, 34, 59);
		border: 3px solid rgb(23, 34, 59, 0.4);
		border-radius: 5px;
		box-sizing: border-box;
	}
	
</style>
</head>
<body>
    <%-- Content --%>
    <!-- 여기서부터 내용 작성하면 됩니다. -->
    <main id="contentMain">
    
        <div class="wrap">
        
	        <h1 align="center">무엇을 도와드릴까요?</h1>
	        <br>
	
<%--미구현 	        <div id="question">
		        <form action="${contextPath}/notYet.enq" method="POST">
		            <input id="question1" type="text" placeholder="무엇을 도와드릴까요?">
		            <button id="question2">검색</button>
	            </form>
	        </div> --%>
	
	        <hr>
        
	        <br><br>
	
	        <table class="table table-hover, listArea" id="faqList">
	        	<thead>
		            <tr>
		                <th width="100">문의 유형</th>
		                <th width="600">문의 제목</th>
		                <!-- <th width="100">조회수</th> -->
		                <th width="100">등록일</th>
		            </tr>
				</thead>

       		 	<tbody>
		            <% if(list.isEmpty()) { %>
	                <tr>
	                	<td colspan="4">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else {%>
					
		            	<% for(FAQ faq : list) { %>
		                <tr>
	                     	<td><%= faq.getFaqCategory() %></td>
	                        <td><%= faq.getFaqTitle() %></td>
	                        <%-- <td><%= faq.getFaqCount() %></td> --%>
		                        
							<% if(faq.getFaqRegister() == null) { %>
	                       		<td>-</td>
		   					<% } else { %>
	                       		<td><%= faq.getFaqRegister() %></td>
	                        <% } %>
		                        
						</tr>
						<tr>
				            <td colspan="3">
				            	<div class="detailView">
					            	<div class="faqDetailView">
					            		<div class="faqDetailContent">
						            	<% if(faq.getFaqContent() == null) { %>
				                       		<b>아직 답장이 안왔습니다.</b>
					   					<% } else { %>
						                	<b><%= faq.getFaqContent() %></b>
				                        <% } %>
			                        	</div>
			                        </div>
		                        </div>
				            </td>
				        </tr>
	                   	<% } %>
	                    	
					<% } %>
                </tbody>	
	        </table>
        
        
	   	    <!-- 페이징 -->
	      	<div class="pagingArea" align="center">
	 			<% if(currentPage != 1){ %>
		           <!-- 맨 처음으로 (<<) -->
		           <button class="btn btn-info" onclick="location.href='<%=contextPath%>/faq?currentPage=1';"> &lt;&lt; </button>
		           <!-- 이전페이지로 (<) -->
		           <button class="btn btn-info" onclick="location.href='<%=contextPath%>/faq?currentPage=<%=currentPage-1%>';"> &lt; </button>
				<% } %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					<% if(p != currentPage){ %>
		          	<button class="btn btn-info" onclick="location.href='<%=contextPath%>/faq?currentPage=<%=p%>';"><%= p %></button>
		          	<% }else{ %>
		          	<button class="btn btn-info" disabled><%= p %></button>
		          	<% } %>
	          	<% } %>
				
				<% if(currentPage != maxPage){ %>
		           <!-- 다음페이지로 (>) -->
		           <button class="btn btn-info" onclick="location.href='<%=contextPath%>/faq?currentPage=<%=currentPage+1%>';"> &gt; </button>
		           <!-- 맨 끝으로 (>>) -->
		           <button class="btn btn-info" onclick="location.href='<%=contextPath%>/faq?currentPage=<%=maxPage%>';"> &gt;&gt; </button>
				<% } %>
	        </div>
        
        
        	<br><br>
        
	        <div class="footerMenu" align="center">
		        <% if(loginUser == null) { %>
		        <h4>문의를 원하시면 <a href="${contextPath}/views/member/login.jsp">회원가입</a>을 해주시기 바랍니다. </h4>
		       
		        <% } else {%>
		        <h4>문의를 원하시면 아래 버튼을 클릭해주시기 바랍니다.</h4>
		        <a class="btn btn-success btn-lg" href="${contextPath}/enquiryEnrollForm">문의하기</a>
		        <a class="btn btn-info btn-lg" href="${contextPath}/enquiryMyPage?currentPage=1">내 문의내역</a>
	        <% } %>
	        </div>
	 	</div>

        <!-- 테이블 클릭시 조회 -->
        <script>
    		$(document).ready(function () {
	            $("#faqList tr:odd").addClass("odd");
	            
	            $("#faqList tr:not(.odd)").hide();	// 처음화면 숨기기 기능
	            $("#faqList tr:first-child").show(); 	// 열머리글 보여주기
	
	            $("#faqList tr.odd").click(function () {
	                $(this).next("tr").toggle(300);
	                $(this).find(".arrow").toggleClass("up");
	            });
	        });
	    </script>
	    
	    
	    <!-- --------------------------------	test	------------------------------------ -->
	    
   <!--      Ajax Test
        <div id="btnfaqCategory" role="group">
			<button onclick="faqCategory();">일반</button>  
			
			<table id="faqCategory" border="1" style="text-align:center">
				<thead>
					<tr>
						<th>문의유형</th>
						<th>문의제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>      
				
        </div>
       
       
       
       
      	테이블 ajaxPage
	    <script>
	    	function faqCategory(){
	    		
	    		$.ajax({
	    				url:"faqCategory.do",
	    				type:"get",
	    				success:function(list){
	    					
	    					console.log(list); // 테스트
	    					
	    					var result = "";
	    					
	    					for(var i=0; i<list.length; i++){
	    						
	    						result += "<tr>" +
	    									"<td>" + list[i].getFaqCategory() + "</td>" +
	    									"<td>" + list[i].getFaqTitle() + "</td>" +
	    									"<td>" + list[i].getFaqRegister() + "</td>" +
	    								  "</tr>"; 
	    					}
	    					
	    					console.log(result);
	    					
	    					$("#btnfaqCategory tbody").html(result);
	    		
	    				}, error:function(){
	    					console.log("ajax 통신 실패");
	    				}
	    		
	    		});
	    	}
	    </script>	 
	    
	    -->
	    
	    
	       <%--  <!-- 상단 메뉴바 -->
	        <div id="faqCategory" role="group">
		        <ul id="faqCategory">
		            <li><a href="">일반</a></li>
		            <li><a href="">프로젝트</a></li>
		            <li><a href="">지불관련</a></li>
		            <li><a href="">멤버십</a></li>
		            <li><a href="">프로필</a></li>
		        </ul>
	        </div>
        
	        <br><br>
	
	        <table class="table table-hover, listArea" id="faqList">
	        	<thead>
		            <tr>
		                <th width="100">문의 유형</th>
		                <th width="600">문의 제목</th>
		                <!-- <th width="100">조회수</th> -->
		                <th width="100">등록일</th>
		            </tr>
				</thead>

       		 	<tbody>
		            <% if(list.isEmpty()) { %>
	                <tr>
	                	<td colspan="4">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else {%>
					
		            	<% for(FAQ faq : list) { %>
		                <tr>
	                     	<td><%= faq.getFaqCategory() %></td>
	                        <td><%= faq.getFaqTitle() %></td>
	                        <td><%= faq.getFaqCount() %></td>
		                        
							<% if(faq.getFaqRegister() == null) { %>
	                       		<td>-</td>
		   					<% } else { %>
	                       		<td><%= faq.getFaqRegister() %></td>
	                        <% } %>
		                        
						</tr>
						<tr>
				            <td colspan="3">
				            	<div class="detailView">
					            	<div class="faqDetailView">
					            		<div class="faqDetailContent">
						            	<% if(faq.getFaqContent() == null) { %>
				                       		<b>아직 답장이 안왔습니다.</b>
					   					<% } else { %>
						                	<b><%= faq.getFaqContent() %></b>
				                        <% } %>
			                        	</div>
			                        </div>
		                        </div>
				            </td>
				        </tr>
	                   	<% } %>
	                    	
					<% } %>
                </tbody>	
	        </table> --%>	    
	    
	    
	    
	    
	    
	    
	    
	    <!-- --------------------------------	test	------------------------------------ -->
	    
	    
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>