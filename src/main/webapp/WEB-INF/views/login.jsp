<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<center><h1 id="pp">Login</h1></center>

<form action="${pageContext.request.contextPath}/performLogin" method="post">
    <span class="error">${message}</span>
    <div align="center">
        <input type="text" name="username" id="username" placeholder="Username">
        <input type="password" name="password" id="password" placeholder="Password">
        <input type="submit" value="Login">
    </div>
</form>

<div align="center">
    <a href="${pageContext.request.contextPath}/registration">First time?</a>
</div>
<div align="center">
    <a href="${pageContext.request.contextPath}/">Back</a>
</div>

<!--
<form action="${pageContext.request.contextPath/performLogin}" method="post">
    <span class="error">${message}</span>
    <table id="index_table" align="center">
        <tr>
            <td><p id="log_label"><input type="text" name="username" id="username" placeholder="Username"></p>
                <p id="pas_label"><input type="password" name="password" id="password" placeholder="Password"></p>

input type="submit" value="Login">

                <br>
                <input type="submit" value="Login">


                <br>
                <p id="firs_time"><a href="${pageContext.request.contextPath}/registration">First time?</a></p>
            </td>
        </tr>
        <tr>
            <td> </td>
        </tr>
        <tr>
            <td> </td>
        </tr>
    </table>
</form>
-->
</body>
</html>
