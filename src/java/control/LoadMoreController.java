/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CommonDao;
import entity.Feedback_Form;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "LoadMoreController", urlPatterns = {"/load"})
public class LoadMoreController extends HttpServlet {

    CommonDao commonDAO = new CommonDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productIdRaw = request.getParameter("productID");
        String exist = request.getParameter("exist");
        int amount = Integer.parseInt(exist);
        int productID = Integer.parseInt(productIdRaw);
        List<Feedback_Form> accountRating = commonDAO.getNextAccountRatingByProductId(productID, amount);
        PrintWriter out = response.getWriter();
        for (Feedback_Form f : accountRating) {
            out.println("<div class=\"feedback\">\n"
                    + "                                    <hr>\n"
                    + "                                    <h5>" + f.getEmail() + "</h5>\n"
                    + "                                    <div>" + f.getDate_review() + "</div>\n"
                    + "                                    <div>\n"
                    + "                                        <div class=\"rating_review_wrap d-flex align-items-center clearfix w-100\">\n");

            int starRating = f.getStar();
            out.print("<ul class=\"ul_li mr-2\">");
            for (int i = 1; i <= 5; i++) {
                if (i <= starRating) {
                    out.print("<li><i class=\"fas fa-star checked\"></i></li>");
                } else {
                    out.print("<li><i class=\"fas fa-star\"></i></li>");
                }
            }
            out.println("</ul>");

            out.println("                                        </div>\n"
                    + "                                        <div>" + f.getContent() + "</div>\n"
                    + "                                        <img src=\"" + f.getImage() + "\">\n"
                    + "                                    </div>\n"
                    + "                                </div>");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
