<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/18/22
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie List</title>
</head>
<body>
<h1>Welcome to our Movie Store</h1>
<h3>Please make your selection below</h3>
<div>
    <form action="${pageContext.request.contextPath}/movie_navigate.do" method="get">
        <select name="page_name">
            <option value="/movie_search.jsp">Browse Movies</option>
            <option value="/movie_add.jsp">Add New Movie to Database</option>
        </select>
        <input type="submit" value="send"/>
    </form>

</div>
</body>
</html>
