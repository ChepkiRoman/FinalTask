<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Account</title>
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
    <fmt:message bundle="${loc}" key="local.log_out" var="log_out"/>
    <fmt:message bundle="${loc}" key="local.welcome_user" var="welcome_user"/>
    <fmt:message bundle="${loc}" key="local.welcome_driver" var="welcome_driver"/>
    <fmt:message bundle="${loc}" key="local.your_name" var="your_name"/>
    <fmt:message bundle="${loc}" key="local.your_surname" var="your_surname"/>
    <fmt:message bundle="${loc}" key="local.your_email" var="your_email"/>
    <fmt:message bundle="${loc}" key="local.book" var="book"/>
    <fmt:message bundle="${loc}" key="local.edit_acc" var="edit_acc"/>
    <fmt:message bundle="${loc}" key="local.delete_acc" var="delete_acc"/>
    <fmt:message bundle="${loc}" key="local.not_confirmed" var="not_confirmed"/>
    <fmt:message bundle="${loc}" key="local.drivers" var="drivers"/>
    <fmt:message bundle="${loc}" key="local.admins" var="admins"/>
    <fmt:message bundle="${loc}" key="local.orders" var="orders"/>
    <fmt:message bundle="${loc}" key="local.users_view" var="users_view"/>
    <fmt:message bundle="${loc}" key="local.go_to_orders" var="go_to_orders"/>
    <fmt:message bundle="${loc}" key="local.create_admin" var="create_admin"/>

    <link rel="stylesheet" href="css/auth-style.css" media="screen" type="text/css"/>


    <%@include file="partialHeader.jsp" %>

</head>
<body id="top">
<c:choose>
    <c:when test="${role eq 'customer'}">
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
                <div class="container_12">
                    <h3 style="text-align: center;padding-top: 75px;padding-bottom: 75px; font-size: 44px;">${welcome_user}</h3>
                    <c:out value="${error}"/>
                    <div class="grid_7">
                        <h3>${your_name} <c:out value="${sessionScope.user.name}"/></h3>
                        <br>
                        <h3>${your_surname} < c:out value="${sessionScope.user.surname}"/></h3>
                        <br>
                        <h3>${your_email} <c:out value="${sessionScope.user.login}"/></h3>
                    </div>
                    <div class="grid_4 prefix_1">
                        <a class="btn main-button" href="/FrontController?command=CHECK_ACTIVER_CUSTOMER_ORDER">${book}</a>
                        <br>
                        <a class="btn main-button-black" href="/edit">${edit_acc}</a>
                        <br>
                        <a class="btn main-button-black" href="/FrontController?command=DELETE_ACCOUNT">${delete_acc}</a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </c:when>


    <c:when test="${role eq 'driver'}">

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
                <div class="container_12">
                    <h3 style="text-align: center;padding-top: 75px;padding-bottom: 75px; font-size: 44px;">${welcome_driver}</h3>
                    <c:out value="${error}"/>
                    <div class="grid_7">
                        <h3>${your_name} <c:out value="${sessionScope.user.name}"/></h3>
                        <br>
                        <h3>${your_surname} <c:out value="${sessionScope.user.surname}"/></h3>
                        <br>
                        <h3>Your login: <c:out value="${sessionScope.user.login}"/></h3>
                    </div>
                    <div class="grid_4 prefix_1">
                        <c:if test="${sessionScope.user.confirmed !=false}">
                            <a class="btn main-button" href="/FrontController?command=CHOOSE_ORDER">${go_to_orders}</a>
                        </c:if>
                        <c:if test="${sessionScope.user.confirmed == false}">
                            <h4 style="text-align: center;font-size: 20px;color:red;padding-right: 90px;border-right-width: 20px;width: 300px;">
                               ${not_confirmed}</h4>
                        </c:if>

                        <br>
                        <a class="btn main-button-black" href="/edit">${edit_acc}</a>
                        <br>
                        <a class="btn main-button-black" href="/FrontController?command=DELETE_ACCOUNT">${delete_acc}</a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>


    </c:when>

    <c:when test="${role eq 'admin'}">
<div class="main">
        <header>
            <div class="menu_block ">
                <div class="container_12">
                    <div class="grid_12">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li><a href="FrontController?command=SHOW_ALL_DRIVERS">${drivers}</a></li>
                                <li><a href="FrontController?command=SHOW_ALL_USERS">${users_view}</a></li>
                                <li><a href="FrontController?command=SHOW_ALL_ADMINS">${admins}</a></li>
                                <li><a href="FrontController?command=SHOW_ALL_ORDERS">${orders}</a></li>
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
                <h3 style="font-size: 38px;margin-bottom: 35px;margin-left: 40px;width: 400px;">${create_admin}</h3>
                <form action="FrontController" method="post">
                    <input type="hidden" name="command" value="ADMIN_REGISTRATION">


                    <fieldset class="clearfix">
                        <c:out value="${error}"/>
                        <p><span class="fontawesome-user"></span><input type="text" name="name" value="${name}"
                                                                        onBlur="if(this.value == '') this.value = '${name}'"
                                                                        onFocus="if(this.value == '${name}') this.value = ''"
                                                                        required pattern="[A-Z][a-z]+"></p>
                        <p><span class="fontawesome-user"></span><input type="text" name="surname" value="${surname}"
                                                                        onBlur="if(this.value == '') this.value = '${surname}'"
                                                                        onFocus="if(this.value == '${surname}') this.value = ''"
                                                                        required pattern="[A-Z][a-z]+"></p>
                        <p><span class="fontawesome-bullhorn"></span><input type="text" name="login" value="${surname}"
                                                                            onBlur="if(this.value == '') this.value = '${surname}'"
                                                                            onFocus="if(this.value == '${surname}') this.value = ''"
                                                                            required pattern="([a-zA-Z0-9]+)(@)([a-zA-Z]+)(\.)([a-zA-Z]){2,3}"></p>
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
    </c:when>
</c:choose>
</body>
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
</html>