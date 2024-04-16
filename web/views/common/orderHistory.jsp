<%-- 
    Document   : homePage
    Created on : Mar 10, 2024, 5:40:31 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Home - Brava Shop</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/favourite_icon_01.png">

        <!-- fraimwork - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- icon - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome.css">

        <!-- animation - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css">

        <!-- nice select - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select.css">

        <!-- carousel - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css">

        <!-- popup images & videos - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">

        <!-- jquery ui - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css">

        <!-- custom - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

    </head>


    <body class="home_fashion_minimal">


        <!-- backtotop - start -->
        <div id="thetop"></div>
        <!-- <div class="backtotop bg_fashion2_red">
                <a href="${pageContext.request.contextPath}/#" class="scroll">
                        <i class="far fa-arrow-up"></i>
                </a>
        </div> -->
        <!-- backtotop - end -->

        <!-- preloader - start -->
        <!-- <div id="preloader"></div> -->
        <!-- preloader - end -->


        <!-- header_section - start
        ================================================== -->
        <header class="header_section fashion_minimal_header sticky_header clearfix">
            <div class="header_top clearfix">
                <div class="container-fluid prl_100">
                    <div class="">
                        <div class="">
                            <ul class="contact_info ul_li clearfix" style="float: right">
                                <li>0981456235</li>
                                <li>clothingshoponlineg1se1754@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header_bottom clearfix">
                <div class="container-fluid prl_100">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-4">
                            <ul class="btns_group ul_li text-uppercase clearfix">
                                <li>
                                    <button type="button" class="mobile_menu_btn">
                                        <i class="fal fa-bars mr-1"></i>
                                        MENU
                                    </button>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-4">
                            <div class="brand_logo text-center">
                                <a class="brand_link" href="${pageContext.request.contextPath}/home">
                                    <img class="w-50" src="assets/images/logo/logoHomePage3.png" alt="logo_not_found">
                                </a>

                                <ul class="mh_action_btns ul_li clearfix">
                                    <li>
                                        <button type="button" class="search_btn" data-toggle="collapse" data-target="#search_body_collapse" aria-expanded="false" aria-controls="search_body_collapse">
                                            <i class="fal fa-search"></i>
                                        </button>
                                    </li>
                                    <c:choose>
                                        <c:when test="${not empty countCart && not empty sessionScope.account}">
                                            <li>
                                                <button type="button" class="cart_btn">
                                                    <i class="fal fa-shopping-cart"></i>
                                                    <span class="btn_badge">${countCart}</span>
                                                </button>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <button type="button" class="cart_btn">
                                                    <i class="fal fa-shopping-cart"></i>
                                                    <span class="btn_badge">0</span>
                                                </button>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li><button type="button" class="mobile_menu_btn"><i class="far fa-bars"></i></button></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <ul class="action_btns_group ul_li_right clearfix">
                                <li>
                                    <button type="button" class="user_btn" data-toggle="collapse" data-target="#use_deropdown" aria-expanded="false" aria-controls="use_deropdown">
                                        <i class="fal fa-user"></i>
                                    </button>
                                    <div id="use_deropdown" class="collapse_dropdown collapse">
                                        <div class="dropdown_content">
                                            <c:choose>
                                                <c:when test="${not empty sessionScope.account}">
                                                    <div class="profile_info clearfix">
                                                        <div class="user_thumbnail">
                                                            <c:choose>
                                                                <c:when test="${sessionScope.accountProfile.gender eq 'Male'}">
                                                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="https://bootdey.com/img/Content/avatar/avatar8.png">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="user_content">
                                                            <h4 class="user_name">${sessionScope.account.email}</h4>
                                                        </div>
                                                    </div>
                                                    <ul class="settings_options ul_li_block clearfix">
                                                        <li><a href="${pageContext.request.contextPath}/home?page=update-profile"><i class="fal fa-user-circle"></i> Profile</a></li>
                                                        <li><a href="${pageContext.request.contextPath}/home?page=view-invoice"><i class="fal fa-shopping-bag"></i> My Order</a></li>
                                                        <li><a href="#" data-toggle="modal" data-target="#logoutModal"><i class="fal fa-sign-out-alt"></i> Logout</a></li>
                                                    </ul>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="profile_info clearfix">
                                                        <div class="user_thumbnail">
                                                            <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                                        </div>
                                                        <div class="user_content">
                                                            <h4 class="user_name">Account</h4>
                                                        </div>
                                                    </div>
                                                    <ul class="settings_options ul_li_block clearfix">
                                                        <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-user-circle"></i> Profile</a></li>
                                                        <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-shopping-bag"></i> My Order</a></li>
                                                        <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-sign-out-alt"></i> Login</a></li>
                                                    </ul>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </li>

                                <c:choose>
                                    <c:when test="${not empty countCart && not empty sessionScope.account}">
                                        <li>
                                            <button type="button" class="cart_btn">
                                                <i class="fal fa-shopping-cart"></i>
                                                <span class="btn_badge">${countCart}</span>
                                            </button>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <button type="button" class="cart_btn">
                                                <i class="fal fa-shopping-cart"></i>
                                                <span class="btn_badge">0</span>
                                            </button>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <div id="search_body_collapse" class="search_body_collapse collapse">
                <div class="search_body">
                    <div class="container-fluid prl_100">
                        <form action="#">
                            <div class="form_item mb-0">
                                <input type="search" name="search" placeholder="Type here...">
                                <button type="submit"><i class="fal fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </header>
        <!-- header_section - end
        ================================================== -->


        <!-- main body - start
        ================================================== -->
        <main>


            <!-- sidebar mobile menu & sidebar cart - start
            ================================================== -->
            <div class="sidebar-menu-wrapper">
                <div class="cart_sidebar">
                    <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                    <ul class="cart_items_list ul_li_block mb_30 clearfix">
                        <c:if test="${not empty listProductInCart && not empty sessionScope.account}">
                            <c:forEach items="${listProductInCart}" var="p">
                                <li class="cart_item">
                                    <div class="item_image">
                                        <img src="${p.image_path}" alt="Product Image">
                                    </div>
                                    <div class="item_details">
                                        <h4 class="item_title">${p.name}</h4>
                                        <div class="item_specification">
                                            <span class="spec_label">Color:</span> <span class="spec_value">${p.color}</span><br>
                                            <span class="spec_label">Size:</span> <span class="spec_value">${p.size}</span><br>
                                            <span class="spec_label">Gender:</span> <span class="spec_value">${p.gender}</span><br>
                                        </div>
                                        <div class="item_quantity">
                                            <span class="spec_label">Quantity:</span> <span class="spec_value">${p.quantity}</span>
                                        </div>
                                        <div class="item_price">
                                            <span class="spec_label">Price:</span> <span class="spec_value">${p.price}VND</span>
                                        </div>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/product?action=remove-item-cart" method="POST">
                                        <input type="hidden" name="name" value="${p.name}"></input>
                                        <input type="hidden" name="accountID" value="${p.account_id}"></input>
                                        <input type="hidden" name="productID" value="${p.id}"></input>
                                        <input type="hidden" name="productDetailId" value="${p.product_id}"></input>
                                        <input type="hidden" name="cartID" value="${p.cart_id}"></input>
                                        <button type="submit" class="remove_btn">
                                            <i class="fal fa-trash-alt"></i> Remove
                                        </button>
                                    </form>
                                </li>
                                <hr>
                            </c:forEach>
                            <ul class="total_price ul_li_block mb_30 clearfix">
                                <li>
                                    <span>Total:</span>
                                    <span>${totalPrice}VND</span>
                                </li>
                            </ul>
                        </c:if>
                        <c:if test="${ empty listProductInCart || empty sessionScope.account}">
                            <li>
                                <div class="item_content">
                                    <h4 class="item_title">No Product In Cart</h4>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                    <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                            <ul class="btns_group ul_li_block clearfix">
                                <li><a href="${pageContext.request.contextPath}/Checkout">View Cart</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="btns_group ul_li_block clearfix">
                                <li><a href="${pageContext.request.contextPath}/authen">View Cart</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="sidebar_mobile_menu">
                    <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                    <div class="msb_widget brand_logo text-center">
                        <a href="${pageContext.request.contextPath}/index.html">
                            <img src="assets/images/logo/logo_25_1x.png" srcset="assets/images/logo/logo_25_2x.png 2x" alt="logo_not_found">
                        </a>
                    </div>

                    <div class="msb_widget mobile_menu_list clearfix">
                        <h3 class="title_text mb_15 text-uppercase"><i class="far fa-bars mr-2"></i> Menu List</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/home">Home</a>
                            </li>
                            <li class="">
                                <a href="${pageContext.request.contextPath}/product?page=view-public-product-list">Shop</a>
                            </li>
                        </ul>
                    </div>

                    <div class="user_info">
                        <h3 class="title_text mb_30 text-uppercase"><i class="fas fa-user mr-2"></i> User Info</h3>
                        <c:choose>
                            <c:when test="${not empty sessionScope.account}">
                                <div class="profile_info clearfix">
                                    <div class="user_thumbnail">
                                        <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                    </div>
                                    <div class="user_content">
                                        <h4 class="user_name">${sessionScope.account.email}</h4>
                                    </div>
                                </div>
                                <ul class="settings_options ul_li_block clearfix">
                                    <li><a href="${pageContext.request.contextPath}/home?page=update-profile"><i class="fal fa-user-circle"></i> Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/home?page=view-invoice"><i class="fal fa-shopping-bag"></i> My Order</a></li>
                                    <li><a href="#" data-toggle="modal" data-target="#logoutModal"><i class="fal fa-sign-out-alt"></i> Logout</a></li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <div class="profile_info clearfix">
                                    <div class="user_thumbnail">
                                        <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                                    </div>
                                    <div class="user_content">
                                        <h4 class="user_name">Account</h4>
                                    </div>
                                </div>
                                <ul class="settings_options ul_li_block clearfix">
                                    <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-user-circle"></i> Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-shopping-bag"></i> My Order</a></li>
                                    <li><a href="${pageContext.request.contextPath}/authen"><i class="fal fa-sign-out-alt"></i> Login</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="overlay"></div>
            </div>
            <!-- sidebar mobile menu & sidebar cart - end
            ================================================== -->


            <!-- breadcrumb_section - start
            ================================================== -->
            <section
                class="breadcrumb_section text-white text-center text-uppercase d-flex align-items-end clearfix"
                data-background="assets/images/bannerDefault.jpg">
                <div class="overlay" data-bg-color="rgba(55, 55, 55, 0.75)"></div>
                <div class="overlay" data-bg-color="#1d1d1d"></div>
                <div class="container">
                    <h1 class="page_title text-white">Invoice</h1>
                    <ul class="breadcrumb_nav ul_li_center clearfix">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/home?page=update-profile">Profile</a></li>
                        <li>Invoice</li>
                    </ul>
                </div>
            </section>
            <!-- breadcrumb_section - end
            ================================================== -->


            <!-- product_section - start
            ================================================== -->
            <section class="register_section sec_ptb_140 has_overlay parallaxie clearfix" data-background="assets/images/loginBackground.png" style="height: 100vh;">
                <div class="main-body d-flex align-items-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12 mb-0">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="mb-4 text-b">Invoice</h3>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered mb-0">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>#Invoice Code</th>
                                                        <th>Create At</th>
                                                        <th>Username</th>
                                                        <th>Address</th>
                                                        <th>Total Price</th>
                                                        <th>Status</th>
                                                        <th style="text-align: center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${not empty listIf}">
                                                            <c:forEach items="${listIf}" var="If">
                                                                <tr>
                                                                    <td>${If.cartCode}</td>
                                                                    <td>${If.invoice_date}</td>
                                                                    <td>${If.username}</td>
                                                                    <td>${If.address}</td>
                                                                    <td>${If.totalPrice}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${If.status_id == 1}">
                                                                                <span style="color: rgb(168, 166, 50)">Pending</span>
                                                                            </c:when>
                                                                            <c:when test="${If.status_id == 2}">
                                                                                <span style="color: rgb(50, 168, 87)">Delivery</span>
                                                                            </c:when>
                                                                            <c:when test="${If.status_id == 3}">
                                                                                <span style="color: rgb(50, 168, 87)">Received</span>
                                                                            </c:when>
                                                                            <c:when test="${If.status_id == 4}">
                                                                                <span style="color: red">Canceled</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td style="text-align: center;">
                                                                        <button class="btn btn-primary mb-2 w-100">
                                                                            <a href="${pageContext.request.contextPath}/home?page=view-invoice-details&invoiceID=${If.id}" style="color: white; text-decoration: none;">View Details</a>
                                                                        </button>
                                                                        <c:if test="${If.status_id == 1}">
                                                                            <button class="btn btn-danger mb-2 w-100" data-toggle="modal" data-target="#deleteInvoiceModal" title="Delete Invoice" onclick="deleteInvoiceModal('${If.id}')">
                                                                                <i class="px-2 py-2" style="color: white;">Cancel</i>
                                                                            </button>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <td colspan="9" style="text-align: center;">Not found any invoice</td>
                                                            </tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!--            Ecommerce Pagination Starts -->
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
                                                            <!--                                PAGE - 2 (in case last page )-->
                                                            <c:if test="${pagination.page == pagination.totalPage && pagination.page > 2}">
                                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 2}">${pagination.page - 2}</a></li>
                                                                </c:if>
                                                            <!--                                PAGE - 1 (in case last page )-->
                                                            <c:if test="${pagination.page == pagination.totalPage && pagination.page > 1}">
                                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">${pagination.page - 1}</a></li>
                                                                </c:if>
                                                            <!--                                PAGE-->
                                                            <c:if test="${pagination.totalPage >= 1}">
                                                                <li class="page-item active" aria-current="page"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page}">${pagination.page}</a></li>
                                                                </c:if>
                                                            <!--                                PAGE + 1-->
                                                            <c:if test="${pagination.page < pagination.totalPage}">
                                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">${pagination.page + 1}</a></li>
                                                                </c:if>
                                                            <!--                                PAGE + 2-->
                                                            <c:if test="${pagination.page + 1 < pagination.totalPage}">
                                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 2}">${pagination.page + 2}</a></li>
                                                                </c:if>
                                                            <!--                                NEXT-->
                                                            <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                                <li class="page-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">Next</a></li>
                                                                </c:if>
                                                            <!--                                LAST-->
                                                            <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
                                                                <li class="page-item next-item"><a class="page-link" href="${pagination.urlPattern}pagination=${pagination.totalPage}">Last</a></li>
                                                                </c:if>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </section>
                                        <!--            Ecommerce Pagination Ends -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
    </section>
    <!-- product_section - end
    ================================================== -->
