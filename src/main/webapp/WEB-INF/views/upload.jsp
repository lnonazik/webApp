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
    <link href="css/menu.css" rel="stylesheet">
</head>
<body>
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




    <form method="post" action="/upload" enctype="multipart/form-data">
        <input type="file" name="file" />
        <input type="submit" value="Upload" />
        <br>
    </form>

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
                <div>
                    <table id="m_text">
                        <tr>
                            <td><p>${tr.name}</p></td>
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

</body>
</html>
