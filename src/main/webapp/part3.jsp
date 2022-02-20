<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Core Tag Example</title>
</head>
<body>
<div>
    <c:set var="income" scope="session" value="${4000*4}"/>
    <p>Your income is : <c:out value="${income}"/></p>
    <c:choose>
        <c:when test="${income <= 1000}">
            Income is not good.
        </c:when>
        <c:when test="${income > 10000}">
            Income is very good.
        </c:when>
        <c:otherwise>
            Income is undetermined...
        </c:otherwise>
    </c:choose>
</div>
<div>
    <c:url value="/index.jsp" var="completeURL">
        <c:param name="trackingId" value="786"/>
        <c:param name="user" value="Nakul"/>
    </c:url>
    ${completeURL}
</div>
<div>
    <h3>The fmt:parseNumber tag Example is:</h3>

    <c:set var="Amount" value="786.970" />

    <fmt:parseNumber var="j" type="number" value="${Amount}" />
    <p><i>Amount is:</i>  <c:out value="${j}" /></p>

    <fmt:parseNumber var="j" integerOnly="true" type="number" value="${Amount}" />
    <p><i>Amount is:</i>  <c:out value="${j}" /></p>
    <h3>Formatting of Number:</h3>
    <c:set var="Amount" value="9850.14115" />
    <p> Formatted Number-1:
        <fmt:formatNumber value="${Amount}" type="currency" /></p>
    <p>Formatted Number-2:
        <fmt:formatNumber type="number" groupingUsed="true" value="${Amount}" /></p>
    <p>Formatted Number-3:
        <fmt:formatNumber type="number" maxIntegerDigits="3" value="${Amount}" /></p>
    <p>Formatted Number-4:
        <fmt:formatNumber type="number" maxFractionDigits="6" value="${Amount}" /></p>
    <p>Formatted Number-5:
        <fmt:formatNumber type="percent" maxIntegerDigits="4" value="${Amount}" /></p>
    <p>Formatted Number-6:
        <fmt:formatNumber type="number" pattern="###.###$" value="${Amount}" /></p>
    <h3>Parsed Date:</h3>
    <c:set var="date" value="12-08-2016" />

    <fmt:parseDate value="${date}" var="parsedDate"  pattern="dd-MM-yyyy" />
    <p><c:out value="${parsedDate}" /></p>
</div>
</body>
</html>