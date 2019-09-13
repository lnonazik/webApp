<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Home</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div align="center">
<h1>Welcome back, ${username}!</h1>
<a href="${pageContext.request.contextPath}/index">Back to index</a>
<a href="${pageContext.request.contextPath}/product">Go to Product Page</a>
<a href="${pageContext.request.contextPath}/logout">Logout</a>
<sec:authorize access='hasRole("ROLE_ADMIN")'>
    <a href="${pageContext.request.contextPath}/admin/">Admin page</a>
</sec:authorize>

<a href="/upload">Upload</a>
</div>
</body>
</html>
