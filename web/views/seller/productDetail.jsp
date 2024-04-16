<%-- 
    Document   : productDetails
    Created on : Feb 5, 2024, 9:24:35 AM
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
        <title>Product Details - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/app-ecommerce-details.css">
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

    <body id="body" class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns ecommerce-application navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

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
                    <li class=" nav-item"><a href="${pageContext.request.contextPath}/seller/dashboard"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/seller/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
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
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/seller/manageProduct">Products List</a>
                                        </li>
                                        <li class="breadcrumb-item active">Details
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="content-body">
                    <!-- app ecommerce details start -->
                    <section class="app-ecommerce-details">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group breadcrum-right">
                                    <a style="float:right" class="btn btn-success btn-equal-size view-options mb-2 mb-md-0 flex-fill" href="${pageContext.request.contextPath}/seller/manageProduct?page=update-product&productID=${productForm.id}">
                                        <i class="feather icon-edit"></i> <span  style="color: white">Update Product</span>
                                    </a> 
                                </div>
                                <div class="row mb-5 mt-2">
                                    <div class="col-12 col-md-5 d-flex flex-column align-items-center justify-content-center mb-2 mb-md-0">
                                        <!-- Product Images Carousel -->
                                        <div id="carouselIndicators" class="carousel slide w-50" data-ride="carousel">
                                            <c:choose>
                                                <c:when test="${not empty productForm.image_path and not empty listImages}">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="${productForm.image_path}" class="d-block w-100 h-100" alt="Default Image">
                                                        </div>
                                                        <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                            <div class="carousel-item">
                                                                <img class="d-block w-100 h-100" src="${image.image}" alt="Slide ${loop.index + 1}">
                                                            </div>
                                                        </c:forEach>
                                                        <ol class="carousel-indicators">
                                                            <li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
                                                                <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                                <li data-target="#carouselIndicators" data-slide-to="${loop.index + 1}"></li>
                                                                </c:forEach>
                                                        </ol>
                                                    </div>
                                                </c:when>
                                                <c:when test="${empty listImages}">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="${productForm.image_path}" class="d-block w-100 h-100" alt="Default Image">
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${empty productForm.image_path}">
                                                    <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                        <div class="carousel-item">
                                                            <img class="d-block w-100 h-100" src="${image.image}" alt="Slide ${loop.index + 1}">
                                                        </div>
                                                    </c:forEach>
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
                                                            <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                            <li data-target="#carouselIndicators" data-slide-to="${loop.index + 1}"></li>
                                                            </c:forEach>
                                                    </ol>
                                                </c:when>
                                            </c:choose>
                                            <a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- end carousel-->
                                    <div class="col-12 col-md-6">
                                        <div class="card">
                                            <div class="card-body" style="color: black">
                                                <h1 class="card-title">${productForm.name}</h1>
                                                <h5 class="card-text">${productForm.price} VND</h5>
                                                <p class="card-text">Brand: ${productForm.brand}</p>
                                                <p class="card-text">Category: ${productForm.category}</p>
                                                <p class="card-text">Description: ${productForm.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Ecommerce Content Section Starts -->
                                <hr>

                                <section id="ecommerce-header">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="result-toggler">
                                                <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                                                    <span class="navbar-toggler-icon d-block d-lg-none"><i class="feather icon-menu"></i></span>
                                                </button>
                                                <div class="search-results">
                                                    ${pagination.totalRecord} results found
                                                </div>
                                            </div>
                                            <div class="ecommerce-header-items" style="float:right">
                                                <div class="view-options">
                                                    <select name="searchByStatus" class="selectpicker" data-style="btn-success" onchange="updateUrlParams()">
                                                        <option selected value="">Status</option>
                                                        <option value="0" id="hideOption" <c:if test="${status eq '0'}">selected</c:if>>Hide</option>
                                                        <option value="1" id="displayOption" <c:if test="${status eq '1'}">selected</c:if>>Display</option>
                                                        </select>
                                                        <select name="sortByDate" class="selectpicker" data-style="btn-success" onchange="updateUrlParams()">
                                                            <option selected value="">Sorted By Date</option>
                                                            <option value="desc" id="descOptionDate" <c:if test="${sortedByDate eq 'desc'}">selected=""</c:if>>Newest</option>
                                                        <option value="asc" id="ascOptionDate" <c:if test="${sortedByDate eq 'asc'}">selected=""</c:if>>Oldest</option>
                                                        </select>
                                                        <select name="sortByColor" class="selectpicker" data-style="btn-success" onchange="updateUrlParams()">
                                                            <option selected value="">Sort By Color</option>
                                                        <c:forEach items="${listCp}" var="c">
                                                            <option value="${c.id}" id="colorOption" <c:if test="${colorID eq c.id}"> selected</c:if> >${c.color}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select name="sortBySize" class="selectpicker" data-style="btn-success" onchange="updateUrlParams()">
                                                        <option selected value="">Sort By Size</option>
                                                        <c:forEach items="${listSp}" var="s">
                                                            <option value="${s.id}" id="sizeOption" <c:if test="${sizeID eq s.id}"> selected</c:if> >${s.size}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select name="sortByGender" class="selectpicker" data-style="btn-success" onchange="updateUrlParams()">
                                                        <option selected value="">Sort By Gender</option>
                                                        <c:forEach items="${listGp}" var="g">
                                                            <option value="${g.id}" id="genderOption" <c:if test="${genderID eq g.id}"> selected</c:if> >${g.gender}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <button  class="btn btn-success" type="button" data-toggle="modal" data-target="#addProductDetailsModal" onclick="addProductDetailsModal('${productID}', '${productName}')">Add Product Details</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- Ecommerce Content Section End -->
                                <!-- Ecommerce Products Starts -->
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th class="align-middle">Color</th>
                                                <th class="align-middle">Size</th>
                                                <th class="align-middle">Gender</th>
                                                <th class="align-middle">Created On</th>
                                                <th class="align-middle">Stock</th>
                                                <th class="align-middle">Status</th>
                                                <th class="align-middle text-center">Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <c:forEach var="p" items="${listPf}">
                                                <tr style="color: black">
                                                    <td class="align-middle px-1 py-1 border-bottom">${p.color}</td>
                                                    <td class="align-middle px-1 py-1 border-bottom">${p.size}</td>
                                                    <td class="align-middle px-1 py-1 border-bottom">${p.gender}</td>
                                                    <td class="align-middle px-2 py-2 border-bottom">${p.created_on}</td>
                                                    <td class="align-middle px-2 py-2 border-bottom">${p.stock}</td>
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
                                                            <button class="btn btn-success btn-custom-size delete" data-toggle="modal" data-target="#editQuantityProductDetailModal" title="Edit Quantity Product Detail" onclick="editQuantityProductDetailModal('${p.id}', '${p.productDetailId}', '${p.status}')">
                                                                <i class="feather icon-edit"></i> <span class="ml-1" style="color:white">Update</span>
                                                            </button>
                                                            <c:if test="${p.status eq '1'}">
                                                                <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusProductDetailModal" title="Edit Status Product Detail" onclick="editStatusProductDetailModal('${p.id}', '${p.status}', '${p.productDetailId}')">
                                                                    <i class="feather icon-eye-off"></i> <span class="ml-1" style="color:white">Hide</span>
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${p.status eq '0'}">
                                                                <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusProductDetailModal" title="Edit Status Product Detail" onclick="editStatusProductDetailModal('${p.id}', '${p.status}', '${p.productDetailId}')">
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
                                <jsp:include page="../../views/seller/editQuantityProductDetailModal.jsp"></jsp:include>
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
                                                    <c:if test="${pagination.totalPage > 1}">
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
                                                        <li class="page-item "><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">Next</a></li>
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
                    </section>
                    <!-- app ecommerce details end -->
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
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/forms/spinner/jquery.bootstrap-touchspin.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/swiper.min.js"></script>
        <!-- END: Page Vendor JS--> 

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/app-ecommerce-details.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/forms/number-input.js"></script>
        <!-- END: Page JS-->

        <jsp:include page="../seller/logOutModal.jsp"></jsp:include> 
        <jsp:include page="../seller/deleteProductDetailsModal.jsp"></jsp:include> 
        <jsp:include page="../seller/addProductDetailsModal.jsp"></jsp:include>
        <jsp:include page="../seller/editStatusProductDetailModal.jsp"></jsp:include>

        </body>
        <!-- END: Body-->
        <script>

                var errorup = "${errorup}";
                if (errorup) {
                    alert("Error: " + errorup);
                }

                var msgup = "${msgup}";
                if (msgup) {
                    alert("Success: " + msgup);
                }

                function updateUrlParams() {
                    var currentUrl1 = window.location.href;
                    var searchUrl = new URL(currentUrl1);

                    var statusParam = searchUrl.searchParams.get('status');
                    var colorParam = searchUrl.searchParams.get('colorID');
                    var sizeParam = searchUrl.searchParams.get('sizeID');
                    var genderParam = searchUrl.searchParams.get('genderID');
                    var dateParam = searchUrl.searchParams.get('sortByDate');

                    var statusSelect = document.querySelector('select[name="searchByStatus"]');
                    var colorSelect = document.querySelector('select[name="sortByColor"]');
                    var sizeSelect = document.querySelector('select[name="sortBySize"]');
                    var genderSelect = document.querySelector('select[name="sortByGender"]');
                    var sortByDate = document.querySelector('select[name="sortByDate"]');

                    statusParam = statusSelect.value || "";

                    if (colorSelect.value === "") {
                        colorParam = "";
                    } else {
                        colorParam = colorSelect.value;
                    }
                    if (sizeSelect.value === "") {
                        sizeParam = "";
                    } else {
                        sizeParam = sizeSelect.value;
                    }
                    if (genderSelect.value === "") {
                        genderParam = "";
                    } else {
                        genderParam = genderSelect.value;
                    }
                    if (sortByDate.value === "") {
                        dateParam = "";
                    } else {
                        dateParam = sortByDate.value;
                    }

                    var newUrl = "manageProduct?page=view-product-details&action=search-product-details&productID=${productID}";

                    if (statusParam !== "") {
                        newUrl += "&status=" + statusParam;
                    }
                    if (colorParam) {
                        newUrl += "&colorID=" + colorParam;
                    }
                    if (sizeParam) {
                        newUrl += "&sizeID=" + sizeParam;
                    }
                    if (genderParam) {
                        newUrl += "&genderID=" + genderParam;
                    }
                    if (dateParam) {
                        newUrl += "&sortByDate=" + dateParam;
                    }

                    window.location.href = newUrl;
                }

    </script>    
</html>