</main>
<!-- main body - end
================================================== -->


<!-- footer_section - start
================================================== -->
<footer class="footer_section fashion_minimal_footer clearfix" data-bg-color="#222222">
    <div class="backtotop" data-background="assets/images/shape_01.png">
        <a href="${pageContext.request.contextPath}/#" class="scroll">
            <i class="far fa-arrow-up"></i>
        </a>
    </div>

    <div class="footer_widget_area sec_ptb_100 clearfix">
        <div class="container">
            <div class="row justify-content-lg-between">
                <div class="col-lg-4">
                    <div class="footer_widget footer_about">
                        <div class="brand_logo mb_30">
                            <a href="${pageContext.request.contextPath}/home">
                                <img class="w-75" src="assets/images/logo/logoHomePage3.png">
                            </a>
                        </div>
                        <p class="mb-0">
                            Thank you for using my shopping website!
                        </p>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="row justify-content-lg-between">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="footer_widget footer_useful_links clearfix">
                                <h3 class="footer_widget_title text-white">Contact</h3>
                                <ul class="ul_li_block">
                                    <li><i class="fal fa-phone-square"></i> 0981456235</li>
                                    <li><i class="fal fa-envelope"></i> clothingshoponlineg1se1754@gmail.com</li>
                                    <li><i class="fal fa-map"></i> FPT Univeristy</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="footer_widget footer_useful_links clearfix">
                                <h3 class="footer_widget_title text-white">Links</h3>
                                <ul class="ul_li_block">
                                    <li><a href="${pageContext.request.contextPath}/product?page=view-public-product-list">Shop</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="footer_bottom text-center">
            <p class="copyright_text mb-0">
                © Copyrights, <script>document.write(new Date().getFullYear());</script> <a href="${pageContext.request.contextPath}/home" class="author_link text-white">Brava</a>
            </p>
        </div>
    </div>
