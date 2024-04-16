/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import constant.Constant;
import dao.CommonDao;
import entity.Account_Form;
import entity.Brand;
import entity.Category;
import entity.Color;
import entity.Feedback;
import entity.Feedback_Form;
import entity.Gender;
import entity.Image;
import entity.Pagination;
import entity.Product_Form;
import entity.Size;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "PublicProductDetailsController", urlPatterns = {"/product"})
@MultipartConfig
public class PublicProductController extends HttpServlet {

    CommonDao commonDAO = new CommonDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pagination pagination = new Pagination();
        Brand b = new Brand();
        String url = "";
        String page = request.getParameter("page") == null ? "default" : request.getParameter("page");
        switch (page) {
            case "view-product-details":
                viewProductDetails(request, response);
                url = "views/common/productDetails.jsp";
                break;
            case "view-public-product-list":
                List<Color> listC = commonDAO.findAllColor();
                List<Size> listS = commonDAO.findAllSize();
                List<Gender> listG = commonDAO.findAllGender();
                List<Brand> listB = commonDAO.findAllBrand();
                List<Category> listCate = commonDAO.findAllCategory();

                List<Image> image = commonDAO.selectTop10DistinctImageProduct();
                int countWomenProduct = commonDAO.countWomenProduct();
                int countMenProduct = commonDAO.countMenProduct();

                String[] brandID = request.getParameterValues("brandID");
                String[] cateID = request.getParameterValues("categoryID");
                String[] colorID = request.getParameterValues("colorID");
                String[] sizeID = request.getParameterValues("sizeID");
                String[] genderID = request.getParameterValues("genderID");

                String sortByPrice = request.getParameter("sortByPrice");
                String sortByDate = request.getParameter("sortByDate");
                List<Product_Form> listPublicProduct = pagination(request, pagination);
                session.setAttribute("listPublicProduct", listPublicProduct);
                session.setAttribute("pagination", pagination);

                request.setAttribute("countW", countWomenProduct);
                request.setAttribute("countM", countMenProduct);
                request.setAttribute("image", image);

                request.setAttribute("genderID", genderID);
                request.setAttribute("cateID", cateID);
                request.setAttribute("colorID", colorID);
                request.setAttribute("sizeID", sizeID);
                request.setAttribute("brandID", brandID);

                request.setAttribute("sortByPrice", sortByPrice);
                request.setAttribute("sortByDate", sortByDate);
                session.setAttribute("listCpp", listC);
                session.setAttribute("listSpp", listS);
                session.setAttribute("listGpp", listG);
                session.setAttribute("listBpp", listB);
                session.setAttribute("listCatepp", listCate);
                url = "views/common/publicProductList.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "";
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "add-products-to-cart":
                addProductToCarts(request, response);
                String accountIdRaw = request.getParameter("accountID");
                int accountID = Integer.parseInt(accountIdRaw);
                List<Product_Form> listProduct = commonDAO.findCartByAccountId(accountID);
                int totalPrice = commonDAO.findTotalPriceInCart(accountID);
                int cartId = commonDAO.findCartId(accountID);
                int countCart = commonDAO.countCartByCartId(cartId);
                session.setAttribute("listProductInCart", listProduct);
                session.setAttribute("totalPrice", totalPrice);
                session.setAttribute("countCart", countCart);
                url = "views/common/productDetails.jsp";
                break;
            case "remove-item-cart":
                removeItemCart(request, response);
                accountIdRaw = request.getParameter("accountID");
                accountID = Integer.parseInt(accountIdRaw);
                listProduct = commonDAO.findCartByAccountId(accountID);
                totalPrice = commonDAO.findTotalPriceInCart(accountID);
                cartId = commonDAO.findCartId(accountID);
                countCart = commonDAO.countCartByCartId(cartId);
                session.setAttribute("listProductInCart", listProduct);
                session.setAttribute("totalPrice", totalPrice);
                session.setAttribute("countCart", countCart);
                url = "views/common/productDetails.jsp";
                break;
            case "rating":
                Account_Form af = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                String productIdRaw = request.getParameter("productID");
                String username = request.getParameter("UserName");
                String email = request.getParameter("Email");
                String message = request.getParameter("message");
                String starRaw = request.getParameter("star");
                String imagePath = "";
                Date currentTimestamp = new Date(System.currentTimeMillis());

                if (starRaw == null || starRaw.isEmpty() || message == null || message.isEmpty()
                        || productIdRaw == null || productIdRaw.isEmpty() || username == null
                        || username.isEmpty() || email == null || email.isEmpty()) {
                    request.setAttribute("message", message);
                    request.setAttribute("username", username);
                    request.setAttribute("messageError1", "All fields are required!");
                } else {
                    boolean flag = false;
                    boolean flag1 = commonDAO.checkCustomerBuyProductYet(af.getId(), productIdRaw);
                    if (!flag1) {
                        request.setAttribute("error", "You have to buy product first to rating!");
                        flag = true;
                    }
                    if (!username.matches("^(?!\\s{2,})[A-Za-z\\s]+$")) {
                        request.setAttribute("message", message);
                        request.setAttribute("username", username);
                        request.setAttribute("messageName", "Name must contain only letters!");
                        flag = true;
                    }
                    if (message.length() < 5 || message.length() >= 350) {
                        request.setAttribute("message", message);
                        request.setAttribute("username", username);
                        request.setAttribute("messageError", "Message must be between 5 and 350 characters!");
                        flag = true;
                    }
                    if (!message.matches("^(?!\\s{2,})[A-Za-z0-9!,.\\s]+$")) {
                        request.setAttribute("message", message);
                        request.setAttribute("username", username);
                        request.setAttribute("messageError", "Message contains letter and character(,.!)!");
                        flag = true;
                    }
                    if (!flag && flag1) {
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
                            request.setAttribute("error", "Error when uploading the image!");
                            return;
                        }

                        int star = Integer.parseInt(starRaw);
                        int productID = Integer.parseInt(productIdRaw);
                        Feedback f = Feedback.builder()
                                .account_id(af.getId())
                                .product_id(productID)
                                .content(message)
                                .date_review(currentTimestamp)
                                .star(star)
                                .image(imagePath)
                                .build();
                        Feedback isExist = commonDAO.findFeedback(af.getId(), productID);
                        if (isExist == null) {
                            commonDAO.addNewFeedback(f);
                        } else {
                            request.setAttribute("error", "You have already rating this product!");
                        }
                        double averageStar = 0;
                        int starRating = commonDAO.getStarByProductId(productID);
                        int countFeedback = commonDAO.getFeedbackByProductId(productID);
                        if (starRating != 0 && countFeedback != 0) {
                            averageStar = starRating / countFeedback;
                        }
                        List<Feedback_Form> accountRating = commonDAO.getAccountRatingByProductId(productID);
                        session.setAttribute("ar", accountRating);
                        session.setAttribute("countFeedback", countFeedback);
                        session.setAttribute("avgStar", averageStar);
                        request.setAttribute("msg", "Feedback sent successfully!");
                    }
                }
                url = "views/common/productDetails.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void viewProductDetails(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String productIdRaw = request.getParameter("productID");
        if (productIdRaw == null && productIdRaw.isEmpty()) {
            request.setAttribute("errvpd", "Can't find product!");
            return;
        }
        int productID = Integer.parseInt(productIdRaw);
        List<Size> listSp = commonDAO.findSizeByProductId(productID);
        List<Gender> listGp = commonDAO.findGenderByProductId(productID);
        List<Color> listCp = commonDAO.findColorByProductId(productID);
        Product_Form pf = commonDAO.getProductById(productID);
        List<Product_Form> listPf = commonDAO.getListProductRelated(pf.getCategory(), pf.getId());
        List<Image> listImages = commonDAO.getImagesByProductID(productID);

