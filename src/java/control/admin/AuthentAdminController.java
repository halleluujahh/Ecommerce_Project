/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.admin;

import constant.Constant;
import dao.AdminDao;
import entity.Account;
import entity.Account_Form;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AuthentAdminController", urlPatterns = {"/admin/authen"})
public class AuthentAdminController extends HttpServlet {

    AdminDao adminDAO = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "login":
                url = "../views/admin/login.jsp";
                break;
            case "logout":
                logout(request, response);
                url = "../views/admin/login.jsp";
                break;
            default:
                url = "../views/admin/login.jsp";
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
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = "";
        switch (action) {
            case "login":
                login(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        adminDAO = new AdminDao();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account_Form account = Account_Form.builder()
                .email(username)
                .password(password)
                .build();
        account = adminDAO.checkExistOfAdmin(account);

        if (account == null) {
            request.setAttribute("username", username);
            request.setAttribute("err", "Nhap sai ten dang nhap hoac mat khau");
            request.getRequestDispatcher("../views/admin/login.jsp").forward(request, response);
        } else {
            if (account.getRole_Id() == Constant.ROLE_ADMIN) {
                HttpSession session = request.getSession();
                session.setAttribute(Constant.SESSION_ACCOUNT, account);
                response.sendRedirect("../admin/dashboard");
            } else {
                request.setAttribute("username", username);
                request.setAttribute("err", "You don't have permission!");
                request.getRequestDispatcher("../views/admin/login.jsp").forward(request, response);
            }
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constant.SESSION_ACCOUNT);
    }
}
