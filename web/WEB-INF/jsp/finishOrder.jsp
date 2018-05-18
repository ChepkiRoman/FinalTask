<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Finish</title>
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.about" var="about"/>
    <fmt:message bundle="${loc}" key="local.services" var="services"/>
    <fmt:message bundle="${loc}" key="local.contacts" var="contacts"/>
    <fmt:message bundle="${loc}" key="local.home" var="home"/>
    <fmt:message bundle="${loc}" key="local.log_out" var="log_out"/>
    <fmt:message bundle="${loc}" key="local.order_status_view" var="status_view"/>
    <fmt:message bundle="${loc}" key="local.check_status" var="check_status"/>
    <fmt:message bundle="${loc}" key="local.decline_order" var="decline_order"/>
    <%@include file="partialHeader.jsp" %>
    <script>
        function check_status() {
            $.ajax({
                url: 'FrontController?command=CHECK_STATUS',
                success: function () {
                    alert("ok");
                },
                error: function () {
                    alert('error');
                }
            });
        }
    </script>
</head>
<body id="top">
<div class="main">
    <header>
        <div class="menu_block ">
            <div class="container_12">
                <div class="grid_12">
                    <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                        <ul class="sf-menu">
                            <li class="current"><a href="/index">${home}</a></li>
                            <li><a href="/about">${about}</a></li>
                            <li><a href="/services">${services}</a></li>
                            <li><a href="/contacts">${contacts}</a></li>
                            <li><a href="/FrontController?command=LOGOUT">${log_out}</a></li>

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
                        <img src="images/logo.png" alt="Your Happy Family">
                    </a>
                </h1>
            </div>
        </div>
        <div class="clear"></div>
    </header>


    <c:out value="${error}"/>
    <span>
    <h3 style="font-size: 44px;">${status_view} </h3>
    </span>
    <span>
         <c:if test="${empty message}">
        <h3 style="font-size: 44px;">
                NEW
        </h3>

         </c:if>
      <c:if test="${not empty message}">
        <h3 style="font-size: 44px;">
                ${message}
        </h3>

      </c:if>
    </span>


<div class="content">
    <br>
    <a style="background-color: #fdc903;
    color: white;
    padding: 14px 25px;
    margin-left: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;" href="FrontController?command=CHECK_STATUS">${check_status}</a>
    <br>
    <a style="background-color: #f44336;
    color: white;
    padding: 14px 25px;
    margin-top: 20px;
    margin-left: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;" href="FrontController?command=DECLINE_ORDER">${decline_order}</a>
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
                    <div class="brand">Your<span class="color1">T</span>axi</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</footer>
</body>
</html>
