<%-- 
    Document   : orderhistory
    Created on : Mar 11, 2021, 8:27:03 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/header.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Order History Page</title>
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
        <h1>Order History List!</h1>
        <h3><font color="red">${requestScope.NOTIFICATION}</font></h3>
        <form action="OrderHistory">
            <div class="row">
                <c:if test="${sessionScope.ROLE.equals('admin')}">
                    <div class="col">
                        <input type="text" name="txtEmail" class="form-control" placeholder="Email" aria-label="Email" value="${requestScope.EMAIL}">
                    </div>
                </c:if>
                <div class="col">
                    <input type="Date" name="txtCreateDate" class="form-control" aria-label="Create Date" value="${requestScope.CREATEDATE}">
                </div>
                <div class="col">
                    <button class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>
        <c:set var="list" value="${requestScope.ORDER_LIST}"/>
        <c:if test="${not empty list}">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Email</th>
                        <th scope="col">Discount</th>
                        <th scope="col">Price</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Check Info</th>
                            <c:if test="${sessionScope.ROLE.equals('admin')}">
                            <th scope="col">Delete</th>
                            </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.email}</td>
                            <td>${dto.discount}</td>
                            <td>${dto.price}</td>
                            <td><fmt:formatDate value="${dto.createDate}" pattern="dd/MM/yyyy" /></td>
                            <td>${dto.status}</td>
                            <td><a class="btn btn-primary" href="ViewOrderDetail?txtOrderID=${dto.orderID}">Info</a></td>
                            <c:if test="${sessionScope.ROLE.equals('admin')}">
                                <c:if test="${dto.status.equals('Active')}">
                                    <td><a class="btn btn-danger" href="RemoveOrderHistory?txtOrderID=${dto.orderID}&action=Remove">Remove</a></td>
                                </c:if>
                                <c:if test="${dto.status.equals('Inactive')}">
                                    <td><a class="btn btn-danger" href="RemoveOrderHistory?txtOrderID=${dto.orderID}&action=Resume">Resume</a></td>
                                </c:if>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty list}">
            List is Empty!
        </c:if>
    </body>
</html>
