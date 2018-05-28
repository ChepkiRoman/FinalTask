<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="local" var="loc"/>
    <fmt:message bundle="${loc}" key="local.login" var="login"/>

    <fmt:message bundle="${loc}" key="local.name" var="name"/>
    <fmt:message bundle="${loc}" key="local.surname" var="surname"/>
    <fmt:message bundle="${loc}" key="local.password" var="password"/>
    <fmt:message bundle="${loc}" key="local.submit" var="submit"/>
    <fmt:message bundle="${loc}" key="local.about" var="about"/>
    <fmt:message bundle="${loc}" key="local.services" var="services"/>
    <fmt:message bundle="${loc}" key="local.contacts" var="contacts"/>
    <fmt:message bundle="${loc}" key="local.home" var="home"/>
    <fmt:message bundle="${loc}" key="local.car_model" var="car_model"/>
    <fmt:message bundle="${loc}" key="local.car_number" var="car_number"/>
    <fmt:message bundle="${loc}" key="local.become_driver" var="become_driver"/>
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
                            <li class="current"><a href="/index">${home}</a></li>
                            <li><a href="/about">${about}</a></li>
                            <li><a href="/services">${services}</a></li>
                            <li><a href="/contacts">${contacts}</a></li>
                            <li><a href="/login">${login}</a></li>

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
            <h3 style="font-size: 38px;margin-bottom: 35px;margin-left: 50px;width: 300px;margin-top: -40;">${become_drivere}</h3>
            <c:out value="${error}"/>
            <form action="FrontController" method="post">
                <input type="hidden" name="command" value="DRIVER_REGISTRATION">


                <fieldset class="clearfix">
                    <p><span class="fontawesome-user"></span><input type="text" name="name" value="${name}"
                                                                    onBlur="if(this.value == '') this.value = '${name}'"
                                                                    onFocus="if(this.value == '${name}') this.value = ''"
                                                                    required pattern="[A-Z][a-z]+"></p>
                    <p><span class="fontawesome-user"></span><input type="text" name="surname" value="${surname}"
                                                                    onBlur="if(this.value == '') this.value = '${surname}'"
                                                                    onFocus="if(this.value == '${surname}') this.value = ''"
                                                                    required pattern="[A-Z][a-z]+"></p>
                    <p><span class="fontawesome-bullhorn"></span><input type="text" name="login" value="email"
                                                                        onBlur="if(this.value == '') this.value = 'email'"
                                                                        onFocus="if(this.value == 'email') this.value = ''"
                                                                        required pattern="([a-zA-Z0-9]+)(@)([a-zA-Z]+)(\.)([a-zA-Z]){2,3}"></p>
                    <p><span class="fontawesome-flag"></span><input type="text" name="car_model" value="${car_model}"
                                                                    onBlur="if(this.value == '') this.value = '${car_model}'"
                                                                    onFocus="if(this.value == '${car_model}') this.value = ''"
                                                                    required pattern="[A-Z][a-z]+"></p>
                    <p><span class="fontawesome-flag"></span><input type="text" name="car_number" value="${car_number}"
                                                                    onBlur="if(this.value == '') this.value = '${car_number}'"
                                                                    onFocus="if(this.value == '${car_number}') this.value = ''"
                                                                    required pattern="\dTAX\d{4}"></p>
                    <p><span class="fontawesome-lock"></span><input type="password" name="password"
                                                                    value="${password}"
                                                                    onBlur="if(this.value == '') this.value = '${password}'"
                                                                    onFocus="if(this.value == '${password}') this.value = ''"
                                                                    required pattern="^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></p>
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
