<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Welcome</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/index_style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">

</head>
<body>


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
            <td valign="top">
                <center><h1 class="pp">Welcome</h1></center>
            </td>
        </tr>
        <tr>
            <td>f13

            <div align="center">
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

</body>
</html>
