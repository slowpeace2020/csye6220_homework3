<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Batch Add Books</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="float: left">
    <div class="container">
        <form action="${pageContext.request.contextPath}/books.do" method="post">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Book Title</th>
                    <th>Authors</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach  begin = "1" end = "${num}" >
                    <tr>
                        <td><input type="text" name="isbn[]" value=""></td><br>
                        <td><input type="text" name="title[]" value=""></td><br>
                        <td><input type="text" name="authors[]" value=""></td><br>
                        <td><input type="text" name="price[]" value=""></td><br>
                    </tr>
                </c:forEach>
                <tr>
                    <td align="right"></td>
                    <td>
                        <input type="submit" value="Add Books">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>