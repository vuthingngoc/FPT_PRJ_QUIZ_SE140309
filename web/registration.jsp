<%-- 
    Document   : registration
    Created on : Feb 17, 2021, 5:44:50 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css" />
        <title>Registration Page</title>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Login Form -->
                <div class="fadeIn first">
                    <h2><font color="Green">REGISTRATION</font></h2>
                </div>
                <form name="myForm" action="Register" onsubmit="return validateForm()" method="POST">
                    <font color="red" >${requestScope.ERROR}</font><br>
                    <input type="text" id="login" class="fadeIn second" name="txtEmail" placeholder="Email" value="${requestScope.USERNAME}">
                    <input type="password" id="password" class="fadeIn third" name="txtPassword" placeholder="password">
                    <input type="password" id="password" class="fadeIn third" name="txtRePassword" placeholder="Re-input password">
                    <input type="text" id="login" class="fadeIn third" name="txtFullname" placeholder="Fullname" value="${requestScope.FULLNAME}">
                    <input type="text" id="login" class="fadeIn third" name="txtPhone" placeholder="Phone" value="${requestScope.PHONE}">
                    <input type="text" id="login" class="fadeIn third" name="txtAddress" placeholder="Address" value="${requestScope.ADDRESS}">
                    <input type="submit" class="fadeIn fourth" name="btAction" value="Sign Up">
                </form>
                <div id="formFooter">
                    <a href="LoginPage">Back To Login</a>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var x = document.forms["myForm"]["txtUsername"].value;
                if (x == "" || x == null) {
                    alert("Username must be filled out");
                    return false;
                }
            }
        </script>
    </body>
</html>
