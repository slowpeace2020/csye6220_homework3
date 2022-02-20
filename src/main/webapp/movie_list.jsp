<%--
  Created by IntelliJ IDEA.
  User: shanchu
  Date: 2/18/22
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Movie List</title>
</head>
<body>
<h1> You searched for "<%= request.getAttribute("keyword")%>"</h1>
<div>
    <table border="1" class="table table-bordered table-hover">
        <caption>Here are the search results</caption>
        <tr class="success">
            <th>Title</th>
            <th>Actress</th>
            <th>Actor</th>
            <th>Genre</th>
            <th>Year</th>
        </tr>

        <c:forEach items="${list}" var="movie" varStatus="s">
            <tr>
                <td>${movie.title}</td>
                <td>${movie.actress}</td>
                <td>${movie.actor}</td>
                <td>${movie.genre}</td>
                <td>${movie.year}</td>
            </tr>
        </c:forEach>

    </table>
    <div style="margin-top: 10px">
        <a href="${pageContext.request.contextPath}/movie_navigate.jsp">Click here to go back to the main page</a>
    </div>
</div>

</body>
</html>
