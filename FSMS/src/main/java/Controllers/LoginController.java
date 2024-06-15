/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import Hash.MD5;
import Models.Account;
import Utils.Constants;
import Utils.GoogleInformation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

public class LoginController extends HttpServlet {

    private void doGetLoginWithGoogle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String authToken = getToken(code);
        GoogleInformation userInfor = getUserInfo(authToken);

        System.out.println(userInfor.getEmail());
        AccountDAO accountDAO = new AccountDAO();
        String email = userInfor.getEmail();
        Account account = accountDAO.getAccountByEmail(email);
        if (account != null) {
            if (!accountDAO.checkAccountIsActive(account)) {
                request.setAttribute("failLogin", "Account has been locked!");
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
                return;
            }

            session.setAttribute("acc", account);
            Cookie c = new Cookie("login", account.getUsername());
            c.setMaxAge(24 * 60 * 60 * 3);
            response.addCookie(c);
            
            session.setAttribute("successLogin", "success");
            // Redirect to the corresponding Controller role
            switch (account.getRoleId()) {
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
        } else {
            request.setAttribute("failLogin", "Account does not exist!");
            session.setAttribute("tabId", 2);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
    }

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
        } else if (request.getParameter("code") != null) {
            doGetLoginWithGoogle(request, response);
        } else if(session.getAttribute("acc") == null) {
            session.setAttribute("tabId", 2);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("/");
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
                request.setAttribute("failLogin", "Incorrect account or password!");
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
                return;
            } else {
                if (!aDAO.checkAccountIsActive(acc)) {
                    request.setAttribute("failLogin", "Account has been locked!");
                    session.setAttribute("tabId", 2);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                    return;
                }
                session.setAttribute("acc", acc);
                Cookie c = new Cookie("login", userName);
                c.setMaxAge(24 * 60 * 60 * 3);
                response.addCookie(c);
                
                session.setAttribute("successLogin", "success");
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

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleInformation getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleInformation googleinfo = new Gson().fromJson(response, GoogleInformation.class);
        return googleinfo;
    }

}
