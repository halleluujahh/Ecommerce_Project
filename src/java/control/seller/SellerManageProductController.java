/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.seller;

import constant.Constant;
import dao.AdminDao;
import entity.Brand;
import entity.Category;
import entity.Color;
import entity.Gender;
import entity.Image;
import entity.Pagination;
import entity.Product;
import entity.Product_Detail;
import entity.Product_Form;
import entity.Size;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
@WebServlet(name = "SellerManageProductController", urlPatterns = {"/seller/manageProduct"})
public class SellerManageProductController extends HttpServlet {

    AdminDao adminDAO = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adminDAO = new AdminDao();
        Pagination pagination = new Pagination();
        Product_Form productForm;
        HttpSession session = request.getSession();
        List<Color> listC = adminDAO.findAllColor();
        List<Size> listS = adminDAO.findAllSize();
        List<Gender> listG = adminDAO.findAllGender();
        List<Brand> listB = adminDAO.findAllBrand();
        List<Category> listCate = adminDAO.findAllCategory();
        List<Color> listColors = adminDAO.findAllColorWorking();
        List<Size> listSizes = adminDAO.findAllSizeWorking();
        List<Gender> listGenders = adminDAO.findAllGenderWorking();
        List<Brand> listBrands = adminDAO.findAllBrandWorking();
        List<Category> listCategories = adminDAO.findAllCategoryWorking();
        List<Product_Form> listPf;
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");
        String sortedByPrice = request.getParameter("sortByPrice");
        String sortedByDate = request.getParameter("sortByDate");
        listPf = pagination(request, pagination);
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        switch (page) {
            case "view-product-details":
                status = request.getParameter("status");
                sortedByDate = request.getParameter("sortByDate");
                String colorID = request.getParameter("colorID");
                String sizeID = request.getParameter("sizeID");
                String genderID = request.getParameter("genderID");
                String productIdRaw = request.getParameter("productID");
                if (productIdRaw == null || productIdRaw.isEmpty()) {
                    session.setAttribute("errmp", "Product with product id: " + productIdRaw + " not exist!");
                    request.getRequestDispatcher("/views/seller/manageProduct.jsp").forward(request, response);
                    return;
                }
                int productID = Integer.parseInt(productIdRaw);
                String productName = adminDAO.getProductNameById(productID);
                List<Size> listSp = adminDAO.findSizeByProductId(productID);
                List<Gender> listGp = adminDAO.findGenderByProductId(productID);
                List<Color> listCp = adminDAO.findColorByProductId(productID);
                productForm = adminDAO.getProductById(productID);
                List<Image> listImages = adminDAO.getImagesByProductID(productID);
                listPf = viewProductDetails(request, pagination);
                session.setAttribute("productForm", productForm);
                session.setAttribute("listImages", listImages);
                session.setAttribute("status", status);
                session.setAttribute("sortedByDate", sortedByDate);
                session.setAttribute("colorID", colorID);
                session.setAttribute("sizeID", sizeID);
                session.setAttribute("genderID", genderID);
                session.setAttribute("productID", productID);
                session.setAttribute("productName", productName);
                session.setAttribute("listS", listS);
                session.setAttribute("listC", listC);
                session.setAttribute("listG", listG);
                session.setAttribute("listSp", listSp);
                session.setAttribute("listGp", listGp);
                session.setAttribute("listCp", listCp);
                session.setAttribute("listPf", listPf);
                request.setAttribute("pagination", pagination);
                request.getRequestDispatcher("/views/seller/productDetail.jsp").forward(request, response);
                break;
            case "update-product":
                String productIdToUpdateRaw = request.getParameter("productID");
                if (productIdToUpdateRaw == null || productIdToUpdateRaw.isEmpty()) {
                    session.setAttribute("errup", "Product with product id: " + productIdToUpdateRaw + " not exist!");
                } else {
                    listB = adminDAO.findAllBrand();
                    listCate = adminDAO.findAllCategory();
                    int productIdToUpdate = Integer.parseInt(productIdToUpdateRaw);
                    productForm = adminDAO.findProductByID(productIdToUpdate);
                    listImages = adminDAO.getImagesByProductID(productIdToUpdate);
                    int price = (int)productForm.getPrice();
                    session.setAttribute("listB", listB);
                    session.setAttribute("listCate", listCate);
                    session.setAttribute("price", price);
                    session.setAttribute("productForm", productForm);
                    session.setAttribute("listImages", listImages);
                }
                request.getRequestDispatcher("/views/seller/editProduct.jsp").forward(request, response);
                break;
            case "delete-images-product":
                String productIdToDeleteImageRaw = request.getParameter("imagesID");
                if (productIdToDeleteImageRaw == null || productIdToDeleteImageRaw.isEmpty()) {
                    session.setAttribute("errup", "Product image with product id: " + productIdToDeleteImageRaw + " not exist!");
                } else {
                    int productIdToDeleteImage = Integer.parseInt(productIdToDeleteImageRaw);
                    String imagePathToDelete = request.getParameter("imagePath");
                    adminDAO.deleteImagesProduct(productIdToDeleteImage, imagePathToDelete);
                    listImages = adminDAO.getImagesByProductID(productIdToDeleteImage);
                    session.setAttribute("listImages", listImages);
                }
                request.getRequestDispatcher("/views/seller/editProduct.jsp").forward(request, response);
                break;
            default:
                session.setAttribute("listColors", listColors);
                session.setAttribute("listBrands", listBrands);
                session.setAttribute("listSizes", listSizes);
                session.setAttribute("listCategories", listCategories);
                session.setAttribute("listGenders", listGenders);
                session.setAttribute("listB", listB);
                session.setAttribute("listCate", listCate);
                session.setAttribute("listPf", listPf);
                request.setAttribute("pagination", pagination);
                request.setAttribute("keyword", keyword);
                request.setAttribute("status", status);
                request.setAttribute("sortedByPrice", sortedByPrice);
                request.setAttribute("sortedByDate", sortedByDate);
                request.getRequestDispatcher("/views/seller/manageProduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adminDAO = new AdminDao();
        Pagination pagination = new Pagination();
        HttpSession session = request.getSession();
        Product_Form pf;
        List<Product_Form> listPf;
        listPf = pagination(request, pagination);
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "add-product":
                addProduct(request, response);
                listPf = pagination(request, pagination);
                session.setAttribute("listPf", listPf);
                request.setAttribute("pagination", pagination);
                url = "/views/seller/manageProduct.jsp";
                break;
            case "update-status-product":
                updateStatusProduct(request, response);
                listPf = pagination(request, pagination);
                session.setAttribute("listPf", listPf);
                request.setAttribute("pagination", pagination);
                url = "/views/seller/manageProduct.jsp";
                break;
            case "update-status-product-detail":
                String status = request.getParameter("status");
                if (status.equals("1")) {
                    status = "0";
                }
                if (status.equals("0")) {
                    status = "1";
                }
                updateStatusProductDetail(request, response);
                listPf = viewProductDetails(request, pagination);
                request.setAttribute("pagination", pagination);
                request.setAttribute("listPf", listPf);
                request.setAttribute("status", status);
                url = "/views/seller/productDetail.jsp";
                break;
            case "updateProduct":
                String productIdRaw = request.getParameter("productID");
                if (productIdRaw == null || productIdRaw.isEmpty()) {
                    request.setAttribute("errorup", "Can't find product!");
                    url = "/views/seller/productDetail.jsp";
                } else {
                    int productID = Integer.parseInt(productIdRaw);
                    updateProduct(request, response);
                    pf = adminDAO.getProductById(productID);
                    listPf = viewProductDetails(request, pagination);
                    request.setAttribute("pagination", pagination);
                    request.setAttribute("listPf", listPf);
                    request.setAttribute("productForm", pf);
                    url = "/views/seller/productDetail.jsp";
                }
                break;
            case "add-product-details":
                addProductDetails(request, response);
                productIdRaw = request.getParameter("productID");
                int productID = Integer.parseInt(productIdRaw);
                List<Size> listSp = adminDAO.findSizeByProductId(productID);
                List<Gender> listGp = adminDAO.findGenderByProductId(productID);
                List<Color> listCp = adminDAO.findColorByProductId(productID);
                listPf = viewProductDetails(request, pagination);
                session.setAttribute("listSp", listSp);
                session.setAttribute("listGp", listGp);
                session.setAttribute("listCp", listCp);
                session.setAttribute("listPf", listPf);
                request.setAttribute("pagination", pagination);
                url = "/views/seller/productDetail.jsp";
                break;
            case "update-quantity-product-detail":
                String productDetailIdRaw = request.getParameter("productDetailId");
                String quantityRaw = request.getParameter("quantity");
                if (productDetailIdRaw == null || productDetailIdRaw.isEmpty() || quantityRaw == null || quantityRaw.isEmpty()) {
                    request.setAttribute("erruqd", "Quantity cannot be blank");
                } else {
                    int productDetailId = Integer.parseInt(productDetailIdRaw);
                    int quantity = Integer.parseInt(quantityRaw);
                    adminDAO.updateQuantity(productDetailId, quantity);
                    listPf = viewProductDetails(request, pagination);
                    request.setAttribute("pagination", pagination);
                    request.setAttribute("listPf", listPf);
                    request.setAttribute("msguqd", "Update quantity success!");
                }
                url = "/views/seller/productDetail.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private List<Product_Form> pagination(HttpServletRequest request, Pagination pagination) {
        String pageRaw = request.getParameter("pagination");
        int page;
        String sorted;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        int totalProducts = 0;
        List<Product_Form> listPf = null;
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "search-products":
                String status = request.getParameter("status");
                String sortedByPrice = request.getParameter("sortByPrice");
                String sortedByDate = request.getParameter("sortByDate");
                String keyword = request.getParameter("keyword");
                totalProducts = adminDAO.findTotalProducts(keyword, status);
                listPf = adminDAO.findPageByKeyword(page, sortedByPrice, sortedByDate, keyword, status);
                pagination.setUrlPattern("manageProduct?action=search-products" + "&" + "sortByPrice=" + sortedByPrice + "&" + "sortByDate=" + sortedByDate + "&" + "keyword=" + keyword + "&" + "status=" + status + "&");
                break;
//            case "filter-products":
//                sortedByPrice = request.getParameter("sortByPrice");
//                sortedByDate = request.getParameter("sortByDate");
//                String[] brandID = request.getParameterValues("brand-filter");
//                String[] cateID = request.getParameterValues("category-filter");
//                String[] colorID = request.getParameterValues("colors-filter");
//                String[] sizeID = request.getParameterValues("size-filter");
//                String[] genderID = request.getParameterValues("gender-filter");
//
//                String priceRange = request.getParameter("price-range");
//                String minPrice = "",
//                 maxPrice = "";
//                if (priceRange != null && !priceRange.isEmpty()) {
//                    String[] range = priceRange.split("-");
//                    minPrice = range[0];
//                    maxPrice = range[1];
//                }
//                totalProducts = adminDAO.findTotalProducts(brandID, cateID, priceRange, minPrice, maxPrice, colorID, sizeID, genderID);
//                listPf = adminDAO.findByPage(page, sortedByPrice, sortedByDate, brandID, cateID, priceRange, minPrice, maxPrice, colorID, sizeID, genderID);
//
//                StringBuilder url = new StringBuilder("manageproduct?action=filter-products");
//                if (sortedByPrice != null && !sortedByPrice.isEmpty()) {
//                    url.append("&sortByPrice=").append(sortedByPrice);
//                }
//                if (sortedByDate != null && !sortedByDate.isEmpty()) {
//                    url.append("&sortByDate=").append(sortedByDate);
//                }
//                if (priceRange != null && !priceRange.isEmpty()) {
//                    url.append("&price-range=").append(priceRange);
//                }
//                if (cateID != null && cateID.length > 0) {
//                    for (String category : cateID) {
//                        url.append("&category-filter=").append(category);
//                    }
//                }
//                if (brandID != null && brandID.length > 0) {
//                    for (String brand : brandID) {
//                        url.append("&category-filter=").append(brand);
//                    }
//                }
//                if (colorID != null && colorID.length > 0) {
//                    for (String color : colorID) {
//                        url.append("&category-filter=").append(color);
//                    }
//                }
//                if (sizeID != null && sizeID.length > 0) {
//                    for (String size : sizeID) {
//                        url.append("&category-filter=").append(size);
//                    }
//                }
//                if (genderID != null && genderID.length > 0) {
//                    for (String gender : genderID) {
//                        url.append("&category-filter=").append(gender);
//                    }
//                }
//                url.append("&");
//                pagination.setUrlPattern(url.toString());
//                break;
            default:
                totalProducts = adminDAO.findTotalProducts();
                listPf = adminDAO.findByPage(page);
                pagination.setUrlPattern("manageProduct?");
        }
        int totalPage = (totalProducts % Constant.RECORD_PER_PAGE) == 0
                ? (totalProducts / Constant.RECORD_PER_PAGE)
                : (totalProducts / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalProducts);
        return listPf;
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String productName = request.getParameter("product_name");
        String productDescription = request.getParameter("productDescription");
        String productPriceRaw = request.getParameter("productPrice");
        String cateIdRaw = request.getParameter("cate");
        String brandIdRaw = request.getParameter("brand");
        String imagePath = "";
        String imagesPath = "";
        List<String> imagePaths;
        if (productName == null || productName.isEmpty() || productDescription == null || productDescription.isEmpty() || productPriceRaw == null || productPriceRaw.isEmpty() || cateIdRaw == null || cateIdRaw.isEmpty() || brandIdRaw == null || brandIdRaw.isEmpty()) {
            request.setAttribute("errorap", "Error when add new new product!");
        } else {
            double productPrice = Double.parseDouble(productPriceRaw);
            int cateID = Integer.parseInt(cateIdRaw);
            int brandID = Integer.parseInt(brandIdRaw);
            Date currentTimestamp = new Date(System.currentTimeMillis());
            int productID = 0;
            try {
                Part part = request.getPart("image");
                if (part != null && part.getSize() > 0) {
                    String path = request.getServletContext().getRealPath("/images");
                    File dir = new File(path);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    File image = new File(dir, part.getSubmittedFileName());
                    part.write(image.getAbsolutePath());
                    imagePath = "/SWP391_SE1754_G1/images/" + image.getName();
                }
            } catch (Exception e) {
                request.setAttribute("errorap", "Error when add new new product image layout!");
                return;
            }
            try {
                Collection<Part> parts = request.getParts();
                imagePaths = new ArrayList<>();

                String uploadPath = request.getServletContext().getRealPath("/images");
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                for (Part part : parts) {
                    if (part.getSubmittedFileName() != null && part.getSize() > 0 && part.getName().equals("list_image")) {
                        File image = new File(dir, part.getSubmittedFileName());
                        part.write(image.getAbsolutePath());
                        imagesPath = "/SWP391_SE1754_G1/images/" + image.getName();
                        imagePaths.add(imagesPath);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorup", "Error when add new product images!");
                return;
            }
            try {
                Product product = Product.builder()
                        .name(productName)
                        .create_on(currentTimestamp)
                        .description(productDescription)
                        .price(productPrice)
                        .image_path(imagePath)
                        .category_id(cateID)
                        .brand_id(brandID)
                        .build();
                boolean isExistProduct = adminDAO.findProductExist(productName, cateID, brandID);
                if (!isExistProduct) {
                    adminDAO.insertNewProduct(product);
                    request.setAttribute("msgap", "Create new product " + productName + " with category id " + cateID + " and brand id " + brandID + " successfully !!");
                    productID = adminDAO.getProductID(productName);
                } else {
                    request.setAttribute("errorap", "Product " + productName + " with category id " + cateID + " and brand id " + brandID + " exist already, please create other !!");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorap", "Error when creating new product!");
            }
            String imagePathString = String.join(",", imagePaths);
            if (imagePathString != null && !imagePathString.isEmpty()) {
                Image image = Image.builder()
                        .product_Id(productID)
                        .image(imagePathString)
                        .build();
                int size = adminDAO.countByProductID(productID);
                if (imagePaths.size() + size <= 6) {
                    adminDAO.deleteImagesExistAlready(image);
                    adminDAO.saveImage(image);
                } else {
                    request.setAttribute("errorap", "Maximum of 6 images allowed.");
                }
            }
        }
    }

    private void updateStatusProduct(HttpServletRequest request, HttpServletResponse response) {
        String idProductRaw = request.getParameter("product_ID");
        String statusProductRaw = request.getParameter("product_status");
        Date currentTimestamp = new Date(System.currentTimeMillis());

        if (idProductRaw == null || idProductRaw.isEmpty() || statusProductRaw == null || statusProductRaw.isEmpty()) {
            request.setAttribute("errusp", "Update status of product error !!");
        } else {
            int statusProduct = Integer.parseInt(statusProductRaw);
            int idProduct = Integer.parseInt(idProductRaw);
            if (statusProduct == 1) {
                adminDAO.updateProductStatus(idProduct, 0, currentTimestamp);
                adminDAO.updateProductDetailsStatus1(idProduct, 0, currentTimestamp);
                adminDAO.updateProductImageStatus(idProduct, 0, currentTimestamp);
                request.setAttribute("msgusp", "Update status of product successfully !!");
            } else {
                adminDAO.updateProductStatus(idProduct, 1, currentTimestamp);
                adminDAO.updateProductDetailsStatus1(idProduct, 1, currentTimestamp);
                adminDAO.updateProductImageStatus(idProduct, 1, currentTimestamp);
                request.setAttribute("msgusp", "Update status of product successfully !!");
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String productIdRaw = request.getParameter("productID");
        String productName = request.getParameter("product_name");
        String productDescription = request.getParameter("productDescription");
        String productPriceRaw = request.getParameter("productPrice");
        String cateIdOldRaw = request.getParameter("cate_id");
        String brandIdOldRaw = request.getParameter("brand_id");
        String cateIdRaw = request.getParameter("cate");
        String brandIdRaw = request.getParameter("brand");
        String imagePathLayout = "";
        String imagesPath = "";
        List<String> imagePaths;

        if (cateIdOldRaw == null || cateIdOldRaw.isEmpty() || brandIdOldRaw == null || brandIdOldRaw.isEmpty() || productIdRaw == null || productIdRaw.isEmpty() || productPriceRaw == null || productPriceRaw.isEmpty() || cateIdRaw == null || cateIdRaw.isEmpty() || brandIdRaw == null || brandIdRaw.isEmpty()) {
            request.setAttribute("errorup", "Error when updating product!");
        } else {
            int cateIdOld = Integer.parseInt(cateIdOldRaw);
            int brandIdOld = Integer.parseInt(brandIdOldRaw);
            int productID = Integer.parseInt(productIdRaw);
            double productPrice = Double.parseDouble(productPriceRaw);
            int cateID = Integer.parseInt(cateIdRaw);
            int brandID = Integer.parseInt(brandIdRaw);

            try {
                Part part = request.getPart("image_layout");
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                if (part.getSubmittedFileName() != null && part.getSize() > 0 && part.getName().equals("image_layout")) {
                    File image = new File(dir, part.getSubmittedFileName());
                    part.write(image.getAbsolutePath());
                    imagePathLayout = "/SWP391_SE1754_G1/images/" + image.getName();
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorup", "Error when update product image layout!");
                return;
            }

            try {
                Collection<Part> parts = request.getParts();
                imagePaths = new ArrayList<>();

                String uploadPath = request.getServletContext().getRealPath("/images");
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                for (Part part : parts) {
                    if (part.getSubmittedFileName() != null && part.getSize() > 0 && part.getName().equals("list_image")) {
                        File image = new File(dir, part.getSubmittedFileName());
                        part.write(image.getAbsolutePath());
                        imagesPath = "/SWP391_SE1754_G1/images/" + image.getName();
                        imagePaths.add(imagesPath);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorup", "Error when updating product images!");
                return;
            }

            Product_Form productForm1 = Product_Form.builder()
                    .id(productID)
                    .name(productName)
                    .description(productDescription)
                    .price(productPrice)
                    .image_path(imagePathLayout)
                    .category_id(cateID)
                    .brand_id(brandID)
                    .build();
            boolean isExistProduct = adminDAO.findExistProduct(productForm1);
            if (!isExistProduct) {
                adminDAO.updateProduct(productForm1, cateIdOld, brandIdOld);
                request.setAttribute("msgup", "Update product successfully !!");
            } else {
                adminDAO.updateProductWithoutName(productForm1, cateIdOld, brandIdOld);
                request.setAttribute("msgup", "Update product successfully !!");
            }
            if (imagePathLayout != null && !imagePathLayout.isEmpty()) {
                adminDAO.updateProductImageLayout(productForm1);
                request.setAttribute("msgup", "Images product layout update successfully !!");
            }
            String imagePathString = String.join(",", imagePaths);
            if (imagePathString != null && !imagePathString.isEmpty()) {
                Image image = Image.builder()
                        .product_Id(productID)
                        .image(imagePathString)
                        .build();
                int size = adminDAO.countByProductID(productID);
                if (imagePaths.size() + size <= 6) {
                    adminDAO.deleteImagesExistAlready(image);
                    adminDAO.saveImage(image);
                } else {
                    request.setAttribute("errorap", "Maximum of 6 images allowed.");
                }
            }
        }

//        Product_Form productForm = adminDAO.findProductByID(productIdRaw, colorIdRaw, cateIdRaw, sizeIdRaw, brandIdRaw, genderIdRaw);
//        session.setAttribute("productForm", productForm);
    }

    private List<Product_Form> viewProductDetails(HttpServletRequest request, Pagination pagination) {
        HttpSession session = request.getSession();
        String sortedByDate;
        String productID = request.getParameter("productID");
        int totalProductDetails = 0;
        String pageRaw = request.getParameter("pagination");
        String sorted;
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        List<Product_Form> listPf = null;
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "search-product-details":
                sortedByDate = request.getParameter("sortByDate");
                String status = request.getParameter("status");
                String colorID = request.getParameter("colorID");
                String sizeID = request.getParameter("sizeID");
                String genderID = request.getParameter("genderID");
                listPf = adminDAO.findProductDetails(page, productID, colorID, sizeID, genderID, sortedByDate, status);
                totalProductDetails = adminDAO.findTotalProductDetailsById(productID, colorID, sizeID, genderID, status);
                StringBuilder url = new StringBuilder("manageProduct?page=view-product-details&action=search-product-details&productID=" + productID + "&");
                if (status != null && !status.isEmpty()) {
                    url.append("status=").append(status).append("&");
                }
                if (colorID != null && !colorID.isEmpty()) {
                    url.append("colorId=").append(colorID).append("&");
                }
                if (sizeID != null && !sizeID.isEmpty()) {
                    url.append("sizeId=").append(sizeID).append("&");
                }
                if (genderID != null && !genderID.isEmpty()) {
                    url.append("genderID=").append(genderID).append("&");
                }
                if (sortedByDate != null && !sortedByDate.isEmpty()) {
                    url.append("sortByDate=").append(sortedByDate).append("&");
                }
                pagination.setUrlPattern(url.toString());
                break;
            default:
                status = request.getParameter("status");
                totalProductDetails = adminDAO.findTotalProductDetailsById(productID);
                listPf = adminDAO.findListProductDetailByID(productID, page);
                pagination.setUrlPattern("manageProduct?page=view-product-details&productID=" + productID + "&status=" + status + "&");
        }
        int totalPage = (totalProductDetails % Constant.RECORD_PER_PAGE) == 0
                ? (totalProductDetails / Constant.RECORD_PER_PAGE)
                : (totalProductDetails / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalProductDetails);
        return listPf;
    }

    private void addProductDetails(HttpServletRequest request, HttpServletResponse response) {
        String productIdRaw = request.getParameter("productID");
        String productName = request.getParameter("product_name");
        String colorIdRaw = request.getParameter("color");
        String sizeIdRaw = request.getParameter("size");
        String genderIdRaw = request.getParameter("gender");
        String stockRaw = request.getParameter("stock");
        Date currentTimestamp = new Date(System.currentTimeMillis());
        if (stockRaw == null || stockRaw.isEmpty() || productIdRaw == null || productIdRaw.isEmpty() || productName == null || productName.isEmpty() || colorIdRaw == null || colorIdRaw.isEmpty() || sizeIdRaw == null || sizeIdRaw.isEmpty() || genderIdRaw == null || genderIdRaw.isEmpty()) {
            request.setAttribute("errorapd", "Error when create new product detail!");
            return;
        } else {
            int colorId = Integer.parseInt(colorIdRaw);
            int sizeId = Integer.parseInt(sizeIdRaw);
            int genderId = Integer.parseInt(genderIdRaw);
            int productID = Integer.parseInt(productIdRaw);
            int stock = Integer.parseInt(stockRaw);
            Product_Detail pd = Product_Detail.builder()
                    .product_id(productID)
                    .color_id(colorId)
                    .size_id(sizeId)
                    .gender_id(genderId)
                    .stock(stock).build();
            boolean isExistProduct = adminDAO.findExistProductDetails(productID, colorId, sizeId, genderId);
            if (!isExistProduct) {
                adminDAO.addNewProductDetail(pd, currentTimestamp);
                request.setAttribute("msgapd", "Add new product detail successfully !!");
            } else {
                request.setAttribute("errorapd", "Product detail exist already!");
            }
        }
    }

    private void updateStatusProductDetail(HttpServletRequest request, HttpServletResponse response) {
        String idProductRaw = request.getParameter("productID");
        String statusRaw = request.getParameter("status");
        String idProductDetailRaw = request.getParameter("productDetailId");
        Date currentTimestamp = new Date(System.currentTimeMillis());
        if (idProductDetailRaw == null || idProductDetailRaw.isEmpty()) {
            request.setAttribute("erruspd", "Update status of product detail error !!");
        } else {
            int idProductDetail = Integer.parseInt(idProductDetailRaw);
            int statusProduct = Integer.parseInt(statusRaw);
            int idProduct = Integer.parseInt(idProductRaw);
            int statusOfProduct = adminDAO.checkIsProductOfThisDisplay(idProduct);
            if (statusOfProduct == 0) {
                request.setAttribute("erruspd", "Need to update status of product firstly!");
            } else {
                if (statusProduct == 1) {
                    adminDAO.updateProductDetailsStatus(idProductDetail, 0, currentTimestamp);
                    request.setAttribute("msguspd", "Update status of product detail successfully !!");

                } else {
                    adminDAO.updateProductDetailsStatus(idProductDetail, 1, currentTimestamp);
                    request.setAttribute("msguspd", "Update status of product detail successfully !!");
                }
            }
        }
    }
}
