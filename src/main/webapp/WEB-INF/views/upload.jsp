<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nazar
  Date: 05.09.2019
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>
<form method="post" action="/upload" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload" />
</form>
</div>
<div>
    <ul>
        <c:forEach items="${files}" var="file">
            <li><a href="${file}">${file}</a></li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
