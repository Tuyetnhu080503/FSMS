/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import Hash.MD5;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        if (path.endsWith("/logout")) {
            Cookie[] cList = request.getCookies();
            if (cList != null) {
                for (Cookie c : cList) {
                    c.setValue("");
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
                }

            }
            session.invalidate();
            response.sendRedirect("/");
        } else {
            session.setAttribute("tabId", 2);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String submitButton = request.getParameter("login");
        if (submitButton != null) {
            AccountDAO aDAO = new AccountDAO();
            String userName = request.getParameter("username");
            String pass = request.getParameter("password");
            String pass_hash = MD5.getMd5(pass);
            Account acc = aDAO.getAccountByUsernameAndPassword(userName, pass_hash);
            if (acc == null) {
                session.setAttribute("isSuccess", "false");
                response.sendRedirect("/login");
                return;
            } else {
                session.setAttribute("acc", acc);
                Cookie c = new Cookie("login", userName);
                c.setMaxAge(24 * 60 * 60 * 3);
                response.addCookie(c);
                switch (acc.getRoleId()) {
                    case 1:
                        response.sendRedirect("/admin");
                        break;
                    case 2:
                        response.sendRedirect("/staff");
                        break;
                    case 3:
                        response.sendRedirect("/shipper");
                        break;
                    case 4:
                        response.sendRedirect("/");
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
