/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.admin;

import constant.Constant;
import dao.AdminDao;
import entity.Account;
import entity.Account_Form;
import entity.Brand;
import entity.Category;
import entity.Chart;
import entity.ChartStar;
import entity.Color;
import entity.DateDashboard;
import entity.Discount;
import entity.Gender;
import entity.History;
import entity.Pagination;
import entity.Product;
import entity.Role;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "DashboardController", urlPatterns = {"/admin/dashboard"})
public class DashboardController extends HttpServlet {

    AdminDao adminDAO = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Pagination pagination = new Pagination();
        adminDAO = new AdminDao();
        HttpSession session = request.getSession();

        List<Color> listC;
        List<Brand> listB;
        List<Gender> listG;
        List<Category> listCate;
        List<Size> listS;
        List<Discount> listD;
        List<Account_Form> listAf;
        List<Role> listR;
        double percentageSaleToday = 0;
        //dashboard data
        int countAccounts = adminDAO.countAllAccount();
        double countInvoices = adminDAO.countAllInvoice();
        double countInvoiceTodays = adminDAO.countInvoiceTodays();
        if (countInvoiceTodays != 0 && countInvoices != 0) {
            percentageSaleToday = countInvoiceTodays / countInvoices * 100;
        }
        DateDashboard date = adminDAO.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int day = adminDAO.CountDayByStartEnd(start, end);

        int totalProduct = adminDAO.getTotalProduct(end);

        listCate = adminDAO.getTotalCategoryID(end);

        List<Integer> totalProductsList = new ArrayList<>();
        for (int i = 0; i < listCate.size(); i++) {
            Category cate = listCate.get(i);
            int totalProductByCateId = adminDAO.getTotalProduct(cate.getId(), end);
            totalProductsList.add(totalProductByCateId);
        }
        List<String> stringList = new ArrayList<>();
        for (Integer totalProductCate : totalProductsList) {
            stringList.add(String.valueOf(totalProductCate));
        }
        String totalProductsString = String.join(",", stringList);
        request.setAttribute("totalProductsString", totalProductsString);

        List<Category> listCategoryProduct = adminDAO.getAllCategory();

        // set chart revenue
        List<Chart> listChartRevenueArea = adminDAO.getChartRevenueArea(start, day);
        int maxListChartRevenueArea = -1;
        for (Chart o : listChartRevenueArea) {
            if (o.getValue() > maxListChartRevenueArea) {
                maxListChartRevenueArea = o.getValue();
            }
        }
        maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

        // set chart customer
        List<Chart> listChartCustomer = adminDAO.getChartCustomerArea(start, day);
        int maxListChartCustomerArea = -1;
        for (Chart o : listChartCustomer) {
            if (o.getValue() > maxListChartCustomerArea) {
                maxListChartCustomerArea = o.getValue();
            }
        }
        maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;

        // set chart avg rated
        List<ChartStar> listChartAvgStar = adminDAO.getChartAvgStar(start, day);

        request.setAttribute("totalProduct", totalProduct);

        session.setAttribute("countInvoiceTodays", (int)countInvoiceTodays);
        request.setAttribute("listCategoryProduct", listCategoryProduct);

        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        request.setAttribute("listChartCustomer", listChartCustomer);
        request.setAttribute("maxListChartCustomerArea", maxListChartCustomerArea);

