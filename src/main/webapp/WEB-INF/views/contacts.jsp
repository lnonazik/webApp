<%--
  Created by IntelliJ IDEA.
  User: Ruslan
  Date: 14.09.2019
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contacts</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/index_style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
</head>
<body>
<div align="center">
<nav class="three">
    <ul>
        <li><a href="/index"><i class="fa fa-home fa-fw"></i>Home</a></li>
        <li><a href="/upload">Repository</a></li>
        <li><a href="/contacts">Contact</a></li>
        <li><a href="${pageContext.request.contextPath}/logout" >Logout</a></li>
    </ul>
</nav>
</div>
<center>
<table width="400px" height="300px" bgcolor="#f5f5dc">
    <tr>
        <td valign="top">
            <center>
            <h1><p class="pp">Contacts</p></h1>
            <p>Name:    Lanchevych Nazar</p>
            <p>Email:   lnonazik@gmail.com</p>
            <p>Number:  380688860042</p>
            </center>
        </td>
    </tr>
</table>
</center>

</body>
</html>
