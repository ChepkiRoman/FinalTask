<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Edit</title>
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.login" var="login"/>
    <fmt:message bundle="${loc}" key="local.about" var="about"/>
    <fmt:message bundle="${loc}" key="local.services" var="services"/>
    <fmt:message bundle="${loc}" key="local.contacts" var="contacts"/>
    <fmt:message bundle="${loc}" key="local.home" var="home"/>
    <fmt:message bundle="${loc}" key="local.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.surname" var="surname"/>
    <fmt:message bundle="${loc}" key="local.password" var="password"/>
    <fmt:message bundle="${loc}" key="local.submit" var="submit"/>
    <fmt:message bundle="${loc}" key="local.log_out" var="log_out"/>
    <fmt:message bundle="${loc}" key="local.edit_account" var="edit"/>
    <%@include file="partialHeader.jsp" %>
    <link rel="stylesheet" href="css/auth-style.css" media="screen" type="text/css"/>
</head>
<body id="top">
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

    </header>
    <div class="content">
        <div id="login">
            <h3 style="font-size: 38px;margin-bottom: 35px;margin-left: 70px;width: 300px;">${edit}</h3>
            <form action="FrontController" method="post">
                <input type="hidden" name="command" value="EDIT_ACCOUNT">


                <fieldset class="clearfix">
                    <p><span class="fontawesome-user"></span><input type="text" name="name" value="${sessionScope.user.name}"

                                                                        required></p>
                    <p><span class="fontawesome-user"></span><input type="text" name="surname" value="${sessionScope.user.surname}"

                                                                        required></p>

                    <input type="submit" value="${submit}" style="margin-left: 75px; margin-top: 10px;">
                </fieldset>
            </form>


        </div>
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
