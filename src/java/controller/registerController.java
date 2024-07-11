/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.User;

/**
 *
 * @author int.thong.nk
 */
public class registerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/user/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SendEmail sm = new SendEmail();
        String verifyCode = sm.getRandom();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String rePass = request.getParameter("repass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        boolean gender = request.getParameter("gender").equals("true") ? true : false;
        Date dob = Date.valueOf(request.getParameter("dob"));

        User u = UserDao.INS.findUser(email);

        User user = new User(email, verifyCode);
        boolean test = sm.sendEmail(user);

        if (u != null) {
            request.setAttribute("mess", "Email exitsed!");
            request.getRequestDispatcher("view/user/register.jsp").forward(request, response);
        }

        if (!pass.equals(rePass)) {
            request.setAttribute("mess", "Passwords didn't match!");
            request.getRequestDispatcher("view/user/register.jsp").forward(request, response);
        }
        if (test) {
            HttpSession session = request.getSession();
            session.setAttribute("verifyCode", user);

            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("pass", pass);
            request.setAttribute("gender", gender);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("dob", dob);

            request.getRequestDispatcher("view/user/OTP.jsp").forward(request, response);
        } else {
            response.sendRedirect("error");
        }

    }

}
