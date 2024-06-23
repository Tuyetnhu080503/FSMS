/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AdminController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        if (acc != null && acc.getRoleId() == 1) { // is admin
            if (path.endsWith("/profile")) {
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
            else{ // route = "/admin"
                session.setAttribute("tabId", 1);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }
}
