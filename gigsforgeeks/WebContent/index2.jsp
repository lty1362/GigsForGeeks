<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Geeks Swim In Gigs! | Gigs For Geeks</title>
</head>
<body>
    <%-- Header --%>
    <jsp:include page="${contextPath}/views/common/header.jsp" flush="true"></jsp:include>
    <%-- End Of Header --%>
    
    <%-- Content --%>
    <main id="contentMain">
        <h2 id="contentTitle">Hello World!</h2>
        <section>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec sapien vestibulum, consectetur erat vitae, rhoncus tellus. Aliquam placerat vel tellus et tincidunt. In hendrerit posuere consequat. Ut vulputate consequat tellus. Donec eu consectetur sem. Nullam eu lobortis libero, eu fringilla est. Sed eleifend lectus ac sapien semper, eu mattis lacus finibus. Fusce pulvinar nec orci vitae cursus. Donec in maximus lorem, quis molestie elit.</p>
            <p>Integer eget lectus auctor, eleifend leo eget, pretium tellus. Mauris in ullamcorper enim. Aenean aliquam pharetra erat non imperdiet. Vestibulum porta libero eget libero pulvinar euismod. Suspendisse justo risus, consectetur a lorem nec, viverra convallis arcu. Mauris varius tortor aliquet pretium luctus. Fusce ac dolor non turpis laoreet mollis vitae eu lacus. In ullamcorper felis fermentum tincidunt molestie.</p>
            <p>Vivamus ex nunc, ornare nec euismod pellentesque, placerat eget sem. Sed auctor euismod augue, a vestibulum magna hendrerit venenatis. Nunc efficitur pellentesque facilisis. Proin sit amet viverra felis, a tempus libero. Praesent sodales justo neque, id placerat dui dapibus ut. In gravida mauris vitae pharetra commodo. Nunc pellentesque ullamcorper pharetra. In quis mollis ex, a malesuada urna. Nunc in egestas diam, mattis vehicula sapien. Etiam vel dictum eros. Ut et tellus quis massa mollis vestibulum.</p>
            <p>Pellentesque id lectus quis leo aliquam interdum. Curabitur justo sapien, tincidunt in sollicitudin nec, dapibus non odio. Nullam bibendum congue quam eu tincidunt. Morbi mi velit, aliquet a auctor eu, posuere egestas massa. Curabitur eu dignissim metus. Nullam ut lectus ligula. Nunc consequat posuere dui at semper.</p>
            <p>Quisque at purus ut ligula tempor lacinia id et nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam a nisi sit amet nibh molestie pretium non ut orci. Curabitur sem lorem, mattis ut pellentesque a, commodo non velit. Suspendisse eu purus a mauris consequat facilisis. Ut sagittis est ac pharetra rhoncus. Vestibulum nisl massa, scelerisque non gravida quis, feugiat non nisl. Nam viverra, neque eget tempus tincidunt, magna diam commodo nulla, quis pellentesque nisi velit vitae nibh. Nullam viverra posuere dictum.</p>
        </section>
    </main>	
    <%-- End Of Content --%>
    
    <%-- Footer --%>
    <jsp:include page="/views/common/footer.jsp" flush="true"></jsp:include>
    <%-- End Of Footer --%>
</body>
</html>