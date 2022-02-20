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
    <div class="panel-heading">Shop for Computer</div>
    <!-- Default panel contents -->
    <form action="${pageContext.request.contextPath}/part8.do" method="post">
        <table class="table table-striped">
            <tr>
                <td>
                    <input type="checkbox" name="computer[]" value="Mac"/>MacBook
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="computer[]" value="Microsoft"/>Microsoft
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="computer[]" value="HP"/>HP
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="computer[]" value="Dell"/>Dell
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="computer[]" value="Alien"/>Alien
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td><input type="submit" value="Add to Cart"></td>
                <td><input type="hidden" name="category" value="computer"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
