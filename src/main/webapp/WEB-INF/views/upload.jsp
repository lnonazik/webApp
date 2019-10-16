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
    <title>My Playlist</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/index_style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
</head>
<body>
<header>
<center>
<table class="home_table">
    <tr>
        <td valign="top" height="20px" bgcolor="#f5f5dc">
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
        <td valign="top" height="20px" bgcolor="#f5f5dc"><center>
            <!-- <h1>Welcome back, !${user.username}</h1>-->
            <h1><p class="pp"> Upload Tracks!</p></h1>
            <form method="post" action="/upload" enctype="multipart/form-data" modelAttribute="top">
                <input type="file" name="file" />
                <input type="submit" value="Upload" />
                <br>
            </form>
            <hr>
            <p class="pp">My Playlist</p>
            <hr>
        </center>
        </td>
    </tr>
    <tr>
        <td valign="top"><center>
        <div>

            <ul>
                <c:forEach items="${files}" var="file">
                    <li><a href="${file}">${file}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div>
            <ul>
                <c:forEach items="${trackList}" var="tr">
                <li>
                    <div >
                        <table id="m_text">
                            <tr>
                                <td><center>
                                    <p>${tr.name}</p>
                                </center></td>
                             </tr>
                         </table>
                        <!--<p>${tr.name}</p> -->
                     </div>
                    <audio controls>
                        <source src="${tr.path}" type="audio/ogg; codecs=vorbis">
                        <source src="${tr.path}" type="audio/mpeg">
                        <a href="${tr.path}">Скачайте музыку</a>
                    </audio>
                        <div>
                            <form method="post" action="/delete" />
                                <input name="track_id" type="hidden" value="${tr.id}"/>
                                <input type="submit" value="Delete" />
                            </form>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        </center>
        </td>
    </tr>
</table>
</center>
</header>
</body>
</html>
