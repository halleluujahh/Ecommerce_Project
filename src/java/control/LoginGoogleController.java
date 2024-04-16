/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import constant.Constant;
import dao.CommonDao;
import entity.Account;
import entity.Account_Form;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/login-google"})
public class LoginGoogleController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleController() {
        super();
    }

    CommonDao commonDAO = new CommonDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("views/common/login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            String email = GoogleUtils.getUserInfo(accessToken);
            Date currentTimestamp = new Date(System.currentTimeMillis());
            Account googlePojo = Account.builder()
                    .email(email)
                    .role_Id(Constant.ROLE_CUSTOMER)
                    .created_on(currentTimestamp)
                    .build();
            Account_Form isExist = commonDAO.checkExistOfAcc1(googlePojo);
            if (isExist == null) {
                boolean isInserted = commonDAO.createAccountCustomerByGoogle(googlePojo);
                if (isInserted) {
                    Account_Form accountLoginGoogle = commonDAO.getAccountByEmail(googlePojo);
                    session.setAttribute(Constant.SESSION_ACCOUNT, accountLoginGoogle);
                    response.sendRedirect("home");
                } else {
                    request.setAttribute("error", "Error when login by google");
                    request.getRequestDispatcher("views/common/login.jsp").forward(request, response);
                }
            } else {
                Account_Form accountProfile = commonDAO.findProfileById(isExist);
                session.setAttribute("accountProfile", accountProfile);
                session.setAttribute(Constant.SESSION_ACCOUNT, isExist);
                response.sendRedirect("home");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
