/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.seller;

import constant.Constant;
import dao.SellerDao;
import entity.Account;
import entity.Account_Form;
import entity.Chart;
import entity.DateDashboard;
import entity.Discount;
import entity.Feedback;
import entity.Feedback_Form;
import entity.Gender;
import helper.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DecimalFormat;
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
@WebServlet(name = "SellerDashboardController", urlPatterns = {"/seller/dashboard"})
public class SellerDashboardController extends HttpServlet {

    SellerDao sellerDAO = new SellerDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "";
        List<Feedback_Form> listF;
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        //dashboard data
        double percentageSaleToday = 0;
        int countAccounts = sellerDAO.countAllAccount();
        double countInvoices = sellerDAO.countAllInvoice();
        double countInvoiceTodays = sellerDAO.countInvoiceTodays();
        if (countInvoiceTodays != 0 && countInvoices != 0) {
            percentageSaleToday = countInvoiceTodays / countInvoices * 100;
        }

        DateDashboard date = sellerDAO.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int day = sellerDAO.CountDayByStartEnd(start, end);

        // set parameter for order
        int totalOrder = sellerDAO.getTotalOrder(start, end);
        int totalOrderPending = sellerDAO.getTotalOrderPending(start, end);
        int totalOrderDelivery = sellerDAO.getTotalOrderDelivery(start, end);
        int totalOrderSuccesful = sellerDAO.getTotalOrderSuccesful(start, end);
        int totalOrderCanceled = sellerDAO.getTotalOrderCanceled(start, end);

        // set chart for order
        List<Chart> listChartOrderBar = sellerDAO.getChartOrderBar(start, day);
        int maxListChartOderBar = -1;
        for (Chart o : listChartOrderBar) {
            if (o.getValue() > maxListChartOderBar) {
                maxListChartOderBar = o.getValue();
            }
        }

        // set chart revenue
        List<Chart> listChartRevenueBar = sellerDAO.getChartRevenueBar(start, day);
        List<Chart> listChartRevenueArea = sellerDAO.getChartRevenueArea(start, day);
        int maxListChartRevenueBar = -1;
        for (Chart o : listChartRevenueBar) {
            if (o.getValue() > maxListChartRevenueBar) {
                maxListChartRevenueBar = o.getValue();
            }
        }

        maxListChartRevenueBar = (maxListChartRevenueBar / 1000000 + 1) * 1000000;
        int maxListChartRevenueArea = -1;
        for (Chart o : listChartRevenueArea) {
            if (o.getValue() > maxListChartRevenueArea) {
                maxListChartRevenueArea = o.getValue();
            }
        }
        maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

        maxListChartOderBar = (maxListChartOderBar / 10 + 1) * 10;

        // set parameter blog chart request to jsp
        session.setAttribute("countInvoiceTodays", (int) countInvoiceTodays);
        session.setAttribute("countAccounts", countAccounts);
        session.setAttribute("countInvoices", countInvoices);
        session.setAttribute("percentageSaleToday", Constant.FORMAT_NUMBER(percentageSaleToday));
        session.setAttribute("listChartRevenueBar", listChartRevenueBar);
        session.setAttribute("listChartRevenueArea", listChartRevenueArea);
        session.setAttribute("maxListChartRevenueBar", maxListChartRevenueBar);
        session.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        session.setAttribute("listChartOrderBar", listChartOrderBar);
        session.setAttribute("maxListChartOderBar", maxListChartOderBar);
        session.setAttribute("start", start);
        session.setAttribute("end", end);
        session.setAttribute("totalOrder", totalOrder);
        session.setAttribute("totalPending", totalOrderPending);
        session.setAttribute("totalDelivery", totalOrderDelivery);
        session.setAttribute("totalSucces", totalOrderSuccesful);
        session.setAttribute("totalCancel", totalOrderCanceled);

