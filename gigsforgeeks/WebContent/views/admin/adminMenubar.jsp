<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenubar</title>
<style>

    /* 메인 틀 잡기 */
    div{
        /* 테두리 검정틀 */
        /* border: 1px solid black; */
        box-sizing: border-box;
    }

    .wrap{
        width: 1200px;
        height: 1200px;
        margin: auto;
    }

    .wrap>div{width: 100%;}
    #content{height: 100%;}

    #content>div{height: 100%; float: left;}

    #content_l{width: 20%; background: rgba(23, 34, 59, 0.95); color: white;}
    #content_r{width: 80%;}

    /* 세부 틀 잡기 */
    #content_l_high{height: 10%; text-align: center; padding-top: 30px; font-size: 35px; font-weight: 700;}
    #content_l_mid{height: 15%; padding: 20px;}
    #content_l_navi{height: 75%;}

    #content_r_header{height: 10%; background: rgba(107, 119, 141, 0.21);}
    #content_r_header_r{width: 10%; height: 100%; float: left;}
    #content_r_header_m{width: 40%; height: 100%; float: left;}
    #content_r_header_l{width: 50%; height: 100%; float: left;}

    #content_r_center{height: 90%;}
    #content_r_center_h{height: 15%;}
    #content_r_center_m{height: 30%;}
    #content_r_center_r{height: 55%;}

    #navi_main{
        width: 100%;
        height: 55px;
        line-height: 55px;
        text-align: center;
        font-size: 23px;
        font-weight:800;
        background: rgb(23, 34, 59);
        cursor:pointer;
    }

    #navi_sub{
        width: 100%;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-size: 15px;
        font-weight:600;
        color: rgb(190, 190, 190);
        cursor:pointer;
    }

    #navi_sub:hover{
        background: rgb(127, 127, 127, 0.3);
        color: goldenrod;
        font-size: 19px;
        font-weight: 900;
    }

    #content_r_header,#content_r_center_h{
        color: rgb(23, 34, 59);
    }
</style>
<!-- <script src="resources/js/jquery-3.5.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<div id="content">

			<!-- 화면 좌측 -->
			<div id="content_l">
				<div id="content_l_high">Admin Page</div>
				<div id="content_l_mid">
					<label id="adminId" style="font-size: 30px; font-weight: 600;">홍길동</label>
					<label
						style="color: lightslategray; font-size: 14px; font-weight: 600;">님
						반갑습니다.<br> <br> 좋은 하루 되세요.
					</label> <br> <br>

					<button>로그아웃</button>
				</div>

				<!-- 좌측 상세메뉴 -->
				<div id="content_l_navi">
					<div id="navi_main">회원관리</div>
					<div id="navi_sub">전체회원 보기</div>
					<div id="navi_sub">우수 프리랜서</div>
					<div id="navi_sub">멤버십 회원</div>
					<div id="navi_sub">신고내역</div>
					<div id="navi_main">프로젝트 관리</div>
					<div id="navi_sub">전체 프로젝트</div>
					<div id="navi_sub">마감된 프로젝트</div>
					<div id="navi_main">고객지원 관리</div>
					<div id="navi_sub">FAQ관리</div>
					<div id="navi_sub">1:1 문의</div>
				</div>
			</div>

			<!-- 화면 우측 -->
			<div id="content_r">

				<!-- 우측 상단 헤더 -->
				<div id="content_r_header">
					<div id="content_r_header_r"></div>
					<div id="content_r_header_m">
						<div style="font-size: 20px; margin-top: 60px; font-weight: 700;">
							HOME > MAIN > 회원관리
						</div>
					</div>

					<!-- 우측메인 로고 -->
					<div id="content_r_header_l" style="text-align: right; padding-right: 20px; padding-top: 20px;">
						<b style="font-size: 60px;">G</b><b style="font-size: 37px;">igs for Geeks</b>
					</div>
				</div>

				<!-- 우측 메인 -->
				<div id="content_r_center">
					<div id="content_r_center_h">
						<h1 style="margin-left: 50px; font-size: 50px;">전체 회원 보기</h1>
					</div>
					<div id="content_r_center_m"></div>
					<div id="content_r_center_r"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

