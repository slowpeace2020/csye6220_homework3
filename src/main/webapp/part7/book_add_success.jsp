<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/18/22
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Books Add Success</title>
</head>
<body>
<h1><%= request.getAttribute("num")%>
    <c:if test="${num>1}">
        Books
    </c:if>
    <c:if test="${num<=1}">
        Book
    </c:if>
    Successfully</h1>
<a href="${pageContext.request.contextPath}/part7/book_add.jsp">Click here to go back to the main page</a>
</body>
</html>
