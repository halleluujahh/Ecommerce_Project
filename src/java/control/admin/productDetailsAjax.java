/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.admin;

import constant.Constant;
import dao.AdminDao;
import dao.CommonDao;
import entity.Color;
import entity.Gender;
import entity.Pagination;
import entity.Product_Form;
import entity.Size;
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
@WebServlet(name = "productDetailsAjax", urlPatterns = {"/productDetailsAjax"})
public class productDetailsAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CommonDao commonDAO = new CommonDao();
        AdminDao adminDAO = new AdminDao();
        String productID = request.getParameter("productID");
        String colorId = request.getParameter("colorID");
        String sizeId = request.getParameter("sizeID");
        String genderID = request.getParameter("genderID");
        
        if (colorId != null && !colorId.isEmpty()) {
            List<Size> listSa = commonDAO.findSizeByColorId(productID, colorId);
            List<Gender> listGa = commonDAO.findGenderByColorId(productID, colorId);      
            request.setAttribute("listSa", listSa);
            request.setAttribute("listGa", listGa);
            request.setAttribute("colorIdA", colorId);
        }
        if (sizeId != null && !sizeId.isEmpty()) {
            List<Color> listC = commonDAO.findColorBySize(productID, sizeId);
            List<Gender> listG = commonDAO.findGenderBySize(productID, sizeId);
            request.setAttribute("listCa", listC);
            request.setAttribute("listGa", listG);
            request.setAttribute("sizeIdA", sizeId);
        }
        if (genderID != null && !genderID.isEmpty()) {
            List<Color> listC = commonDAO.findColorByGender(productID, genderID);
            List<Size> listS = commonDAO.findSizeByGender(productID, genderID);
            request.setAttribute("listCa", listC);
            request.setAttribute("listSa", listS);
            request.setAttribute("genderIdA", genderID);
        }
        if (colorId != null && !colorId.isEmpty() && sizeId != null && !sizeId.isEmpty()) {
            List<Gender> listG = commonDAO.findGenderByColorAndSize(productID, colorId, sizeId);
            request.setAttribute("listGa", listG);
            request.setAttribute("colorIdA", colorId);
            request.setAttribute("sizeIdA", sizeId);
        }
        if (colorId != null && !colorId.isEmpty() && genderID != null && !genderID.isEmpty()) {
            List<Size> listS = commonDAO.findSizeByColorAndGender(productID, colorId, genderID);
            request.setAttribute("listSa", listS);
            request.setAttribute("colorIdA", colorId);
            request.setAttribute("genderIdA", genderID);
        }
        if (genderID != null && !genderID.isEmpty() && sizeId != null && !sizeId.isEmpty()) {
            List<Color> listC = commonDAO.findColorByGenderAndSize(productID, genderID, sizeId);
            request.setAttribute("listCa", listC);
            request.setAttribute("genderIdA", genderID);
            request.setAttribute("sizeIdA", sizeId);
        }
        if (colorId != null && !colorId.isEmpty() && sizeId != null && !sizeId.isEmpty() && genderID != null && !genderID.isEmpty()) {
            int StockOfProductDetail = commonDAO.getStockProductDetailByAllField(productID, colorId, sizeId, genderID);
            request.setAttribute("StockOfProductDetail", StockOfProductDetail);
            request.setAttribute("colorIdA", colorId);
            request.setAttribute("sizeIdA", sizeId);
            request.setAttribute("genderIdA", genderID);
        }
        request.getRequestDispatcher("views/common/productDetails.jsp").forward(request, response);
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
