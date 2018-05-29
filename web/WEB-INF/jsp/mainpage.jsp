<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ctg" uri="customTag" %>
<html>
<head>
    <title>BookPage</title>
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.about" var="about"/>
    <fmt:message bundle="${loc}" key="local.services" var="services"/>
    <fmt:message bundle="${loc}" key="local.contacts" var="contacts"/>
    <fmt:message bundle="${loc}" key="local.home" var="home"/>
    <fmt:message bundle="${loc}" key="local.log_out" var="log_out"/>
    <fmt:message bundle="${loc}" key="local.booking_form" var="booking_form"/>
    <fmt:message bundle="${loc}" key="local.submit" var="submit"/>
    <fmt:message bundle="${loc}" key="local.car_model" var="car_model"/>
    <fmt:message bundle="${loc}" key="local.car_number" var="car_number"/>
    <fmt:message bundle="${loc}" key="local.become_driver" var="become_driver"/>
    <fmt:message bundle="${loc}" key="local.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.surname" var="surname"/>
    <fmt:message bundle="${loc}" key="local.distance" var="distance"/>
    <fmt:message bundle="${loc}" key="local.arrival_time" var="arrival_time"/>
    <fmt:message bundle="${loc}" key="local.price" var="price_text"/>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script src="https://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script type="text/javascript" src="https://api-maps.yandex.ru/2.1/?lang=en_US"></script>

    <%@include file="partialHeader.jsp" %>
    <link rel="stylesheet" href="css/booking.css">
    <script type="text/javascript" src="/js/order.js"></script>

</head>
<body class="page1" id="top">
<div class="main">
    <header>
        <div class="menu_block ">
            <div class="container_12">
                <div class="grid_12">
                    <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                        <ul class="sf-menu">
                            <li><a href="/index">${home}</a></li>
                            <li><a href="/about">${about}</a></li>
                            <li><a href="/services">${services}</a></li>
                            <li><a href="/contacts">${contacts}</a></li>
                            <li class="current"><a href="/FrontController?command=LOGOUT">${log_out}</a></li>
                        </ul>
                    </nav>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="container_12">
            <div class="grid_12">
                <h1>
                    <a href="/index">
                        <ctg:logo/>
                    </a>
                </h1>
            </div>
        </div>
        <div class="clear"></div>
    </header>


    <div class="content">
        <div class="container_12">
            <div id="mapContainer">
            <h3>${booking_form}</h3>
            <%--<div id="map" style=""></div>--%>
            <form id="bookingForm" action="FrontController">
                <input type="hidden" name="command" value="CREATE_ORDER">
                <input style="width: 400px;height: 47px;" name="from" placeholder="From:" type="text"  value="${from}" required="true">

                <input style="width: 400px;margin-left: 50px;height: 47px;" name="destination" value="${destination}" placeholder="To:"
                type="text" required="true">
                <div class="clear"></div>
                <input class="btn" id="bookSuccessButtonId" type="submit" value="${submit}"
                       style="margin-left: 45px;margin-bottom: 16px;height: 45px;width: 128px; background-color:#fdc903">

            </form>


            <div class="clear"></div>
            </div>
        </div>


        <form action="FrontController" method="post" id="userForm">
            <input type="hidden" name="command" value="FIND_DRIVER"/>
            <input type="hidden" id="idDriver" name="idDriver"/>
            <c:choose>
                <c:when test="${not empty driverList}">
                    <table class="table table-striped" id="table">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>${name}</td>
                            <td>${surname}</td>
                            <td>${car_number}</td>
                            <td>${car_model}</td>
                            <td>${distance}</td>
                            <td>${arrival_time}</td>
                            <td>${price_text}</td>
                        </tr>
                        </thead>
                        <c:forEach var="drivers" items="${driverList}">
                            <c:set var="classSucess" value=""/>
                            <c:if test="${idDriver == drivers.driver.id}">
                                <c:set var="classSucess" value="info"/>
                            </c:if>
                            <tr class="${classSucess}">
                                <td>${drivers.driver.id}</td>
                                <td>${drivers.driver.name}</td>
                                <td>${drivers.driver.surname}</td>
                                <td>${drivers.driver.carNumber}</td>
                                <td>${drivers.driver.carModel}</td>
                                <td>${drivers.distance}</td>
                                <td>${drivers.arrival_time}</td>
                                <td>${ride_price}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <input type="submit" value="${submit}" class="ok"
                           style="margin-left: 45px;margin-bottom: 16px;height: 45px;width: 128px; background-color:#fdc903">
                </c:when>
                <c:otherwise>


                </c:otherwise>
            </c:choose>
        </form>

        <script>
            var id
            $("#table tr").click(function () {
                $(this).addClass('selected').siblings().removeClass('selected');
                id = $(this).find('td:first').html();
            });
            $('.ok').on('click', function (e) {
                document.getElementById('idDriver').value = id;
                document.getElementById("userForm").submit();
                alert("Please wait for accepting order by driver");
            });
        </script>

    </div>
</div>
<footer>
    <div class="container_12">
        <div class="grid_12">
            <div class="f_phone"><span> <%@include file="language.jsp" %></span></div>
            <div class="socials">
                <a href="#" class="fa fa-twitter"></a>
                <a href="#" class="fa fa-facebook"></a>
                <a href="#" class="fa fa-google-plus"></a>
            </div>
            <div class="copy">
                <div class="st1">
                    <div class="brand">Tour<span class="color1">T</span>axi</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>
</body>
</html>
