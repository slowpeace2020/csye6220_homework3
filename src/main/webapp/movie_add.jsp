<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/18/22
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/movie_navigate.do" method="post">

    <table width="100%">
        <tr>
            <td align="right">Movie Title:</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td align="right">Lead Actress:</td>
            <td><input type="text" name="actress"/></td>
        </tr>
        <tr>
            <td align="right">Lead Actor:</td>
            <td><input type="text" name="actor"/></td>
        </tr>
        <tr>
            <td align="right">Genre:</td>
            <td><input type="text" name="genre"/></td>
        </tr>
        <tr>
            <td align="right">Year:</td>
            <td><input type="text" name="year"/></td>
        </tr>
        <tr>
            <td align="right"></td>
            <td>
                <input type="submit" value="Add Movie">
            </td>
            <td>
                <input type="hidden" name="action" value="add">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
