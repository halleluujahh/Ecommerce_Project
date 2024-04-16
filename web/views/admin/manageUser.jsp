<%-- 
    Document   : manageUser
    Created on : Mar 5, 2024, 10:01:29 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>User List - Admin</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/tables/ag-grid/ag-grid.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/tables/ag-grid/ag-theme-material.css">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/app-user.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/aggrid.css">
        <!-- END: Page CSS-->

        <!-- BEGIN: Custom CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- END: Custom CSS-->

        <style>
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
                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Ecommerce</span></a>
                        <ul class="menu-content">
                            <li><a href="${pageContext.request.contextPath}/admin/manageproduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=view-details"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Setting Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=manage-discount"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Manage Discount</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="User">User</span></a>
                        <ul class="menu-content">
                            <li  class="active"><a href="${pageContext.request.contextPath}/admin/dashboard?page=manageUser"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">Manage Accounts</span></a>
                            </li>
                        </ul>
                    </li>
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
                                <h2 class="content-header-title float-left mb-0">Manage Accounts</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard?page=manageUser">Accounts List</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content-body">
                    <!-- users list start -->
                    <section class="users-list-wrapper">
                        <!-- users filter start -->
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Filters</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="feather icon-chevron-down"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="users-list-filter">
                                        <form>
                                            <div class="row">
                                                <div class="col-4">
                                                    <label for="users-list-role">Role</label>
                                                    <fieldset class="form-group">
                                                        <select name="searchByRole" class="form-control" id="users-list-role" onchange="updateUrlParams()">
                                                            <option selected="" value="">All</option>
                                                            <c:forEach items="${listR}" var="r">
                                                                <option value="${r.id}" <c:if test="${roleId eq r.id}">selected=""</c:if>>${r.role}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </fieldset>
                                                </div>
                                                <div class="col-4">
                                                    <label for="users-list-status">Status</label>
                                                    <fieldset class="form-group">
                                                        <select name="searchByStatus" class="form-control" id="users-list-status" onchange="updateUrlParams()">
                                                            <option selected="" value="">All</option>
                                                            <option value="0" id="hideOption" <c:if test="${status eq '0'}">selected</c:if>>Hide</option>
                                                            <option value="1" id="displayOption" <c:if test="${status eq '1'}">selected</c:if>>Display</option>
                                                            </select>
                                                        </fieldset>
                                                    </div>
                                                    <div class="col-4">
                                                        <label for="users-list-verified">Gender</label>
                                                        <fieldset class="form-group">
                                                            <select name="searchByGender" class="form-control" id="users-list-verified" onchange="updateUrlParams()">
                                                                <option selected="" value="">All</option>
                                                            <c:forEach items="${listG}" var="g">
                                                                <option value="${g.id}" <c:if test="${genderId eq g.id}">selected=""</c:if>>${g.gender}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- users filter end -->

                        <!-- Ag Grid users list section start -->
                        <div id="basic-examples">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="ag-grid-btns d-flex justify-content-between flex-wrap mb-1">
                                                    <div class="dropdown sort-dropdown mb-1 mb-sm-0">
                                                        <h3>Total Account: ${pagination.totalRecord}</h3>
                                                        <select name="searchByPageSize" onchange="updateUrlParams()" id="pageSize" class="btn btn-white filter-btn dropdown-toggle border text-dark" type="button" id="dropdownMenuButton6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            1 - 10 of 20
                                                            <option selected="" class="dropdown-item" value="">Default</option>
                                                            <option  <c:if test="${pageSizeRaw eq '5'}">selected=""</c:if> class="dropdown-item" value="5">5</option>
                                                            <option <c:if test="${pageSizeRaw eq '10'}">selected=""</c:if> class="dropdown-item" value="10">10</option>
                                                            <option <c:if test="${pageSizeRaw eq '20'}">selected=""</c:if> class="dropdown-item" value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <form action="${pageContext.request.contextPath}/admin/dashboard" method="GET">
                                                        <section id="ecommerce-searchbar">
                                                            <div class="row mt-1">
                                                                <div class="col-sm-12">
                                                                    <fieldset class="form-group position-relative">
                                                                        <input type="hidden" name="page" value="manageUser">
                                                                        <input type="hidden" name="action" value="search-users">
                                                                        <input name="keyword" type="text" class="form-control search-product" placeholder="Search by user name" id="iconLeft5" placeholder="Search here">
                                                                        <div class="form-control-position">
                                                                            <button type="submit"><i class="feather icon-search"></i></button>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </section>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <button style="float: right" class="btn btn-success mb-2" type="button" data-toggle="modal" data-target="#addSellerModal">Add New Seller</button>
                                        <jsp:include page="../../views/admin/addSellerModal.jsp"></jsp:include>
                                            <!-- List Users Starts -->
                                            <div class="table-responsive">
                                            <table class="table custom-table table-striped ">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th class="align-middle">Username</th>
                                                        <th class="align-middle">Email</th>
                                                        <th class="align-middle">Gender</th>
                                                        <th class="align-middle">Role</th>
                                                        <th class="align-middle">Status</th>
                                                        <th class="align-middle text-center">Options</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listAf}" var="a">
                                                        <tr style="color:black">
                                                            <td class="align-middle px-2 py-2 border-bottom">${a.username}</td>
                                                            <td class="align-middle px-2 py-2 border-bottom">${a.email}</td>
                                                            <td class="align-middle border-bottom">${a.gender}</td>
                                                            <td class="align-middle px-2 py-2 border-bottom">${a.role}</td>
                                                            <c:if test="${a.status eq '1'}">
                                                                <td class="align-middle px-2 py-2 border-bottom">
                                                                    <div class="circle"></div>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${a.status eq '0'}">
                                                                <td class="align-middle px-2 py-2 border-bottom">
                                                                    <div class="circle-1"></div>
                                                                </td>
                                                            </c:if>
                                                            <td class="align-middle item-options px-1 py-1 border-bottom  text-center">
                                                                <div class="btn-group" role="group" aria-label="Product Options">
                                                                    <a class="btn btn-success btn-custom-size view-options" href="${pageContext.request.contextPath}/admin/dashboard?page=view-account-details&accountID=${a.id}">
                                                                        <i class="feather icon-external-link"></i> <span class="ml-1" style="color:white">View</span>
                                                                    </a>
                                                                    <c:if test="${a.status eq '1'}">
                                                                        <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusAccountModal" title="Edit Status Account" onclick="editStatusAccountModal('${a.id}', '${a.status}')">
                                                                            <i class="feather icon-eye-off"></i> <span class="ml-1" style="color:white">Hide</span>
                                                                        </button>
                                                                    </c:if>
                                                                    <c:if test="${a.status eq '0'}">
                                                                        <button class="btn btn-primary btn-custom-size delete" data-toggle="modal" data-target="#editStatusAccountModal" title="Edit Status Account" onclick="editStatusAccountModal('${a.id}', '${a.status}')">
                                                                            <i class="feather icon-eye"></i> <span class="ml-1" style="color:white">Display</span>
                                                                        </button>
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <!-- List User Pagination Starts -->
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
                                                                <c:if test="${pagination.totalPage == 1}">
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
                                            <!-- List User Pagination Ends -->        
                                        </div>
                                        <!-- List Users Ends -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Ag Grid users list section end -->
                    </section>
                    <!-- users list ends -->
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
        <script>


        </script>



        <!-- BEGIN: Vendor JS-->
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/ag-grid/ag-grid-community.min.noStyle.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/pages/app-user.js"></script>
        <!-- END: Page JS-->

        <jsp:include page="../admin/logOutModal.jsp"></jsp:include> 
        <jsp:include page="../admin/editStatusAccountModal.jsp"></jsp:include>
    </body>
    <!-- END: Body-->
    <script>
            function updateUrlParams() {
                var currentUrl1 = window.location.href;
                var searchUrl = new URL(currentUrl1);

                var statusParam = searchUrl.searchParams.get('status');
                var roleParam = searchUrl.searchParams.get('role');
                var genderParam = searchUrl.searchParams.get('gender');
                var pageSizeParam = searchUrl.searchParams.get('pageSize');
                var searchKeywordParam = searchUrl.searchParams.get('keyword');

                var statusSelect = document.querySelector('select[name="searchByStatus"]');
                var roleSelect = document.querySelector('select[name="searchByRole"]');
                var genderSelect = document.querySelector('select[name="searchByGender"]');
                var pageSizeSelect = document.querySelector('select[name="searchByPageSize"]');

                if (statusSelect.value === "") {
                    statusParam = "";
                } else {
                    statusParam = statusSelect.value;
                }
                if (roleSelect.value === "") {
                    roleParam = "";
                } else {
                    roleParam = roleSelect.value;
                }
                if (genderSelect.value === "") {
                    genderParam = "";
                } else {
                    genderParam = genderSelect.value;
                }
                if (pageSizeSelect.value === "") {
                    pageSizeParam = "";
                } else {
                    pageSizeParam = pageSizeSelect.value;
                }

                var newUrl = "dashboard?page=manageUser&action=search-users";
                if (searchKeywordParam) {
                    newUrl += "&keyword=" + searchKeywordParam;
                }
                if (statusParam) {
                    newUrl += "&status=" + statusParam;
                }
                if (roleParam) {
                    newUrl += "&role=" + roleParam;
                }
                if (genderParam) {
                    newUrl += "&gender=" + genderParam;
                }
                if (pageSizeParam) {
                    newUrl += "&pageSize=" + pageSizeParam;
                }

                window.location.href = newUrl;
            }
    </script>
</html>
