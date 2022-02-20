<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/18/22
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Movies</title>
</head>
<body>
<h1>Searching Movies</h1>
<form action="${pageContext.request.contextPath}/movie_navigate.do" method="post">
    <tr>
        Keyword: &nbsp;&nbsp;&nbsp;&nbsp;<input name="keyword" value=""/>
    </tr>
    <br>
    <tr>
        <td>
            <input type="radio" name="search_type" value="title">Search By Title <br>
            <input type="radio" name="search_type" value="actor">Search By Actor <br>
            <input type="radio" name="search_type" value="actress">Search By Actress <br>
        </td>
    </tr>
    <br>
    <tr>
        <td>
            <input type="submit" value="Submit">
        </td>
        <input type="hidden" name="action" value="search">
    </tr>
</form>

</body>
</html>
