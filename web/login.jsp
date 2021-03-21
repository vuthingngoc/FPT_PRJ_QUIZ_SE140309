<%-- 
    Document   : login
    Created on : Jan 7, 2021, 10:32:12 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css" />
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <title>Login Page</title>
    </head>
    <body>
        <script src="https"></script>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Login Form -->
                <div class="fadeIn first">
                    <h2><font color="Green">LOGIN</font></h2>
                </div>
                <form name="myForm" action="Login" onsubmit="return validateForm()" method="POST">
                    <font color="red" >${requestScope.ERROR}</font><br>
                    <input type="text" id="login" class="fadeIn second" name="txtUsername" placeholder="Email" value="${requestScope.USERNAME}">
                    <input type="password" id="password" class="fadeIn third" name="txtPassword" placeholder="Password">
                    <div class="g-recaptcha"
                         data-sitekey="6Lc6PHcaAAAAABXP3VJdlsPzC1YglGMvSD-0zKjt" style="margin: auto; display: inline-block;"></div>
                    <input type="submit" class="fadeIn fourth" name="btAction" value="Login">
                </form>
                <form action="Register" method="POST">
                    <input type="submit" class="fadeIn fourth" value="Register" >
                </form>
                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a href="Home">Home</a>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var x = document.forms["myForm"]["txtUsername"].value;
                var y = document.forms["myForm"]["txtPassword"].value;
                if (x == "" || x == null) {
                    alert("Username must be filled out");
                    return false;
                }
                if (y == "" || y == null) {
                    alert("Password must be filled out");
                    return false;
                }
            }
        </script>
    </body>
</html>