        switch (page) {
            case "view-profile":
                Account_Form account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                List<Gender> listG = sellerDAO.findAllGender();
                Account_Form af = sellerDAO.getProfileByAccountID(account.getId());
                session.setAttribute("af", af);
                session.setAttribute("listG", listG);
                url = "../views/seller/viewProfile.jsp";
                break;
            case "view-feedback":
                String dateFromRaw = request.getParameter("from");
                String dateToRaw = request.getParameter("to");
                if (dateFromRaw == null || dateFromRaw.isEmpty() || dateToRaw == null || dateToRaw.isEmpty()) {
                    listF = sellerDAO.findAllFeedback();
                    session.setAttribute("listF", listF);
                    url = "../views/seller/feedBack.jsp";
                } else {
                    Date dateFrom = Date.valueOf(dateFromRaw);
                    Date dateTo = Date.valueOf(dateToRaw);
                    listF = sellerDAO.findFeedbackByDate(dateFrom, dateTo);
                    session.setAttribute("listF", listF);
                    url = "../views/seller/feedBack.jsp";
                }
                break;
            case "setting-discounts":
                List<Discount> listD = sellerDAO.findAllDiscountWorking();
                session.setAttribute("listD", listD);
                url = "../views/seller/manageDiscount.jsp";
                break;
            default:
                url = "../views/seller/sellerDashboard.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Feedback_Form> listF;
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "update-profile":
                String username = request.getParameter("username");
                String phoneNumber = request.getParameter("phone_number");
                String dobRaw = request.getParameter("dob");
                String genderIdRaw = request.getParameter("gender");
                String address = request.getParameter("address");
                if (username.isEmpty() || username == null || phoneNumber.isEmpty() || phoneNumber == null
                        || dobRaw.isEmpty() || dobRaw == null || genderIdRaw.isEmpty() || genderIdRaw == null || address.isEmpty() || address == null) {
                    request.setAttribute("errorup", "Fail when update profile!");
                } else {
                    int genderID = Integer.parseInt(genderIdRaw);
                    Date dob = Date.valueOf(dobRaw);
                    Account_Form afToUpdate = Account_Form.builder()
                            .username(username)
                            .phone_number(phoneNumber)
                            .dob(dob)
                            .gender_id(genderID)
                            .address(address)
                            .build();
                    sellerDAO.updateProfile(afToUpdate);
                    request.setAttribute("msgup", "Update profile successfully!");
                }
                Account_Form account = (Account_Form) session.getAttribute(Constant.SESSION_ACCOUNT);
                Account_Form af = sellerDAO.getProfileByAccountID(account.getId());
                session.setAttribute("af", af);
                url = "../views/seller/viewProfile.jsp";
                break;
            case "delete-feedback":
                String idFeedback = request.getParameter("selectedFeedbackIds");
                if (idFeedback == null || idFeedback.isEmpty()) {
                    request.setAttribute("errordf", "Fail when delete feedback!");
                } else {
                    sellerDAO.deleteFeedbackById(idFeedback);
                    request.setAttribute("msgdf", "Delete feedback successful!");
                    listF = sellerDAO.findAllFeedback();
                    session.setAttribute("listF", listF);
                }
                url = "../views/seller/feedBack.jsp";
                break;
            case "change-password":
                changePassword(request, response);
                url = "../views/seller/viewProfile.jsp";
                break;
            case "update-quantity-discount":
                updateQuantityDiscount(request, response);
                List<Discount> listD = sellerDAO.findAllDiscountWorking();
                session.setAttribute("listD", listD);
                url = "../views/seller/manageDiscount.jsp";
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
        Account_Form af = sellerDAO.checkExistOfAcc(account);
        if (af != null) {
            if (!newpassword.matches(Constant.PASSWORD_REGEX)) {
                request.setAttribute("errorups", "New password contains at lease 8 character (1 number, 1 uppercase char, 1 special char(no space)");
                return;
            } else {
                if (!newpassword.equals(passwordConfirm)) {
                    request.setAttribute("errorups", "New password and confirm password must be equal");
                    return;
                }
                if (newpassword.equals(password)) {
                    request.setAttribute("errorups", "Old password and new password must be different");
                    return;
                }
                BCrypt bcryp = new BCrypt();
                String passwordBcryp = bcryp.hashpw(newpassword, bcryp.gensalt());
                int result = sellerDAO.changePassword(passwordBcryp, af.getId());
                if (result > 0) {
                    request.setAttribute("msgups", "Change password successful!");
                }
            }
        } else {
            request.setAttribute("errorups", "Password not correct!");
        }
    }

    private void updateQuantityDiscount(HttpServletRequest request, HttpServletResponse response) {
        String quantityRaw = request.getParameter("quantity");
        String discountIdRaw = request.getParameter("discountID");
        if (quantityRaw == null || quantityRaw.isEmpty() || discountIdRaw == null || discountIdRaw.isEmpty()) {
            request.setAttribute("erruqdiscount", "Fail when update quantity discount!");
            return;
        }
        int quantity = Integer.parseInt(quantityRaw);
        int discountID = Integer.parseInt(discountIdRaw);
        int quantityBeforeUpdate = sellerDAO.getQuantityBeforeUpdate(discountID);
        int quantityAfterUpdate = quantity + quantityBeforeUpdate;
        int rowAffected = sellerDAO.updateQuantityDiscount(quantityAfterUpdate, discountID);
        if (rowAffected != 0) {
            request.setAttribute("msguqdiscount", "Update quantity of discount success!");
        } else {
            request.setAttribute("erruqdiscount", "Fail when update quantity discount!");
        }
    }
}
