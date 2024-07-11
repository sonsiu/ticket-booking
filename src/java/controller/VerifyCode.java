/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import model.User;

/**
 *
 * @author ADMIN
 */
public class VerifyCode extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            //generated code
            User user = (User) session.getAttribute("verifyCode");

            //user input code
            String verifyCode = "";
            for (int i = 1; i < 7; i++) {
                verifyCode += request.getParameter("verifyCode" + i);
            }
            if (verifyCode.equals(user.getVerifyCode())) {

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                boolean gender = request.getParameter("gender") == "true" ? true : false;
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                Date dob = Date.valueOf(request.getParameter("dob"));
                UserDao.INS.register(name, email, pass, gender, phone, address, 1, null, dob, true);

                response.sendRedirect("homeController");
            } else {
                out.println("WRONG VERIFICATION CODE!");
            } 
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
