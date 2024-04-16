/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import EmailSender.EmailSender;
import constant.Constant;
import dao.CommonDao;
import entity.Account;
import entity.Account_Form;
import entity.Cart;
import entity.Discount;
import entity.Invoice;
import entity.Product_Form;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author FPT-LAPTOP
 */
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {

    CommonDao commonDao = new CommonDao();
    EmailSender emailSender = new EmailSender();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account_Form acc = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
        String url = "";
        String page = request.getParameter("page") == null ? "default" : request.getParameter("page");
        switch (page) {
            case "checkoutstep1":
                url = "views/common/checkoutstep1.jsp";
                break;
            case "checkoutstep2":
                url = "views/common/checkoutstep2.jsp";
                break;
            case "checkoutstep3":
                url = "views/common/checkoutstep3.jsp";
                break;
            default:
                if (acc != null) {
                    Account acc_infor = commonDao.getAccountInformationByAccountId(acc.getId());
                    session.setAttribute("account_information", acc_infor);
                    List<Cart> p = commonDao.getShoppingCartDetailsByAccountId(acc.getId());
                    session.setAttribute("shopping_cart_details", p);
                    List<Discount> dis = commonDao.getActiveDiscountList();
                    session.setAttribute("disountList", dis);
                    url = "views/common/checkoutstep1.jsp";
                } else {
                    url = "views/common/checkoutstep1.jsp";
                }
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Account_Form acc = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
        int accountId = acc.getId();
        String email = commonDao.getEmailByAccountId(accountId);
        switch (action) {
            case "placeOrder":
                //Update stock in product detail by product id.
                String[] productIdStrings = request.getParameterValues("product_id");
                String[] productDetailIdStrings1 = request.getParameterValues("productDetailId");

                int[] productId = new int[productIdStrings.length];
                for (int i = 0; i < productIdStrings.length; i++) {
                    productId[i] = Integer.parseInt(productIdStrings[i]);
                }

                int[] productDetailId = new int[productDetailIdStrings1.length];
                for (int i = 0; i < productDetailIdStrings1.length; i++) {
                    productDetailId[i] = Integer.parseInt(productDetailIdStrings1[i]);
                }

                //Add invoice and add cart code in Cart.
                Date currentDate = new Date();
                java.sql.Date invoiceDate = new java.sql.Date(currentDate.getTime());
                Double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                String address = request.getParameter("hiddenDeliveryAddress");
                String cartCode = commonDao.generateRandomCartCode();
                double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
                int quantity = commonDao.getQuantityByDiscountPercent((int) discountPercent);
                int quantityBeforeCheckoutSuccess = quantity - 1;
                commonDao.updateQuantityDiscountByDiscountPercent((int) discountPercent, quantityBeforeCheckoutSuccess);
                double subTotalPrice = Double.parseDouble(request.getParameter("subTotalPrice"));
                commonDao.addCartCodeForCartByAccountId(cartCode, accountId);
                commonDao.addInvoice(accountId, invoiceDate, totalPrice, cartCode, address, discountPercent, subTotalPrice);
                int invoiceId = commonDao.getInvoiceIdByCartCode(cartCode);
                //Add invoice detail.
                String[] unitPriceStrings = request.getParameterValues("unit_price");
                String[] totalPricePerProductStrings = request.getParameterValues("total_price_per_product");
                String[] quantityStrings2 = request.getParameterValues("quantity_per_product");
                double[] unitPrice = new double[unitPriceStrings.length];
                for (int i = 0; i < unitPriceStrings.length; i++) {
                    unitPrice[i] = Double.parseDouble(unitPriceStrings[i]);
                }
                double[] totalPricePerProduct = new double[totalPricePerProductStrings.length];
                for (int i = 0; i < totalPricePerProductStrings.length; i++) {
                    totalPricePerProduct[i] = Double.parseDouble(totalPricePerProductStrings[i]);
                }
                int[] quantities2 = new int[quantityStrings2.length];
                for (int i = 0; i < quantityStrings2.length; i++) {
                    quantities2[i] = Integer.parseInt(quantityStrings2[i]);
                }
                for (int i = 0; i < productIdStrings.length; i++) {
                    commonDao.addInvoiceDetail(productDetailId[i], invoiceId, productId[i], quantities2[i], unitPrice[i], totalPricePerProduct[i]);
                }

                //Delete Cart and CartDetail.
                int cartId = Integer.parseInt(request.getParameter("cart_id"));
                commonDao.deleteCartDetailByCartId(cartId);
                commonDao.deleteCartById(cartId);
                Account_Form account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                commonDao.deleteCartByAccId(account.getId());
                if (account != null) {
                    int accountID = account.getId();
                    List<Product_Form> listProduct = commonDao.findCartByAccountId(accountID);
                    int totalPriceInt = commonDao.findTotalPriceInCart(accountID);
                    totalPrice = (double) totalPriceInt;
                    cartId = commonDao.findCartId(accountID);
                    int countCart = commonDao.countCartByCartId(cartId);
                    session.setAttribute("listProductInCart", listProduct);
                    session.setAttribute("totalPrice", totalPrice);
                    session.setAttribute("countCart", countCart);
                }
                String username = request.getParameter("hiddenUserName");
                String phonenumber = request.getParameter("hiddenPhoneNumber");
                session.setAttribute("hiddenDeliveryAddress", address);
                session.setAttribute("hiddenUserName", username);
                session.setAttribute("hiddenPhoneNumber", phonenumber);
                session.setAttribute("invoiceId", invoiceId);
                String htmlContent = invoiceHTML("Pending", request, response);
                emailSender.sendMsgEmail(email, htmlContent, "Your Invoice");
                request.getRequestDispatcher("views/common/checkoutstep3.jsp").forward(request, response);
                break;
            case "deleteProduct":
                int p_id = Integer.parseInt(request.getParameter("p_id"));
                int pd_id = Integer.parseInt(request.getParameter("pd_id"));
                int cart_id = Integer.parseInt(request.getParameter("cart_id"));

                int quantityBeforeDelete = commonDao.getQuantityByProductDetailsId(pd_id);
                quantity = commonDao.getQuantityByCartDetail(cart_id, pd_id);
                int quantityAfterDelete = quantityBeforeDelete + quantity;
                boolean isExistCartDetail = commonDao.findExistCartDetail(cart_id, pd_id);
                if (!isExistCartDetail) {
                    commonDao.updateQuantityProductDetail(quantityAfterDelete, pd_id);
                }
                commonDao.deleteProductInCartDetailByProductId(p_id);
                List<Cart> up = commonDao.getShoppingCartDetailsByAccountId(accountId);
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                commonDao.deleteCartByAccId(account.getId());
                if (account != null) {
                    int accountID = account.getId();
                    List<Product_Form> listProduct = commonDao.findCartByAccountId(accountID);
                    int totalPriceInt = commonDao.findTotalPriceInCart(accountID);
                    totalPrice = (double) totalPriceInt;
                    cartId = commonDao.findCartId(accountID);
                    int countCart = commonDao.countCartByCartId(cartId);
                    session.setAttribute("listProductInCart", listProduct);
                    session.setAttribute("totalPrice", totalPrice);
                    session.setAttribute("countCart", countCart);
                }
                session.setAttribute("shopping_cart_details", up);
                request.getRequestDispatcher("views/common/checkoutstep1.jsp").forward(request, response);
                break;
            case "proceedCheckout":
                String[] quantityStrings = request.getParameterValues("input_number");
                String[] productDetailIdStrings = request.getParameterValues("pro_det_id");
                Double subtotal = Double.parseDouble(request.getParameter("tps_va_in"));
                Double discount = Double.parseDouble(request.getParameter("dis_va_in"));
                Double total = Double.parseDouble(request.getParameter("tpf_va_in"));

                int[] quantities = new int[quantityStrings.length];
                for (int i = 0; i < quantityStrings.length; i++) {
                    quantities[i] = Integer.parseInt(quantityStrings[i]);
                }
                int[] productDetailIds = new int[productDetailIdStrings.length];
                for (int i = 0; i < productDetailIdStrings.length; i++) {
                    productDetailIds[i] = Integer.parseInt(productDetailIdStrings[i]);
                }
                for (int i = 0; i < quantities.length; i++) {
                    commonDao.updateQuantityByProductId(quantities[i], productDetailIds[i]);
                }
                List<Cart> p = commonDao.getShoppingCartDetailsByAccountId(accountId);
                session.setAttribute("shopping_cart_details", p);
                request.setAttribute("subtotal", subtotal);
                request.setAttribute("discount", discount);
                request.setAttribute("total", total);
                request.getRequestDispatcher("views/common/checkoutstep2.jsp").forward(request, response);

                break;
            default:
                throw new AssertionError();
        }
    }

    private String invoiceHTML(String sta, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account_Form acc = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
        int accountId = acc.getId();
        String recipient = (String) session.getAttribute("hiddenUserName");
        String deliveryAddress = (String) session.getAttribute("hiddenDeliveryAddress");
        String phone = (String) session.getAttribute("hiddenPhoneNumber");
//        session.removeAttribute("hiddenUserName");
//        session.removeAttribute("hiddenDeliveryAddress");
//        session.removeAttribute("hiddenPhoneNumber");
        String email = commonDao.getEmailByAccountId(accountId);
        int invoiceIdd = (Integer) session.getAttribute("invoiceId");
        List<Invoice> in = commonDao.getInvoiceListById(invoiceIdd);
        session.setAttribute("invoice_list_detail", in);
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm, dd/MM/yyyy");
        String formattedDate = sdf.format(new Date());
        StringBuilder htmlContent = new StringBuilder();
        htmlContent.append("<!DOCTYPE html>\n")
                .append("<html>\n")
                .append("    <head>\n")
                .append("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n")
                .append("        <title>JSP Page</title>\n")
                .append("        <!-- fraimwork - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/bootstrap.min.css\">\n")
                .append("\n")
                .append("        <!-- icon - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/fontawesome.css\">\n")
                .append("\n")
                .append("        <!-- animation - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/animate.css\">\n")
                .append("\n")
                .append("        <!-- nice select - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/nice-select.css\">\n")
                .append("\n")
                .append("        <!-- carousel - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/slick.css\">\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/slick-theme.css\">\n")
                .append("\n")
                .append("        <!-- popup images & videos - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/magnific-popup.css\">\n")
                .append("\n")
                .append("        <!-- jquery ui - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/jquery-ui.css\">\n")
                .append("\n")
                .append("        <!-- custom - css include -->\n")
                .append("        <link rel=\"stylesheet\" type=\"text/css\" href=\"${pageContext.request.contextPath}/assets/css/style.css\">\n")
                .append("        <style>\n")
                .append("            body {\n")
                .append("                font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\n")
                .append("                text-align: center;\n")
                .append("                color: #777;\n")
                .append("            }\n")
                .append("\n")
                .append("            body h1 {\n")
                .append("                font-weight: 300;\n")
                .append("                margin-bottom: 0px;\n")
                .append("                padding-bottom: 0px;\n")
                .append("                color: #000;\n")
                .append("            }\n")
                .append("\n")
                .append("            body h3 {\n")
                .append("                font-weight: 300;\n")
                .append("                margin-top: 10px;\n")
                .append("                margin-bottom: 20px;\n")
                .append("                font-style: italic;\n")
                .append("                color: #555;\n")
                .append("            }\n")
                .append("\n")
                .append("            body a {\n")
                .append("                color: #06f;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box {\n")
                .append("                max-width: 800px;\n")
                .append("                margin: auto;\n")
                .append("                padding: 30px;\n")
                .append("                border: 1px solid #eee;\n")
                .append("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);\n")
                .append("                font-size: 16px;\n")
                .append("                line-height: 24px;\n")
                .append("                font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\n")
                .append("                color: #555;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table {\n")
                .append("                width: 100%;\n")
                .append("                line-height: inherit;\n")
                .append("                text-align: left;\n")
                .append("                border-collapse: collapse;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table td {\n")
                .append("                padding: 5px;\n")
                .append("                vertical-align: top;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr td:nth-child(2) {\n")
                .append("                text-align: right;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.top table td {\n")
                .append("                padding-bottom: 20px;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.top table td.title {\n")
                .append("                font-size: 45px;\n")
                .append("                line-height: 45px;\n")
                .append("                color: #333;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.information table td {\n")
                .append("                padding-bottom: 40px;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.heading td {\n")
                .append("                background: #eee;\n")
                .append("                border-bottom: 1px solid #ddd;\n")
                .append("                font-weight: bold;\n")
                .append("                text-align: right;\n")
                .append("            }\n")
                .append("            .invoice-box table tr.heading td:first-child {\n")
                .append("                background: #eee;\n")
                .append("                border-bottom: 1px solid #ddd;\n")
                .append("                font-weight: bold;\n")
                .append("                text-align: left;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.heading td:nth-child(2) {\n")
                .append("                padding-right: 120px;\n")
                .append("            }\n")
                .append("            .invoice-box table tr.details td {\n")
                .append("                padding-bottom: 20px;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.item td {\n")
                .append("                border-bottom: 1px solid #eee;\n")
                .append("                text-align: right;\n")
                .append("            }\n")
                .append("            .invoice-box table tr.item td:first-child {\n")
                .append("                border-bottom: 1px solid #eee;\n")
                .append("                text-align: left;\n")
                .append("            }\n")
                .append("            .invoice-box table tr.item td:nth-child(2) {\n")
                .append("                text-align: center;\n")
                .append("            }\n")
                .append("            .invoice-box table tr.item.last td {\n")
                .append("                border-bottom: none;\n")
                .append("            }\n")
                .append("\n")
                .append("            .invoice-box table tr.total td:nth-child(3) {\n")
                .append("                border-top: 2px solid #eee;\n")
                .append("                font-weight: bold;\n")
                .append("                text-align: right;\n")
                .append("            }\n")
                .append("\n")
                .append("            @media only screen and (max-width: 600px) {\n")
                .append("                .invoice-box table tr.top table td {\n")
                .append("                    width: 100%;\n")
                .append("                    display: block;\n")
                .append("                    text-align: center;\n")
                .append("                }\n")
                .append("\n")
                .append("                .invoice-box table tr.information table td {\n")
                .append("                    width: 100%;\n")
                .append("                    display: block;\n")
                .append("                    text-align: center;\n")
                .append("                }\n")
                .append("            }\n")
                .append("\n")
                .append("            .hh-grayBox {\n")
                .append("                background-color: #F8F8F8;\n")
                .append("                margin-bottom: 20px;\n")
                .append("                padding: 35px;\n")
                .append("                margin-top: 20px;\n")
                .append("            }\n")
                .append("            .pt45 {\n")
                .append("                padding-top: 45px;\n")
                .append("            }\n")
                .append("            .order-tracking {\n")
                .append("                text-align: center;\n")
                .append("                width: 33.33%;\n")
                .append("                position: relative;\n")
                .append("                display: block;\n")
                .append("            }\n")
                .append("            .order-tracking .is-complete {\n")
                .append("                display: block;\n")
                .append("                position: relative;\n")
                .append("                border-radius: 50%;\n")
                .append("                height: 30px;\n")
                .append("                width: 30px;\n")
                .append("                border: 0px solid #AFAFAF;\n")
                .append("                background-color: #f7be16;\n")
                .append("                margin: 0 auto;\n")
                .append("                transition: background 0.25s linear;\n")
                .append("                -webkit-transition: background 0.25s linear;\n")
                .append("                z-index: 2;\n")
                .append("            }\n")
                .append("            .order-tracking .is-complete:after {\n")
                .append("                display: block;\n")
                .append("                position: absolute;\n")
                .append("                content: '';\n")
                .append("                height: 14px;\n")
                .append("                width: 7px;\n")
                .append("                top: -2px;\n")
                .append("                bottom: 0;\n")
                .append("                left: 5px;\n")
                .append("                margin: auto 0;\n")
                .append("                border: 0px solid #AFAFAF;\n")
                .append("                border-width: 0px 2px 2px 0;\n")
                .append("                transform: rotate(45deg);\n")
                .append("                opacity: 0;\n")
                .append("            }\n")
                .append("            .order-tracking.completed .is-complete {\n")
                .append("                border-color: #27aa80;\n")
                .append("                border-width: 0px;\n")
                .append("                background-color: #27aa80;\n")
                .append("            }\n")
                .append("            .order-tracking.completed .is-complete:after {\n")
                .append("                border-color: #fff;\n")
                .append("                border-width: 0px 3px 3px 0;\n")
                .append("                width: 7px;\n")
                .append("                left: 11px;\n")
                .append("                opacity: 1;\n")
                .append("            }\n")
                .append("            .order-tracking p {\n")
                .append("                color: #A4A4A4;\n")
                .append("                font-size: 16px;\n")
                .append("                margin-top: 8px;\n")
                .append("                margin-bottom: 0;\n")
                .append("                line-height: 20px;\n")
                .append("            }\n")
                .append("            .order-tracking p span {\n")
                .append("                font-size: 14px;\n")
                .append("            }\n")
                .append("            .order-tracking.completed p {\n")
                .append("                color: #000;\n")
                .append("            }\n")
                .append("            .order-tracking::before {\n")
                .append("                content: '';\n")
                .append("                display: block;\n")
                .append("                height: 3px;\n")
                .append("                width: calc(100% - 40px);\n")
                .append("                background-color: #f7be16;\n")
                .append("                top: 13px;\n")
                .append("                position: absolute;\n")
                .append("                left: calc(-50% + 20px);\n")
                .append("                z-index: 0;\n")
                .append("            }\n")
                .append("            .order-tracking:first-child:before {\n")
                .append("                display: none;\n")
                .append("            }\n")
                .append("            .order-tracking.completed:before {\n")
                .append("                background-color: #27aa80;\n")
                .append("            }\n")
                .append("        </style>\n")
                .append("    </head>\n")
                .append("    <body>\n")
                .append("        <div class=\"invoice-box\">\n")
                .append("            <table>\n")
                .append("                <tr class=\"top\">\n")
                .append("                    <td colspan=\"3\">\n")
                .append("                        <table>\n")
                .append("                            <tr>\n")
                .append("                                <td class=\"title\">\n")
                .append("                                    <img src=\"https://w7.pngwing.com/pngs/501/77/png-transparent-brava-hd-logo.png \"").append(" alt=\"Company logo\" style=\"width: 100%; max-width: 100px\" />\n")
                .append("                                </td>\n")
                .append("\n")
                .append("                                <td style=\"text-align: right;\">\n")
                .append("                                        Invoice #: ").append(in.get(0).getCartCode()).append("<br />\n")
                .append("                                        <br />\n")
                .append("                                        Created at: ").append(formattedDate).append("<br />\n")
                .append("                                    </td>\n")
                .append("                                </tr>\n")
                .append("                            </table>\n")
                .append("                        </td>\n")
                .append("                    </tr>\n")
                .append("\n")
                .append("                    <tr class=\"information\">\n")
                .append("                        <td colspan=\"3\">\n")
                .append("                            <table>\n")
                .append("                                <tr>\n")
                .append("                                        <td>\n")
                .append("                                            Recipient: ").append(recipient).append("<br />\n")
                .append("                                            Delivery address: ").append(deliveryAddress).append("<br />\n")
                .append("                                            Contact number: ").append(phone).append("\n")
                .append("                                        </td>\n")
                .append("                                        <td>\n")
                .append("                                            Sender: Brava Shop<br />\n")
                .append("                                            Branch: Group 1, Ha Noi<br />\n");
        if (sta.equalsIgnoreCase("Pending")) {
            htmlContent.append("                                     Invoice Status: ").append(sta).append("\n");
        }
        if (sta.equalsIgnoreCase("Cancel")) {
            htmlContent.append("                                     Invoice Status: ").append(sta).append("\n");
        }
        if (sta.equalsIgnoreCase("Delivery")) {
            htmlContent.append("                                     Invoice Status: ").append(sta).append("\n");
        }
        if (sta.equalsIgnoreCase("Complete")) {
            htmlContent.append("                                     Invoice Status: ").append(sta).append("\n");
        }
        htmlContent
                .append("                                        </td>\n")
                .append("\n")
                .append("                                </tr>\n")
                .append("                            </table>\n")
                .append("                        </td>\n")
                .append("                    </tr>\n")
                .append("                    <tr class=\"heading\">\n")
                .append("                        <td>Item</td>\n")
                .append("                        <td>Unit Price x (Quantity)</td>\n")
                .append("                        <td>Price</td>\n")
                .append("                    </tr>\n");
        for (Invoice invoice : in) {
            htmlContent.append("                        <tr class=\"item\">\n")
                    .append("                            <td style=\"text-align: right;\">").append(invoice.getPro().getName()).append("</td>\n")
                    .append("                            <td>").append(invoice.getPro().getPrice()).append(" x(").append(invoice.getIn_de().getQuantity()).append(")</td>\n")
                    .append("                            <td>").append(invoice.getIn_de().getTotalPrice()).append("VND</td>\n")
                    .append("                        </tr>\n")
                    .append("\n");
        }

        htmlContent
                .append("\n")
                .append("                    <tr class=\"item\">\n")
                .append("                        <td></td>\n")
                .append("                        <td></td>\n")
                .append("                        <td>Subtotal: ").append(in.get(0).getSubtotal_price()).append("VND</td>\n")
                .append("                    </tr>\n")
                .append("                    <tr class=\"item\">\n")
                .append("                        <td></td>\n")
                .append("                        <td></td>\n")
                .append("                        <td>Discount(%): ").append(in.get(0).getDiscount_percent()).append("<td>\n")
                .append("                    </tr>\n")
                .append("                    <tr class=\"item\">\n")
                .append("                        <td></td>\n")
                .append("                        <td></td>\n")
                .append("                        <td><td>\n")
                .append("                    </tr>\n")
                .append("                    <tr class=\"total\">\n")
                .append("                        <td>Total: </td>\n")
                .append("                        <td></td>\n")
                .append("                        <td>").append(in.get(0).getTotal_price()).append("VND</td>\n")
                .append("                    </tr>\n")
                .append("            </table>\n")
                .append("            </div>\n")
                .append("        </body>\n")
                .append("    </html>\n")
                .append("");
        return htmlContent.toString();
    }
}
