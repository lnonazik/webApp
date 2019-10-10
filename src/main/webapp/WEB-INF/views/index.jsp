<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Welcome</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie-edge">

    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/index_style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,300,400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<header id="header">


<sec:authorize access="isAuthenticated()">
       <center>
    <table class="home_table">
        <tr>
            <td valign="top" height="20px">
                <center>
                <nav class="three">
                    <ul>
                        <li><a href="/index"><i class="fa fa-home fa-fw"></i>Home</a></li>
                        <li><a href="/upload">Repository</a></li>
                        <li><a href="/contacts">Contact</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout" >Logout</a></li>
                    </ul>
                </nav>
                </center>
            </td>
        </tr>
        <tr>
            <td valign="top" width="30px">
                <center><p class="pp">Welcome</p></center>
            </td>
        </tr>
        <tr>
            <td valign="top">

            <div align="center">
                <h1>TOP Music</h1>
                <hr>
                <ul>
                <c:forEach items="${allTrackList}" var="tr">
                        <li>
                            <div>
                                <p>${tr.name}</p>
                            </div>
                            <audio controls>
                                <source src="${tr.path}" type="audio/ogg; codecs-vorbis">
                                <source src="${tr.path}" type="audio/mpeg">
                            </audio>
                        </li>
                    <br>
                </c:forEach>
                </ul>
            </div>

            </td>
        </tr>
    </table>
    </center>



</sec:authorize>


<sec:authorize access="isAnonymous()" >

    <div>
        <table id="index_table" align="center">
            <tr>
                <td>
                    <p id="in_log">
                    <a href="${pageContext.request.contextPath}/login">
                    <img src="/img/login_index.png" width="242" height="42">
                    </a></p>

                </td>
            </tr>
            <tr>
                <td>
                    <p id="in_reg">
                        <a href="${pageContext.request.contextPath}/registration">
                            <img src="/img/reg_index.png" width="242" height="42">
                        </a>
                    </p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

</sec:authorize>
</header>
<script  src="https://code.jquery.com/jquery-3.4.1.slim.js" integrity="sha256-BTlTdQO9/fascB1drekrDVkaKd9PkwBymMlHOiG+qLI=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
