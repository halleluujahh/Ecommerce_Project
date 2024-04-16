<%-- 
    Document   : checkoutstep2
    Created on : Feb 17, 2024, 12:16:34 PM
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

        <title>Checkout 2nd Step Page - Brava</title>
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


            <!-- checkout_section - start
                    ================================================== -->
            <section class="checkout_section sec_ptb_140 clearfix">
                <div class="container">

                    <ul class="checkout_step ul_li clearfix">
                        <li class="activated"><a style="cursor: default;" href="${pageContext.request.contextPath}/Checkout?page=checkoutstep1"><span>01.</span>View Shopping Cart</a></li>
                        <li class="active"><a><span>02.</span> Checkout</a></li>
                        <li><a><span>03.</span> Order Completed</a></li>
                    </ul>

                    <c:if test="${sessionScope.account_information.getRole_Id() != 1}">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout_collapse_content">
                                    <div class="wrap_heade">
                                        <p class="mb-0">
                                            Returning customer? <a class="collapsed" data-toggle="collapse"
                                                                   href="#loginform_collapse" aria-expanded="false" role="button">Click here to
                                                login</a>
                                        </p>
                                    </div>
                                    <div id="loginform_collapse" class="collapse_form_wrap collapse">
                                        <div class="card-body">
                                            <form action="#">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form_item">
                                                            <input type="email" name="email" placeholder="Email">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form_item">
                                                            <input type="password" name="password" placeholder="Password">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="login_button">
                                                    <div class="checkbox_item">
                                                        <label for="remember_checkbox"><input id="remember_checkbox"
                                                                                              type="checkbox"> Remember me</label>
                                                    </div>
                                                    <button type="submit" class="custom_btn bg_default_red">Login Now</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="checkout_collapse_content">
                                    <div class="wrap_heade">
                                        <p class="mb-0">
                                            <i class="ti-info-alt"></i>
                                            Have a coupon? <a class="collapsed" data-toggle="collapse" href="#coupon_collapse"
                                                              aria-expanded="false">Click here to enter your code</a>
                                        </p>
                                    </div>
                                    <div id="coupon_collapse" class="collapse_form_wrap collapse">
                                        <div class="card-body">
                                            <form action="#">
                                                <div class="form_item">
                                                    <input type="text" name="coupon" placeholder="Coupon Code">
                                                </div>
                                                <button type="submit" class="custom_btn bg_default_red">Apply coupon</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="billing_form mb_50">
                        <h3 class="form_title mb_30">Billing details</h3>
                        <form action="#">
                            <div class="form_wrap">
                                <c:if test="${not empty account_information}">

                                    <div class="form_item">
                                        <span class="input_title">Recipient's name<sup>*</sup></span>

                                        <input type="text" name="username" value="${account_information.getAcc_det().getUsername()}">

                                    </div>
                                    <div class="form_item">
                                        <span class="input_title">Delivery address<sup>*</sup></span>
                                        <input type="text" name="deliveryAddress" value="${account_information.getAcc_det().getAddress()}">
                                    </div>

                                    <!-- <div class="option_select">
                                            <span class="input_title">Address<sup>*</sup></span>
                                            <select name="address">
                                                    <option value="USA" selected>Vietnam</option>
                                                    <option value="USA">Thai Lan</option>
                                                    <option value="USA">Campuchis</option>
                                                    <option value="USA">Lao</option>
                                            </select>
                                    </div> -->


                                    <!--                                    <div class="form_item">
                                                                            <span class="input_title">Postcode / Zip<sup>*</sup></span>
                                                                            <input type="text" name="postcode">
                                                                        </div>-->

                                    <div class="form_item">
                                        <span class="input_title">Contact number<sup>*</sup></span>
                                        <input type="tel" name="phone" value="${account_information.getAcc_det().getPhone_number()}" style="width: max-content">
                                    </div>

                                    <div class="form_item">
                                        <span class="input_title">Email Address<sup>*</sup></span>
                                        <input type="email" name="email" value="${account_information.getEmail()}">
                                    </div>

                                    <div class="form_item mb-0">
                                        <span class="input_title">Order notes<sup>*</sup></span>
                                        <textarea name="note"
                                                  placeholder="Note about your order, eg. special notes fordelivery."></textarea>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="billing_form">
                            <h3 class="form_title mb_30">Review your order</h3>
                            <form action="Checkout?action=placeOrder" method="post">
                                <div class="form_wrap">
                                    <input type="hidden" id="hiddenUserName" name="hiddenUserName" value="${account_information.getAcc_det().getUsername()}">
                                    <input type="hidden" id="hiddenPhoneNumber" name="hiddenPhoneNumber" value="${account_information.getAcc_det().getPhone_number()}">
                                    <input type="hidden" id="hiddenDeliveryAddress" name="hiddenDeliveryAddress" value="${account_information.getAcc_det().getAddress()}">
                                    <div class="checkout_table">
                                        <table class="table text-center mb_50">
                                            <thead class="text-uppercase text-uppercase">
                                                <tr>
                                                    <th>Product Name</th>
                                                    <th>Unit Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total Price/Product</th>
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
                                                                <div class="item_content">
                                                                    <h4 class="item_title mb-0">${p.p.name}</h4>
                                                                    <span class="item_type">${p.cate.category}</span>
                                                                    Size: ${p.s.size} |
                                                                    Color: <div style="background-color: ${p.c.color}; width: 15px; height: 15px; display: inline-block;"></div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <span class="price_text" name="pr">${p.p.price}VND</span>
                                                        </td>
                                                        <td>
                                                            <span class="quantity_text">${p.c_Det.quantity}</span>
                                                        </td>
                                                        <td><span class="total_price">${p.c_Det.quantity * p.p.price}VND</span></td>
                                                <input type="hidden" value="${p.c_Det.quantity}" name="quantity_per_product">
                                                <input type="hidden" value="${p.p.price}" name="unit_price">
                                                <input type="hidden" value="${p.c_Det.quantity * p.p.price}" name="total_price_per_product">
                                                <input type="hidden" value="${p.p_Det.stock - p.c_Det.quantity}" name="remaining_stock">
                                                <input type="hidden" name="product_id" value="${p.c_Det.product_id}">
                                                <input type="hidden" name="cart_id" value="${p.id}">
                                                <input type="hidden" name="productDetailId" value="${p.p_Det.id}">
                                                <input type="hidden" name="colorID" value="${p.c.id}">
                                                <input type="hidden" name="sizeID" value="${p.s.id}">
                                                <input type="hidden" name="genderID" value="${p.gen.id}">
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <span class="subtotal_text">Subtotal</span>
                                                </td>
                                                <td>
                                                    <c:if test="${not empty requestScope.subtotal}">
                                                        <span class="total_price">${requestScope.subtotal}VND</span>
                                                        <input name="subTotalPrice" type="hidden" value="${requestScope.subtotal}">
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <span class="discount_text">Discount</span>
                                                </td>
                                                <td>
                                                    <c:if test="${not empty requestScope.discount}">
                                                        <span class="total_price">${requestScope.discount}%</span>
                                                        <input name="discountPercent" type="hidden" value="${requestScope.discount}">
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">
                                                    <span class="subtotal_text">TOTAL</span>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <c:if test="${not empty requestScope.total}">
                                                        <span class="total_price">${requestScope.total}VND</span>
                                                        <input name="totalPrice" type="hidden" value="${requestScope.total}">
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <!-- <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                            <span class="subtotal_text">Shipping</span>
                                                    </td>
                                                    <td class="text-left">
                                                            <div class="checkbox_item mb_15">
                                                                    <label for="shipping_checkbox"><input id="shipping_checkbox"
                                                                                    type="checkbox" checked> Free Shipping</label>
                                                            </div>
                                                            <div class="checkbox_item mb_15">
                                                                    <label for="flatrate_checkbox"><input id="flatrate_checkbox"
                                                                                    type="checkbox"> Flat rate: $15.00</label>
                                                            </div>
                                                            <div class="checkbox_item">
                                                                    <label for="localpickup_checkbox"><input id="localpickup_checkbox"
                                                                                    type="checkbox"> Local Pickup: $8.00</label>
                                                            </div>
                                                    </td>
                                            </tr> -->


                                            </tbody>

                                        </table>
                                    </div>

                                    <!-- <div class="billing_payment_mathod">
                                            <ul class="ul_li_block clearfix">
                                                    <li>
                                                            <div class="checkbox_item mb_15 pl-0">
                                                                    <label for="bank_transfer_checkbox"><input id="bank_transfer_checkbox"
                                                                                    type="checkbox" checked> Direct Bank Transfer</label>
                                                            </div>
                                                            <p class="mb-0">
                                                                    Make your payment directly into our bank account. Please use your Order ID
                                                                    as the payment reference. Your order will not be shipped until the funds
                                                                    have cleared in our account.
                                                            </p>
                                                    </li>
    
                                                    <li>
                                                            <div class="checkbox_item mb-0 pl-0">
                                                                    <label for="check_payments"><input id="check_payments" type="checkbox">Check
                                                                            Payments</label>
                                                            </div>
                                                    </li>
                                                    <li>
                                                            <div class="checkbox_item mb-0 pl-0">
                                                                    <label for="cash_delivery"><input id="cash_delivery" type="checkbox"> Cash
                                                                            On Delivery</label>
                                                            </div>
                                                    </li>
                                                    <li>
                                                            <div class="checkbox_item mb-0 pl-0">
                                                                    <label for="paypal_checkbox"><input id="paypal_checkbox" type="checkbox">
                                                                            Paypal <a href="#!"><img class="paypal_image"
                                                                                            src="${pageContext.request.contextPath}/assets/images/payment_methods_03.png"
                                                                                            alt="image_not_found"></a></label>
                                                            </div>
                                                    </li>
                                            </ul>
                                            <button type="submit" class="custom_btn bg_default_red">PLACE ORDER</button>
                                    </div> -->
                                    <button type="submit" class="custom_btn bg_default_red">PLACE ORDER</button>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>
            </section>
            <!-- checkout_section - end
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
                                            <li><a href="${pageContext.request.contextPath}/#!">Contact</a></li>
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
        <script>
                            const deliveryAddressInput = document.getElementsByName('deliveryAddress')[0];
                            const hiddenDeliveryAddressInput = document.getElementById('hiddenDeliveryAddress');
                            const userNameInput = document.getElementsByName('username')[0];
                            const hiddenUserNameInput = document.getElementById('hiddenUserName');
                            const phoneNumberInput = document.getElementsByName('phone')[0];
                            const hiddenPhoneNumberInput = document.getElementById('hiddenPhoneNumber');
                            deliveryAddressInput.addEventListener('input', function () {
                                hiddenDeliveryAddressInput.value = this.value;
                            });
                            userNameInput.addEventListener('input', function () {
                                hiddenUserNameInput.value = this.value;
                            });
                            phoneNumberInput.addEventListener('input', function () {
                                hiddenPhoneNumberInput.value = this.value;
                            });
        </script>
    </body>
    <jsp:include page="../../views/common/logOutModal.jsp"></jsp:include>
</html>