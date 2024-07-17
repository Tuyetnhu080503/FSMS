/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.AccountDAO;
import Hash.MD5;
import Models.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class StaffController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        if (acc != null && acc.getRoleId() == 2) { // is staff
            if (path.endsWith("/profile")) {
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            }
            else if(path.endsWith("/profile/edit")){
                session.setAttribute("tabId", 3);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            }
            else if(path.endsWith("/profile/changepassword")){
                session.setAttribute("tabId", 4);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            } else if(path.endsWith("/products")){
                session.setAttribute("tabId", 5);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            }else if(path.endsWith("/products")){
                session.setAttribute("tabId", 6);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            }
            else{ // route = "/admin"
                session.setAttribute("tabId", 1);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
                
            }
        } else {
            response.sendRedirect("/");
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        if (request.getParameter("changePassword") != null) {
            String password = request.getParameter("oldpassword");
            String newPassword = request.getParameter("newpassword");

            String pass = MD5.getMd5(password);
            
            
            AccountDAO accDAO = new AccountDAO();
            Account curAcc = (Account) mySession.getAttribute("acc");
            String email = curAcc.getEmail();

            boolean isRightPassword = accDAO.checkRightPasswordByEmail(email, pass);

            if (isRightPassword) {
                String newpass = MD5.getMd5(newPassword);
                accDAO.changePasswordByEmail(email, newpass);
                mySession.setAttribute("changePassword", "yes");
                response.sendRedirect("/staff/profile");
            } else {
                request.setAttribute("wrongPass", "The old password is incorrect");
                mySession.setAttribute("tabId", 4);
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
            }
        }
    }
}
