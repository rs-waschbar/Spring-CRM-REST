<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring CRM REST Demo</title>
</head>
<body>
    <h3>Spring CRM front view section</h3>
    <a href="${pageContext.request.contextPath}/customer/list">here some User Interface</a>
    <br>
    <hr>

    <h3>Spring CRM REST section</h3>

    <a href="${pageContext.request.contextPath}/api/customers">Get All Customers</a>


</body>
</html>
