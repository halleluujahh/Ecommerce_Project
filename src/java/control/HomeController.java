/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import constant.Constant;
import dao.CommonDao;
import entity.Account;
import entity.Account_Form;
import entity.Feedback;
import entity.Gender;
import entity.Invoice_Form;
import entity.Pagination;
import entity.Product;
import entity.Product_Detail;
import entity.Product_Form;
import helper.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    CommonDao commonDAO = new CommonDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "";
        List<Gender> listG;
        String page = request.getParameter("page") == null ? "default" : request.getParameter("page");
        Pagination pagination = new Pagination();
        Account_Form account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
        if (account != null) {
            int accountID = account.getId();
            List<Product_Form> listProduct = commonDAO.findCartByAccountId(accountID);
            int totalPrice = commonDAO.findTotalPriceInCart(accountID);
            int cartId = commonDAO.findCartId(accountID);
            int countCart = commonDAO.countCartByCartId(cartId);
            session.setAttribute("listProductInCart", listProduct);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("countCart", countCart);
        }
        List<Product_Form> listP = commonDAO.getTop12ProductNewest();

        switch (page) {
            case "update-profile":
                if (account == null) {
                    url = "views/common/login.jsp";
                } else {
                    Account_Form accountProfile = commonDAO.findProfileById(account);
                    listG = commonDAO.findAllGenderWorking();
                    session.setAttribute("accountProfile", accountProfile);
                    session.setAttribute("listG", listG);
                    url = "views/common/updateProfile.jsp";
                }
                break;
            case "view-invoice":
                String pageRaw = request.getParameter("pagination");
                int pageNumber;
                try {
                    pageNumber = Integer.parseInt(pageRaw);
                } catch (Exception e) {
                    pageNumber = 1;
                }
                int totalInvoice = 0;
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                if (account == null) {
                    url = "views/common/login.jsp";
                } else {
                    totalInvoice = commonDAO.countAllInvoiceByAccountId(account);
                    List<Invoice_Form> listIf = commonDAO.findAllInvoiceByAccountId(pageNumber, account);
                    int totalPage = (totalInvoice % 2) == 0
                            ? (totalInvoice / 2)
                            : (totalInvoice / 2) + 1;
                    pagination.setUrlPattern("home?page=view-invoice&");
                    pagination.setPage(pageNumber);
                    pagination.setTotalPage(totalPage);
                    pagination.setTotalRecord(totalInvoice);
                    session.setAttribute("pagination", pagination);
                    session.setAttribute("listIf", listIf);
                    url = "views/common/orderHistory.jsp";
                }
                break;
            case "view-invoice-details":
                pageRaw = request.getParameter("pagination");
                try {
                    pageNumber = Integer.parseInt(pageRaw);
                } catch (Exception e) {
                    pageNumber = 1;
                }
                int totalInvoiceDetail = 0;
                String invoiceID = request.getParameter("invoiceID");
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                if (account == null) {
                    url = "views/common/login.jsp";
                } else {
                    if (invoiceID == null || invoiceID.isEmpty()) {
                        request.setAttribute("errorvid", "Cannot find invoice detail of invoice id " + invoiceID);
                        url = "views/common/orderHistory.jsp";
                    } else {
                        int totalInvoiceDetails = commonDAO.countAllInvoiceDetails(invoiceID);
                        List<Invoice_Form> listIf = commonDAO.getInvoiceDetails(pageNumber, invoiceID);

                        pagination.setUrlPattern("home?page=view-invoice-details&invoiceID=" + invoiceID + "&");
                        int totalPage = (totalInvoiceDetails % 5) == 0
                                ? (totalInvoiceDetails / 5)
                                : (totalInvoiceDetails / 5) + 1;
                        pagination.setPage(pageNumber);
                        pagination.setTotalPage(totalPage);
                        pagination.setTotalRecord(totalInvoiceDetail);
                        List<Feedback> listFeedback = commonDAO.getFeedbackByAccountIdAndProductId(account, listIf);
                        request.setAttribute("listFeedback", listFeedback);
                        session.setAttribute("pagination", pagination);
                        request.setAttribute("listIf", listIf);
                        url = "views/common/orderHistoryDetails.jsp";
                    }
                }
                break;
            default:
                session.setAttribute("listP", listP);
                session.setAttribute("pagination", pagination);
                url = "views/common/homePage.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pagination pagination = new Pagination();
        String url = "";
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "changePassword":
                changePassword(request, response);
                url = "views/common/updateProfile.jsp";
                break;
            case "createPassword":
                createPassword(request, response);
                url = "views/common/updateProfile.jsp";
                break;
            case "updateProfile":
                Account_Form accountProfile = updateProfile(request, response);
                session.setAttribute("accountProfile", accountProfile);
                url = "views/common/updateProfile.jsp";
                break;
            case "cancel-invoice":
                cancel(request, response);
                Account_Form account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                String pageRaw = request.getParameter("pagination");
                int pageNumber;
                try {
                    pageNumber = Integer.parseInt(pageRaw);
                } catch (Exception e) {
                    pageNumber = 1;
                }
                int totalInvoice = 0;
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                if (account == null) {
                    url = "views/common/login.jsp";
                } else {
                    totalInvoice = commonDAO.countAllInvoiceByAccountId(account);
                    List<Invoice_Form> listIf = commonDAO.findAllInvoiceByAccountId(pageNumber, account);
                    int totalPage = (totalInvoice % 2) == 0
                            ? (totalInvoice / 2)
                            : (totalInvoice / 2) + 1;
                    pagination.setUrlPattern("home?page=view-invoice&");
                    pagination.setPage(pageNumber);
                    pagination.setTotalPage(totalPage);
                    pagination.setTotalRecord(totalInvoice);
                    session.setAttribute("pagination", pagination);
                    session.setAttribute("listIf", listIf);
                    url = "views/common/orderHistory.jsp";
                }
                break;
            case "receive-invoice":
                receive(request, response);
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                pageRaw = request.getParameter("pagination");
                try {
                    pageNumber = Integer.parseInt(pageRaw);
                } catch (Exception e) {
                    pageNumber = 1;
                }
                totalInvoice = 0;
                account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                if (account == null) {
                    url = "views/common/login.jsp";
                } else {
                    totalInvoice = commonDAO.countAllInvoiceByAccountId(account);
                    List<Invoice_Form> listIf = commonDAO.findAllInvoiceByAccountId(pageNumber, account);
                    int totalPage = (totalInvoice % 2) == 0
                            ? (totalInvoice / 2)
                            : (totalInvoice / 2) + 1;
                    pagination.setUrlPattern("home?page=view-invoice&");
                    pagination.setPage(pageNumber);
                    pagination.setTotalPage(totalPage);
                    pagination.setTotalRecord(totalInvoice);
                    session.setAttribute("pagination", pagination);
                    session.setAttribute("listIf", listIf);
                    url = "views/common/orderHistory.jsp";
                }
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newPassword");
        String passwordConfirm = request.getParameter("newPassword2");
        if (email == null || email.isEmpty() || password == null || password.isEmpty()
                || newpassword == null || newpassword.isEmpty() || passwordConfirm == null || passwordConfirm.isEmpty()) {
            request.setAttribute("errorupa", "All field must be required");
            return;
        }
        Account account = Account.builder()
                .email(email)
                .password(password)
                .build();
        Account_Form af = commonDAO.checkExistOfAcc(account);
        if (af != null) {
            if (!newpassword.matches(Constant.PASSWORD_REGEX)) {
                request.setAttribute("errorupa", "New password contains at lease 8 character (1 number, 1 uppercase char, 1 special char(no space)");
                return;
            } else {
                if (!newpassword.equals(passwordConfirm)) {
                    request.setAttribute("errorupa", "New password and confirm password must be equal");
                    return;
                }
                if (newpassword.equals(password)) {
                    request.setAttribute("errorups", "Old password and new password must be different");
                    return;
                }
                BCrypt bcryp = new BCrypt();
                String passwordBcryp = bcryp.hashpw(newpassword, bcryp.gensalt());
                int result = commonDAO.changePassword(passwordBcryp, af.getId());
                if (result > 0) {
                    request.setAttribute("msgupa", "Change password successful!");
                }
            }
        } else {
            request.setAttribute("errorupa", "Password not correct!");
        }
    }

    private Account_Form updateProfile(HttpServletRequest request, HttpServletResponse response) {
        String accountIdRaw = request.getParameter("account_id");
        String userName = request.getParameter("userName");
        String phone = request.getParameter("phone");
        String genderIdRaw = request.getParameter("gender");
        String dobRaw = request.getParameter("dob");
        String address = request.getParameter("address");
        if (accountIdRaw == null || accountIdRaw.isEmpty() || userName == null || userName.isEmpty() || phone == null || phone.isEmpty()
                || genderIdRaw == null || genderIdRaw.isEmpty() || dobRaw == null || dobRaw.isEmpty()
                || address == null || address.isEmpty()) {
            request.setAttribute("errorupa", "All field must be required");
            return null;
        }
        int accountID = Integer.parseInt(accountIdRaw);
        int genderID = Integer.parseInt(genderIdRaw);
        Date dob = Date.valueOf(dobRaw);
        Account_Form af = Account_Form.builder()
                .id(accountID)
                .username(userName)
                .phone_number(phone)
                .gender_id(genderID)
                .dob(dob)
                .address(address).build();
        boolean isExistAccountDetails = commonDAO.checkExistOfAccountDetail(af);
        if (isExistAccountDetails) {
            Account_Form newProfileAccount = commonDAO.editAccountDetails(af);
            request.setAttribute("msgupa", "Update profile successfully!");
            return newProfileAccount;
        } else {
            Account_Form newProfileAccount = commonDAO.insertAccountDetails(af);
            request.setAttribute("msgupa", "Update profile successfully!");
            return newProfileAccount;
        }

    }

    private void cancel(HttpServletRequest request, HttpServletResponse response) {
        String invoiceIdRaw = request.getParameter("invoiceId");
        if (invoiceIdRaw == null || invoiceIdRaw.isEmpty()) {
            request.setAttribute("errorcd", "Fail when cancel invoice!");
            return;
        }
        int invoiceId = Integer.parseInt(invoiceIdRaw);
        commonDAO.cancelInvoice(invoiceId);
        List<Product_Detail> pd = commonDAO.getQuantityInvoiceDetail(invoiceId);
        for (Product_Detail product_Detail : pd) {
            int quantityBeforeCancel = commonDAO.getQuantityOfProductDetail(product_Detail);
            int quantityAfterCancel = quantityBeforeCancel + product_Detail.getStock();
            commonDAO.updateQuantityProductDetail(quantityAfterCancel, product_Detail.getId());
        }
        request.setAttribute("msgcd", "Cancel invoice success!");
    }

    private void createPassword(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String newpassword = request.getParameter("newPassword");
        String passwordConfirm = request.getParameter("newPassword2");
        if (email == null || email.isEmpty() || newpassword == null || newpassword.isEmpty() || passwordConfirm == null || passwordConfirm.isEmpty()) {
            request.setAttribute("errorupa", "All field must be required");
            return;
        }
        Account account = Account.builder()
                .email(email)
                .password(newpassword)
                .build();
        Account_Form af = commonDAO.checkExistOfAcc1(account);
        if (af != null) {
            if (!newpassword.matches(Constant.PASSWORD_REGEX)) {
                request.setAttribute("errorupa", "New password contains at lease 8 character (1 number, 1 uppercase char, 1 special char(no space)");
                return;
            } else {
                if (!newpassword.equals(passwordConfirm)) {
                    request.setAttribute("errorupa", "New password and confirm password must be equal");
                    return;
                }
                BCrypt bcryp = new BCrypt();
                String passwordBcryp = bcryp.hashpw(newpassword, bcryp.gensalt());
                int result = commonDAO.changePassword(passwordBcryp, af.getId());
                if (result > 0) {
                    Account accountAfterCreatePassword = commonDAO.getAccountById(af.getId());
                    session.setAttribute(Constant.SESSION_ACCOUNT, accountAfterCreatePassword);
                    request.setAttribute("msgupa", "Change password successful!");
                }
            }
        } else {
            request.setAttribute("errorupa", "Account not exist!");
        }
    }

    private void receive(HttpServletRequest request, HttpServletResponse response) {
        String invoiceIdRaw = request.getParameter("invoiceId");
        if (invoiceIdRaw == null || invoiceIdRaw.isEmpty()) {
            request.setAttribute("errorcd", "Fail when change status to received invoice!");
            return;
        }
        int invoiceId = Integer.parseInt(invoiceIdRaw);
        commonDAO.receiveInvoice(invoiceId);
        request.setAttribute("msgcd", "Change status invoice to received success!");
    }
}
