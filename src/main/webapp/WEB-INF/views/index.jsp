<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Index</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">

</head>
<body>


<sec:authorize access="isAuthenticated()">
    <div align="center">
    <nav class="three">
        <ul>
            <li><a href="/index"><i class="fa fa-home fa-fw"></i>Home</a></li>
            <li><a href="/upload">Repository</a></li>
            <li><a href="/index">Blog</a></li>
            <li><a href="/contacts">Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" >Logout</a></li>
        </ul>
    </nav>
    </div>
    <center><h1 class="pp">Welcome</h1></center>

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
