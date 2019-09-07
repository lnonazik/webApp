<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<form method="post" action="/upload" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload" />
    <br>
    <a href="${pageContext.request.contextPath}/index">Back to index</a>
</form>
</div>
<div>
    <ul>
        <c:forEach items="${files}" var="file">
            <li><a href="${file}">${file}</a></li>
        </c:forEach>
    </ul>
</div>
<c:forEach items="${trackList}" var="tr">
    <audio controls>
        <source src="${tr.path}" type="audio/ogg; codecs=vorbis">
        <source src="${tr.path}" type="audio/mpeg">
        <a href="${tr.path}">Скачайте музыку</a>
    </audio>
</c:forEach>

</body>
</html>
