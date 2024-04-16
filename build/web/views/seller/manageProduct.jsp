<%-- 
    Document   : manageProduct
    Created on : Feb 5, 2024, 8:59:19 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" data-textdirection="ltr">
    <!-- BEGIN: Head-->

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="PIXINVENT">
        <title>Manage Product - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/nouislider.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/ui/prism.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/forms/select/select2.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/extensions/swiper.min.css">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/plugins/extensions/noui-slider.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/app-ecommerce-shop.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->
        <style>
            .color-circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: inline-block;
                margin-right: 5px;
            }
            .error {
                color: red;
            }
            .item-img {
                position: relative;
                overflow: hidden;
            }
            .item-img img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            #previewImagesContainer {
                position: relative;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 10px;
                max-width: 100%;
                max-height: 300px;
                overflow: auto;
            }

            .imageContainer {
                position: relative;
                overflow: hidden;
                max-width: 100px;
                max-height: 100px;
            }

            .imageContainer img {
                width: 100%;
                height: auto;
                display: block;
            }

            .btn-custom-size {
                padding: 0.375rem 0.75rem;
                font-size: 0.9rem;
                line-height: 1.5;
            }

            .circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-weight: bold;
                background-color: rgb(0, 220, 0);
                box-shadow: 0 0 20px 10px rgba(0, 235, 0, 0.2),
                    0 0 2px 5px rgba(0, 230, 0, 0.2),
                    0 0 5px 2px rgba(0, 230, 0, 0.1);
            }

            .circle-1 {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-weight: bold;
                background-color: rgb(192, 192, 192);
                box-shadow: 0 0 20px 10px rgba(128, 128, 128, 0.2),
                    0 0 2px 5px rgba(128, 128, 128, 0.2),
                    0 0 5px 2px rgba(128, 128, 128, 0.1);
            }
        </style>
    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body class="vertical-layout vertical-menu-modern semi-dark-layout content-detached-left-sidebar ecommerce-application navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-left-sidebar" data-layout="dark-layout">

        <!-- BEGIN: Header-->
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-dark navbar-shadow">
            <div class="navbar-wrapper">
                <div class="navbar-container content">
                    <div class="navbar-collapse" id="navbar-mobile">
                        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                            <ul class="nav navbar-nav">
                                <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                            </ul>
                            <ul class="nav navbar-nav bookmark-icons">
                                <!-- li.nav-item.mobile-menu.d-xl-none.mr-auto-->
                                <!--   a.nav-link.nav-menu-main.menu-toggle.hidden-xs(href='#')-->
                                <!--     i.ficon.feather.icon-menu-->
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                                <li class="nav-item d-none d-lg-block"></li>
                            </ul>
                        </div>
                        <ul class="nav navbar-nav float-right">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                                    <c:choose>
                                        <c:when test="${account.role_Id == 3}">
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">Welcome</span><span class="user-status">${account.email}</span></div><span><img class="round" src="${pageContext.request.contextPath}/assets/images/seller.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i> Edit Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" data-toggle="modal" data-target="#logoutModalAdmin" href="#"><i class="feather icon-power"></i> Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${account.email}</span><span class="user-status">${account.role_Id}</span></div><span><img class="round" src="${pageContext.request.contextPath}/app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i> Edit Profile</a>
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
                    <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath}/seller/dashboard">
                            <div class="brand-logo"></div>
                            <h2 class="brand-text mb-0">Seller</h2>
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <div class="shadow-bottom"></div>
            <div class="main-menu-content">
                <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class=" nav-item"><a href="index.html"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li class="active"><a href="${pageContext.request.contextPath}/seller/manageProduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard?page=setting-discounts"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Setting Discounts</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-file"></i><span class="menu-title" data-i18n="Invoice">Invoice</span></a>
                        <ul class="menu-content">
                            <li  class=""><a href="${pageContext.request.contextPath}/seller/manageInvoice"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">List</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>pages</span>
                    </li>
                    <li class=" nav-item"><a href="${pageContext.request.contextPath}/seller/dashboard?page=view-profile"><i class="feather icon-user"></i><span class="menu-title" data-i18n="Profile">Profile</span></a>
                    </li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/seller/dashboard?page=view-feedback"><i class="feather icon-mail"></i><span class="menu-title" data-i18n="Email">Feedback</span></a>
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
                    <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Manage Products</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active">Products List
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-detached content-body">
                    <div class="content-body">
                        <!-- Ecommerce Content Section Starts -->
                        <section id="ecommerce-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="ecommerce-header-items">
                                        <div class="result-toggler">
                                            <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                                                <span class="navbar-toggler-icon d-block d-lg-none"><i class="feather icon-menu"></i></span>
                                            </button>
                                            <div class="search-results">
                                                ${pagination.totalRecord} results found
                                            </div>
                                        </div>

                                        <div class="view-options">
                                            <select name="searchByStatus" class="price-options form-control" onchange="updateUrlParams()">
                                                <option selected value="">Status</option>
                                                <option value="0" id="hideOption" <c:if test="${status eq '0'}">selected</c:if>>Hide</option>
                                                <option value="1" id="displayOption" <c:if test="${status eq '1'}">selected</c:if>>Display</option>
                                                </select>
                                                <select name="sortByDate" class="price-options form-control" onchange="updateUrlParams()">
                                                    <option selected value="">Sorted By Date</option>
                                                    <option value="desc" id="descOptionDate"<c:if test="${sortedByDate eq 'desc'}">selected</c:if>>Newest</option>
                                                <option value="asc" id="ascOptionDate"<c:if test="${sortedByDate eq 'asc'}">selected</c:if>>Oldest</option>
                                                </select>
                                                <select name="sortByPrice" class="price-options form-control" id="ecommerce-price-options" onchange="updateUrlParams()">
                                                    <option selected value="">Sorted By Price</option>
                                                    <option value="asc" id="ascOption" <c:if test="${sortedByPrice eq 'asc'}">selected</c:if>>Lowest</option>
                                                <option value="desc" id="descOption" <c:if test="${sortedByPrice eq 'desc'}">selected</c:if>>Highest</option>
                                                </select>
                                                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addProductModal">Add Product</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- Ecommerce Content Section Starts -->
                            <!-- background Overlay when sidebar is shown  starts-->
                            <div class="shop-content-overlay"></div>
                            <!-- background Overlay when sidebar is shown  ends-->

                            <!-- Ecommerce Search Bar Starts -->
                            <form action="${pageContext.request.contextPath}/seller/manageProduct" method="GET">
                            <section id="ecommerce-searchbar">
                                <div class="row mt-1">
                                    <div class="col-sm-12">
                                        <fieldset class="form-group position-relative">
                                            <input type="hidden" name="action" value="search-products">
                                            <input value="${keyword}" name="keyword" type="text" class="form-control search-product" placeholder="Search by product name" id="iconLeft5" placeholder="Search here">
                                            <div class="form-control-position">
                                                <button type="submit"><i class="feather icon-search"></i></button>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </section>
                        </form>
                        <!-- Ecommerce Search Bar Ends -->

                        <!-- Ecommerce Products Starts -->
                        <div class="table-responsive">
                            <table class="table custom-table table-striped ">
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="align-middle">Product ID</th>
                                        <th class="align-middle">Image</th>
                                        <th class="align-middle">Name</th>
                                        <th class="align-middle">Category</th>
                                        <th class="align-middle">Brand</th>
                                        <th class="align-middle">Create On</th>
                                        <th class="align-middle">Price</th>
                                        <th class="align-middle">Status</th>
                                        <th class="align-middle text-center">Options</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${listPf}">
                                        <tr>
                                            <td class="align-middle border-bottom">${p.id}</td>
                                            <td class="align-middle item-img h-50 px-2 py-4 border-bottom">
                                                <img class="img-thumbnail " src="${p.image_path}" alt="Product Image">
                                            </td>
                                            <td class="align-middle px-2 py-2 border-bottom">${p.name}</td>
                                            <td class="align-middle border-bottom">${p.category}</td>
                                            <td class="align-middle border-bottom">${p.brand}</td>
                                            <td class="align-middle px-1 py-1 border-bottom">${p.create_on}</td>
                                            <td class="align-middle px-2 py-2 border-bottom">${p.price}VND</td>
                                            <c:if test="${p.status eq '1'}">
                                                <td class="align-middle px-2 py-2 border-bottom">
                                                    <div class="circle"></div>
                                                </td>
                                            </c:if>
                                            <c:if test="${p.status eq '0'}">
                                                <td class="align-middle px-2 py-2 border-bottom">
                                                    <div class="circle-1"></div>
                                                </td>
                                            </c:if>
                                            <td class="align-middle item-options px-2 py-2 border-bottom  text-center">
                                                <div class="btn-group" role="group" aria-label="Product Options">
                                                    <a class="btn btn-success btn-custom-size view-options" href="${pageContext.request.contextPath}/seller/manageProduct?page=view-product-details&productID=${p.id}">
                                                        <i class="feather icon-external-link"></i> <span class="ml-1" style="color:white">View</span>
                                                    </a>
                                                    <c:if test="${p.status eq '1'}">
                                                        <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusProductModal" title="Edit Status Product" onclick="editStatusProductModal('${p.id}', '${p.status}')">
                                                            <i class="feather icon-eye-off"></i> <span class="ml-1" style="color:white">Hide</span>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${p.status eq '0'}">
                                                        <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusProductModal" title="Edit Status Product" onclick="editStatusProductModal('${p.id}', '${p.status}')">
                                                            <i class="feather icon-eye"></i> <span class="ml-1" style="color:white">Display</span>
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Ecommerce Products Ends -->

                        <!-- Ecommerce Pagination Starts -->
                        <section id="ecommerce-pagination">
                            <div class="row">
                                <div class="col-sm-12">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center mt-2">
                                            <c:if test="${pagination.page > 1}">
                                                <li class="page-item prev-item"><a class="page-link" href="${pagination.urlPattern}pagination=1">Start</a></li>
                                                </c:if>
                                                <c:if test="${pagination.page > 1}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">Previous</a></li>
                                                </c:if>
                                            <!--PAGE - 2 (in case last page )-->
                                            <c:if test="${pagination.page == pagination.totalPage && pagination.page > 2}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 2}">${pagination.page - 2}</a></li>
                                                </c:if>
                                            <!--PAGE - 1 (in case last page )-->
                                            <c:if test="${pagination.page == pagination.totalPage && pagination.page > 1}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">${pagination.page - 1}</a></li>
                                                </c:if>
                                            <!--PAGE-->
                                            <c:if test="${pagination.totalPage >= 1}">
                                                <li class="page-item active" aria-current="page"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page}">${pagination.page}</a></li>
                                                </c:if>
                                            <!--PAGE + 1-->
                                            <c:if test="${pagination.page < pagination.totalPage}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">${pagination.page + 1}</a></li>
                                                </c:if>
                                            <!--PAGE + 2-->
                                            <c:if test="${pagination.page + 1 < pagination.totalPage}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 2}">${pagination.page + 2}</a></li>
                                                </c:if>
                                            <!--NEXT-->
                                            <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">Next</a></li>
                                                </c:if>
                                            <!--LAST-->
                                            <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                <li class="page-item next-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.totalPage}">Last</a></li>
                                                </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </section>
                        <!-- Ecommerce Pagination Ends -->
                    </div>
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


        <!-- BEGIN: Vendor JS-->
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/ui/prism.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/wNumb.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/swiper.min.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/app-ecommerce-shop.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/forms/number-input.js"></script>

        <!-- END: Page JS-->

        <script>
                var errmp = "${errmp}";
                if (errmp) {
                    alert("Error: " + errmp);
                }

                function updateUrlParams() {
                    var currentUrl = new URL(window.location.href);

                    var searchKeywordParam = currentUrl.searchParams.get('keyword');
                    var statusParam = currentUrl.searchParams.get('status');
                    var sortByPriceParam = currentUrl.searchParams.get('sortByPrice');
                    var sortByDateParam = currentUrl.searchParams.get('sortByDate');

                    var statusSelect = document.querySelector('select[name="searchByStatus"]');
                    var sortByPriceSelect = document.querySelector('select[name="sortByPrice"]');
                    var sortByDateSelect = document.querySelector('select[name="sortByDate"]');


                    statusParam = statusSelect.value || "";

                    sortByPriceParam = sortByPriceSelect.value || "";

                    sortByDateParam = sortByDateSelect.value || "";

                    var newUrl = "manageProduct?action=search-products";

                    if (searchKeywordParam) {
                        newUrl += "&keyword=" + searchKeywordParam;
                    }

                    if (statusParam !== "") {
                        newUrl += "&status=" + statusParam;
                    }

                    if (sortByPriceParam !== "") {
                        newUrl += "&sortByPrice=" + sortByPriceParam;
                    }

                    if (sortByDateParam) {
                        newUrl += "&sortByDate=" + sortByDateParam;
                    }

                    window.location.href = newUrl;
                }

        </script>    

        <jsp:include page="../seller/logOutModal.jsp"></jsp:include> 
        <jsp:include page="../seller/addProductModal.jsp"></jsp:include> 
        <jsp:include page="../seller/editStatusProductModal.jsp"></jsp:include> 
    </body>
    <!-- END: Body-->

</html>