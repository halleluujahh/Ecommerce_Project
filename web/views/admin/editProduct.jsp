<%-- 
    Document   : editProduct
    Created on : Feb 24, 2024, 12:40:09 PM
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
            .error {
                color: red;
            }
        </style>
    </head>
    <!-- END: Head-->

    <!-- BEGIN: Body-->

    <body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns ecommerce-application navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="dark-layout">

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
                    <li class=" nav-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">1</span></a>
                        <ul class="menu-content">
                            <li class=""><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Analytics</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class=" navigation-header"><span>Apps</span>
                    </li>

                    <li class=" nav-item"><a href="#"><i class="feather icon-shopping-bag"></i><span class="menu-title" data-i18n="Ecommerce">Product</span></a>
                        <ul class="menu-content">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/manageproduct"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Manage Products</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admin/dashboard?page=view-details"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Details">Setting Products</span></a>
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
                                <h2 class="content-header-title float-left mb-0">Manage Products</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/manageproduct">Products List</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/manageproduct?page=view-product-details&productID=${productForm.id}&colorID=${productForm.color_id}&categoryID=${productForm.category_id}&sizeID=${productForm.size_id}&brandID=${productForm.brand_id}&genderID=${productForm.gender_id}">Details</a>
                                        </li>
                                        <li class="breadcrumb-item active">Update Product Details
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
                                <h1>Update Product Form</h1>
                                <form id="updateProductForm" action="manageproduct?action=update-product" method="POST" enctype="multipart/form-data">
                                    <div class="row mb-5 mt-2">
                                        <div class="col-md-6">
                                            <input type="hidden" type="text" class="form-control" id="productid" name="productID" value="${productForm.id}">
                                            <div class="form-group">
                                                <label for="pname">Product Name: </label>
                                                <input type="text" class="form-control" id="productnameInput8" name="product_name" value="${productForm.name}">
                                                <div id="productnameError8" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="productPrice">Product Price: </label>
                                                <input type="text" class="form-control" id="productpriceInput8" name="productPrice" value="${price}">
                                                <div id="productpriceError8" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="productDescription">Product Description: </label>
                                                <input type="text" class="form-control" id="productdescriptionInput8" name="productDescription" value="${productForm.description}">
                                                <div id="productdescriptionError8" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="cateSelect">Category: </label>
                                                <input type="hidden" type="text" class="form-control" id="cateid" name="cate_id" value="${productForm.category_id}">
                                                <select class="form-control" id="cateSelect8" name="cate" required>
                                                    <option selected="" value="">Select category</option>
                                                    <c:forEach items="${listCategories}" var="c">
                                                        <c:choose>
                                                            <c:when test="${productForm.category_id == c.id}">
                                                                <option value="${c.id}" selected>${c.category}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${c.id}">${c.category}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <div id="cateError8" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="brandSelect">Brand: </label>
                                                <input type="hidden" type="text" class="form-control" id="brandid" name="brand_id" value="${productForm.brand_id}">
                                                <select class="form-control" id="brandSelect8" name="brand" required>
                                                    <option selected value="">Select brand</option>
                                                    <c:forEach items="${listBrands}" var="b">
                                                        <c:choose>
                                                            <c:when test="${b.id == productForm.brand_id}">
                                                                <option value="${b.id}" selected>${b.brand}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${b.id}">${b.brand}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <div id="brandError8" class="error"></div>
                                            </div>

                                        </div>
                                        <div class="col-6 form-group">
                                            <label for="image">Product Image Layout: </label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Upload (*.png, *.jpg, *.jpeg)</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input accept="image/png, image/jpg, image/jpeg" type="file" class="custom-file-input" id="image_layout" name="image_layout">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>
                                            </div>
                                            <c:if test="${ not empty productForm.image_path}">
                                                <img id="imageLayout" src="${productForm.image_path}" alt="Preview" style="max-width: 300px; max-height: 300px;">
                                            </c:if>
                                            <br>
                                            <br>
                                            <label for="image">Product Images: </label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Upload (*.png, *.jpg, *.jpeg)</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input multiple="multiple" accept="image/png, image/jpg, image/jpeg" type="file" class="custom-file-input" id="list_image" name="list_image">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>
                                            </div>
                                            <div id="imageError8" class="error"></div>
                                            <c:forEach items="${listImages}" var="image">
                                                <div style="position: relative; display: inline-block;">
                                                    <img src="${image.image}" alt="Preview" style="max-width: 150px; max-height: 150px;">
                                                    <a href="${pageContext.request.contextPath}/admin/manageproduct?page=delete-images-product&imagesID=${image.product_Id}&imagePath=${image.image}" style="position: absolute; top: 5px; right: 5px;">
                                                        <!-- X icon -->
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                        <path d="M0 0h24v24H0z" fill="none"/>
                                                        <path fill="red" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div> 
                                    </div>
                                </form>
                                <div class="row justify-content-center">
                                    <div class="col-md-5">
                                        <button type="submit" form="updateProductForm" onclick="validateUpdateProductForm()" class="btn btn-success btn-block">
                                            <i class="feather icon-edit"></i> Save
                                        </button>
                                    </div>
                                </div>
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



        <jsp:include page="../admin/logOutModal.jsp"></jsp:include> 
            <script>

                var errorup = "${errorup}";
                if (errorup) {
                    alert("Error: " + errorup);
                }

                var msgup = "${msgup}";
                if (msgup) {
                    alert("Success: " + msgup);
                }


                function validateUpdateProductForm() {
                    let cateID = $('#cateSelect8').val();
                    let brandID = $('#brandSelect8').val();
                    let productName = $('#productnameInput8').val();
                    let productDescription = $('#productdescriptionInput8').val();
                    let productPrice = $('#productpriceInput8').val();
                    let images = $('#list_image')[0].files;

                    $('.error').html('');

                    if (cateID === '') {
                        $('#cateError8').html('Please choose a category!');
                    }
                    if (brandID === '') {
                        $('#brandError8').html('Please choose a brand!');
                    }
                    if (images.length > 6) {
                        $('#imageError8').html('Maximum of 6 images allowed!');
                    }
                    
                    if (productName === '') {
                        $('#productnameError8').html('Product Name cannot be blank');
                    } else if (productName.length < 3) {
                        $('#productnameError8').html('Product Name must be at least 3 characters long.');
                    } else if (!/^(?!.*\s{2})[A-Za-z0-9-\s]+$/.test(productName)) {
                        $('#productnameError8').html('Product Name must contain only letters');
                    }
                    
                    if (productDescription === '') {
                        $('#productdescriptionError8').html('Product Description cannot be blank');
                    } else if (productDescription.length < 10) {
                        $('#productdescriptionError8').html('Product Description must be at least 10 characters long.');
                    } else if (!/^(?!.*\s{2})[A-Za-z0-9.,!-@#$%&^*/()\[\]"";'':{}\s]+$/.test(productDescription)) {
                        $('#productdescriptionError8').html('Product Description must contain only letters, numbers, and special characters');
                    }
                    
                    if (productPrice === '') {
                        $('#productpriceError8').html('Product Price cannot be blank');
                    } else if (!/^\d+(\.\d{1,2})?$/.test(productPrice) || parseFloat(productPrice) <= 0) {
                        $('#productpriceError8').html('Product Price must contain only numbers and be larger than zero');
                    }
                    
                    let error = '';
                    $('.error').each(function () {
                        error += $(this).html();
                    });

                    if (error === '') {
                        if (confirm('Are you sure you want to update this product?')) {
                            $('#updateProductForm').submit();
                        }else{
                            event.preventDefault();
                        }
                    }else{
                        event.preventDefault();
                    }
                }

        </script>
    </body>
    <!-- END: Body-->

</html>
