<%--
  Created by IntelliJ IDEA.
  User: Ruslan
  Date: 31.08.2019
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Track</title>
    <link href="css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
</head>
<body>
<h1> ADD Tracks </h1>

<form action="/addTrack" method="post">
    <input type="file" name="file" id="file">
    <input type="submit">
</form>



</body>
</html>
