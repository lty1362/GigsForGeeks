<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../views/common/header2.jsp" %>

	<meta charset="UTF-8">
   	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminCommon.css">
	<title>관리자 메인페이지 = 회원전체조회 페이지</title>
</head>
<body>
    <div class="wrap">
        <div id="content">
        
        	<!-- 좌측 메뉴바 -->
        	<div id="content_l">
			    <jsp:include page="/views/admin/adminMenubar.jsp" flush="true"></jsp:include>
        	</div>
        	
        	<!-- 우측 문의조회 -->
        	<div id="content_r">

                <!-- 여기서부터 복사-->
                <div id="content_r_header">
                    <div id="content_r_header_r"></div>
                    <div id="content_r_header_m">
                        <div style="font-size: 20px; margin-top: 60px; font-weight: 700;"> HOME > MAIN > 회원관리</div>
                    </div>

                    <!-- 우측메인 로고 -->
                    <div id="content_r_header_l" style="text-align: right; padding-right: 20px; padding-top: 20px;">
                        <b style="font-size: 60px;">G</b><b style="font-size: 37px;">igs for Geeks</b>
                    </div>
                </div>

                <!-- 우측 메인 : 회원조회 -->
                <div id="content_r_center"> 
                
                    <!-- 회원조회 영역 -->

                    <h1 style="padding-left: 30px; padding-top: 20px;">1:1 문의내역</h1>

                    <hr>

                    <div id="content_r_center_m">

                        <div class="btn-group" id="jobType" role="group" style="float: right;">
                            <button type="button" class="btn btn-default">고용주</button>
                            <button type="button" class="btn btn-default">프리랜서</button>
                        </div>

                        <br><br><br>

                        <table class="table table-hover, listArea">
                            <thead>
                                <tr>
                                    <td style="width: 50px;">No</td>
                                    <td style="width: 200px;">문의 제목</td>
                                    <td style="width: 300px;">답변 여부</td>
                                    <td style="width: 200px;">문의 일자</td>
                                    <td style="width: 200px;">상세 조회</td>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td>문의제목입니닷</td>
                                    <td>응?</td>
                                    <td>2020-20-20</td>
                                    <td>상세조회</td>
                                </tr>
                                <tr>
                                    <td colspan="7">조회된 리스트가 없습니다.</td>
                                </tr>
                            </tbody>

                        </table>
	               	</div>
	                <!-- 복사 여기까지 끝 -->
	                
				</div>
        	</div>
        </div>
    </div>
</body>
</html>