        request.setAttribute("listChartAvgStar", listChartAvgStar);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        List<Gender> listGenders = adminDAO.findAllGenderWorking();
        session.setAttribute("listGenders", listGenders);
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        String url = "";
        switch (page) {
            case "view-details":
                listC = adminDAO.findAllColor();
                listB = adminDAO.findAllBrand();
                listCate = adminDAO.findAllCategory();
                listG = adminDAO.findAllGender();
                listS = adminDAO.findAllSize();
                session.setAttribute("listC", listC);
                session.setAttribute("listB", listB);
                session.setAttribute("listCate", listCate);
                session.setAttribute("listG", listG);
                session.setAttribute("listS", listS);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "manage-discount":
                listD = adminDAO.findAllDiscount();
                session.setAttribute("listD", listD);
                url = "../views/admin/manageDiscount.jsp";
                break;
            case "manageUser":
                String status = request.getParameter("status");
                String roleId = request.getParameter("role");
                String genderId = request.getParameter("gender");
                String keyword = request.getParameter("keyword");
                listR = adminDAO.findRoleForSellerAndCustomer();
                listG = adminDAO.findAllGender();
                listAf = pagination(request, pagination);
                session.setAttribute("status", status);
                session.setAttribute("roleId", roleId);
                session.setAttribute("genderId", genderId);
                session.setAttribute("listR", listR);
                session.setAttribute("listG", listG);
                session.setAttribute("listAf", listAf);
                session.setAttribute("pagination", pagination);
                url = "../views/admin/manageUser.jsp";
                break;
            case "view-account-details":
                String accountIdRaw = request.getParameter("accountID");
                if (accountIdRaw == null || accountIdRaw.isEmpty()) {
                    request.setAttribute("errorua", "Can't find account!");
                } else {
                    int accountID = Integer.parseInt(accountIdRaw);
                    Account_Form af = adminDAO.getAccountByID(accountID);
                    List<History> listH = paginationForHistory(request, pagination);
                    session.setAttribute("listH", listH);
                    session.setAttribute("pagination", pagination);
                    session.setAttribute("Account_Form", af);
                }
                url = "../views/admin/accountDetail.jsp";
                break;
            default:
                session.setAttribute("percentageSaleToday", Constant.FORMAT_NUMBER(percentageSaleToday));
                session.setAttribute("countAccount", countAccounts);
                session.setAttribute("countInvoice", countInvoices);
                url = "../views/admin/dashboard.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Pagination pagination = new Pagination();
        List<Account_Form> listAf;
        HttpSession session = request.getSession();
        List<Color> listC;
        List<Brand> listB;
        List<Category> listCate;
        List<Gender> listG;
        List<Size> listS;
        List<Discount> listD;
        List<Role> listR;
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "add-color":
                addColor(request, response);
                listC = adminDAO.findAllColor();
                session.setAttribute("listC", listC);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "change-status-color":
                changeStatusColor(request, response);
                listC = adminDAO.findAllColor();
                session.setAttribute("listC", listC);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "update-color":
                updateColor(request, response);
                listC = adminDAO.findAllColor();
                session.setAttribute("listC", listC);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "add-brand":
                addBrand(request, response);
                listB = adminDAO.findAllBrand();
                session.setAttribute("listB", listB);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "change-status-brand":
                changeStatusBrand(request, response);
                listB = adminDAO.findAllBrand();
                session.setAttribute("listB", listB);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "update-brand":
                updateBrand(request, response);
                listB = adminDAO.findAllBrand();
                session.setAttribute("listB", listB);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "add-category":
                addCategory(request, response);
                listCate = adminDAO.findAllCategory();
                session.setAttribute("listCate", listCate);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "change-status-category":
                changeStatusCategory(request, response);
                listCate = adminDAO.findAllCategory();
                session.setAttribute("listCate", listCate);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "update-category":
                updateCategory(request, response);
                listCate = adminDAO.findAllCategory();
                session.setAttribute("listCate", listCate);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "add-gender":
                addGender(request, response);
                listG = adminDAO.findAllGender();
                session.setAttribute("listG", listG);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "change-status-gender":
                changeStatusGender(request, response);
                listG = adminDAO.findAllGender();
                session.setAttribute("listG", listG);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "update-gender":
                updateGender(request, response);
                listG = adminDAO.findAllGender();
                session.setAttribute("listG", listG);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "add-size":
                addSize(request, response);
                listS = adminDAO.findAllSize();
                session.setAttribute("listS", listS);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "change-status-size":
                changeStatusSize(request, response);
                listS = adminDAO.findAllSize();
                session.setAttribute("listS", listS);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "update-size":
                updateSize(request, response);
                listS = adminDAO.findAllSize();
                session.setAttribute("listS", listS);
                url = "../views/admin/productCharacteristic.jsp";
                break;
            case "add-discount":
                addDiscount(request, response);
                listD = adminDAO.findAllDiscount();
                session.setAttribute("listD", listD);
                url = "../views/admin/manageDiscount.jsp";
                break;
            case "update-discount":
                updateDiscount(request, response);
                listD = adminDAO.findAllDiscount();
                session.setAttribute("listD", listD);
                url = "../views/admin/manageDiscount.jsp";
                break;
            case "update-status-account":
                updateStatusAccount(request, response);
                listAf = pagination(request, pagination);
                session.setAttribute("listAf", listAf);
                session.setAttribute("pagination", pagination);
                url = "../views/admin/manageUser.jsp";
                break;
            case "update-account-details":
                String accountIdRaw = request.getParameter("accountID");
                if (accountIdRaw == null && accountIdRaw.isEmpty()) {
                    request.setAttribute("errorua", "Can't find account!");
                } else {
                    listG = adminDAO.findAllGender();
                    listR = adminDAO.findRoleForSellerAndCustomer();
                    updateAccountDetails(request, response);
                    int accountID = Integer.parseInt(accountIdRaw);
                    Account_Form af = adminDAO.getAccountByID(accountID);
                    List<History> listH = paginationForHistory(request, pagination);
                    session.setAttribute("listH", listH);
                    session.setAttribute("pagination", pagination);
                    session.setAttribute("Account_Form", af);
                    session.setAttribute("listG", listG);
                    session.setAttribute("listR", listR);
                }
                url = "../views/admin/accountDetail.jsp";
                break;
            case "add-seller":
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("password1");
                String gender = request.getParameter("gender");
                if (gender == null || gender.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()
                        || confirmPassword == null || confirmPassword.isEmpty()) {
                    request.setAttribute("erroras", "Fail when create new seller account!");
                } else {
                    if (!password.equals(confirmPassword)) {
                        request.setAttribute("erroras", "Password and confirm password must be equual!");
                    } else {
                        Account isExistAccount = adminDAO.findAccountByEmail(email);
                        if (isExistAccount == null) {
                            adminDAO.addNewSeller(email, password);
                            int accountID = adminDAO.getAccountIdSellerByEmail(email);
                            adminDAO.insertAccountDetail(accountID, gender);
                            request.setAttribute("msgas", "Add new seller successfully!");
                        } else {
                            request.setAttribute("erroras", "Account exist already!");
                        }
                    }
                }
                listAf = pagination(request, pagination);
                session.setAttribute("listAf", listAf);
                session.setAttribute("pagination", pagination);
                url = "../views/admin/manageUser.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void addColor(HttpServletRequest request, HttpServletResponse response) {
        adminDAO = new AdminDao();
        String color = request.getParameter("color");

        if (color == null || color.isEmpty() || !color.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorcoa", "Create color error!");
            return;
        }

        boolean colorExist = adminDAO.findColorExist(color);

        if (!colorExist) {
            adminDAO.addColor(color);
            request.setAttribute("msgcoa", "Create new color success");
        } else {
            request.setAttribute("errorcoa", "This color is exist already, please create other color!");
        }
    }

