<%-- 
    Document   : updateProfile
    Created on : Mar 11, 2024, 11:24:13 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Profile</title>
        <link rel="shortcut icon"
              href="${pageContext.request.contextPath}/assets/images/logo/favourite_icon_01.png">

        <!-- fraimwork - css include -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

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
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">

        <!-- jquery ui - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css">

        <!-- custom - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                background: #f7f7ff;
                margin-top: 20px;
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }

            .me-2 {
                margin-right: .5rem !important;
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
                            <img src="assets/images/logo/logoHomePage3.png"
                                 alt="logo_not_found">
                        </a>
                    </div>

                    <div class="msb_widget mobile_menu_list clearfix">
                        <h3 class="title_text mb_15 text-uppercase"><i class="far fa-bars mr-2"></i> Menu List</h3>
                        <ul class="ul_li_block clearfix">
                            <li class="">
                                <a href="${pageContext.request.contextPath}/home    " data-toggle="" aria-haspopup="true"
                                   aria-expanded="false">Home</a>
                            </li>
                            <li class="">
                                <a href="${pageContext.request.contextPath}/product?page=view-public-product-list" data-toggle="" aria-haspopup="true"
                                   aria-expanded="false">Shop</a>
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
                <div class="overlay" data-bg-color="#1d1d1d"></div>
                <div class="overlay" data-bg-color="rgba(55, 55, 55, 0.75)"></div>
                <div class="container">
                    <h1 class="page_title text-white">Profile</h1>
                    <ul class="breadcrumb_nav ul_li_center clearfix">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li>Profile</li>
                    </ul>
                </div>
            </section>
            <!-- breadcrumb_section - end
        ================================================== -->


            <!-- register_section - start
        ================================================== -->

            <section class="register_section sec_ptb_140 has_overlay parallaxie clearfix"
                     data-background="assets/images/loginBackground.png">
                <div class="container">
                    <div class="main-body">
                        <div class="row">
                            <div class="card">
                                <div class="col-lg-12">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                            <c:choose>
                                                <c:when test="${sessionScope.accountProfile.gender eq 'Male'}">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png"
                                                         alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar8.png"
                                                         alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="mt-3">
                                                <h4>${sessionScope.accountProfile.username}</h4>
                                                <p class="text-secondary mb-1">${sessionScope.account.email}</p>
                                            </div>
                                            <hr> 
                                            <c:choose>
                                                <c:when test="${empty sessionScope.account.password}">
                                                    <button data-toggle="modal" data-target="#createPasswordModal" title="Create Password"><button data-toggle="modal" data-target="#createPasswordModal" title="Create Password" class="custom_btn bg_success text-uppercase mb_50 w-100">Create New Password</button></button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button data-toggle="modal" data-target="#changePasswordModal" title="Change Password"><button data-toggle="modal" data-target="#changePasswordModal" title="Change Password" class="custom_btn bg_success text-uppercase mb_50 w-100">Change Password</button></button>
                                                </c:otherwise>
                                            </c:choose>
                                            <button class="custom_btn bg_success text-uppercase mb_50 w-100"><a href="${pageContext.request.contextPath}/home?page=view-invoice" style="color: white">Order History</a></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <form id="updateAccountDetailsForm" action="${pageContext.request.contextPath}/home?action=updateProfile" method="POST">
                                            <h3>Personal Information</h3>
                                            <hr>
                                            <div style="display:none" class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">ID</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input value="${sessionScope.account.id}" type="text" name="account_id" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Full Name</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" id="usernameInput1" name="userName" class="form-control"
                                                           value="${sessionScope.accountProfile.username}">
                                                    <div  style="color: red" id="usernameError1" class="error"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Phone Number</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" id="phoneNumberInput1" name="phone" class="form-control"
                                                           value="${sessionScope.accountProfile.phone_number}">
                                                    <div style="color: red" id="phonenumberError1" class="error"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Gender</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <select id="selectGender1" class="form-control" name="gender">
                                                        <option value="">All</option>
                                                        <c:forEach items="${listG}" var="g">
                                                            <option <c:if test="${g.id eq sessionScope.accountProfile.gender_id}">selected=""</c:if> value="${g.id}">${g.gender}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <div  style="color: red" id="genderError1" class="error"></div> 
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">DOB</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input id="dobInput1" type="date" name="dob" class="form-control"
                                                           value="${sessionScope.accountProfile.dob}">
                                                    <div  style="color: red" id="dobError1" class="error"></div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Address</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input id="addressInput1" type="text" name="address" class="form-control"
                                                           value="${sessionScope.accountProfile.address}">
                                                    <div style="color: red" id="addressError1" class="error"></div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3"></div>
                                                <div class="col-sm-9 text-secondary">
                                                    <button type="submit" class="btn btn-primary px-4" onclick="validateFormEditProfile()">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                <script type="text/javascript"></script>
                </body>
                </div>
            </section>
            <!-- register_section - end
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
        <!--        ================================================== -->


        <!-- fraimwork - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

        <!-- mobile menu - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/mCustomScrollbar.js"></script>

        <!-- google map - jquery include -->
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
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
        <jsp:include page="../common/logOutModal.jsp"></jsp:include> 
        <jsp:include page="../common/changePasswordModal.jsp"></jsp:include>
        <jsp:include page="../common/createPasswordModal.jsp"></jsp:include>

        </body>
        <script>
                                                        var errorupa = "${errorupa}";
                                                        if (errorupa) {
                                                            alert("Error: " + errorupa);
                                                        }

                                                        var msgupa = "${msgupa}";
                                                        if (msgupa) {
                                                            alert("Success: " + msgupa);
                                                        }

                                                        function validateFormEditProfile() {
                                                            let accountUsername = $('#usernameInput1').val();
                                                            let accountPhonenumber = $('#phoneNumberInput1').val();
                                                            let accountDob = $('#dobInput1').val();
                                                            let accountAddress = $('#addressInput1').val();
                                                            let genderID = $('#selectGender1').val();

                                                            $('.error').html('');

                                                            if (genderID === '') {
                                                                $('#genderError1').html('Please choose gender!');
                                                            }

                                                            if (accountDob === '') {
                                                                $('#dobError1').html('Please choose date of birth!');
                                                            } else {
                                                                var dobDate = new Date(accountDob);
                                                                var currentDate = new Date();

                                                                var hundredYearsAgo = new Date();
                                                                hundredYearsAgo.setFullYear(currentDate.getFullYear() - 100);

                                                                var eighteenYearsAgo = new Date();
                                                                eighteenYearsAgo.setFullYear(currentDate.getFullYear() - 18);

                                                                if (dobDate > hundredYearsAgo && dobDate < eighteenYearsAgo) {
                                                                    $('#dobError1').html('');
                                                                } else {
                                                                    $('#dobError1').html('Please choose a valid date of birth!');
                                                                }
                                                            }

                                                            if (accountAddress === '') {
                                                                $('#addressError1').html('Address cannot be blank');
                                                            } else if (accountAddress.length < 6) {
                                                                $('#addressError1').html('Address must be at least 6 characters long.');
                                                            } else if (!/^(?!.*\s{2})[A-Za-z0-9\s,]+$/.test(accountAddress)) {
                                                                $('#addressError1').html('Address must contain only letters, numbers and \',\'.');
                                                            }

                                                            if (accountUsername === '') {
                                                                $('#usernameError1').html('Username cannot be blank');
                                                            } else if (accountUsername.length < 10) {
                                                                $('#usernameError1').html('Username must be at least 10 characters long.');
                                                            } else if (!/^(?!.*\s{2})[A-Za-z\s]+$/.test(accountUsername)) {
                                                                $('#usernameError1').html('Username must contain only letters');
                                                            }

                                                            if (accountPhonenumber === '') {
                                                                $('#phonenumberError1').html('Phone number cannot be blank');
                                                            } else if (!/^\d{10}$/.test(accountPhonenumber)) {
                                                                $('#phonenumberError1').html('Phone number must contain exactly 10 digits');
                                                            } else if (accountPhonenumber.charAt(0) !== '0') {
                                                                $('#phonenumberError1').html('Phone number must start with 0');
                                                            }
                                                            
                                                            let error = '';
                                                            $('.error').each(function () {
                                                                error += $(this).html();
                                                            });
                                                            if (error === '') {
                                                                if (confirm('Are you sure you want to update your profile?')) {
                                                                    $('#updateAccountDetailsForm').submit();
                                                                } else {
                                                                    event.preventDefault();
                                                                }
                                                            } else {
                                                                event.preventDefault();
                                                            }
                                                        }
    </script>
</html>