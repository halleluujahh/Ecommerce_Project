<%-- 
    Document   : addtocart
    Created on : Feb 17, 2024, 11:53:21 AM
    Author     : FPT-LAPTOP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Checkout 1st Step - Brava</title>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/hieu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

        <style>
            .input_number::-webkit-inner-spin-button,
            .input_number::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            .input_number {
                -moz-appearance: textfield;
            }
        </style>

    </head>


    <body>


        <!-- backtotop - start -->
        <div id="thetop"></div>
        <div class="backtotop bg_default_red">
            <a href="#" class="scroll">
                <i class="far fa-arrow-up"></i>
            </a>
        </div>
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
                                                        <li><a href="" data-toggle="modal" data-target="#logoutModal"><i class="fal fa-sign-out-alt"></i> Logout</a></li>
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
                        <c:if test="${not empty listProductInCart}">
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
                        <c:if test="${ empty listProductInCart}">
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
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="assets/images/logo/logoHomePage3.png" alt="logo_not_found">
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
                                    <li><a href="" data-toggle="modal" data-target="#logoutModal"><i class="fal fa-sign-out-alt"></i> Logout</a></li>
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
            <section class="breadcrumb_section text-white text-center text-uppercase d-flex align-items-end clearfix" data-background="assets/images/bannerDefault.jpg">
                <div class="overlay" data-bg-color="#1d1d1d"></div>
                <div class="container">
                    <h1 class="page_title text-white">Checkout</h1>
                    <ul class="breadcrumb_nav ul_li_center clearfix">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li>Checkout</li>
                    </ul>
                </div>
            </section>
            <!-- breadcrumb_section - end
            ================================================== -->


            <!-- cart_section - start
            ================================================== -->
            <section class="cart_section sec_ptb_140 clearfix">
                <div class="container">
                    <form id="cartForm" action="Checkout?action=proceedCheckout" method="post">
                        <ul class="checkout_step ul_li clearfix">
                            <li class="active"><a href="${pageContext.request.contextPath}/Checkout"><span>01.</span>View Shopping Cart</a></li>
                            <li><a><span>02.</span> Checkout</a></li>
                            <li><a><span>03.</span> Order Completed</a></li>
                        </ul>

                        <div class="cart_table mb_50">
                            <table class="table">
                                <thead class="text-uppercase bg-white border-bottom">
                                    <tr>
                                        <th>Product</th>
                                        <th>Unit Price</th>
                                        <th style="text-align: center">Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${shopping_cart_details}" var="p">
                                        <tr>
                                            <td>
                                                <div class="cart_product">
                                                    <div class="item_image">
                                                        <img src="${p.p.image_path}" alt="image_not_found">
                                                    </div>
                                                    <div class="item_content" style=" width: 300px;word-wrap: break-word;">
                                                        <h6 class="item_title">${p.p.name}</h6>
                                                        <span class="item_type">${p.cate.category}</span>
                                                        Size: ${p.s.size}
                                                        | Color: <div style="background-color: ${p.c.color}; width: 15px; height: 15px; display: inline-block; border-radius: 15px; border: 1px solid black;"></div>
                                                    </div>
                                                    <button data-toggle="modal" data-target="#confirmationModal" type="button" class="remove_btn" onclick="openConfirmationModal('${p.c_Det.product_id}', '${p.p_Det.id}', '${p.id}')">
                                                        <i class="fal fa-times"></i>
                                                    </button>
                                                </div>
                                            </td>
                                            <td>
                                                <span class="price_text" name="pr">${p.p.price}VND</span>
                                            </td>
                                            <td>
                                                <div class="quantity_input">
                                                    <form style="display: flex">
                                                        <input readonly="" class="input_number" name="input_number" type="number" value="${p.c_Det.quantity}" step="1" min="1" max="${p.p_Det.stock}">
                                                        <input type="hidden" name="pro_det_id" value="${p.c_Det.product_id}">
                                                    </form>
                                                    <span style="display: none;" class="stock_text">${p.p_Det.stock}</span>
                                                </div>
                                            </td>
                                            <td><span class="total_price">${p.c_Det.quantity * p.p.price}VND</span></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${empty shopping_cart_details}">
                            <div class="order_complete_alart text-center" style="padding: 20px;">
                                <h2><img style="max-width: 20%" src="${pageContext.request.contextPath}/assets/images/Hieuimagetest/npic.jpg" alt="thumbnail_not_found"><strong>There are no products in the cart yet.</strong></h2>
                            </div>
                        </c:if>
                        <c:if test="${empty sessionScope.account}">
                            <div class="text-center" style="padding-bottom: 20px;">
                                <h4>You haven't logged in yet. Login to your user account by <a href="authen">clicking here</a>. If you don't already have one, <a href='authen?action=register'>sign up here</a>.</h4>
                            </div>
                        </c:if>
                        <div class="coupon_wrap mb_50">
                            <div class="row justify-content-lg-between">
                                <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                    <div class="coupon_form">

                                        <div class="form_item mb-0">
                                            <select class="coupon">
                                                <option value="0">Coupon: 0% Discount</option>
                                                <c:forEach items="${disountList}" var="dis">
                                                    <option value="${dis.discount_percent}">Coupon: ${dis.discount_percent}% Discount</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form_item mb-0">
                                        <button id="btnCouponApply" type="button" class="custom_btn bg_danger text-uppercase">Apply Coupon</button>
                                    </div>
                                </div> 
                            </div>
                        </div>

                        <div class="row justify-content-lg-end">
                            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                <div class="cart_pricing_table pt-0 text-uppercase" data-bg-color="#f2f3f5">
                                    <h3 class="table_title text-center" data-bg-color="#ededed">Cart Total</h3>
                                    <ul class="ul_li_block clearfix">
                                        <li><span>Subtotal</span> <span id="total_price_sum"></span></li>
                                        <li><span>Discount</span> <span id="discount_value"></span></li>
                                        <li><span>Total</span> <span id="total_price_final"></span></li>
                                    </ul>
                                    <input type="hidden" id="tps_value_input" name="tps_va_in">
                                    <input type="hidden" id="dis_value_input" name="dis_va_in">
                                    <input type="hidden" id="tpf_value_input" name="tpf_va_in">
                                    <c:choose>
                                        <c:when test="${not empty shopping_cart_details}">
                                            <button class="custom_btn bg_success" type="submit">Proceed to Checkout</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="custom_btn bg_success" type="button">Proceed to Checkout</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- cart_section - end
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
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <!-- mobile menu - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/mCustomScrollbar.js"></script>

        <!-- google map - jquery include -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
        <script src="${pageContext.request.contextPath}/assets/js/gmaps.min.js"></script>

        <!-- animation - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/parallaxie.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>

        <!-- nice select - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/nice-select.min.js"></script>

        <!-- carousel - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

        <!-- countdown timer - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/countdown.js"></script>

        <!-- popup images & videos - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/magnific-popup.min.js"></script>

        <!-- filtering & masonry layout - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/masonry.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/imagesloaded.pkgd.min.js"></script>

        <!-- jquery ui - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>

        <!-- custom - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/hieu.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </body>
    <jsp:include page="../../views/common/removeCartModal.jsp"></jsp:include>
    <jsp:include page="../../views/common/logOutModal.jsp"></jsp:include>
</html>