    private void changeStatusColor(HttpServletRequest request, HttpServletResponse response) {
        String idToDelete = request.getParameter("colorId");
        String status = request.getParameter("status");
        if (idToDelete == null || idToDelete.isEmpty() || status.isEmpty() || status == null) {
            request.setAttribute("errorcod", "Change status color error!");
            return;
        }

        int id = Integer.parseInt(idToDelete);

        adminDAO.changeStatusColorById(id, status);
        request.setAttribute("msgcod", "Change status color successfully!");
    }

    private void updateColor(HttpServletRequest request, HttpServletResponse response) {
        String idToEdit = request.getParameter("colorIdToUpdate");
        String color = request.getParameter("colorToUpdate");
        String oldColorName = request.getParameter("oldNameColor");

        if (idToEdit == null || idToEdit.isEmpty() || color == null || color.isEmpty() || oldColorName == null || oldColorName.isEmpty() || !idToEdit.matches("^[0-9]+$") || !color.matches("^[A-Za-z\\s]+$") || !oldColorName.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorcoe", "Edit color error!");
            return;
        }

        int id = Integer.parseInt(idToEdit);

        Color c = Color.builder()
                .id(id)
                .color(color)
                .build();
        boolean colorExist = adminDAO.findColorExistByIdAndColor(id, color);
        if (!colorExist) {
            adminDAO.editColor(c, oldColorName);
            request.setAttribute("msgcoe", "Edit color successfully !!");
        } else {
            request.setAttribute("errorcoe", "This color exist already, please edit different from remaining color !!");
        }

    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) {
        String category = request.getParameter("cate");

        if (category == null || category.isEmpty() || !category.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorca", "Create category error!");
            return;
        }

        boolean cateExist = adminDAO.findCateExist(category);

        if (!cateExist) {
            adminDAO.addCategory(category);
            request.setAttribute("msgca", "Create new category success");
        } else {
            request.setAttribute("errorca", "This category is exist already, please create other category!");
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) {
        String idToEdit = request.getParameter("categoryIdToUpdate");
        String cate = request.getParameter("categoryToUpdate");
        String oldCategoryName = request.getParameter("oldNameCategory");

        if (idToEdit == null || idToEdit.isEmpty() || cate == null || cate.isEmpty() || oldCategoryName == null || oldCategoryName.isEmpty() || !idToEdit.matches("^[0-9]+$") || !cate.matches("^[A-Za-z\\s]+$") || !oldCategoryName.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorce", "Edit brand error!");
            return;
        }

        int id = Integer.parseInt(idToEdit);
        Category c = Category.builder()
                .id(id)
                .category(cate)
                .build();
        boolean cateExist = adminDAO.findCateExistByIdAndCate(id, cate);

        if (!cateExist) {
            adminDAO.editCate(c, oldCategoryName);
            request.setAttribute("msgce", "Edit category successfully !!");
        } else {
            request.setAttribute("errorce", "This category exist already, please edit different from remaining category !!");
        }
    }

    private void changeStatusCategory(HttpServletRequest request, HttpServletResponse response) {
        String idToDelete = request.getParameter("categoryId");
        String status = request.getParameter("status");
        if (idToDelete == null || idToDelete.isEmpty() || status == null || status.isEmpty()) {
            request.setAttribute("errorcd", "Change status category error!");
            return;
        }
        int id = Integer.parseInt(idToDelete);
        adminDAO.changeStatusCateById(id, status);
        request.setAttribute("msgcd", "Change status category successfully!");
    }

    private void addBrand(HttpServletRequest request, HttpServletResponse response) {
        String brand = request.getParameter("brand");

        if (brand == null || brand.isEmpty() || !brand.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorba", "Create brand error!");
            return;
        }

        boolean cateExist = adminDAO.findBrandExist(brand);

        if (!cateExist) {
            adminDAO.addBrand(brand);
            request.setAttribute("msgba", "Create new brand success");
        } else {
            request.setAttribute("errorba", "This brand is exist already, please create other brand!");
        }
    }

    private void updateBrand(HttpServletRequest request, HttpServletResponse response) {
        String idToEdit = request.getParameter("brandIdToUpdate");
        String brand = request.getParameter("brandToUpdate");
        String oldBrandName = request.getParameter("oldBrandName");

        if (idToEdit == null || idToEdit.isEmpty() || brand == null || brand.isEmpty() || oldBrandName == null || oldBrandName.isEmpty() || !idToEdit.matches("^[0-9]+$") || !brand.matches("^[A-Za-z\\s]+$") || !oldBrandName.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorbe", "Edit brand error!");
            return;
        }

        int id = Integer.parseInt(idToEdit);
        Brand b = Brand.builder()
                .id(id)
                .brand(brand)
                .build();
        boolean brandExist = adminDAO.findBrandExistByBrandAndId(id, brand);

        if (!brandExist) {
            adminDAO.editBrand(b, oldBrandName);
            request.setAttribute("msgbe", "Edit brand successfully !!");
        } else {
            request.setAttribute("errorbe", "This brand exist already, please edit different from remaining brand !!");
        }
    }

    private void changeStatusBrand(HttpServletRequest request, HttpServletResponse response) {
        String idToDelete = request.getParameter("brandId");
        String status = request.getParameter("status");
        if (idToDelete == null || idToDelete.isEmpty() || status == null || status.isEmpty()) {
            request.setAttribute("errorbd", "Change status brand error!");
            return;
        }

        int id = Integer.parseInt(idToDelete);

        adminDAO.changeStatusBrandById(id, status);
        request.setAttribute("msgbd", "Change status brand successfully!");
    }

    private void addGender(HttpServletRequest request, HttpServletResponse response) {
        String gender = request.getParameter("gender");

        if (gender == null || gender.isEmpty() || !gender.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorga", "Create gender error!");
            return;
        }

        boolean genderExist = adminDAO.findGenderExist(gender);

        if (!genderExist) {
            adminDAO.addGender(gender);
            request.setAttribute("msgga", "Create new gender success");
        } else {
            request.setAttribute("errorga", "This gender is exist already, please create other gender!");
        }
    }

    private void changeStatusGender(HttpServletRequest request, HttpServletResponse response) {
        String idToDelete = request.getParameter("genderId");
        String status = request.getParameter("status2");
        if (idToDelete == null || idToDelete.isEmpty() || status.isEmpty() || status == null) {
            request.setAttribute("errorgd", "Change status gender error!");
            return;
        }

        int id = Integer.parseInt(idToDelete);

        adminDAO.changeStatusGenderById(id, status);
        request.setAttribute("msggd", "Change status gender successfully!");
    }

    private void updateGender(HttpServletRequest request, HttpServletResponse response) {
        String idToUpdate = request.getParameter("genderIdToUpdate");
        String gender = request.getParameter("genderToUpdate");
        String oldGenderName = request.getParameter("oldGenderName");

        if (idToUpdate == null || idToUpdate.isEmpty() || gender == null || gender.isEmpty() || oldGenderName == null || oldGenderName.isEmpty() || !idToUpdate.matches("^[0-9]+$") || !gender.matches("^[A-Za-z\\s]+$") || !oldGenderName.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorge", "Edit gender error!");
            return;
        }

        int id = Integer.parseInt(idToUpdate);

        Gender g = Gender.builder()
                .id(id)
                .gender(gender)
                .build();
        boolean genderExist = adminDAO.findGenderExistByIdAndGender(id, gender);

        if (!genderExist) {
            adminDAO.editGender(g, oldGenderName);
            request.setAttribute("msgge", "Edit gender successfully !!");
        } else {
            request.setAttribute("errorge", "This gender exist already, please edit different from remaining gender !!");
        }
    }

    private void addSize(HttpServletRequest request, HttpServletResponse response) {
        String size = request.getParameter("size");

        if (size == null || size.isEmpty() || !size.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorsa", "Create size error!");
            return;
        }

        boolean sizeExist = adminDAO.findSizeExist(size);

        if (!sizeExist) {
            adminDAO.addSize(size);
            request.setAttribute("msgsa", "Create new size success");
        } else {
            request.setAttribute("errorsa", "This size is exist already, please create other gender!");
        }
    }

    private void updateSize(HttpServletRequest request, HttpServletResponse response) {
        String idToEdit = request.getParameter("sizeIdToUpdate");
        String size = request.getParameter("sizeToUpdate");
        String oldSizeName = request.getParameter("oldSizeName");

        if (idToEdit == null || idToEdit.isEmpty() || size == null || size.isEmpty() || oldSizeName == null || oldSizeName.isEmpty() || !idToEdit.matches("^[0-9]+$") || !size.matches("^[A-Za-z\\s]+$") || !oldSizeName.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("errorse", "Edit size error!");
            return;
        }
        int id = Integer.parseInt(idToEdit);
        Size s = Size.builder()
                .id(id)
                .size(size)
                .build();
        boolean genderExist = adminDAO.findSizeExistByIdAndSize(id, size);

        if (!genderExist) {
            adminDAO.editSize(s, oldSizeName);
            request.setAttribute("msgse", "Edit size successfully !!");
        } else {
            request.setAttribute("errorse", "This size exist already, please edit different from remaining gender !!");
        }
    }

    private void changeStatusSize(HttpServletRequest request, HttpServletResponse response) {
        String idToDelete = request.getParameter("sizeId");
        String status = request.getParameter("status");
        if (idToDelete == null || idToDelete.isEmpty() || status == null || status.isEmpty()) {
            request.setAttribute("errorsd", "Change status size error!");
            return;
        }
        int id = Integer.parseInt(idToDelete);
        adminDAO.changeStatusSizeById(id, status);
        request.setAttribute("msgsd", "Change status size successfully!");
    }

    private void addDiscount(HttpServletRequest request, HttpServletResponse response) {
        String discountRaw = request.getParameter("discount");
        Date currentTimestamp = new Date(System.currentTimeMillis());
        String statusRaw = request.getParameter("status");
        if (discountRaw == null || discountRaw.isEmpty() || statusRaw == null || statusRaw.isEmpty()) {
            request.setAttribute("errorad", "Create discount error!");
            return;
        }
        int discountData = Integer.parseInt(discountRaw);
        int status = Integer.parseInt(statusRaw);
        boolean discountExist = adminDAO.findDiscountExist(discountData);
        Discount discount = Discount.builder()
                .create_at(currentTimestamp)
                .discount_percent(discountData)
                .status(status)
                .build();
        if (!discountExist) {
            adminDAO.addDiscount(discount);
            request.setAttribute("msgad", "Create new discount success!");
        } else {
            request.setAttribute("errorad", "This discount is exist already, please create other discount!");
        }
    }

    private void updateDiscount(HttpServletRequest request, HttpServletResponse response) {
        String idToEdit = request.getParameter("discountIdToUpdate");
        String oldDiscountRaw = request.getParameter("oldDiscount");
        String discountPercentRaw = request.getParameter("discountPercentToUpdate");
        String statusRaw = request.getParameter("status");

        if (idToEdit == null || idToEdit.isEmpty() || discountPercentRaw == null || discountPercentRaw.isEmpty() || statusRaw == null || statusRaw.isEmpty() || oldDiscountRaw == null || oldDiscountRaw.isEmpty() || !discountPercentRaw.matches("^[0-9]+$") || !oldDiscountRaw.matches("^[0-9]+$") || !statusRaw.equalsIgnoreCase("Inactive") || !statusRaw.equalsIgnoreCase("Active")) {
            request.setAttribute("errored", "Edit discount error!");
            return;
        }
        int id = Integer.parseInt(idToEdit);
        int discountPercent = Integer.parseInt(discountPercentRaw);
        int oldDiscount = Integer.parseInt(oldDiscountRaw);
        int status = Integer.parseInt(statusRaw);
        Discount discount = Discount.builder()
                .id(id)
                .discount_percent(discountPercent)
                .status(status)
                .build();
        boolean discountExist = adminDAO.findDiscountExistByDiscount(discountPercent);

        if (!discountExist) {
            adminDAO.editDiscount(discount, oldDiscount);
            request.setAttribute("msged", "Edit discount successfully !!");
        } else {
            request.setAttribute("errored", "This discount exist already, please edit different from remaining gender !!");
        }
    }

    private List<Account_Form> pagination(HttpServletRequest request, Pagination pagination) {
        String pageRaw = request.getParameter("pagination");
        int page, pageSize = 0;
        String sorted;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        int totalAccount = 0;
        List<Account_Form> listAf = null;
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "search-users":
                String status = request.getParameter("status");
                String roleId = request.getParameter("role");
                String genderId = request.getParameter("gender");
                String keyword = request.getParameter("keyword");
                String pageSizeRaw = request.getParameter("pageSize");
                try {
                    pageSize = Integer.parseInt(pageSizeRaw);
                } catch (NumberFormatException e) {
                }
                totalAccount = adminDAO.findTotalAccountBySearch(keyword, status, roleId, genderId);
                listAf = adminDAO.findPageBySearch(page, keyword, status, roleId, genderId, pageSize);
                StringBuilder url = new StringBuilder("dashboard?page=manageUser&action=search-users");
                if (keyword != null && !keyword.isEmpty()) {
                    url.append("&keyword=").append(keyword);
                }
                if (status != null && !status.isEmpty()) {
                    url.append("&status=").append(status);
                }
                if (roleId != null && !roleId.isEmpty()) {
                    url.append("&role=").append(roleId);
                }
                if (genderId != null && !genderId.isEmpty()) {
                    url.append("&gender=").append(genderId);
                }
                if (pageSize != 0) {
                    url.append("&pageSize=").append(pageSize);
                }
                url.append("&");
                pagination.setUrlPattern(url.toString());
                break;
            default:
                totalAccount = adminDAO.findTotalAccount();
                listAf = adminDAO.findAccountByPage(page);
                pagination.setUrlPattern("dashboard?page=manageUser&");
        }
        int totalPage = (totalAccount % Constant.RECORD_PER_PAGE) == 0
                ? (totalAccount / Constant.RECORD_PER_PAGE)
                : (totalAccount / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalAccount);
        return listAf;
    }

