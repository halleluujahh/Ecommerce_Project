<%-- 
    Document   : productCharacteristic
    Created on : Jan 27, 2024, 1:42:33 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <!-- BEGIN: Head-->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="PIXINVENT">
        <title>Dashboard - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/charts/apexcharts.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/tether-theme-arrows.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/tether.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/shepherd-theme-default.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/themes/semi-dark-layout.css">

        <!-- BEGIN: Page CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/core/menu/menu-types/vertical-menu.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/core/colors/palette-gradient.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/dashboard-analytics.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/card-analytics.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/plugins/tour/tour.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->

    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-dark navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="navbar-collapse" id="navbar-mobile">
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                            </ul>
                        </div>
                        <ul class="nav navbar-nav float-right">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                                    <c:choose>
                                        <c:when test="${account.role_Id == 2}">
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">Welcome</span><span class="user-status">${account.email}</span></div><span><img class="round" src="${pageContext.request.contextPath}/assets/images/admin.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${account.email}</span><span class="user-status">${account.role_Id}</span></div><span><img class="round" src="${pageContext.request.contextPath}/app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <ul class="main-search-list-defaultlist-other-list d-none">
            <li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer"><a class="d-flex align-items-center justify-content-between w-100 py-50">
                    <div class="d-flex justify-content-start"><span class="mr-75 feather icon-alert-circle"></span><span>No results found.</span></div>
                </a></li>
        </ul>
        <!-- END: Header-->


        <!-- BEGIN: Main Menu-->
        <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">
                            <div class="brand-logo"></div>
                            <h2 class="brand-text mb-0">Admin</h2>
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" nav-item"><a href="index.html"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/admin/manageproduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=view-details"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Setting Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=manage-discount"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Discount</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="User">User</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=manageUser"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">Manage Accounts</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END: Main Menu-->   

        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <!-- Dashboard Analytics Start -->
                    <section id="dashboard-analytics">
                        <div class="row match-height">
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="card bg-analytics text-white">
                                    <div class="card-content">
                                        <div class="card-body text-center">
                                            <img src="${pageContext.request.contextPath}/app-assets/images/elements/decore-left.png" class="img-left" alt="
                                                 card-img-left">
                                            <img src="${pageContext.request.contextPath}/app-assets/images/elements/decore-right.png" class="img-right" alt="
                                                 card-img-right">
                                            <div class="avatar avatar-xl bg-primary shadow mt-0">
                                                <div class="avatar-content">
                                                    <i class="feather icon-award white font-large-1"></i>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <h1 class="mb-2 text-white">Congratulations Admin</h1>
                                                <p class="m-auto w-75">You have done <strong>${percentageSaleToday}%</strong> more sales today.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="card h-75">
                                    <div class="card-header d-flex flex-column align-items-start pb-0">
                                        <div class="avatar bg-rgba-primary p-50 m-0">
                                            <div class="avatar-content">
                                                <i class="feather icon-users text-primary font-medium-5"></i>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${countAccount > 999 && countAccount < 999999}">
                                                <h2 class="text-bold-700 mt-1 mb-25">${countAccount}K</h2>
                                                <p class="mb-0">Subscribers Gained Today</p>
                                            </c:when>
                                            <c:otherwise>
                                                <h2 class="text-bold-700 mt-1 mb-25">${countAccount} </h2>
                                                <p class="mb-0">Subscribers Gained Today</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="card h-75">
                                    <div class="card-header d-flex flex-column align-items-start pb-0">
                                        <div class="avatar bg-rgba-warning p-50 m-0">
                                            <div class="avatar-content">
                                                <i class="feather icon-package text-warning font-medium-5"></i>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${countInvoiceTodays > 999 && countInvoiceTodays < 999999}">
                                                <h2 class="text-bold-700 mt-1 mb-25">${countInvoiceTodays}K</h2>
                                                <p class="mb-0">Orders Received Gained Today</p>
                                            </c:when>
                                            <c:otherwise>
                                                <h2 class="text-bold-700 mt-1 mb-25">${countInvoiceTodays} </h2>
                                                <p class="mb-0">Orders Received Gained Today</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/dashboard" method="GET">
                            <div style="color:white; display: inline-block;">From</div>
                            <input class="" type="date" id="start" name="start" value="${start}" style="display: inline-block;">
                            <div class="ml-2" style="color:white; display: inline-block;">To</div>
                            <input type="date" id="end" name="end" value="${end}" style="display: inline-block;">
                            <input class="ml-3 btn btn-danger" type="submit" value="SEARCH"/>
                        </form>
                        <div class="row match-height mt-2">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between pb-0">
                                        <h4>Product Statistics: </h4>
                                    </div>
                                    <div class="card-content">
                                        <h4 class="text-center mt-4">All Products ${totalProduct}</h4>
                                        <div class="card-body">
                                            <div id="product-polarArea-chart" class="mb-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between pb-0">
                                        <h4>Revenue Statistics: </h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div id="shop-revenue-bar-chart" class="mb-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row match-height">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between pb-0">
                                        <h4>Customer Statistics: </h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div id="customer-bar-chart" class="mb-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-header d-flex justify-content-between pb-0">
                                            <h4>Rate Statistics: </h4>
                                        </div>
                                        <div class="card-body">
                                            <div id="product-rate-bar-chart" class="mb-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Dashboard Analytics end -->

                </div>
            </div>
        </div>
        <!-- END: Content-->

        <div class="sidenav-overlay"></div>
        <div class="drag-target"></div>

        <!-- BEGIN: Footer-->
        <footer class="footer footer-static footer-light">
            <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; <script>document.write(new Date().getFullYear());</script><a class="text-bold-800 grey darken-2" href="" target="_blank">Brava,</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>
                <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
            </p>
        </footer>
        <!-- END: Footer-->

        <jsp:include page="../admin/logOutModal.jsp"></jsp:include> 

            <!-- BEGIN: Vendor JS-->
            <script src="${pageContext.request.contextPath}/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/charts/apexcharts.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/tether.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/shepherd.min.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/dashboard-analytics.js"></script>
        <!-- END: Page JS-->
        <!-- Include ApexCharts library -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    </body>
    <!-- END: Body-->

    <script>
                var options = {
                chart: {
                type: 'pie',
                        height: 350
                },
                        series: [${totalProductsString}],
                        labels: [ <c:forEach items="${listCategoryProduct}" var="category" > "${category.category}",</c:forEach>],
                        colors: ['#ffc107', '#28a745', '#7e3bad', '#d91a53'],
                        legend: {
                        show: true,
                                position: 'bottom',
                                horizontalAlign: 'center',
                                fontSize: '14px',
                                fontFamily: 'Arial, sans-serif',
                                markers: {
                                width: 12,
                                        height: 12,
                                        radius: 6,
                                },
                                itemMargin: {
                                horizontal: 10,
                                        vertical: 5
                                }
                        },
                        responsive: [{
                        breakpoint: 480,
                                options: {
                                chart: {
                                height: 300
                                },
                                        legend: {
                                        show: false
                                        }
                                }
                        }]
                };
                var chart = new ApexCharts(document.querySelector("#product-polarArea-chart"), options);
                chart.render();
        </script>

        <script>
            var options = {
            chart: {
            type: 'line',
                    height: 350,
                    fontFamily: '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif',
                    animations: {
                    enabled: false // Disable animations for smoother performance
                    }
            },
                    series: [{
                    name: 'Doanh Thu',
                            data: [<c:forEach items="${listChartRevenueArea}" var="revenue">${revenue.value},</c:forEach>]
                    }],
                    xaxis: {
                    categories: [<c:forEach items="${listChartRevenueArea}" var="revenue">"${revenue.date}",</c:forEach>],
                            tickAmount: 5,
                            labels: {
                            rotate: 0
                            }
                    },
                    yaxis: {
                    min: 0,
                            max: ${maxListChartRevenueArea},
                            tickAmount: 2,
                            labels: {
                            formatter: function (value) {
                            return value.toFixed(2);
                            }
                            }

                    },
                    grid: {
                    borderColor: 'rgba(0, 0, 0, .125)'
                    },
                    legend: {
                    show: false
                    }
            };
            var chart = new ApexCharts(document.querySelector("#shop-revenue-bar-chart"), options);
            chart.render();
    </script>

    <script>
        var options = {
        chart: {
        type: 'line',
                height: 350
        },
                series: [{
                name: 'Khách hàng',
                        data: [
        <c:forEach items="${listChartCustomer}" var="customer">
            ${customer.value},
        </c:forEach>
                        ]
                }],
                xaxis: {
                categories: [
        <c:forEach items="${listChartCustomer}" var="customer">
                "${customer.date}",
        </c:forEach>
                ],
                        tickAmount: 6,
                        labels: {
                        rotate: 0
                        }
                },
                yaxis: {
                min: 0,
                        max: ${maxListChartCustomerArea},
                        tickAmount: 2,
                        labels: {
                        formatter: function (value) {
                        return value.toFixed(0);
                        }
                        }
                },
                grid: {
                borderColor: 'rgba(0, 0, 0, .125)',
                        padding: {
                        right: 30
                        }
                },
                legend: {
                show: false
                }
        };
        var chart = new ApexCharts(document.querySelector("#customer-bar-chart"), options);
        chart.render();
    </script>

    <script>
        var options = {
        chart: {
        type: 'line',
                height: 350,
                fontFamily: '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif',
                animations: {
                enabled: false 
                }
        },
                series: [{
                name: 'Sao Trung Bình',
                        data: [
        <c:forEach items="${listChartAvgStar}" var="star">
            ${star.value},
        </c:forEach>
                        ]
                }],
                xaxis: {
                categories: [
        <c:forEach items="${listChartAvgStar}" var="star">
                "${star.date}",
        </c:forEach>
                ],
                        tickAmount: 5
                },
                yaxis: {
                min: 0,
                        max: 5,
                        tickAmount: 5
                },
                grid: {
                borderColor: 'rgba(0, 0, 0, .125)'
                },
                legend: {
                show: false
                }
        };
        var chart = new ApexCharts(document.querySelector("#product-rate-bar-chart"), options);
        chart.render();
    </script>


</html>
