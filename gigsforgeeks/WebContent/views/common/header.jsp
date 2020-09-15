<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <header id="header">
       <h1 id="letterMark">Gigs For Geeks</h1>
       <main id="headerMain">
           <nav id="headerMainNav">
               <a href="${contextPath}/views/project/search.jsp">탐색</a>
               <a href="${contextPath}/views/project/myProject.jsp">내 프로젝트</a>
               <a href="${contextPath}/views/message/message.jsp">메시지</a>
               <a href="">업데이트</a>
           </nav>
           <aside id="headerAside">
                <a href="${contextPath}/views/project/post.jsp">프로젝트 게시하기</a>
                <a href="${contextPath}/views/member/myAccount.jsp">내 계정</a>
           </aside>
       </main>
   </header>
</body>
</html>