    private void updateStatusAccount(HttpServletRequest request, HttpServletResponse response) {
        String idAccountRaw = request.getParameter("accountID");
        String statusAccountRaw = request.getParameter("status");
        Date currentTimestamp = new Date(System.currentTimeMillis());

        if (idAccountRaw == null || idAccountRaw.isEmpty() || statusAccountRaw == null || statusAccountRaw.isEmpty()) {
            request.setAttribute("errusp", "Update status of product error !!");
        } else {
            int status = Integer.parseInt(statusAccountRaw);
            int idAccount = Integer.parseInt(idAccountRaw);
            if (status == 1) {
                adminDAO.updateAccountStatus(idAccount, 0, currentTimestamp);
                adminDAO.updateAccountDetailsStatus(idAccount, 0, currentTimestamp);
                request.setAttribute("msgusp", "Update status of account successfully !!");
            } else {
                adminDAO.updateAccountStatus(idAccount, 1, currentTimestamp);
                adminDAO.updateAccountDetailsStatus(idAccount, 1, currentTimestamp);
                request.setAttribute("msgusp", "Update status of account successfully !!");
            }
        }
    }

    private void updateAccountDetails(HttpServletRequest request, HttpServletResponse response) {
        String oldEmail = request.getParameter("oldEmail");
        String accountIdRaw = request.getParameter("accountID");
        String emailRaw = request.getParameter("email");
        String usernameRaw = request.getParameter("username");
        String phonenumberRaw = request.getParameter("phone_number");
        String dobRaw = request.getParameter("dob");
        String addressRaw = request.getParameter("address");
        String genderRaw = request.getParameter("gender");
        String roleRaw = request.getParameter("role");
        Date currentTimestamp = new Date(System.currentTimeMillis());
        if (addressRaw == null || addressRaw.isEmpty() || emailRaw == null || emailRaw.isEmpty() || usernameRaw == null || usernameRaw.isEmpty() || phonenumberRaw == null || phonenumberRaw.isEmpty() || roleRaw == null || roleRaw.isEmpty() || genderRaw == null || genderRaw.isEmpty()) {
            request.setAttribute("Required", "All field must be required");
            return;
        }
        if (!emailRaw.matches(Constant.EMAIL_REGEX)) {
            request.setAttribute("emailRegex", "Email not valid!");
            return;
        }
        int role = Integer.parseInt(roleRaw);
        int gender = Integer.parseInt(genderRaw);
        int accountID = Integer.parseInt(accountIdRaw);
        Date dob = Date.valueOf(dobRaw);
        Account_Form af = Account_Form.builder()
                .id(accountID)
                .email(emailRaw)
                .username(usernameRaw)
                .phone_number(phonenumberRaw)
                .dob(dob)
                .address(addressRaw)
                .gender_id(gender)
                .role_Id(role).build();

        boolean isAccountExist = adminDAO.checkExistOfAccount(emailRaw);
        if (!isAccountExist) {
            adminDAO.updateAccount(af);
            adminDAO.updateAccountRole(af);
            adminDAO.updateAccountDetail(af);
            adminDAO.insertHistoryUpdate(af, currentTimestamp);
        } else {
            adminDAO.updateAccountRole(af);
            adminDAO.updateAccountDetail(af);
            adminDAO.insertHistoryUpdateIfEmailNotExist(af, currentTimestamp, oldEmail);
        }
        request.setAttribute("msgua", "Update account successfull!");
    }

    private List<History> paginationForHistory(HttpServletRequest request, Pagination pagination) {
        String pageRaw = request.getParameter("pagination");
        int page, pageSize = 0;
        String sorted;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        int totalHistory = 0;
        List<History> listH = null;
        String accountIdRaw = request.getParameter("accountID");
        totalHistory = adminDAO.findTotalHistory(accountIdRaw);
        listH = adminDAO.findHistoryByPage(page, accountIdRaw);

        pagination.setUrlPattern("dashboard?page=view-account-details&accountID=" + accountIdRaw + "&");
        int totalPage = (totalHistory % Constant.RECORD_PER_PAGE) == 0
                ? (totalHistory / Constant.RECORD_PER_PAGE)
                : (totalHistory / Constant.RECORD_PER_PAGE) + 1;
        pagination.setPage(page);
        pagination.setTotalPage(totalPage);
        pagination.setTotalRecord(totalHistory);
        return listH;
    }

}
