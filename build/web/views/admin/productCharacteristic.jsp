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
        <title>Product Details - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet">

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

        <!-- Custom fonts for this template-->
        <link type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/fontawesome-free/css/all.min.css" rel="stylesheet">

        <style>
            .error {
                color: red;
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
                            <li class=""><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/admin/manageproduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li     class="active"><a href="${pageContext.request.contextPath}/admin/dashboard?page=view-details"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Setting Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=manage-discount"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Manage Discount</span></a>
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
                    <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Details</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a>
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
                    <!-- list color start -->
                    <section id="backcolor">
                        <div class="row">
                            <div class="col-12">
                                <div class="card background-color">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h4 class="card-title mb-0">Colors</h4>
                                        <div class="breadcrumb-item ml-2 mb-2">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addColorModal">
                                                <i class="fas fa-plus mr-2"></i> Add Color
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-striped col-10" id="colorTable">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="col-4">Color</th>
                                                            <th class="col-4">Status</th>
                                                            <th class="col-4">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listC}" var="c">
                                                            <tr style="color:black">
                                                                <td>${c.color}</td>
                                                                <c:if test="${c.status eq '1'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle"></div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${c.status eq '0'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle-1"></div>
                                                                    </td>
                                                                </c:if>
                                                                <td>
                                                                    <i class="fa fa-edit fa-2x px-2 py-2 rounded text-primary"
                                                                       data-toggle="modal" data-target="#editColorModal" title="Edit Color"
                                                                       onclick="editColorModal(`${c.id}`, `${c.color}`)">
                                                                    </i>
                                                                    <c:choose>
                                                                        <c:when test="${c.status eq '1'}">
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-danger"
                                                                               data-toggle="modal" data-target="#changeStatusColorModal" title="Change Status"
                                                                               onclick="deleteColorModal(`${c.id}`, '${c.status}')">
                                                                            </i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-success"
                                                                               data-toggle="modal" data-target="#changeStatusColorModal" title="Change Status"
                                                                               onclick="deleteColorModal(`${c.id}`, '${c.status}')">
                                                                            </i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- list color end -->

                    <!-- list brand start -->
                    <section id="backcolor-gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card background-color">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h4 class="card-title mb-0">Brands</h4>
                                        <div class="breadcrumb-item ml-2 mb-2">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addBrandModal">
                                                <i class="fas fa-plus mr-2"></i> Add Brands
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-striped col-10" id="brandTable">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="col-4">Brand</th>
                                                            <th class="col-4">Status</th>
                                                            <th class="col-4">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listB}" var="b">
                                                            <tr style="color:black">
                                                                <td>${b.brand}</td>
                                                                <c:if test="${b.status eq '1'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle"></div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${b.status eq '0'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle-1"></div>
                                                                    </td>
                                                                </c:if> 
                                                                <td>
                                                                    <i class="fa fa-edit fa-2x px-2 py-2 rounded text-primary"
                                                                       data-toggle="modal" data-target="#editBrandModal" title="Edit Brand"
                                                                       onclick="editBrandModal(`${b.id}`, `${b.brand}`)">
                                                                    </i>
                                                                    <c:choose>
                                                                        <c:when test="${b.status eq '1'}">
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-danger"
                                                                               data-toggle="modal" data-target="#changeStatusBrandModal" title="Change Status Brand"
                                                                               onclick="deleteBrandModal(`${b.id}`, '${b.status}')">
                                                                            </i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-success"
                                                                               data-toggle="modal" data-target="#changeStatusBrandModal" title="Change Status Brand"
                                                                               onclick="deleteBrandModal(`${b.id}`, '${b.status}')">
                                                                            </i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- list brand end -->

                    <!-- list category start -->
                    <section id="backcolor-gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card background-color">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h4 class="card-title mb-0">Category</h4>
                                        <div class="breadcrumb-item ml-2 mb-2">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addCategoryModal">
                                                <i class="fas fa-plus mr-2"></i> Add Category
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-striped col-10" id="cateTable">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="col-4">Category</th>
                                                            <th class="col-4">Status</th>
                                                            <th class="col-4">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listCate}" var="cate">
                                                            <tr style="color:black">
                                                                <td>${cate.category}</td>
                                                                <c:if test="${cate.status eq '1'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle"></div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${cate.status eq '0'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle-1"></div>
                                                                    </td>
                                                                </c:if>
                                                                <td>
                                                                    <i class="fa fa-edit fa-2x px-2 py-2 rounded text-primary"
                                                                       data-toggle="modal" data-target="#editCategoryModal" title="Edit Category"
                                                                       onclick="editCategoryModal(`${cate.id}`, `${cate.category}`)">
                                                                    </i>
                                                                    <c:choose>
                                                                        <c:when test="${cate.status eq '1'}">
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-danger"
                                                                               data-toggle="modal" data-target="#changeStatusCategoryModal" title="Change Status Category"
                                                                               onclick="deleteCategoryModal(`${cate.id}`, '${cate.status}')">
                                                                            </i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-success"
                                                                               data-toggle="modal" data-target="#changeStatusCategoryModal" title="Change Status Category"
                                                                               onclick="deleteCategoryModal(`${cate.id}`, '${cate.status}')">
                                                                            </i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- list category end -->

                    <!-- list gender start -->
                    <section id="backcolor-gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card background-color">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h4 class="card-title mb-0">Gender</h4>
                                        <div class="breadcrumb-item ml-2 mb-2">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addGenderModal">
                                                <i class="fas fa-plus mr-2"></i> Add Gender
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-striped col-10" id="genderTable">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="col-4">Gender</th>
                                                            <th class="col-4">Status</th>
                                                            <th class="col-4">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listG}" var="g">
                                                            <tr style="color:black">
                                                                <td>${g.gender}</td>
                                                                <c:if test="${g.status eq '1'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle"></div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${g.status eq '0'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle-1"></div>
                                                                    </td>
                                                                </c:if>
                                                                <td>
                                                                    <i class="fa fa-edit fa-2x px-2 py-2 rounded text-primary"
                                                                       data-toggle="modal" data-target="#editGenderModal" title="Edit Gender"
                                                                       onclick="editGenderModal(`${g.id}`, `${g.gender}`)">
                                                                    </i>
                                                                    <c:choose>
                                                                        <c:when test="${g.status eq '1'}">
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-danger"
                                                                               data-toggle="modal" data-target="#changeStatusGenderModal" title="Change Status Gender"
                                                                               onclick="deleteGenderModal(`${g.id}`, '${g.status}')">
                                                                            </i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-success"
                                                                               data-toggle="modal" data-target="#changeStatusGenderModal" title="Change Status Gender"
                                                                               onclick="deleteGenderModal(`${g.id}`, '${g.status}')">
                                                                            </i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- list gender end -->

                    <!-- list size start -->
                    <section id="backcolor-gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card background-color">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h4 class="card-title mb-0">Size</h4>
                                        <div class="breadcrumb-item ml-2 mb-2">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addSizeModal">
                                                <i class="fas fa-plus mr-2"></i> Add Size
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-striped col-10" id="sizeTable">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th class="col-4">Size</th>
                                                            <th class="col-4">Status</th>
                                                            <th class="col-4">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listS}" var="s">
                                                            <tr style="color:black">
                                                                <td>${s.size}</td>
                                                                <c:if test="${s.status eq '1'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle"></div>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${s.status eq '0'}">
                                                                    <td class="align-middle px-2 py-2 border-bottom">
                                                                        <div class="circle-1"></div>
                                                                    </td>
                                                                </c:if>
                                                                <td>
                                                                    <i class="fa fa-edit fa-2x px-2 py-2 rounded text-primary"
                                                                       data-toggle="modal" data-target="#editSizeModal" title="Edit Size"
                                                                       onclick="editSizeModal(`${s.id}`, `${s.size}`)">
                                                                    </i>
                                                                    <c:choose>
                                                                        <c:when test="${s.status eq '1'}">
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-danger"
                                                                               data-toggle="modal" data-target="#changeStatusSizeModal" title="Change Status Size"
                                                                               onclick="deleteSizeModal(`${s.id}`, '${s.status}')">
                                                                            </i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-power-off fa-2x px-2 py-2 rounded text-success"
                                                                               data-toggle="modal" data-target="#changeStatusSizeModal" title="Change Status Size"
                                                                               onclick="deleteSizeModal(`${s.id}`, '${s.status}')">
                                                                            </i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- list size end -->
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
        <jsp:include page="../admin/addColorModal.jsp"></jsp:include>
        <jsp:include page="../admin/deleteColorModal.jsp"></jsp:include>
        <jsp:include page="../admin/editColorModal.jsp"></jsp:include>
        <jsp:include page="../admin/addCategoryModal.jsp"></jsp:include>
        <jsp:include page="../admin/editCategoryModal.jsp"></jsp:include>
        <jsp:include page="../admin/deleteCategoryModal.jsp"></jsp:include>
        <jsp:include page="../admin/addBrandModal.jsp"></jsp:include>
        <jsp:include page="../admin/editBrandModal.jsp"></jsp:include>
        <jsp:include page="../admin/deleteBrandModal.jsp"></jsp:include>
        <jsp:include page="../admin/addGenderModal.jsp"></jsp:include>
        <jsp:include page="../admin/deleteGenderModal.jsp"></jsp:include>
        <jsp:include page="../admin/editGenderModal.jsp"></jsp:include>
        <jsp:include page="../admin/addSizeModal.jsp"></jsp:include>
        <jsp:include page="../admin/editSizeModal.jsp"></jsp:include>
        <jsp:include page="../admin/deleteSizeModal.jsp"></jsp:include>


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
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script>
                new DataTable('#colorTable', {
                    pagingType: 'full_numbers'
                });
                new DataTable('#brandTable', {
                    pagingType: 'full_numbers'
                });
                new DataTable('#cateTable', {
                    pagingType: 'full_numbers'
                });
                new DataTable('#genderTable', {
                    pagingType: 'full_numbers'
                });
                new DataTable('#sizeTable', {
                    pagingType: 'full_numbers'
                });
        </script>
    </body>
    <!-- END: Body-->

</html>