        int star = commonDAO.getStarByProductId(productID);
        int countFeedback = commonDAO.getFeedbackByProductId(productID);
        double averageStar = 0;
        if (star != 0 && countFeedback != 0) {
            averageStar = star / countFeedback;
        }
        List<Feedback_Form> accountRating = commonDAO.getAccountRatingByProductId(productID);

        session.setAttribute("ar", accountRating);
        session.setAttribute("countFeedback", countFeedback);
        session.setAttribute("avgStar", averageStar);
        session.setAttribute("listSp", listSp);
        session.setAttribute("listGp", listGp);
        session.setAttribute("listCp", listCp);
        session.setAttribute("pf", pf);
        session.setAttribute("listPf", listPf);
        session.setAttribute("listImages", listImages);
    }

    private void addProductToCarts(HttpServletRequest request, HttpServletResponse response) {
        String accountIdRaw = request.getParameter("accountID");
        String productIdRaw = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String cateIdRaw = request.getParameter("cateID");
        String brandIdRaw = request.getParameter("brandID");
        String colorIdRaw = request.getParameter("colorID");
        String sizeIdRaw = request.getParameter("sizeID");
        String genderIdRaw = request.getParameter("genderID");
        String quantityBuyRaw = request.getParameter("quantityBuy");
        String address = request.getParameter("address");
        Date currentTimestamp = new Date(System.currentTimeMillis());

        if (quantityBuyRaw == null || quantityBuyRaw.isEmpty() || accountIdRaw == null || accountIdRaw.isEmpty() || productIdRaw == null || productIdRaw.isEmpty() || productName == null || productName.isEmpty() || cateIdRaw == null || cateIdRaw.isEmpty()
                || colorIdRaw == null || colorIdRaw.isEmpty() || sizeIdRaw == null || sizeIdRaw.isEmpty() || genderIdRaw == null || genderIdRaw.isEmpty()) {
            request.setAttribute("errapc", "Can't find product!");
            return;
        }

        int accountID = Integer.parseInt(accountIdRaw);
        int productID = Integer.parseInt(productIdRaw);
        int cateID = Integer.parseInt(cateIdRaw);
        int brandID = Integer.parseInt(brandIdRaw);
        int colorID = Integer.parseInt(colorIdRaw);
        int sizeID = Integer.parseInt(sizeIdRaw);
        int genderID = Integer.parseInt(genderIdRaw);
        int quantity = Integer.parseInt(quantityBuyRaw);
        Product_Form pf = Product_Form.builder()
                .product_id(productID)
                .category_id(cateID)
                .brand_id(brandID)
                .color_id(colorID)
                .size_id(sizeID)
                .gender_id(genderID)
                .quantity(quantity)
                .created_on(currentTimestamp)
                .build();
        int quantityProductDetails = commonDAO.getQuantityProductDetails(pf);
        if (quantityProductDetails <= 0) {
            request.setAttribute("errapc", "This product details is out of stock!");
        } else if (quantity > quantityProductDetails) {
            request.setAttribute("errapc", "Quantity must lower or equal than quantity available of shop");
        } else {
            boolean isExistCart = commonDAO.findExistCartByAccountId(accountID);
            if (!isExistCart) {
                commonDAO.addToCart(accountID, address);
            }
            int productDetailId = commonDAO.getProductDetail(pf);
            int cartId = commonDAO.getCartByAccId(accountID);
            commonDAO.addToCartDetail(productDetailId, cartId, pf);
            request.setAttribute("msgapc", "Add product " + productName + " to cart successful!");
            int quantityAfterAddToCart = quantityProductDetails - quantity;
            commonDAO.updateQuantityProductDetails(quantityAfterAddToCart, pf);
        }
    }

    private void removeItemCart(HttpServletRequest request, HttpServletResponse response) {
        String cartIdRaw = request.getParameter("cartID");
        String productName = request.getParameter("name");
        String accountIdRaw = request.getParameter("accountID");
        String productIdRaw = request.getParameter("productID");
        String productDetailIdRaw = request.getParameter("productDetailId");
        if (accountIdRaw == null || accountIdRaw.isEmpty() || productIdRaw == null || productDetailIdRaw.isEmpty()
                || productDetailIdRaw == null || productDetailIdRaw.isEmpty()) {
            request.setAttribute("errapc", "Can't find product!");
            return;
        }
        int accountID = Integer.parseInt(accountIdRaw);
        int productID = Integer.parseInt(productIdRaw);
        int productDetailID = Integer.parseInt(productDetailIdRaw);
        int cartID = Integer.parseInt(cartIdRaw);

        int quantityBeforeDelete = commonDAO.getQuantityByProductDetailsId(productDetailID);
        int quantity = commonDAO.getQuantityByCartDetail(cartID, productDetailID);
        int quantityAfterDelete = quantityBeforeDelete + quantity;

        commonDAO.removeItemInCartDetail(productID, productDetailID);

        boolean isExistCartDetail = commonDAO.findExistCartDetail(cartID, productDetailID);
        if (!isExistCartDetail) {
            commonDAO.updateQuantityProductDetail(quantityAfterDelete, productDetailID);
        }
        request.setAttribute("msgapc", "Remove item " + productName + " in cart successful!");
    }

    private List<Product_Form> pagination(HttpServletRequest request, Pagination pagination) {
        String sorted;
        String pageRaw = request.getParameter("pagination");
        int page;
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
//                String status = request.getParameter("status");
//                if (status != null && !status.isEmpty()) {
//                    adminDAO.deleteProductHideInterval15Days();
//                    adminDAO.deleteProductDetailsHideInterval15Days();
//                }
//                String sortedByPrice = request.getParameter("sortByPrice");
//                String sortedByDate = request.getParameter("sortByDate");
//                String keyword = request.getParameter("keyword");
//                totalProducts = adminDAO.findTotalProducts(keyword, status);
//                listPf = adminDAO.findPageByKeyword(page, sortedByPrice, sortedByDate, keyword, status);
//                pagination.setUrlPattern("manageproduct?action=search-products" + "&" + "sortByPrice=" + sortedByPrice + "&" + "sortByDate=" + sortedByDate + "&" + "keyword=" + keyword + "&" + "status=" + status + "&");
                break;
            case "filter-products":
                String sortedByPrice = request.getParameter("sortByPrice");
                String sortedByDate = request.getParameter("sortByDate");
                String[] brandID = request.getParameterValues("brandID");
                String[] cateID = request.getParameterValues("categoryID");
                String[] colorID = request.getParameterValues("colorID");
                String[] sizeID = request.getParameterValues("sizeID");
                String[] genderID = request.getParameterValues("genderID");

//                String priceRange = request.getParameter("price-range");
//                String minPrice = "",
//                 maxPrice = "";
//                if (priceRange != null && !priceRange.isEmpty()) {
//                    String[] range = priceRange.split("-");
//                    minPrice = range[0];
//                    maxPrice = range[1];
//                }
                totalProducts = commonDAO.findTotalProducts(brandID, cateID, colorID, sizeID, genderID);
                listPf = commonDAO.findByPage(page, sortedByPrice, sortedByDate, brandID, cateID, colorID, sizeID, genderID);

                StringBuilder url = new StringBuilder("product?page=view-public-product-list&action=filter-products");
                if (sortedByPrice != null && !sortedByPrice.isEmpty()) {
                    url.append("&sortByPrice=").append(sortedByPrice);
                }
                if (sortedByDate != null && !sortedByDate.isEmpty()) {
                    url.append("&sortByDate=").append(sortedByDate);
                }
                if (cateID != null && cateID.length > 0) {
                    for (String category : cateID) {
                        url.append("&categoryID=").append(category);
                    }
                }
                if (brandID != null && brandID.length > 0) {
                    for (String brand : brandID) {
                        url.append("&brandID=").append(brand);
                    }
                }
                if (colorID != null && colorID.length > 0) {
                    for (String color : colorID) {
                        url.append("&colorID=").append(color);
                    }
                }
                if (sizeID != null && sizeID.length > 0) {
                    for (String size : sizeID) {
                        url.append("&sizeID=").append(size);
                    }
                }
                if (genderID != null && genderID.length > 0) {
                    for (String gender : genderID) {
                        url.append("&genderID=").append(gender);
                    }
                }
                url.append("&");
                pagination.setUrlPattern(url.toString());
                break;
            default:
                totalProducts = commonDAO.findTotalProducts();
                listPf = commonDAO.findByPage(page);
                pagination.setUrlPattern("product?page=view-public-product-list&");
        }
        int totalPage = (totalProducts % Constant.RECORD_PER_PAGE) == 0
                ? (totalProducts / Constant.RECORD_PER_PAGE)
                : (totalProducts / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalProducts);
        return listPf;
    }

}
