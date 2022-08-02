<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="ua.hoienko.webstorespring.model.Cart " %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>WebStore</title>
    <%@ include file="/WEB-INF/jspf/style.jspf" %>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<header>
    <div class="logo">
        <a href="${pageContext.request.contextPath}/store"><i class="material-icons" id="graphiclogo">store</i></a>
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
        <a href="${pageContext.request.contextPath}/cart">
            <span class="material-icons" id="cart">shopping_cart</span>
        </a>
    </div>

</header>
<main>
    <div class="advantages-container">
        <c:if test="${sessionScope.cart.getProductList().size() != 0}">
            <table>
                <tr>
                    <th><fmt:message key="name"/></th>
                    <th><fmt:message key="color"/></th>
                    <th><fmt:message key="amount"/></th>
                    <th><fmt:message key="price"/></th>
                    <th><fmt:message key="action"/></th>
                </tr>
                <c:forEach items="${sessionScope.cart.getProducts().entrySet()}" var="product">
                    <form action="${pageContext.request.contextPath}/cart/delete" method="post">
                        <tr>
                            <td>${product.getKey().getName()}</td>
                            <td>${product.getKey().getColor()}</td>
                            <td>${product.getValue()}</td>
                            <td>${product.getKey().getPrice()}</td>
                            <td>
                                <input type="text" readonly="readonly" name="productToDeleteId"
                                       style="visibility: hidden; width: 0"
                                       hidden value="${product.getKey().getId()}">
                                <button type="submit"><fmt:message key="cart.delete"/></button>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                <tr>
                    <th><fmt:message key="total.amount"/></th>
                    <th>${sessionScope.cart.getTotalAmount()}</th>
                    <th><fmt:message key="total.cost"/></th>
                    <th>${sessionScope.cart.getFullPrice()}</th>
                    <th>
                        <form action="${pageContext.request.contextPath}/cart/order" method="post">
                            <input type="text" readonly="readonly" name="Buy" style="visibility: hidden; width: 0"
                                   hidden value="true">
                            <button type="submit"><fmt:message key="buy"/></button>
                        </form>
                    </th>
                </tr>
            </table>
        </c:if>

        <c:if test="${requestScope.isOrderDone}">
            <h1 class="form-header"><fmt:message key="cart.success"/></h1>
            <form action="${pageContext.request.contextPath}/store" method="get">
                <button type="submit" class="button-submit"><fmt:message key="to.store"/></button>
            </form>
        </c:if>


        <c:if test="${requestScope.accessDenied}">
            <h1 class="form-header"><fmt:message key="card.denied"/></h1>
            <h1 class="form-header"><fmt:message key="card.denied.explanation"/></h1>
            <form action="${pageContext.request.contextPath}/store" method="get">
                <button type="submit" class="button-submit"><fmt:message key="to.store"/></button>
            </form>
        </c:if>

        <c:if test="${sessionScope.cart.getProductList().size() == 0 && requestScope.isOrderDone == null}">
            <h1 class="form-header"><fmt:message key="cart.empty"/></h1>
            <form action="${pageContext.request.contextPath}/store" method="get">
                <button type="submit" class="button-submit">
                    <fmt:message key="to.store"/>
                </button>
            </form>
        </c:if>
    </div>
</main>
</body>
</html>