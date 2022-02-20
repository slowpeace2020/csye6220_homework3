<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/19/22
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Books Numbers</title>
</head>
<body>
<h2>How many books do you want to add?</h2>
<form action="${pageContext.request.contextPath}/books.do" method="get">
    <input type="text" name="num" value="" size="20">
    <input type="submit" value="Submit">
</form>
</body>
</html>
