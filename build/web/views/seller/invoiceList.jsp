<%-- 
    Document   : invoiceList
    Created on : Feb 28, 2024, 1:47:31 PM
    Author     : admin
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
        <title>Manage Invoice - Seller</title>
        <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/apple-icon-120.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/app-assets/images/ico/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet">

        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/tables/datatable/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/file-uploaders/dropzone.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/plugins/file-uploaders/dropzone.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/css/pages/data-list-view.css">
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

                            <ul class="nav navbar-nav bookmark-icons">
                                <!-- li.nav-item.mobile-menu.d-xl-none.mr-auto-->
                                <!--   a.nav-link.nav-menu-main.menu-toggle.hidden-xs(href='#')-->
                                <!--     i.ficon.feather.icon-menu-->

                            </ul>
                            <ul class="nav navbar-nav">

                                <!-- select.bookmark-select-->
                                <!--   option Chat-->
                                <!--   option email-->
                                <!--   option todo-->
                                <!--   option Calendar-->
                                </li>
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
                            <li><a href="${pageContext.request.contextPath}/seller/manageProduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li class=""><a href="${pageContext.request.contextPath}/seller/dashboard?page=setting-discounts"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Setting Discounts</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" nav-item"><a href="#"><i class="feather icon-file"></i><span class="menu-title" data-i18n="Invoice">Invoice</span></a>
                        <ul class="menu-content">
                            <li  class="active"><a href="${pageContext.request.contextPath}/seller/manageInvoice"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">List</span></a>
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
                                <h2 class="content-header-title float-left mb-0">List Invoice</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-filter">
                    <form id="statusForm" action="${pageContext.request.contextPath}/seller/manageInvoice" method="GET">
                        <div class="row">
                            <div class="col-2">
                                <label for="list-status">Status</label>
                                <fieldset class="form-group">
                                    <select style="color: white" name="searchByStatus" class="form-control bg-dark" id="users-list-status" onchange="submitForm()">
                                        <option class="bg-white" value="">Choose status</option>
                                        <c:forEach items="${listStatus}" var="s">
                                            <option value="${s.id}">${s.status}</option>
                                        </c:forEach>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="content-body">
                    <!-- Data list view starts -->
                    <section id="data-list-view" class="data-list-view-header">
                        <!-- DataTable starts -->
                        <div class="table-responsive">
                            <div style="color: red">${errdp}</div>
                            <div style="color: green">${msgdp}</div>
                            <table class="table table-striped" id = "invoiceTable">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>STT</th>
                                        <th>Invoice ID</th>
                                        <th>#Invoice Code</th>
                                        <th>Invoice Date</th>
                                        <th>USERNAME</th>
                                        <th>EMAIL</th>
                                        <th>ADDRESS</th>
                                        <th>TOTAL PRICE</th>
                                        <th>Order Status</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listIf}" var="If" varStatus="loop">
                                        <tr style="color:black">
                                            <td>${loop.index + 1}</td>
                                            <td class="product-id">${If.id}</td>
                                            <td class="product-cartcode">${If.cartCode}</td>
                                            <td class="invoice-date">${If.invoice_date}</td>
                                            <td class="username">${If.username}</td>
                                            <td class="email">${If.email}</td>
                                            <td class="address">${If.address}</td>
                                            <td class="product-price">$${If.totalPrice}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${If.status == 'Cancel'}">
                                                        <div class="chip chip-danger">
                                                            <div class="chip-body">
                                                                <div class="chip-text">${If.status}</div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${If.status == 'Delivery'}">
                                                        <div class="chip chip-warning">
                                                            <div class="chip-body">
                                                                <div class="chip-text">${If.status}</div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${If.status == 'Pending'}">
                                                        <div class="chip chip-secondary">
                                                            <div class="chip-body">
                                                                <div class="chip-text">${If.status}</div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="chip chip-success">
                                                            <div class="chip-body">
                                                                <div class="chip-text">${If.status}</div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="product-action">
                                                <span class="action-edit"><a href="manageInvoice?page=view-invoice-details&invoiceID=${If.id}"><i class="feather icon-eye"></i></a></span>
                                                        <c:if test="${If.status ne 'Complete' && If.status ne 'Cancel'}">
                                                    <a class="" data-toggle="modal" data-target="#editInvoiceModal" title="Edit Invoice" onclick="updateInvoice('${If.id}', '${If.status}')">
                                                        <i class="feather icon-edit"></i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${If.status == 'Cancel'}">
                                                    <a class="" data-toggle="modal" data-target="#deleteInvoiceModal" title="Delete Invoice" onclick="deleteInvoiceModal('${If.id}')">
                                                        <i class="feather icon-trash"></i>
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- DataTable ends -->
                    </section>
                    <!-- Data list view end -->

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
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/extensions/dropzone.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/dataTables.select.min.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app-menu.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/core/app.js"></script>
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="${pageContext.request.contextPath}/app-assets/js/scripts/ui/data-list-view.js"></script>
        <!-- END: Page JS-->
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script>
                new DataTable('#invoiceTable', {
                    pagingType: 'full_numbers'
                });
        </script>
        <jsp:include page="../../views/seller/logOutModal.jsp"></jsp:include>
        <jsp:include page="../../views/seller/editStatusInvoiceModal.jsp"></jsp:include>
        <jsp:include page="../../views/seller/deleteInvoiceModal.jsp"></jsp:include>

    </body>
    <!-- END: Body-->
    <script>
        function submitForm() {
            document.getElementById("statusForm").submit();
        }
    </script>
</html>