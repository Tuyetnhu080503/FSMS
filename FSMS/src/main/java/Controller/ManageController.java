package Controller;

import DAOs.categoryDAO;
import DAOs.orderDAO;
import DAOs.productDAO;
import Models.Category;
import Models.Order;
import Models.Product;
import Models.ProductType;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

public class ManageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            request.getRequestDispatcher("/manage.jsp").forward(request, response);
            return;
        }

        switch (path) {
            case "/product":
                productDAO productDAO = new productDAO();
                List<Product> productList = productDAO.getAllProduct();
                request.setAttribute("listP", productList);
                categoryDAO cateDao = new categoryDAO();
                List<Category> listcate = cateDao.getAllCategory();
                request.setAttribute("listC", listcate);
                request.getRequestDispatcher("/product.jsp").forward(request, response);
                break;
            case "/order":
                orderDAO orderDao = new orderDAO();
                List<Order> orderList = orderDao.getAllOrder();
                request.setAttribute("listO", orderList);
                request.getRequestDispatcher("/order.jsp").forward(request, response);
                break;
            case "/category":
                categoryDAO categoryDao = new categoryDAO();
                List<Category> listcate2 = categoryDao.getAllCategory();
                request.setAttribute("listC", listcate2);
                request.getRequestDispatcher("/category.jsp").forward(request, response);
                break;
            case "/categoryProducts":
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                categoryDAO categoryDAO2 = new categoryDAO();
                List<Product> categoryProducts = categoryDAO2.getAllProductbyCategoryId(categoryId);
                request.setAttribute("listP", categoryProducts);
                request.getRequestDispatcher("/categoryProducts.jsp").forward(request, response);
                break;
            case "/createProduct":
                // Forward to createProduct.jsp
                request.getRequestDispatcher("/createProduct.jsp").forward(request, response);
                break;
            case "/createProductProcess":
                createProduct(request, response);
                break;

            case "/updateProduct":

                float price = 0.0f; // Default value or handle accordingly
                int productId = 0;
                String PID = request.getParameter("productId");
                if (PID != null && !PID.isEmpty()) {
                    try {
                        productId = Integer.parseInt(PID);
                    } catch (NumberFormatException e) {
                        productId = 0;
                    }
                }

                productDAO productDao = new productDAO();
                Product product = productDao.getProductById(productId);
                ProductType productType = productDao.getProductTypeByPId(productId);
                request.setAttribute("product", product);
                request.setAttribute("productType", productType);
                // Forward to updateProduct.jsp
                request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
                break;

            case "/updateProductProcess":
                editProduct(request, response);
                break;
            case "/deleteProduct":
                deleteProduct(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Create Product and ProductType objects
        Product product = new Product(name, description, price, image, categoryId);
        ProductType productType = new ProductType(color, size, quantity);

        // Update the product in the database using DAO
        productDAO productDao = new productDAO(); // Adjust this according to your DAO class name
        int result = productDao.createProduct(product, productType);

        // Handle the result of the update operation
        if (result > 0) {
            // Redirect to product management page if update successful
            response.sendRedirect(request.getContextPath() + "/manage/product");
        } else {
            // Set error message attribute if update failed
            request.setAttribute("errorMessage", "tao sản phẩm thất bại." + name + description + price + image + categoryId + color + size + quantity);
            // Forward back to updateProduct.jsp to display error message and allow retry
            request.getRequestDispatcher("/createProduct.jsp").forward(request, response);
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from request
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Create Product and ProductType objects
        Product product = new Product(productId, name, description, price, image, categoryId);
        ProductType productType = new ProductType(color, size, quantity, productId);

        // Update the product in the database using DAO
        productDAO productDao = new productDAO(); // Adjust this according to your DAO class name
        int result = productDao.updateProduct(product, productType);

        // Handle the result of the update operation
        if (result > 0) {
            // Redirect to product management page if update successful
            response.sendRedirect(request.getContextPath() + "/manage/product");
        } else {
            // Set error message attribute if update failed
            request.setAttribute("errorMessage", "Cập nhật sản phẩm thất bại.");
            // Forward back to updateProduct.jsp to display error message and allow retry
            request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        productDAO productDao = new productDAO();
        int result = productDao.deleteProduct(productId);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/manage/product");
        } else {
            request.setAttribute("errorMessage", "Xóa sản phẩm thất bại.");
            request.getRequestDispatcher("/manage/product").forward(request, response);
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
    }
}
