<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/png" href="resources/images/favicon.png">
<title>Geeks Swim In Gigs! | Gigs For Geeks</title>
</head>
<body>
    <%-- Header --%>
    <jsp:include page="${contextPath}/views/common/header.jsp" flush="true"></jsp:include>
    <%-- End Of Header --%>
    
    <%-- Content --%>
    <main id="contentMain">
        <section>
        
        <jsp:include page="/views/common/introduceFirst.jsp" flush="true"></jsp:include>

        <jsp:include page="/views/common/introduceSecond.jsp" flush="true"></jsp:include>
        
        </section>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>