<%-- 
    Document   : viewcart
    Created on : Mar 10, 2021, 9:20:33 AM
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
        <title>View Cart Page</title>
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
                    <c:if test="${sessionScope.STATUS.equals('new')}">
                        <a href="VerifyEmail">Verify Email</a>
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
        <c:set var="cart" value="${sessionScope.CAR_CART.cart.values()}"/>
        <h3><font color="red">${requestScope.NOTIFICATION}</font></h3>
            <c:if test="${not empty cart}">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"> Image</th>
                        <td scope="col"> License</td>
                        <th scope="col"> Car Name</th>
                        <th scope="col"> Car Color</th>
                        <th scope="col"> Start Rent Date</th>
                        <th scope="col"> End Rent Date</th>
                        <th scope="col"> Price per Day</th>
                        <th scope="col"> Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${cart}" varStatus="counter">
                        <tr>
                        <td scope="row">${counter.count}</td>
                        <td scope="row"><img src="${dto.image}" width="120" height="80"/></td>
                        <td>${dto.license}</td>
                        <td>${dto.carName}</td>
                        <td>${dto.color}</td>
                        <td>
                            <fmt:formatDate value="${dto.rentDate}" pattern="dd/MM/yyyy" />
                            <input type="hidden" name="txtRentDate" value="${dto.rentDate}" />
                        </td>
                        <td>
                            <fmt:formatDate value="${dto.expiryDate}" pattern="dd/MM/yyyy" />
                            <input type="hidden" name="txtExpiryDate" value="${dto.expiryDate}" />
                        </td>
                        <td><font color="orange"> <h5>${dto.price}</h5> </font> <h5>$</h5></td>
                        <td> <a href="RemoveFromCart?txtLicense=${dto.license}" class="btn btn-danger" onclick="return confirm('Are you want to remove?')">Remove</a> </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><h5>Total:</h5></td>
                        <td><font color="orange"> <h5>${sessionScope.CAR_CART.total * (100 - sessionScope.DISCOUNT) / 100} </h5></font> <h5>$</h5></td>
                        <td> <h5>Current Discount: ${sessionScope.DISCOUNT} % <br>
                            - ${sessionScope.CAR_CART.total * (sessionScope.DISCOUNT) / 100} $</h5></td>
                    </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <form action="Discount">
                            Discount: <input type="text" name="txtDiscount" value="" placeholder="Code"/> <button class="btn btn-success">Discount</button>
                        </form>
                    </td>
                    <c:if test="${sessionScope.STATUS.equals('Active')}">
                        <td> <a href="CheckOut" class="btn btn-primary">Checkout</a></td>
                    </c:if>
                    <c:if test="${sessionScope.STATUS.equals('new')}">
                        <td> <h5>You need to Verify to checkout</h5></td>
                    </c:if>
                </tr>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty cart}">
        <h1>Your Cart is Empty!</h1>
    </c:if>
</body>
</html>
