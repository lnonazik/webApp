<%@ taglib prefix="sec" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ruslan
  Date: 30.08.2019
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<sec:authorize access='hasRole("ROLE_ADMIN")'>
    <h2>Welcome, ${username}</h2>
    <a href="${pageContext.request.contextPath}/">Back</a>
</sec:authorize>
</body>
</html>
