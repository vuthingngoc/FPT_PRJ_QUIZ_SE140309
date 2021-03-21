<%-- 
    Document   : orderdetail
    Created on : Mar 11, 2021, 9:25:24 PM
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
        <link rel="stylesheet" href="css/homepage.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Order Detail Page</title>
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
        <h3> <font color="red">${requestScope.NOTIFICATION}</font> </h3>
        <h1>Order Detail List: </h1>
        <c:set var="list" value="${requestScope.DETAIL_LIST}"/>
        <c:set var="carlist" value="${requestScope.CAR_MAP}"/>
        <c:if test="${not empty list}">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <th scope="col">Car Image</th>
                        <th scope="col">License</th>
                        <th scope="col">Car Name</th>
                        <th scope="col">Rent Date</th>
                        <th scope="col">Expiry Date</th>
                        <th scope="col">Feedback</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}">
                        <tr>
                            <td><img src="${carlist[dto.license].image}" width="120" height="80"/></td>
                            <td>${carlist[dto.license].license}</td>
                            <td>${carlist[dto.license].carName}</td>
                            <td><fmt:formatDate value="${dto.rentDate}" pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate value="${dto.expiryDate}" pattern="dd/MM/yyyy" /></td>
                            <td><button class="btn btn-success" onclick="document.getElementById('${dto.license}').style.display = 'block'">Feedback</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:forEach var="dto" items="${list}">
                <form action="Feedback" method="POST" onsubmit="
                        var x = document.get.getElementById('feedback${dto.license}').value;
                        if (x == '' || x == null) {
                            alert('Feedback must be filled out');
                            return false;
                        }
                        return true;">
                    <div id="${dto.license}" class="modal-product">
                        <!-- Modal content -->
                        <div class="modal-content-product">
                            <span onclick="document.getElementById('${dto.license}').style.display = 'none'">&times;</span>
                            <div class="card" style="width: 95%;">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <h5>License: ${dto.license}</h5>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-text" id="inputGroup-sizing-lg">Feedback</span>
                                            <input id="feedback${dto.license}" value="${dto.feedback}" name="txtFeedback" type="text" class="form-control">
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <label for="rating" class="form-label">Rating scores</label>
                                        <input <c:if test="${not empty dto.rating}">value="${dto.rating}"</c:if> name="txtRating" type="range" class="form-range" min="0" max="10" id="rating">
                                        </li>
                                        <li class="list-group-item">
                                            <input type="hidden" name="txtOrderDetailID" value="${dto.orderDetailID}" />
                                        <input type="hidden" name="txtOrderID" value="${dto.orderID}" />
                                        <button class="btn btn-success">Save</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>         
                </form>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            List is Empty!
        </c:if>
    </body>
</html>
