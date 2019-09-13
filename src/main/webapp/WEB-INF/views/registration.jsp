<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registration</title>
    <script src="js/jquery-3.4.1.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
</head>
<body>
<center>
<h1 class="pp">Registration Form</h1>
<form:form modelAttribute="userDTO" action="/register" method="post" enctype="utf8">
    ${userDTO.alreadyExistsError}
    <table id="reg_text">
        <td>
            <tr>
                <div>
                    <form:input placeholder="Username" path="username"/>
                    ${userDTO.usernameError}
                    <form:errors cssClass="error" path="username"/>
                </div>
            </tr>
        </td>
        <td>
            <tr>
                <br>
                <div>
                    <form:input placeholder="Email" path="email" type="email"/>
                    ${userDTO.emailError}
                    <form:errors cssClass="error" path="email"/>
                </div>
            </tr>
        </td>

        <td>
            <tr>
                  <div>
                      <form:password placeholder="Password" path="password"/>
                      ${userDTO.passwordError}
                      <form:errors cssClass="error" path="password"/>
                 </div>
            </tr>
        </td>
        <td>
            <tr>
                <div>
                <form:password placeholder="Repeat Password" path="repeatPassword"/>
                ${userDTO.repeatPasswordError}
                <form:errors cssClass="error" path="repeatPassword"/>
                </div>
            </tr>
        </td>
        <td>
            <tr>
                <div>
                    <input id="register-button" type="submit" value="Register">
                </div>
            </tr>
        </td>
    </table>
</form:form>
<div>
    <a href="${pageContext.request.contextPath}/login">Already registered?</a>
</div>
<div>
    <a href="${pageContext.request.contextPath}/">Back</a>
</div>
</center>
</body>
</html>
