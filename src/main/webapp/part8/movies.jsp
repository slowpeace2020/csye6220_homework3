<%--
  Created by IntelliJ IDEA.
  User: jg
  Date: 2/18/22
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">Shop for Movie</div>
    <!-- Default panel contents -->
    <form action="${pageContext.request.contextPath}/part8.do" method="post">
        <input type="hidden" name="action" value="add">
        <table class="table table-striped">
            <tr>
                <td>
                    <input type="checkbox" name="movie[]" value="Broken"/>Broken
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="movie[]" value="Look Up"/>Look Up
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="movie[]" value="Summer"/>Summer
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="movie[]" value="Citizen Kane"/>Citizen Kane
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="movie[]" value="Casablanca"/>Casablanca
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td><input type="submit" value="Add to Cart"></td>
                <td><input type="hidden" name="category" value="movie"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
