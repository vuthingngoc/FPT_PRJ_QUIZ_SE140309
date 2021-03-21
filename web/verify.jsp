<%-- 
    Document   : verify
    Created on : Mar 11, 2021, 10:52:16 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/header.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Verify Page</title>
    </head>
    <body>
        <header class="header-fixed">
            <div class="header-limiter">
                <h1><a>Trung's <span>Garage</span></a></h1>
                <c:if test="${not empty sessionScope.FULLNAME}">
                    <a><img src="https://cdn.iconscout.com/icon/free/png-512/laptop-user-1-1179329.png" width="25" height="25"></img> Welcome, ${sessionScope.FULLNAME}</a>
                    </c:if>
                <nav>
                    <a href="Home">Home</a>
                    <c:if test="${not empty sessionScope.ROLE}">
                        <a href="ViewCart">View Cart</a>
                        <a href="OrderHistory">Order History</a>
                    </c:if>
                    <c:if test="${empty sessionScope.FULLNAME}">
                        <a href="LoginPage">Login</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.FULLNAME}">
                        <a href="Logout">Logout</a>
                    </c:if>
                </nav>
            </div>
        </header>
        <h2> <font color="red">${requestScope.NOTIFICATION}</font></h2>
        <h2>Check your Email To receive a Code</h2>
        <form action="VerifyCode" method="post">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Verify Code: </label>
                <input type="text" name="txtCode" class="form-control" id="exampleFormControlInput1" placeholder="Input Code"
                       <c:if test="${sessionScope.STATUS.equals('Active')}"> readonly</c:if>>
                </div>
                           <button class="btn btn-success" <c:if test="${sessionScope.STATUS.equals('Active')}">hidden</c:if>>Verify</button>
            </form>
        <c:if test="${sessionScope.STATUS.equals('Active')}"><a href="Home" class="btn btn-success">Back To Home</a></c:if>
    </body>
</html>
