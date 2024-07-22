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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
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
        } else if (path.endsWith("/cart")) {
            CartDAO cartDAO = new CartDAO();
            ResultSet cartItems = cartDAO.getAllProductsInCart(acc.getAccountId());

            request.setAttribute("cartItems", cartItems);

            session.setAttribute("tabId", 15);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.startsWith("/cart/delete")) {
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

            if (cartDAO.checkProductExist(acc.getAccountId(), productID, productTypeID)) {
                isExceed = cartDAO.addMoreQuantity(acc.getAccountId(), productID, productTypeID, quantity);

                if (isExceed) {
                    jsonResponse.put("status", "fail");
                } else {
                    jsonResponse.put("status", "success");
                }
            } else {
                jsonResponse.put("status", "success");
                cartDAO.addProductToCart(acc.getAccountId(), productID, productTypeID, quantity);
            }

            // Write the response
            response.getWriter().write(jsonResponse.toString());
        } else if (request.getParameter("updateItems") != null) {
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
        } else if (request.getParameter("getItems") != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            CartDAO cartDAO = new CartDAO();
            ResultSet cart = cartDAO.getAllProductsInCart(acc.getAccountId());

            JSONArray cartItems = new JSONArray();
            int totalItems = 0;
            int totalPrice = 0;
            
            
            
            try {
                while (cart.next()) {
                    JSONObject item = new JSONObject();
                    item.put("ProductTypeID", cart.getInt("ProductTypeID"));
                    item.put("ProductID", cart.getInt("ProductID"));
                    item.put("Image", cart.getString("Image"));
                    item.put("Name", cart.getString("Name"));
                    item.put("Color", cart.getString("Color"));
                    item.put("Size", cart.getString("Size"));
                    item.put("Price", cart.getInt("Price"));
                    item.put("CartQuantity", cart.getInt("CartQuantity"));
                    item.put("ProductTypeQuantity", cart.getInt("ProductTypeQuantity"));
                    
                    totalItems++;
                    totalPrice += cart.getInt("Price") * cart.getInt("CartQuantity");
                    
                    cartItems.put(item);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("items", cartItems);
        jsonResponse.put("totalItems", totalItems);
        jsonResponse.put("totalPrice", totalPrice);

        response.getWriter().write(jsonResponse.toString());
        }
    }

    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        return acc != null;
    }
}