</footer>
<!-- footer_section - end-->

<!-- fraimwork - jquery include -->
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- mobile menu - jquery include -->
<script src="assets/js/mCustomScrollbar.js"></script>

<!-- google map - jquery include -->
<script src="assets/js/gmaps.min.js"></script>

<!-- animation - jquery include -->
<script src="assets/js/parallaxie.js"></script>
<script src="assets/js/wow.min.js"></script>

<!-- nice select - jquery include -->
<script src="assets/js/nice-select.min.js"></script>

<!-- carousel - jquery include -->
<script src="assets/js/slick.min.js"></script>

<!-- countdown timer - jquery include -->
<script src="assets/js/countdown.js"></script>

<!-- popup images & videos - jquery include -->
<script src="assets/js/magnific-popup.min.js"></script>

<!-- filtering & masonry layout - jquery include -->
<script src="assets/js/isotope.pkgd.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/imagesloaded.pkgd.min.js"></script>

<!-- jquery ui - jquery include -->
<script src="assets/js/jquery-ui.js"></script>

<!-- custom - jquery include -->
<script src="assets/js/custom.js"></script>
<jsp:include page="../../views/common/deleteInvoiceModal.jsp"></jsp:include>
<jsp:include page="../../views/common/receiveModal.jsp"></jsp:include>
<jsp:include page="../../views/common/logOutModal.jsp"></jsp:include> 
</body>

</html>
