package Controllers;

import DAOs.CartDAO;
import Models.Account;
import Models.Cart;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;

@WebServlet("/CartController")
public class CartController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        Account acc = (Account) session.getAttribute("acc");

        if (!isLoggedIn(request)) {
            session.setAttribute("tabId", 2);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
            return;
        }
        else if(path.endsWith("/cart")){
            CartDAO cartDAO = new CartDAO();
            ResultSet cartItems = cartDAO.getAllProductsInCart(acc.getAccountId());
            
            request.setAttribute("cartItems", cartItems);
            
            session.setAttribute("tabId", 15);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
        else if(path.startsWith("/cart/delete")){
            int productID = Integer.parseInt(request.getParameter("productID"));
            int productTypeID = Integer.parseInt(request.getParameter("productTypeID"));
            
            CartDAO cartDAO = new CartDAO();
            cartDAO.deleteCartItems(acc.getAccountId(), productID, productTypeID);
            
            
            response.sendRedirect("/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (request.getParameter("addToCart") != null) {
            // Set the response content type
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Retrieve form parameters
            int productID = Integer.parseInt(request.getParameter("productID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productTypeID = Integer.parseInt(request.getParameter("productTypeID"));

            // Process the form data (e.g., save to database or session)
            // For demonstration, we'll just print the data to the server console
            System.out.println("Product ID: " + productID);
            System.out.println("Quantity: " + quantity);
            System.out.println("productTypeID: " + productTypeID);
            
            JSONObject jsonResponse = new JSONObject();
            
            CartDAO cartDAO = new CartDAO();
            boolean isExceed = false;
            
            if(cartDAO.checkProductExist(acc.getAccountId(), productID, productTypeID)){
                isExceed = cartDAO.addMoreQuantity(acc.getAccountId(), productID, productTypeID, quantity);
                
                if(isExceed){
                    System.out.println("Vuot qua ");
                    jsonResponse.put("status", "fail");
                }
                else{
                     System.out.println("Trung nhung khong vuot ");
                    jsonResponse.put("status", "success");
                }
            }
            else{
                System.out.println("Khong bi trung ");
                jsonResponse.put("status", "success");
                cartDAO.addProductToCart(acc.getAccountId(), productID, productTypeID, quantity);
            }
            
            // Write the response
            response.getWriter().write(jsonResponse.toString());
        }
        else if(request.getParameter("updateItems") != null){
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Retrieve form parameters
            int productID = Integer.parseInt(request.getParameter("productID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productTypeID = Integer.parseInt(request.getParameter("productTypeID"));
            
            CartDAO cartDAO = new CartDAO();
            
            cartDAO.updateQuantityCartItems(acc.getAccountId(), productID, productTypeID, quantity);

            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Product added to cart successfully!");

            // Write the response
            response.getWriter().write(jsonResponse.toString());
        }
    }

    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        return acc != null;
    }
}
