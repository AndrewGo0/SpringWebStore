<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>

<html>
<head>
    <meta charset = "UTF-8">
    <title>Login</title>
    <%@ include file = "/WEB-INF/jspf/style.jspf"%>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<header>
    <div class="logo">
        <a href="${pageContext.request.contextPath}/store"><i class="material-icons" id = "graphiclogo">store</i></a>
        <nav class="topnav" id="mytopnav">
            <a href="${pageContext.request.contextPath}/profile"><fmt:message key="profile"/></a>

            <a href="#"><fmt:message key="news"/></a>
            <a href="#"><fmt:message key="about.us"/></a>
            <c:if test="${sessionScope.userRole == null}">
                <a href="${pageContext.request.contextPath}/login"><fmt:message key="login"/></a>
                <a href="${pageContext.request.contextPath}/registration"><fmt:message key="registration"/></a>
            </c:if>
            <c:if test="${sessionScope.userRole != null}">
                <a href="${pageContext.request.contextPath}/logout"><fmt:message key="logout"/></a>
            </c:if>
            <c:if test="${sessionScope.userRole == 'ADMIN'}">
<a href="${pageContext.request.contextPath}/admin"><fmt:message key="admin.panel"/></a>            </c:if>
            <a href="#" id="menu" class="icon">&#9776;</a>

            <a href="${pageContext.request.contextPath}?lang=en">
                EN
            </a>

            <a href="${pageContext.request.contextPath}?lang=ua">
                UA
            </a>
        </nav>
        <a href="${pageContext.request.contextPath}/cart"><span class="material-icons" id="cart">shopping_cart</span></a>
    </div>

</header>
<main>
    <div class="advantages-container">
        <h1 class ="form-header"><fmt:message key="login.form"/></h1>
        <form action = "${pageContext.request.contextPath}/login" method="post">

            <p>
                <input type="text" id="email" name="username" class="feedback-input" placeholder="<fmt:message key="login.email"/>" id = "email">
            </p>

            <p>
                <input type="text" id="password" name="password" class="feedback-input" placeholder="<fmt:message key="login.password"/>" id = "password">
            </p>

            <button type="submit" class="button-submit" value="Login!"><fmt:message key="login.in"/></button>

        </form>
    </div>
</main>
</body>
</html>
