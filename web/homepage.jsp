<%-- 
    Document   : homepage
    Created on : Mar 8, 2021, 4:29:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/homepage.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <title>Home Page</title>
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
        <h1>Home Page</h1>
        <c:set var="listCar" value="${requestScope.LIST_CAR}"/>
        <c:set var="carDetail" value="${requestScope.CAR_DETAIL}"/>
        <form action="Home" onsubmit="
                var str1 = document.getElementById('rentdate').value;
                var str2 = document.getElementById('expirydate').value;
                var str3 = document.getElementById('currentdate').value;
                var n = str1.localeCompare(str2);
                if (n >= 0) {
                    alert('ExpiryDate must bigger than RentDate');
                    return false;
                }
                if (str1 < str3) {
                    alert('RentDate must bigger than CurrentDate');
                    return false;
                }
                return true;">
            <div class="position-fixed">
                <div class="card" style="width: 18rem;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            Name:<input type="text" name="txtCarName" value="${requestScope.CARNAME}" />
                        </li>
                        <li class="list-group-item">
                            <input id="currentdate" type="hidden" name="txtCurrentDate" value="${requestScope.CURRENT_DATE}" />
                            Category: 
                            <select name="txtCategory">
                                <option value="">--ALL--</option>
                                <c:forEach var="dto" items="${requestScope.LIST_CATEGORY}">
                                    <option value="${dto}" <c:if test="${requestScope.CATEGORY.equals(dto)}">selected</c:if>>${dto}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li class="list-group-item">
                            Seat: 
                            <select name="txtSeat">
                                <option value="0">--Seat--</option>
                                <option value="2" <c:if test="${requestScope.SEAT.equals('2')}">selected</c:if>>2</option>
                                <option value="4" <c:if test="${requestScope.SEAT.equals('4')}">selected</c:if>>4</option>
                                <option value="5" <c:if test="${requestScope.SEAT.equals('5')}">selected</c:if>>5</option>
                                <option value="6" <c:if test="${requestScope.SEAT.equals('6')}">selected</c:if>>6</option>
                                <option value="7" <c:if test="${requestScope.SEAT.equals('7')}">selected</c:if>>7</option>
                                </select>
                            </li>
                            <li class="list-group-item">
                                <label for="rentdate">Start Rent Date: </label>
                                <input type="date" id="rentdate" name="txtRentDate" value="${requestScope.RENT_DATE}">
                            <label for="expirydate">End Rent Date: </label>
                            <input type="date" id="expirydate" name="txtExpiryDate" value="${requestScope.EXPIRY_DATE}">
                        </li>
                    </ul>
                    <div class="card-footer">
                        <input type="submit" value="Search" class="btn btn-primary"/>
                    </div>
                </div>
            </div>
        </form>
        <c:if test="${not empty listCar}">
            <div class="container">
                <div class="row row-cols-3">
                    <c:forEach var="dto" items="${listCar}">
                        <div class="col">
                            <div class="card" style="width: 25rem; height: 33rem;">
                                <img src="${dto.image}" class="card-img-top" width="400" height="190">
                                <div class="card-body">
                                    <h5 class="card-title">${dto.carName}</h5>
                                    <p class="card-text">
                                        <font color="grey">${dto.category}</font> <br>
                                        Quantity: <c:if test="${dto.quantity > 0}">${dto.quantity}</c:if> <br>
                                        <c:if test="${dto.quantity <= 0}"><font color="red">OUT OF STOCK</font></c:if> <br>
                                        <img src="https://www.pinclipart.com/picdir/middle/41-414883_centre-armrest-between-front-seats-car-seat-icon.png" width="25" height="25"> ${dto.seat} <br>
                                    <h4>Price: <font color="orange">${dto.price}</font> $/day</h4>
                                    </p>
                                </div>
                                <c:if test="${sessionScope.ROLE.equals('user') && dto.quantity > 0}">
                                    <div class="card-body">
                                        <button class="btn btn-primary" onclick="document.getElementById('${dto.carName}').style.display = 'block'">Add to Cart</button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <c:forEach var="dto" items="${listCar}">
                <div id="${dto.carName}" class="modal-product">
                    <!-- Modal content -->
                    <div class="modal-content-product">
                        <span onclick="document.getElementById('${dto.carName}').style.display = 'none'">&times;</span>
                        <div class="card" style="width: 95%;">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <label for="rentdate">Start Rent Date: </label>
                                    <input type="date" id="rentdate${dto.carName}" name="txtRentDate" value="${requestScope.RENT_DATE}" readonly>
                                </li>
                                <li class="list-group-item">
                                    <label for="expirydate">End Rent Date: </label>
                                    <input type="date" id="expirydate${dto.carName}" name="txtExpiryDate" value="${requestScope.EXPIRY_DATE}" readonly>
                                </li>
                                <c:forEach var="dto" items="${carDetail[dto.carName]}">
                                    <li class="list-group-item">
                                        License: ${dto.license} <br>
                                        Color: ${dto.color} <br>
                                        <a href="AddToCart?txtLicense=${dto.license}&txtRentDate=${requestScope.RENT_DATE}&txtExpiryDate=${requestScope.EXPIRY_DATE}" class="btn btn-success">Add To Cart</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="1" end="${requestScope.TOTAL_PAGE}">
                        <li class="page-item"><a class="page-link" href="ShowCarServlet?PageNum=${i}&txtCarName=${requestScope.CARNAME}&txtCategory=${requestScope.CATEGORY}&txtSeat=${requestScope.SEAT}">${i}</a></li>
                        </c:forEach>
                </ul>
            </nav>
        </c:if>
        <c:if test="${empty listCar}">
            <h2>List Is Empty!</h2>
        </c:if>
    </body>
</html>
