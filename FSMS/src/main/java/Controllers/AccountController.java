/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import Hash.MD5;
import Models.Account;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        if (acc != null && acc.getRoleId() == 4) { // is customer
            if (path.endsWith("/profile")) {
                session.setAttribute("tabId", 6);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            } else if (path.endsWith("/profile/edit")) {
                session.setAttribute("tabId", 7);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            } else if (path.endsWith("/changepassword")) {
                session.setAttribute("tabId", 8);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            }
        } else if (path.endsWith("/forgot")) {
            session.setAttribute("tabId", 3);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.endsWith("/register")) {
            session.setAttribute("tabId", 9);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.endsWith("/otp") && (String) session.getAttribute("otp") != null) {
            session.setAttribute("tabId", 4);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.endsWith("/newpassword") && (String) session.getAttribute("otp") != null) {
            session.setAttribute("tabId", 5);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else {
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        if (request.getParameter("getNewPassword") != null) {

            AccountDAO accDAO = new AccountDAO();

            //// check email exits
            String email = request.getParameter("email");

            Account account = accDAO.getAccountByEmail(email);

            if (account != null) {
                String otpvalue = generateOTP(6);

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("", ""); // enter key email
                    }
                });

                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello");
                    try {
                        message.setText("your OTP is: " + otpvalue);
                    } catch (MessagingException ex) {
                        mySession.setAttribute("tabId", 3);
                        request.getRequestDispatcher("/customer.jsp").forward(request, response);
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                } catch (MessagingException e) {
                    mySession.setAttribute("tabId", 3);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                    throw new RuntimeException(e);
                }
                mySession.setAttribute("sentOTP", "yes");

                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);

                response.sendRedirect("/account/otp");
            } else {
                request.setAttribute("notSentOTP", "Email not exits");

                mySession.setAttribute("tabId", 3);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            }

        } else if (request.getParameter("getOTP") != null) {
            System.out.println((String) mySession.getAttribute("otp"));
            // check right OTP
            if (request.getParameter("otp").equals((String) mySession.getAttribute("otp"))) {
                response.sendRedirect("/account/newpassword");
            } else {
                if (mySession.getAttribute("enterOTP") == null) {
                    request.setAttribute("failOTP", "Wrong OTP. Please re-enter!");
                    mySession.setAttribute("enterOTP", 1);

                    mySession.setAttribute("tabId", 4);
                    request.getRequestDispatcher("/customer.jsp").forward(request, response);
                } else {
                    if ((int) mySession.getAttribute("enterOTP") == 4) {
                        mySession.removeAttribute("otp");
                        mySession.removeAttribute("enterOTP");

                        AccountDAO accDAO = new AccountDAO();
                        accDAO.banAccountByEmail((String) mySession.getAttribute("email"));
                        mySession.removeAttribute("email");

                        mySession.setAttribute("resetOTP", "yes");
                        response.sendRedirect("/login");
                    } else {
                        mySession.setAttribute("enterOTP", (int) mySession.getAttribute("enterOTP") + 1);

                        request.setAttribute("failOTP", "Wrong OTP. Please re-enter!");
                        mySession.setAttribute("tabId", 4);
                        request.getRequestDispatcher("/customer.jsp").forward(request, response);
                    }

                }
            }
        } else if (request.getParameter("newPassword") != null) {
            String newPassword = request.getParameter("newpassword");
            String email = request.getParameter("email");

            String pass = MD5.getMd5(newPassword);

            AccountDAO accDAO = new AccountDAO();

            accDAO.updatePasswordByEmail(email, pass);

            mySession.setAttribute("successUpdateNewPassword", "yes");

            response.sendRedirect("/login");

        } else if (request.getParameter("changePassword") != null) {
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
                response.sendRedirect("/account/profile");
            } else {
                request.setAttribute("wrongPass", "The old password is incorrect");
                mySession.setAttribute("tabId", 8);
                request.getRequestDispatcher("/customer.jsp").forward(request, response);
            }
        }
    }

    public static String generateOTP(int length) {
        String digits = "0123456789";
        Random random = new Random();

        StringBuilder otp = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(digits.length());
            otp.append(digits.charAt(index));
        }

        return otp.toString();
    }
}
