<%-- 
    Document   : publicProductList
    Created on : Mar 13, 2024, 10:24:32 AM
    Author     : LENOVO
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Fashion Shop - Brava</title>
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
        </style>

    </head>


    <body class="home_fashion">


        <!-- backtotop - start -->
        <div id="thetop"></div>
        <div class="backtotop bg_fashion_red">
            <a href="${pageContext.request.contextPath}/#" class="scroll">
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
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="assets/images/logo/logoHomePage3.png" srcset="assets/images/logo/logo_25_2x.png 2x" alt="logo_not_found">
                        </a>
                    </div>

                    <div class="msb_widget mobile_menu_list clearfix">
                        <h3 class="title_text mb_15 text-uppercase"><i class="far fa-bars mr-2"></i> Menu List</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="">
                                <a href="${pageContext.request.contextPath}/home">Home</a>
                            </li>
                            <li class=" active">
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
                    <h1 class="page_title text-white">Shop</h1>
                    <ul class="breadcrumb_nav ul_li_center clearfix">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li class="active">Shop</li>
                    </ul>
                </div>
            </section>
            <!-- breadcrumb_section - end
        ================================================== -->


            <!-- category_section - start
            ================================================== -->
            <section class="category_section sec_ptb_100 pb-0 clearfix">
                <div class="container">
                    <div class="row mt__50 justify-content-center">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="fashion_category_circle">
                                <div class="item_offer bg_fashion_red text-white">
                                    <span>Best</span>
                                    <span>Seller</span>
                                </div>
                                <div class="item_image">
                                    <img src="assets/images/Test/sportswear-phoenix-fleece-oversized-sweatshirt-french-terry-hoodie-mnzTBx (1).jpg" alt="image_not_found">
                                    <a class="icon_btn bg_fashion_red" href="${pageContext.request.contextPath}/product?page=view-public-product-list&genderID=2"><i class="fal fa-arrow-right"></i></a>
                                </div>
                                <div class="item_content text-uppercase">
                                    <h3 class="item_title">Women</h3>
                                    <span class="item_instock">${countW} ITEMS</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="fashion_category_circle">
                                <div class="item_offer bg_fashion_red text-white">
                                    <span>Best</span>
                                    <span>Seller</span>
                                </div>
                                <div class="item_image">
                                    <img src="assets/images/Test/jordan-essentials-chicago-jacket-656qLG (2).jpg" alt="image_not_found">
                                    <a class="icon_btn bg_fashion_red" href="${pageContext.request.contextPath}/product?page=view-public-product-list&genderID=1"><i class="fal fa-arrow-right"></i></a>
                                </div>
                                <div class="item_content text-uppercase">
                                    <h3 class="item_title">Mens</h3>
                                    <span class="item_instock">${countM} ITEMS</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- category_section - end
            ================================================== -->


            <!-- product_section - start
            ================================================== -->
            <section class="product_section sec_ptb_100 clearfix">
                <div class="container-fluid prl_60">

                    <div class="fp_filter_bar text-uppercase mb_30">
                        <ul class="btns_group ul_li">
                            <li class="dropdown">
                                <button type="button" id="fp_gender_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gender</button>
                                <div class="dropdown-menu" aria-labelledby="fp_gender_dropdown">
                                    <ul class="ul_li_block">
                                        <c:forEach items="${listGpp}" var="g">
                                            <c:choose>
                                                <c:when test="${not empty genderID}">
                                                    <c:set var="isChecked" value="false" />
                                                    <c:forEach var="gender" items="${genderID}">
                                                        <c:if test="${gender eq g.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${g.id}" id="genderOption" name="gender-filter" type="checkbox" ${isChecked ? 'checked' : ''}>
                                                            <label for="genderOption_${g.id}">${g.gender}</label>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${g.id}" id="genderOption" name="gender-filter" type="checkbox">
                                                            <label for="genderOption_${g.id}">${g.gender}</label>
                                                        </div>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <button type="button" id="fp_color_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Color</button>
                                <div class="dropdown-menu" aria-labelledby="fp_color_dropdown">
                                    <ul class="ul_li_block">
                                        <c:forEach items="${listCpp}" var="c">
                                            <c:choose>
                                                <c:when test="${not empty colorID}">
                                                    <c:set var="isChecked" value="false" />
                                                    <c:forEach var="color" items="${colorID}">
                                                        <c:if test="${color eq c.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${c.id}" id="colorOption" name="color-filter" type="checkbox" ${isChecked ? 'checked' : ''}>
                                                            <label for="colorOption">${c.color}</label>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${c.id}" id="colorOption" name="color-filter" type="checkbox">
                                                            <label for="colorOption">${c.color}</label>
                                                        </div>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>    
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <button type="button" id="fp_size_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Size</button>
                                <div class="dropdown-menu" aria-labelledby="fp_size_dropdown">
                                    <ul class="ul_li_block">
                                        <c:forEach items="${listSpp}" var="s">
                                            <c:choose>
                                                <c:when test="${not empty sizeID}">
                                                    <c:set var="isChecked" value="false" />
                                                    <c:forEach var="size" items="${sizeID}">
                                                        <c:if test="${size eq s.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${s.id}" id="sizeOption_${s.id}" name="size-filter" type="checkbox" ${isChecked ? 'checked' : ''}>
                                                            <label for="sizeOption_${s.id}">${s.size}</label>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${s.id}" id="sizeOption_${s.id}" name="size-filter" type="checkbox">
                                                            <label for="sizeOption_${s.id}">${s.size}</label>
                                                        </div>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <button type="button" id="fp_price_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Price</button>
                                <div class="dropdown-menu" aria-labelledby="fp_price_dropdown">
                                    <ul class="ul_li_block">
                                        <li>
                                            <div class="checkbox_item">
                                                <input onclick="updateUrlParams()" value="asc" name="sortByPrice" type="checkbox" ${sortByPrice eq 'asc' ? 'checked' : ''}>
                                                <label for="fc4_1">Lowest</label>
                                            </div>
                                            <div class="checkbox_item">
                                                <input onclick="updateUrlParams()" value="desc" name="sortByPrice" type="checkbox" ${sortByPrice eq 'desc' ? 'checked' : ''}>
                                                <label for="fc4_2">Highest</label>
                                            </div>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <button type="button" id="fp_activity_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Date</button>
                                <div class="dropdown-menu" aria-labelledby="fp_activity_dropdown">
                                    <ul class="ul_li_block">
                                        <li>
                                            <div class="checkbox_item">
                                                <input onclick="updateUrlParams()" value="desc" id="descOptionDate" name="sortByDate"<c:if test="${sortByDate eq 'desc'}">checked=""</c:if> type="checkbox">
                                                    <label for="fc5_1">Newest</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="checkbox_item">
                                                    <input onclick="updateUrlParams()" value="asc" id="ascOptionDate" name="sortByDate"<c:if test="${sortByDate eq 'asc'}">checked=""</c:if> type="checkbox">
                                                    <label for="fc5_2">Oldest</label>
                                                </div>
                                            </li> 
                                        </ul>
                                    </div>
                                </li>
                                <li class="dropdown">
                                    <button type="button" id="fp_model_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Brand</button>
                                    <div class="dropdown-menu" aria-labelledby="fp_model_dropdown">
                                        <ul class="ul_li_block">
                                        <c:forEach items="${listBpp}" var="b">
                                            <c:choose>
                                                <c:when test="${not empty brandID}">
                                                    <c:set var="isChecked" value="false" />
                                                    <c:forEach var="brand" items="${brandID}">
                                                        <c:if test="${brand eq b.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${b.id}" id="brandOption" name="brand-filter" type="checkbox" ${isChecked ? 'checked' : ''}>
                                                            <label for="brandOption">${b.brand}</label>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${b.id}" id="brandOption" name="brand-filter" type="checkbox">
                                                            <label for="brandOption">${b.brand}</label>
                                                        </div>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>    
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <button type="button" id="fp_patters_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category</button>
                                <div class="dropdown-menu" aria-labelledby="fp_patters_dropdown">
                                    <ul class="ul_li_block">
                                        <c:forEach items="${listCatepp}" var="c">
                                            <c:choose>
                                                <c:when test="${not empty cateID}">
                                                    <c:set var="isChecked" value="false" />
                                                    <c:forEach var="cate" items="${cateID}">
                                                        <c:if test="${cate eq c.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${c.id}" id="cateOption" name="category-filter" type="checkbox" ${isChecked ? 'checked' : ''}>
                                                            <label for="cateOption">${c.category}</label>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <div class="checkbox_item">
                                                            <input onclick="updateUrlParams()" value="${c.id}" id="cateOption" name="category-filter" type="checkbox">
                                                            <label for="cateOption">${c.category}</label>
                                                        </div>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <ul class="fp_popular_tags ul_li clearfix">
                        <li><a class="allclear_btn" href="${pageContext.request.contextPath}/product?page=view-public-product-list">Clear All</a></li>
                    </ul>

                    <div class="element-grid column5_element_grid mb_50">
                        <c:forEach items="${listPublicProduct}" var="p">
                            <div class="element-item">
                                <div class="fashion_product_item">
                                    <div class="item_image">
                                        <a class="image_wrap" href="${pageContext.request.contextPath}/product?page=view-product-details&productID=${p.id}">
                                            <img src="${p.image_path}" class="product_image"/>
                                        </a>
                                        <ul class="product_action_btns ul_li_center clearfix">
                                            <li>
                                                <a class="addtocart_btn tooltips" data-placement="top" title="Add To Cart" href="${pageContext.request.contextPath}/product?page=view-product-details&productID=${p.id}">
                                                    <i class="fal fa-shopping-basket"></i> View Details
                                                </a>
                                            </li>
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
                                        </ul>
                                    </div>
                                    <div class="item_content">
                                        <span class="item_category text-uppercase">${p.category}</span>
                                        <span class="item_category text-uppercase">${p.brand}</span>
                                        <h3 class="item_title"><a href="${pageContext.request.contextPath}/product?page=view-product-details&productID=${p.id}">${p.name}</a></h3>
                                        <span class="item_price">${p.price}VND</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- product_section - end
            ================================================== -->
            <!-- Ecommerce Pagination Starts -->
            <ul class="fashion_pagination_nav ul_li_center text-uppercase clearfix">
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
            <!-- Ecommerce Pagination Ends -->
            <hr>
            <!-- barnd_section - start
            ================================================== -->
            <div class="barnd_section sec_ptb_50 pt-0 clearfix">
                <div class="container">
                    <div class="barnd_carousel clearfix">
                        <c:forEach items="${image}" var="i">
                            <div class="item">
                                <a class="brand_item" href="${pageContext.request.contextPath}/product?page=view-product-details&&productID=${i.product_Id}">
                                    <img src="${i.image}" alt="image_not_found">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- barnd_section - end
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


        <!-- fraimwork - jquery include -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- mobile menu - jquery include -->
        <script src="assets/js/mCustomScrollbar.js"></script>

        <!-- google map - jquery include -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
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
        <jsp:include page="../../views/common/logOutModal.jsp"></jsp:include>
    </body>
    <script>

                            function quickViewProductModal(image_path, name, price, description, brand, category) {
                                $('#imageModal').attr('src', image_path);
                                $('#productNameModal').text(name);
                                $('#productPriceModal').text(price + 'VND');
                                $('#productDescriptionModal').text(description);
                                $('#categoryModal').text(category);
                                $('#brandModal').text(brand);
                            }



                            function updateUrlParams() {
                                var currentUrl1 = window.location.href;
                                var searchUrl = new URL(currentUrl1);

                                var newUrl = "product?page=view-public-product-list&action=filter-products";

                                var sortByPriceParam = searchUrl.searchParams.get('sortByPrice');
                                var sortByDateParam = searchUrl.searchParams.get('sortByDate');
                                var sortByPriceSelect = document.querySelector('input[name="sortByPrice"]:checked');
                                var sortByDateSelect = document.querySelector('input[name="sortByDate"]:checked');

                                sortByPriceParam = sortByPriceSelect ? sortByPriceSelect.value : "";
                                sortByDateParam = sortByDateSelect ? sortByDateSelect.value : "";

                                if (sortByPriceParam !== "") {
                                    newUrl += "&sortByPrice=" + sortByPriceParam;
                                }

                                if (sortByDateParam !== "") {
                                    newUrl += "&sortByDate=" + sortByDateParam;
                                }

                                var genderParams = searchUrl.searchParams.getAll('genderID');
                                for (var i = 0; i < genderParams.length; i++) {
                                    newUrl = newUrl.replace('&genderID=' + genderParams[i], '');
                                }

                                var genderCheckbox = document.querySelectorAll('input[name="gender-filter"]:checked');
                                for (var i = 0; i < genderCheckbox.length; i++) {
                                    newUrl += "&genderID=" + genderCheckbox[i].value;
                                }

                                var colorParams = searchUrl.searchParams.getAll('colorID');
                                for (var i = 0; i < colorParams.length; i++) {
                                    newUrl = newUrl.replace('&colorID=' + colorParams[i], '');
                                }

                                var colorCheckbox = document.querySelectorAll('input[name="color-filter"]:checked');
                                for (var i = 0; i < colorCheckbox.length; i++) {
                                    newUrl += "&colorID=" + colorCheckbox[i].value;
                                }

                                var sizeParams = searchUrl.searchParams.getAll('sizeID');
                                for (var i = 0; i < sizeParams.length; i++) {
                                    newUrl = newUrl.replace('&sizeID=' + sizeParams[i], '');
                                }

                                var sizeCheckbox = document.querySelectorAll('input[name="size-filter"]:checked');
                                for (var i = 0; i < sizeCheckbox.length; i++) {
                                    newUrl += "&sizeID=" + sizeCheckbox[i].value;
                                }

                                var brandParams = searchUrl.searchParams.getAll('brandID');
                                for (var i = 0; i < brandParams.length; i++) {
                                    newUrl = newUrl.replace('&brandID=' + brandParams[i], '');
                                }

                                var brandCheckbox = document.querySelectorAll('input[name="brand-filter"]:checked');
                                for (var i = 0; i < brandCheckbox.length; i++) {
                                    newUrl += "&brandID=" + brandCheckbox[i].value;
                                }

                                var cateParams = searchUrl.searchParams.getAll('cateID');
                                for (var i = 0; i < cateParams.length; i++) {
                                    newUrl = newUrl.replace('&categoryID=' + cateParams[i], '');
                                }

                                var cateCheckbox = document.querySelectorAll('input[name="category-filter"]:checked');
                                for (var i = 0; i < cateCheckbox.length; i++) {
                                    newUrl += "&categoryID=" + cateCheckbox[i].value;
                                }


                                window.location.href = newUrl;
                            }

    </script>
</html>
