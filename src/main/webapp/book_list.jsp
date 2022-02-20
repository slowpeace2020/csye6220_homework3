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
    <div class="panel-heading">Shop for Books</div>
    <!-- Default panel contents -->
    <form action="${pageContext.request.contextPath}/part8.do" method="post">
        <table class="table table-striped">
            <tr>
                <td>
                    <input type="checkbox" name="book[]" value="Secondary"/>Secondary
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="book[]" value="Things We Never Got Over"/>Things We Never Got Over
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="book[]" value="Will"/>Will
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="book[]" value="House of Sky and Breath (Crescent City) Kindle Edition
"/>House of Sky and Breath (Crescent City) Kindle Edition

                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="book[]" value="Education"/>Education
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td><input type="submit" value="Add to Cart"></td>
                <td><input type="hidden" name="category" value="book"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
