/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CategoryDAO;
import DAOs.CommentDAO;
import DAOs.ProductDAO;
import DAOs.ProductTypeDAO;
import Models.Product;
import Models.ProductType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

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
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        if (path.endsWith("/products")) {

            if (request.getParameter("id") != null) {
                int categoryID = Integer.parseInt(request.getParameter("id"));
                CategoryDAO catDAO = new CategoryDAO();

                ResultSet rss = catDAO.getAllProductsByCatID(categoryID);

                List<Product> products = new ArrayList<>();

                try {
                    while (rss.next()) {
                        Product product = new Product();
                        product.setProductId(rss.getInt("ProductID"));
                        product.setName(rss.getString("Name"));
                        product.setPrice(rss.getLong("Price"));
                        product.setImage(rss.getString("Image"));
                        product.setDescription(rss.getString("Description"));
                        products.add(product);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }

                session.setAttribute("products", products);

            } else if (request.getParameter("sort-by") != null) {
                if (request.getParameter("sort-by").equals("name")) {
                    List<Product> products = (List<Product>) session.getAttribute("products");

                    //sort by name
                    products = sortProducts(products, "name");
                    session.setAttribute("products", products);
                } else {
                    List<Product> products = (List<Product>) session.getAttribute("products");

                    // sort by products
                    products = sortProducts(products, "price");

                    session.setAttribute("products", products);
                }
            } else {
                ProductDAO proDAO = new ProductDAO();
                ResultSet rss = proDAO.getAlls();
                List<Product> products = new ArrayList<>();
                try {
                    while (rss.next()) {
                        Product product = new Product();
                        product.setProductId(rss.getInt("ProductID"));
                        product.setName(rss.getString("Name"));
                        product.setPrice(rss.getLong("Price"));
                        product.setImage(rss.getString("Image"));
                        product.setDescription(rss.getString("Description"));
                        products.add(product);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }

                session.setAttribute("products", products);
            }

            session.setAttribute("tabId", 11);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.endsWith("products/list2")) {
            if (request.getParameter("id") != null) {

                int categoryID = Integer.parseInt(request.getParameter("id"));
                CategoryDAO catDAO = new CategoryDAO();

                ResultSet rss = catDAO.getAllProductsByCatID(categoryID);

                List<Product> products = new ArrayList<>();

                try {
                    while (rss.next()) {
                        Product product = new Product();
                        product.setProductId(rss.getInt("ProductID"));
                        product.setName(rss.getString("Name"));
                        product.setPrice(rss.getLong("Price"));
                        product.setImage(rss.getString("Image"));
                        product.setDescription(rss.getString("Description"));
                        products.add(product);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }

                session.setAttribute("products", products);
            } else if (request.getParameter("sort-by") != null) {
                if (request.getParameter("sort-by").equals("name")) {
                    List<Product> products = (List<Product>) session.getAttribute("products");

                    //sort by name
                    products = sortProducts(products, "name");
                    session.setAttribute("products", products);
                } else {
                    List<Product> products = (List<Product>) session.getAttribute("products");

                    // sort by products
                    products = sortProducts(products, "price");

                    session.setAttribute("products", products);
                }
            } else {
                ProductDAO proDAO = new ProductDAO();
                ResultSet rss = proDAO.getAlls();
                List<Product> products = new ArrayList<>();

                try {
                    while (rss.next()) {
                        Product product = new Product();
                        product.setProductId(rss.getInt("ProductID"));
                        product.setName(rss.getString("Name"));
                        product.setPrice(rss.getLong("Price"));
                        product.setImage(rss.getString("Image"));
                        product.setDescription(rss.getString("Description"));
                        products.add(product);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }

                session.setAttribute("products", products);
            }
            session.setAttribute("tabId", 10);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        } else if (path.startsWith("/products/detail")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO proDAO = new ProductDAO();
            ProductTypeDAO proTypeDao = new ProductTypeDAO();

            Product pro = proDAO.getProductByIdOld(id);

            ResultSet colors = proTypeDao.getColors(id);

            ResultSet sizes = proTypeDao.getSizes(id);

            ArrayList<ProductType> productTypes = proTypeDao.getProductTypesByProductID(id);

            CommentDAO cDAO = new CommentDAO();

            ResultSet allComment = cDAO.getAllCommentByProductID(id);

            int starAVG = cDAO.getStar(id);

            int commentNumber = cDAO.getQuantityComment(id);

            request.setAttribute("starAVG", starAVG);
            request.setAttribute("allComment", allComment);
            request.setAttribute("commentNumber", commentNumber);
            request.setAttribute("product", pro);
            request.setAttribute("colors", colors);
            request.setAttribute("sizes", sizes);
            request.setAttribute("productTypes", productTypes);

            session.setAttribute("tabId", 12);
            request.getRequestDispatcher("/customer.jsp").forward(request, response);
        }
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

    }

    private List<Product> sortProducts(List<Product> products, String sortBy) {
        if (sortBy != null) {
            switch (sortBy) {
                case "name":
                    Collections.sort(products, new Comparator<Product>() {
                        @Override
                        public int compare(Product p1, Product p2) {
                            return p1.getName().compareTo(p2.getName());
                        }
                    });
                    break;
                case "price":
                    Collections.sort(products, new Comparator<Product>() {
                        @Override
                        public int compare(Product p1, Product p2) {
                            return Long.compare(p1.getPrice(), p2.getPrice());
                        }
                    });
                    break;
                default:
                    break;
            }
        }
        return products;
    }
}
