<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tours</title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="ctg" uri="customTags" %>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
          rel="stylesheet">
    <link rel="stylesheet"
          href="${root}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${root}/resources/css/animate.css">
    <link rel="stylesheet" href="${root}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet"
          href="${root}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${root}/resources/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css"
          href="${root}/resources/css/table.css">
    <link rel="stylesheet" type="text/css"
          href="${root}/resources/css/mainPage.css">
    <link rel="stylesheet" href="${root}/resources/css/aos.css">
    <link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${root}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${root}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${root}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${root}/resources/css/style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"
          href="${root}/resources/css/navigation.css">
</head>
<header>
    <c:import url="/WEB-INF/view/header.jsp"/>
</header>
<body>
<div class="nanvnav">
    <nav>
        <ul class="dropdown">
            <li class="drop"><a href="#">Cities</a>
                <ul class="sub_menu">
                    <li>
                        <jsp:useBean id="cities" scope="session"
                                     type="java.util.List"/>
                        <c:forEach items="${cities}" var="city">
                            <form method="post" name="cities">
                                <button class="btn btn-outline-info btn-lg btn-block"
                                        aria-label="Cities" type="submit"
                                        name="command"
                                        value="GET_BY_CITY"><input type="hidden"
                                                                   name="city_id"
                                                                   value="${city.cityId}"/>
                                        ${city.city}
                                </button>
                            </form>
                        </c:forEach>
                    </li>
                </ul>
            </li>
            <li class="drop"><a href="#">Types</a>
                <ul class="sub_menu">
                    <li>
                        <jsp:useBean id="tour_types" scope="session"
                                     type="java.util.List"/>
                        <c:forEach items="${tour_types}" var="tour_type">
                            <form method="post" name="tourTypes">
                                <button class="btn btn-outline-info btn-lg btn-block"
                                        aria-label="TourType" type="submit"
                                        name="command"
                                        value="GET_BY_TOUR_TYPE"><input
                                        type="hidden"
                                        name="tour_type_id"
                                        value="${tour_type.tourTypeId}"/>
                                        ${tour_type.type}
                                </button>
                            </form>
                        </c:forEach>
                    </li>
                </ul>
            </li>
        </ul>
        <form method="post" name="hotTours">
            <button class="btn btn-info btn-lg"
                    aria-label="Hot"
                    type="submit"
                    name="command"
                    value="GET_HOT_TOURS">Hot tours
            </button>
        </form>
    </nav>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row">
            <jsp:useBean id="tours" class="java.util.ArrayList"
                         scope="session"/>
            <c:forEach items="${tours}" var="tour">
                <div class="col-md-6 col-lg-4 ftco-animate">
                    <div class="project">
                        <div class="img">
                            <img src="data:image/jpg;base64,${tour.imageString}"
                                 class="img-fluid" alt="Colorlib Template">
                        </div>
                        <div class="text">
                            <h4 class="price"><c:out
                                    value="${tour.cost}$"/></h4>
                            <span><c:out value="${tour.days}"/> days</span>
                            <h3><c:out
                                    value="${tour.name} to ${tour.city.city}"/>
                            </h3>
                            <div class="star d-flex clearfix">
                                <div class="mr-auto float-left">
                                    <span class="rate">${tour.departureDate}</span>
                                </div>
                            </div>
                            <div class="star d-flex clearfix">
                                <div class="mr-auto float-left">
                                                <span class="ion-ios-star"><c:out
                                                        value="${tour.tourType.type}"/></span>
                                </div>
                            </div>
                            <div class="star d-flex clearfix">
                                <div class="mr-auto float-left">
                                                <span class="ion-ios-star"><c:out
                                                        value="${tour.transport.type}"/></span>
                                </div>
                            </div>
                            <div class="star d-flex clearfix">
                                <div class="mr-auto float-left">
                                                <span class="ion-ios-star"><c:out
                                                        value="from ${tour.departureCity.city}"/></span>
                                </div>
                            </div>
                            <div style="padding-top: 5px">
                                <c:if test="${sessionScope.role =='CLIENT'}">
                                    <%--                                        <form method="post">--%>
                                    <%--                                                <button class="btn btn-info"--%>
                                    <%--                                                        aria-label="Buy"--%>
                                    <%--                                                        type="submit" name="command"--%>
                                    <%--                                                        value="buy_tour">--%>
                                    <%--                                                    <input type="hidden" name="tour_id"--%>
                                    <%--                                                           value="${tour.tourId}"/>--%>
                                    <%--                                                    do not hot--%>
                                    <%--                                                </button>--%>
                                    <%--                                        </form>--%>
                                    <form method="post">
                                        <button class="btn btn-info"
                                                aria-label="Buy"
                                                type="submit">
                                            Buy
                                        </button>
                                    </form>
                                </c:if>
                                <c:if test="${sessionScope.role =='ADMIN'}">
                                    <form method="post">
                                        <c:if test="${tour.hot}">
                                            <button class="btn btn-info"
                                                    aria-label="Hot"
                                                    type="submit"
                                                    name="command"
                                                    value="un_hot_tour">
                                                <input type="hidden"
                                                       name="tour_id"
                                                       value="${tour.tourId}"/>
                                                do not hot
                                            </button>
                                        </c:if>
                                        <c:if test="${!tour.hot}">
                                            <button class="btn btn-info"
                                                    aria-label="UnHot"
                                                    type="submit"
                                                    name="command"
                                                    value="set_hot_tour">
                                                <input type="hidden"
                                                       name="tour_id"
                                                       value="${tour.tourId}"/>
                                                do hot
                                            </button>
                                        </c:if>
                                        <button class="btn btn-danger"
                                                type="submit" name="command"
                                                value="delete_tour">
                                            <input type="hidden"
                                                   name="tour_id"
                                                   value="${tour.tourId}"/>
                                            <i class="fa fa-trash-o fa-lg"></i>
                                            Delete
                                        </button>
                                        <button class="btn btn-default btn-sm">
                                            <i class="fa fa-cog"></i>
                                            Settings
                                        </button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                        <a href="data:image/jpg;base64,${tour.imageString}"
                           class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</section>

<footer>
    <div class="copyrights wrapper">
        <ctg:copyrightTag/>
    </div>
</footer>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none"
                stroke-width="4"
                stroke-miterlimit="10" stroke="#F96D00"/>
    </svg>
</div>


<script src="${root}/resources/js/jquery.min.js"></script>
<script src="${root}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${root}/resources/js/popper.min.js"></script>
<script src="${root}/resources/js/bootstrap.min.js"></script>
<script src="${root}/resources/js/jquery.waypoints.min.js"></script>
<script src="${root}/resources/js/jquery.stellar.min.js"></script>
<script src="${root}/resources/js/owl.carousel.min.js"></script>
<script src="${root}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${root}/resources/js/aos.js"></script>
<script src="${root}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${root}/resources/js/bootstrap-datepicker.js"></script>
<script src="${root}/resources/js/scrollax.min.js"></script>
<script src="${root}/resources/js/main.js"></script>
<script src="${root}/resources/js/nav.js"></script>
</body>
</html>