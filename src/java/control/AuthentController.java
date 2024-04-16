/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import constant.Constant;
import dao.CommonDao;
import entity.Account;
import entity.Account_Form;
import entity.Product_Form;
import helper.BCrypt;
import static helper.BCrypt.hashpw;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "AuthentController", urlPatterns = {"/authen"})
public class AuthentController extends HttpServlet {

    CommonDao commonDAO;
    BCrypt bcryp = new BCrypt();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String action = request.getParameter("action") == null ? "login" : request.getParameter("action");
        switch (action) {
            case "login":
                Cookie arr[] = request.getCookies();
                if (arr != null) {
                    for (Cookie cookie : arr) {
                        if (cookie.getName().equals("userC")) {
                            request.setAttribute("username", cookie.getValue());
                        }
                        if (cookie.getName().equals("passC")) {
                            request.setAttribute("password", cookie.getValue());
                        }
                        if (cookie.getName().equals("rememberC")) {
                            request.setAttribute("remember", cookie.getValue());
                        }
                    }
                }
                url = "views/common/login.jsp";
                break;
            case "register":
                url = "views/common/signup.jsp";
                break;
            case "logout":
                logout(request, response);
                url = "home";
                break;
            default:
                url = "views/common/login.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "login" : request.getParameter("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonDAO = new CommonDao();
        String remember = request.getParameter("remember");
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        Account account = Account.builder()
                .email(email)
                .password(password)
                .build();
        Account_Form af = commonDAO.checkExistOfAcc(account);

        if (af == null) {
            request.setAttribute("username", email);
            request.setAttribute("err", "Nhap sai email hoac mat khau");
            request.getRequestDispatcher("views/common/login.jsp").forward(request, response);
        } else {
            if (af.getRole_Id() == Constant.ROLE_CUSTOMER) {
                Account_Form accountProfile = commonDAO.findProfileById(af);
                List<Product_Form> listProduct = commonDAO.findCartByAccountId(af.getId());
                int totalPrice = commonDAO.findTotalPriceInCart(af.getId());
                HttpSession session = request.getSession();

                session.setAttribute(Constant.SESSION_ACCOUNT, af);
                session.setAttribute("acc_id", af.getId());

                session.setAttribute("isLoggedIn", true);
                session.setAttribute("accountProfile", accountProfile);
                session.setAttribute("listProductInCart", listProduct);
                session.setAttribute("totalPrice", totalPrice);
                Cookie userC = new Cookie("userC", email);
                Cookie passC = new Cookie("passC", password);
                Cookie rememberC = new Cookie("rememberC", remember);
                if (remember != null) {
                    userC.setMaxAge(60 * 60 * 24);
                    passC.setMaxAge(60 * 60 * 24);
                    rememberC.setMaxAge(60 * 60 * 24);
                } else {
                    userC.setMaxAge(0);
                    passC.setMaxAge(0);
                    rememberC.setMaxAge(0);
                }
                response.addCookie(userC);
                response.addCookie(passC);
                response.addCookie(rememberC);
                response.sendRedirect("home");
            } else {
                request.setAttribute("username", email);
                request.setAttribute("err", "You don't have permission!");
                request.getRequestDispatcher("views/common/login.jsp").forward(request, response);
            }
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonDAO = new CommonDao();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        if (!email.matches(Constant.EMAIL_REGEX)) {
            request.setAttribute("username", email);
            request.setAttribute("password", password);
            request.setAttribute("password2", password2);
            request.setAttribute("error", "Email không hợp lệ");
            request.getRequestDispatcher("views/common/signup.jsp").forward(request, response);
        } else if (!password.matches(Constant.PASSWORD_REGEX)) {
            request.setAttribute("username", email);
            request.setAttribute("password", password);
            request.setAttribute("password2", password2);
            request.setAttribute("error", "Mật khẩu phải chứa ít nhất 8 kí tự (1 số, 1 chữ in hoa, 1 kí tự đặc biệt(trừ khoảng trắng)");
            request.getRequestDispatcher("views/common/signup.jsp").forward(request, response);
        } else {
            if (!password.equals(password2)) {
                request.setAttribute("username", email);
                request.setAttribute("password", password);
                request.setAttribute("password2", password2);
                request.setAttribute("error", "Mật khẩu phải giống nhau");
                request.getRequestDispatcher("views/common/signup.jsp").forward(request, response);
                return;
            }
            Date currentTimestamp = new Date(System.currentTimeMillis());
            Account account = Account.builder()
                    .email(email)
                    .password(password)
                    .role_Id(Constant.ROLE_CUSTOMER)
                    .created_on(currentTimestamp)
                    .build();

            boolean isExist = commonDAO.CheckAccount(account);

            if (!isExist) {
                // Nếu tài khoản chưa tồn tại thì thêm vào cơ sở dữ liệu
                boolean isInserted = commonDAO.createAccountCustomer(account);
                if (isInserted) {
                    request.setAttribute("msg", "Register success!");
                    // Chuyển hướng đến trang login nếu insert thành công
                    request.getRequestDispatcher("views/common/login.jsp").forward(request, response);
                } else {
                    // Xử lý lỗi nếu insert không thành công
                    request.setAttribute("error", "Lỗi khi thêm tài khoản");
                    request.getRequestDispatcher("views/common/signup.jsp").forward(request, response);
                }
            } else {
                // Nếu tài khoản đã tồn tại thì thông báo lỗi
                request.setAttribute("username", email);
                request.setAttribute("password", password);
                request.setAttribute("password2", password2);
                request.setAttribute("error", "Tài khoản đã tồn tại, vui lòng chọn tài khoản khác!!");
                request.getRequestDispatcher("views/common/signup.jsp").forward(request, response);
            }
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constant.SESSION_ACCOUNT);
    }

}
