<%-- 
    Document   : homePage
    Created on : Mar 10, 2024, 5:31:27 PM
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

        <title>Product Details - Brava Shop</title>
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

        <style>
            .product_image {
                width: 500px;
                height: 500px;
                object-fit: cover;
            }

            .star {
                cursor: pointer;
            }

            .star.highlight {
                color: gold;
            }

            .checked {
                color: gold;
            }
        </style>

    </head>


    <body id="body" class="home_fashion_minimal">


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
                        <div class="float-right">
                            <ul class="contact_info ul_li clearfix">
                                <li>098-1456235</li>
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
                                    <img class="w-50" src="assets/images/logo/logoHomePage3.png">
                                </a>
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
                            <img src="assets/images/logo/logoHomePage3.png" alt="logo_not_found">
                        </a>
                    </div>

                    <div class="msb_widget mobile_menu_list clearfix">
                        <h3 class="title_text mb_15 text-uppercase"><i class="far fa-bars mr-2"></i> Menu List</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="">
                                <a href="${pageContext.request.contextPath}/home">Home</a>
                            </li>
                            <li class="">
                                <a href="${pageContext.request.contextPath}/product?page=view-public-product-list">Shop</a>
                            </li>
                        </ul>
                    </div>
                    <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                            <div class="user_info">
                                <h3 class="title_text mb_30 text-uppercase"><i class="fas fa-user mr-2"></i> User Info</h3>
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
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="user_info">
                                <h3 class="title_text mb_30 text-uppercase"><i class="fas fa-user mr-2"></i> User Info</h3>
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
                            </div>
                        </c:otherwise>
                    </c:choose>
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
                <div class="overlay" data-bg-color=""></div>
                <div class="container">
                    <h1 class="page_title text-white">Product Details</h1>
                    <ul class="breadcrumb_nav ul_li_center clearfix">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/product?page=view-public-product-list">Products</a></li>
                        <li>Product Details</li>
                    </ul>
                </div>
            </section>
            <!-- breadcrumb_section - end
        ================================================== -->


            <!-- fm_details_section - start
            ================================================== -->
            <section class="fm_details_section sec_ptb_100 clearfix">
                <div class="container mb_100">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-5 col-md-7">
                            <div class="details_image">
                                <div class="tab-content">
                                    <!-- Product Images Carousel -->
                                    <div id="carouselIndicators" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <!-- Main carousel items -->
                                            <c:choose>
                                                <c:when test="${not empty pf.image_path and not empty listImages}">
                                                    <div class="carousel-item active">
                                                        <img src="${pf.image_path}" class="d-block w-100 h-100" alt="Default Image">
                                                    </div>
                                                    <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                        <div class="carousel-item">
                                                            <img class="d-block w-100 h-100" src="${image.image}" alt="Slide ${loop.index + 1}">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${empty listImages}">
                                                    <div class="carousel-item active">
                                                        <img src="${pf.image_path}" class="d-block w-100 h-100" alt="Default Image">
                                                    </div>
                                                </c:when>
                                                <c:when test="${empty pf.image_path}">
                                                    <c:forEach var="image" items="${listImages}" varStatus="loop">
                                                        <div class="carousel-item">
                                                            <img class="d-block w-100 h-100" src="${image.image}" alt="Slide ${loop.index + 1}">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <!-- Carousel Indicators -->
                                        <ol class="carousel-indicators">
                                            <c:forEach items="${listImages}" var="image" varStatus="loop">
                                                <li data-target="#carouselIndicators" data-slide-to="${loop.index}" class="<c:if test='${loop.first}'>active</c:if>"></li>
                                                </c:forEach>
                                        </ol>
                                        <!-- Navigation Arrows -->
                                        <a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                    <!-- end carousel-->
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-7">
                            <ul class="di_tab_nav ul_li" role="tablist">
                                <c:forEach items="${listImages}" var="image" varStatus="loop">
                                    <li>
                                        <a class="thumbnail-tab" data-toggle="tab" href="#carouselIndicators" data-slide-to="${loop.index+1}">
                                            <img src="${image.image}" alt="image_not_found">
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-lg-5 col-md-7">
                            <div class="details_content">
                                <h5 class="item_title mb_15">${pf.name}</h5>
                                <span class="item_price mb_15"><strong>${pf.price}VND</strong></span>
                                <hr>
                                <div class="rating_review_wrap d-flex align-items-center clearfix w-100">
                                    <c:choose>
                                        <c:when test="${avgStar >=1 && avgStar<2}">
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                            </ul>
                                        </c:when>
                                        <c:when test="${avgStar >=2 && avgStar<3}">
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                            </ul>
                                        </c:when>
                                        <c:when test="${avgStar >=3 && avgStar<4}">
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                            </ul>
                                        </c:when>
                                        <c:when test="${avgStar >=4 && avgStar<5}">
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                            </ul>
                                        </c:when>
                                        <c:when test="${avgStar >= 5}">
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                                <li><i class="fas fa-star checked"></i></li>
                                            </ul>
                                        </c:when>
                                        <c:otherwise>
                                            <ul class="ul_li mr-2">
                                                <li><i class="fas fa-star "></i></li>
                                                <li><i class="fas fa-star "></i></li>
                                                <li><i class="fas fa-star "></i></li>
                                                <li><i class="fas fa-star "></i></li>
                                                <li><i class="fas fa-star "></i></li>
                                            </ul>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="mr-2">${countFeedback} Review(s)</span>
                                </div>
                                <hr>
                                <c:choose>
                                    <c:when test="${not empty listCp && not empty listSp}">
                                        <div class="item_color_list mb_15 d-flex align-items-center clearfix">
                                            <h4 class="list_title mb-0 text-uppercase">Color:</h4>
                                            <ul class="ul_li clearfix">
                                                <c:forEach items="${listCp}" var="c">
                                                    <c:choose>
                                                        <c:when test="${not empty listCa}">
                                                            <c:choose>
                                                                <c:when test="${!listCa.contains(c)}">
                                                                    <li class="d-inline-block">
                                                                        <div class="color-option">
                                                                            <button disabled onclick="selectColor('${c.id}'); return false;" class="filloption" style="background-color: ${c.color}; color: #1D9251;">
                                                                                <span>X</span>
                                                                            </button>
                                                                        </div> 
                                                                    </li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${not empty colorIdA && colorIdA eq c.id}">
                                                                        <li class="d-inline-block selected">
                                                                            <div class="color-option " style="border: 1px solid black">
                                                                                <button onclick="selectColor('${c.id}'); return false;" class="filloption" style="background-color: ${c.color}"></button>
                                                                            </div>
                                                                        </li>
                                                                    </c:if>
                                                                    <c:if test="${empty colorIdA || colorIdA ne c.id}">
                                                                        <li class="d-inline-block">
                                                                            <div class="color-option">
                                                                                <button onclick="selectColor('${c.id}'); return false;" class="filloption" style="background-color: ${c.color}"></button>
                                                                            </div>
                                                                        </li>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${not empty colorIdA && colorIdA eq c.id}">
                                                                <li class="d-inline-block selected">
                                                                    <div class="color-option"  style="border: 1px solid black">
                                                                        <button onclick="selectColor('${c.id}'); return false;" class="filloption" style="background-color: ${c.color}"></button>
                                                                    </div>
                                                                </li>
                                                            </c:if>
                                                            <c:if test="${empty colorIdA || colorIdA ne c.id}">
                                                                <li class="d-inline-block">
                                                                    <div class="color-option">
                                                                        <button onclick="selectColor('${c.id}'); return false;" class="filloption" style="background-color: ${c.color}"></button>
                                                                    </div>
                                                                </li>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="item_size_list mb_30 d-flex align-items-center clearfix">
                                            <h4 class="list_title mb-0 text-uppercase">Size:</h4>
                                            <div class="option_select mb-0">
                                                <c:forEach items="${listSp}" var="s">
                                                    <c:choose>
                                                        <c:when test="${not empty listSa}">
                                                            <c:choose>
                                                                <c:when test="${!listSa.contains(s)}">
                                                                    <button class="size-option disabled btn btn-white btn-xs" disabled style="border: 1px solid black;">
                                                                        ${s.size}
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${not empty sizeIdA && sizeIdA eq s.id}">
                                                                        <button class="size-option active btn btn-success btn-xs"  style="border: 1px solid black" onclick="selectSize('${s.id}'); return false;">
                                                                            ${s.size}
                                                                        </button>
                                                                    </c:if>
                                                                    <c:if test="${empty sizeIdA || sizeIdA ne s.id}">
                                                                        <button class="size-option btn btn-white btn-xs" style="color:black; border: 1px solid black" onclick="selectSize('${s.id}'); return false;">
                                                                            ${s.size}
                                                                        </button>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${not empty sizeIdA && sizeIdA eq s.id}">
                                                                <button class="size-option active btn btn-success btn-xs" style="border: 1px solid black" onclick="selectSize('${s.id}'); return false;">
                                                                    ${s.size}
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${empty sizeIdA || sizeIdA ne s.id}">
                                                                <button class="size-option btn btn-white btn-xs" style="color:black; border: 1px solid black" onclick="selectSize('${s.id}'); return false;">
                                                                    ${s.size}
                                                                </button>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="item_size_list mb_30 d-flex align-items-center clearfix">
                                            <h4 class="list_title mb-0 text-uppercase">Gender:</h4>
                                            <div class="option_select mb-0">
                                                <c:forEach items="${listGp}" var="g">
                                                    <c:choose>
                                                        <c:when test="${not empty listGa}">
                                                            <c:choose>
                                                                <c:when test="${!listGa.contains(g)}">
                                                                    <button class="size-option disabled-size btn btn-white btn-sm" disabled style="border: 1px solid black;">
                                                                        ${g.gender}
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${not empty genderIdA && genderIdA eq g.id}">
                                                                        <button class="size-option btn-success btn-sm" style="border: 1px solid black" onclick="selectGender('${g.id}'); return false;">
                                                                            ${g.gender}
                                                                        </button>
                                                                    </c:if>
                                                                    <c:if test="${empty genderIdA || genderIdA ne g.id}">
                                                                        <button class="size-option btn btn-white btn-sm" style="border: 1px solid black" onclick="selectGender('${g.id}'); return false;">
                                                                            ${g.gender}
                                                                        </button>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${not empty genderIdA && genderIdA eq g.id}">
                                                                <button class="size-option btn-success btn-sm" style="border: 1px solid black" onclick="selectGender('${g.id}'); return false;">
                                                                    ${g.gender}
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${empty genderIdA || genderIdA ne g.id}">
                                                                <button class="size-option btn btn-white btn-sm" style="border: 1px solid black" onclick="selectGender('${g.id}'); return false;">
                                                                    ${g.gender}
                                                                </button>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="item_color_list mb_15 d-flex align-items-center clearfix">
                                            <h4 class="list_title mb-0 text-uppercase">Category: <a href="${pageContext.request.contextPath}/product?page=view-public-product-list&action=filter-products&categoryID=${pf.category_id}">${pf.category}</a></h4>
                                        </div>
                                        <div class="item_color_list mb_15 d-flex align-items-center clearfix">
                                            <h4 class="list_title mb-0 text-uppercase">Brand: <a href="${pageContext.request.contextPath}/product?page=view-public-product-list&action=filter-products&brandID=${pf.brand_id}"">${pf.brand}</a></h4>
                                        </div>    
                                        <c:choose>
                                            <c:when test="${StockOfProductDetail != 0}">
                                                <p>Available - <span class="text-success">In stock</span></p>
                                            </c:when>
                                            <c:when test="${StockOfProductDetail == 0}">
                                                <p>Available - <span class="text-danger">Out of stock</span></p>
                                            </c:when>
                                        </c:choose>  
                                    </c:when>
                                    <c:otherwise>
                                        <p>Available - <span class="text-danger">Out of stock</span></p>
                                    </c:otherwise>
                                </c:choose>



                                <ul class="btns_group ul_li clearfix">
                                    <li>
                                        <div class="quantity_input">
                                            <span class="input_number_decrement">–</span>
                                            <input readonly="" class="input_number" type="text" id="quantityInput" value="1" min="1">
                                            <span class="input_number_increment">+</span>
                                        </div>
                                    </li>                        
                                    <c:choose>
                                        <c:when test="${empty sessionScope.account}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/authen" class="custom_btn btn_sm bg_fashion2_red text-uppercase"<i class="fal fa-shopping-bag mr-2"></i> Add To Cart</a>
                                            </li>   
                                        </c:when>
                                        <c:when test="${not empty sizeIdA && not empty colorIdA && not empty genderIdA && not empty sessionScope.account && not empty sessionScope.accountProfile.address}">
                                            <li>
                                                <button class="custom_btn btn_sm bg_fashion2_red text-uppercase"<i class="fal fa-shopping-bag mr-2" data-toggle="modal" data-target="#confirmAddToCartModal" title="Add Product To Cart" onclick="addProductToCartWithQuantity('${sessionScope.account.id}', '${sessionScope.accountProfile.address}', '${pf.id}', '${pf.name}', '${pf.category_id}', '${pf.brand_id}', '${colorIdA}', '${sizeIdA}', '${genderIdA}')"></i> Add To Cart</button>
                                            </li>
                                        </c:when>
                                        <c:when test="${not empty sizeIdA && not empty colorIdA && not empty genderIdA && not empty sessionScope.account && empty sessionScope.account.address && empty sessionScope.account.username && empty sessionScope.account.phone_number}">
                                            <li>
                                                <a class="custom_btn btn_sm bg_fashion2_red text-uppercase"<i class="fal fa-shopping-bag mr-2" href="${pageContext.request.contextPath}/home?page=update-profile"></i> Add To Cart</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <button class="custom_btn btn_sm bg_fashion2_red text-uppercase"<i class="fal fa-shopping-bag mr-2" onclick="displayMessage('Please choose a color, size, and gender first off to add product to cart.')"></i> Add To Cart</button>
                                            </li>
                                            <div class="error" style="color: red" id="displayMessage"></div>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="fm_details_description">
                    <div class="container">
                        <ul class="nav ul_li_center mb_30" role="tablist">
                            <li>
                                <a class="active" data-toggle="tab" href="#description_tab">DESCRIPTION</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#review_ta">REVIEWS</a>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div id="description_tab" class="tab-pane active">
                            <div class="container">
                                <div class="table_wrap">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img src="assets/images/img_01.png" alt="instructions">
                                                </td>
                                                <td>${pf.description}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Color:</strong></td>
                                                <td>
                                                    <c:forEach items="${listCp}" var="c">
                                                        ${c.color}<c:if test="${not loop.last}">, </c:if>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Sizes:</strong></td>
                                                <td>
                                                    <c:forEach items="${listSp}" var="s">
                                                        ${s.size}<c:if test="${not loop.last}">, </c:if>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Category:</strong></td>
                                                <td>
                                                    ${pf.category}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Brand:</strong></td>
                                                <td>
                                                    ${pf.brand}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="review_ta" class="tab-pane fade">
                            <form class="container" action="${pageContext.request.contextPath}/product?action=rating&productID=${pf.id}" method="POST" id="reviewForm" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h6 style="color: rgb(60, 179, 113); float: right">*Required</h6>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <c:choose>
                                            <c:when test="${not empty username}">
                                                <div class="form_item">
                                                    <input value="${username}" type="text" name="UserName" placeholder="Your Name*">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="form_item">
                                                    <input value="${sessionScope.accountProfile.username}" type="text" name="UserName" placeholder="Your Name*">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div style="color:red">${messageName}</div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="form_item">
                                            <input value="${sessionScope.account.email}" type="email" name="Email" placeholder="Your Email*" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form_item">
                                            <textarea name="message" placeholder="Your Message*" required="">${message}</textarea>
                                        </div>
                                        <div style="color:red">${messageError}</div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form_item d-flex">
                                            <h6>Rate your experience*:</h6>
                                            <div class="rating ml-3" id="rating">
                                                <button type="button" name="star" class="star" value="1"><i class="fas fa-star"></i></button>
                                                <button type="button" name="star" class="star" value="2"><i class="fas fa-star"></i></button>
                                                <button type="button" name="star" class="star" value="3"><i class="fas fa-star"></i></button>
                                                <button type="button" name="star" class="star" value="4"><i class="fas fa-star"></i></button>
                                                <button type="button" name="star" class="star" value="5"><i class="fas fa-star"></i></button>
                                            </div>
                                            <input type="hidden" id="selectedStar" name="star" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <h6 for="image">Image:</h6>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Upload (.png, .jpg, .jpeg)</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input accept="image/png, image/jpg, image/jpeg" type="file" class="custom-file-input" id="image" name="image" onchange="displayImage(this)">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>
                                            </div>
                                            <img id="previewImage" src="" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                                        </div>
                                    </div>
                                    <div style="color:red">${messageError1}</div>
                                </div>
                                <c:if test="${not empty sessionScope.account && not empty sessionScope.accountProfile.username && not empty sessionScope.account.email}">
                                    <button type="submit" class="custom_btn bg_default_red text-uppercase">Submit Review</button>
                                </c:if>
                                <c:if test="${not empty sessionScope.account &&  empty sessionScope.accountProfile.username &&  empty sessionScope.account.email}">
                                    <a href="${pageContext.request.contextPath}/home?page=update-profile" class="custom_btn bg_default_red text-uppercase">Submit Review</a>
                                </c:if>
                                <c:if test="${empty sessionScope.account}">
                                    <a href="${pageContext.request.contextPath}/authen?action=login" class="custom_btn bg_default_red text-uppercase">Submit Review</a>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
                <!--            Rating section start-->
                <div class="fm_details_description">
                    <div class="container">
                        <hr>
                        <h6>${countFeedback} Reviews</h6>
                        <div  id="feedbackList">
                            <c:forEach items="${ar}" var="accountRating">
                                <div class="feedback">
                                    <hr>
                                    <h5>${accountRating.email}</h5>
                                    <div>${accountRating.date_review}</div>
                                    <div>
                                        <div class="rating_review_wrap d-flex align-items-center clearfix w-100">
                                            <c:choose>
                                                <c:when test="${accountRating.star >=1 && accountRating.star<2}">
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                    </ul>
                                                </c:when>
                                                <c:when test="${accountRating.star >=2 && accountRating.star<3}">
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                    </ul>
                                                </c:when>
                                                <c:when test="${accountRating.star >=3 && accountRating.star<4}">
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                    </ul>
                                                </c:when>
                                                <c:when test="${accountRating.star >=4 && accountRating.star<5}">
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star"></i></li>
                                                    </ul>
                                                </c:when>
                                                <c:when test="${accountRating.star >= 5}">
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                        <li><i class="fas fa-star checked"></i></li>
                                                    </ul>
                                                </c:when>
                                                <c:otherwise>
                                                    <ul class="ul_li mr-2">
                                                        <li><i class="fas fa-star "></i></li>
                                                        <li><i class="fas fa-star "></i></li>
                                                        <li><i class="fas fa-star "></i></li>
                                                        <li><i class="fas fa-star "></i></li>
                                                        <li><i class="fas fa-star "></i></li>
                                                    </ul>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div>${accountRating.content}</div>
                                        <img src="${accountRating.image}" class="w-25">
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${ar.size()>3}">
                            <button onclick="loadMore('${pf.id}')" type="button" class="custom_btn bg_default_red text-uppercase">Load More...</button>
                        </c:if>
                    </div>
                </div>      
                <!--            Rating section end-->
            </section>
            <!-- fm_details_section - end
            ================================================== -->



            <!-- product_section - start
            ================================================== -->
            <section class="product_section clearfix mb_30">
                <div class="container-fluid prl_100">
                    <c:if test="${not empty listPf}">
                        <div class="fm_section_title text-center mb_15">
                            <h2 class="title_text">Related Product</h2>
                        </div>

                        <div class="row justify-content-center">
                            <c:forEach items="${listPf}" var="p">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="fashion_minimal_product">
                                        <ul class="product_label ul_li clearfix">
                                            <li data-bg-color="#82ca9c">NEW</li>
                                        </ul>
                                        <div class="item_image">
                                            <a class="image_wrap" href="${pageContext.request.contextPath}/#!">
                                                <img src="${p.image_path}" class="product_image">
                                            </a>
                                            <ul class="product_action_btns ul_li_center clearfix">
                                                <li>
                                                    <a class="tooltips" 
                                                       data-placement="top" 
                                                       title="Quick View" 
                                                       data-toggle="modal" 
                                                       data-target="#quickview_modal" 
                                                       onclick="quickViewProductModal('${p.image_path}', '${p.name}', '${p.price}', '${p.description}', '${p.brand}', '${p.category}')">
                                                        <i class="fal fa-search"></i>
                                                    </a>
                                                </li>
                                                <li><a class="addtocart_btn text-uppercase" href="${pageContext.request.contextPath}/product?action=view-product-details&productID=${p.id}">View product details</a></li>
                                            </ul>
                                        </div>
                                        <div class="item_content">
                                            <h3 class="item_title">
                                                <a href="${pageContext.request.contextPath}/product?action=view-product-details&productID=${p.id}">${p.name}</a>
                                            </h3>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <span class="item_price"><strong>${p.price}VND</strong></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
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
        <!-- footer_section - end
        ================================================== -->




        <!-- product quick view - start -->
        <div class="quickview_modal modal fade ml-0" id="quickview_modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content clearfix">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="item_image">
                        <img class="w-100 h-75 img-fluid" id="imageModal" src="">
                    </div>
                    <div class="item_content">
                        <h2 class="item_title mb_15" id="productNameModal"></h2>
                        <span id="productPriceModal" class="item_price mb_15"></span>
                        <p id="productDescriptionModal" class="mb_30">VND</p>
                        <ul class="info_list ul_li_block clearfix">
                            <li><strong class="list_title">Category:</strong><span id="categoryModal"></span></li>
                            <li><strong class="list_title">Brand:</strong><span id="brandModal"></span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- product quick view - end -->
        <!-- shop_section - end
                ================================================== -->

        <!-- fraimwork - jquery include -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- mobile menu - jquery include -->
        <script src="assets/js/mCustomScrollbar.js"></script>

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

        <jsp:include page="../common/logOutModal.jsp"></jsp:include> 
        <jsp:include page="../common/confirmAddToCartModal.jsp"></jsp:include> 
        </body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                const stars = document.querySelectorAll('.star');

                                stars.forEach(star => {
                                    star.addEventListener('click', function () {
                                        const value = this.value;
                                        document.getElementById('selectedStar').value = value;
                                        resetStars();
                                        highlightStars(value);
                                    });
                                });

                                function resetStars() {
                                    stars.forEach(star => {
                                        star.classList.remove('highlight');
                                    });
                                }

                                function highlightStars(value) {
                                    for (let i = 0; i < value; i++) {
                                        stars[i].classList.add('highlight');
                                    }
                                }
                            });

                            var msg = "${msg}";
                            if (msg) {
                                alert('Success: ' + msg);
                            }

                            var err = "${error}";
                            if (err) {
                                alert('Error: ' + err);
                            }

                            function displayImage(input) {
                                var previewImage = document.getElementById("previewImage");
                                var file = input.files[0];
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    previewImage.src = e.target.result;
                                    previewImage.style.display = "block";
                                };
                                reader.readAsDataURL(file);
                            }

                            function addProductToCartWithQuantity(accountId, address, productId, productName, categoryId, brandId, colorId, sizeId, genderId) {
                                var quantity = document.getElementById("quantityInput").value;
                                addProductToCartModal(accountId, address, productId, productName, categoryId, brandId, colorId, sizeId, genderId, quantity);
                            }

                            var selectedColorId;
                            var selectedSizeId;
                            var selectedGenderId;
                            function selectColor(colorId) {
                                if (selectedColorId !== colorId) {
                                    selectedColorId = colorId;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                } else {
                                    selectedColorId = null;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                }
                            }

                            function selectSize(sizeId) {
                                if (selectedSizeId !== sizeId) {
                                    selectedSizeId = sizeId;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                } else {
                                    selectedSizeId = null;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                }
                            }

                            function selectGender(genderId) {
                                if (selectedGenderId !== genderId) {
                                    selectedGenderId = genderId;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                } else {
                                    selectedGenderId = null;
                                    getProductDetailOfEachProperties('${pf.id}', selectedColorId, selectedSizeId, selectedGenderId);
                                }
                            }

                            function getProductDetailOfEachProperties(productId, colorId, sizeId, genderId) {
                                var param1 = productId;
                                var param2 = colorId;
                                var param3 = sizeId;
                                var param4 = genderId;
                                $.ajax({
                                    url: "/SWP391_SE1754_G1/productDetailsAjax",
                                    type: "GET",
                                    data: {
                                        productID: param1,
                                        colorID: param2,
                                        sizeID: param3,
                                        genderID: param4
                                    },
                                    success: function (data) {
                                        var content = document.getElementById("body");
                                        content.innerHTML = data;
                                    },
                                    error: function (xhr) {
                                        //
                                    }
                                });
                            }

                            function changeMainImage(imageSrc) {
                                var mainImage = document.getElementById("main_image").getElementsByTagName("img")[0];
                                mainImage.src = imageSrc;
                            }

                            function quickViewProductModal(image_path, name, price, description, brand, category) {
                                $('#imageModal').attr('src', image_path);
                                $('#productNameModal').text(name);
                                $('#productPriceModal').text(price + 'VND');
                                $('#productDescriptionModal').text(description);
                                $('#categoryModal').text(category);
                                $('#brandModal').text(brand);
                            }

                            function displayMessage(message) {
                                $('#displayMessage').text(message);
                            }

                            var msgapc = "${msgapc}";
                            if (msgapc) {
                                alert("Success: " + msgapc);
                            }

                            var errorapc = "${errapc}";
                            if (errorapc) {
                                alert("Error: " + errorapc);
                            }

                            function loadMore(productId) {
                                var param1 = productId;
                                var amount = document.getElementsByClassName("feedback").length;
                                $.ajax({
                                    url: '/SWP391_SE1754_G1/load',
                                    type: 'GET',
                                    data: {
                                        productID: param1,
                                        exist: amount
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("feedbackList");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {
                                        //Do to handle error 
                                    }
                                });
                            }

    </script>
</html>