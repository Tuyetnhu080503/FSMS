package Controllers;

import DAOs.categoryDAO;
import DAOs.productDAO;
import DAOs.orderDAO;
import DAOs.voucherDAO;
import Models.Account;
import Models.Category;
import Models.Product;
import Models.ProductType;
import Models.Order;
import Models.Voucher;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

public class AdminController extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getPathInfo();

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc == null || acc.getRoleId() != 1) {
            response.sendRedirect("/");
            return;
        }

        if (path == null || path.equals("/")) {
            session.setAttribute("tabId", 1);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }

        try {
            switch (path) {
                case "/product":
                    handleProduct(request, response);
                    break;
                case "/order":
                    handleOrder(request, response);
                    break;
                case "/category":
                    handleCategory(request, response);
                    break;
                case "/categoryProducts":
                    handleCategoryProducts(request, response);
                    break;
                case "/createProduct":
                    request.getRequestDispatcher("/createProduct.jsp").forward(request, response);
                    break;
                case "/createProductProcess":
                    createProduct(request, response);
                    break;
                case "/updateProduct":
                    handleUpdateProduct(request, response);
                    break;
                case "/updateProductProcess":
                    editProduct(request, response);
                    break;
                case "/deleteProduct":
                    deleteProduct(request, response);
                    break;
                case "/searchProduct":
                    searchProduct(request, response);
                    break;
                case "/updateOrder":
                    handleUpdateOrder(request, response);
                    break;
                case "/updateOrderProcess":
                    updateOrder(request, response);
                    break;
                case "/voucher":
                    handleVoucher(request, response);
                    break;
                case "/createVoucher":
                    request.getRequestDispatcher("/createVoucher.jsp").forward(request, response);
                    break;
                case "/createVoucherProcess":
                    createVoucher(request, response);
                    break;
                case "/updateVoucher":
                    handleUpdateVoucher(request, response);
                    break;
                case "/updateVoucherProcess":
                    updateVoucher(request, response);
                    break;
                case "/deleteVoucher":
                    deleteVoucher(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Manage Product
    private void handleProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        productDAO productDAO = new productDAO();
        List<Product> productList = productDAO.getAllProduct();
        request.setAttribute("listP", productList);
        categoryDAO cateDao = new categoryDAO();
        List<Category> listcate = cateDao.getAllCategory();
        request.setAttribute("listC", listcate);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product(name, description, price, image, categoryId);
        ProductType productType = new ProductType(color, size, quantity);

        productDAO productDao = new productDAO();
        int result = productDao.createProduct(product, productType);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/product");
        } else {
            request.setAttribute("errorMessage", "Tạo sản phẩm thất bại.");
            request.getRequestDispatcher("/createProduct.jsp").forward(request, response);
        }
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        productDAO productDao = new productDAO();
        Product product = productDao.getProductById(productId);
        ProductType productType = productDao.getProductTypeByPId(productId);
        request.setAttribute("product", product);
        request.setAttribute("productType", productType);
        request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product(productId, name, description, price, image, categoryId);
        ProductType productType = new ProductType(color, size, quantity, productId);

        productDAO productDao = new productDAO();
        int result = productDao.updateProduct(product, productType);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/product");
        } else {
            request.setAttribute("errorMessage", "Cập nhật sản phẩm thất bại.");
            request.getRequestDispatcher("/updateProduct.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        productDAO productDao = new productDAO();
        int result = productDao.deleteProduct(productId);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/product");
        } else {
            request.setAttribute("errorMessage", "Xóa sản phẩm thất bại.");
            request.getRequestDispatcher("/admin/product").forward(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String keyword = request.getParameter("keyword");
        productDAO productDao = new productDAO();
        List<Product> searchResults = productDao.searchProducts(keyword);
        request.setAttribute("listP", searchResults);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }

    // Manage Order
    private void handleOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        orderDAO orderDao = new orderDAO();
        List<Order> orderList = orderDao.getAllOrder();
        request.setAttribute("listO", orderList);
        request.getRequestDispatcher("/order.jsp").forward(request, response);
    }

    private void handleUpdateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String orderId = request.getParameter("orderId");
        orderDAO orderDao = new orderDAO();
        Order order = orderDao.getOrderById(orderId);
        request.setAttribute("order", order);
        request.getRequestDispatcher("/updateOrder.jsp").forward(request, response);
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");
        orderDAO orderDao = new orderDAO();
        Order order = new Order(orderId, status);
        int result = orderDao.updateOrder(order);
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/order");
        } else {
            request.setAttribute("errorMessage", "Cập nhật đơn hàng thất bại.");
            request.getRequestDispatcher("/updateOrder.jsp").forward(request, response);
        }
    }

    // Manage Category
    private void handleCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        categoryDAO categoryDao = new categoryDAO();
        List<Category> listcate = categoryDao.getAllCategory();
        request.setAttribute("listC", listcate);
        request.getRequestDispatcher("/category.jsp").forward(request, response);
    }

    // Manage Category Products
    private void handleCategoryProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        categoryDAO categoryDAO = new categoryDAO();
        List<Product> categoryProducts = categoryDAO.getAllProductbyCategoryId(categoryId);
        request.setAttribute("listP", categoryProducts);
        request.getRequestDispatcher("/categoryProducts.jsp").forward(request, response);
    }

    // Manage Voucher
    private void handleVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        voucherDAO voucherDAO = new voucherDAO();
        List<Voucher> voucherList = voucherDAO.getAllVoucher();
        request.setAttribute("listV", voucherList);
        request.getRequestDispatcher("/voucher.jsp").forward(request, response);
    }

    private void createVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int discountAmount = Integer.parseInt(request.getParameter("discountAmount"));
        int discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));
        Date expiryDate = Date.valueOf(request.getParameter("expiryDate"));
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        Date createdDate = Date.valueOf(request.getParameter("createdDate"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int minimumPrice = Integer.parseInt(request.getParameter("minimumPrice"));

        Voucher voucher = new Voucher(0, discountAmount, discountPercentage, expiryDate, isActive, createdDate, quantity, minimumPrice);
        voucherDAO voucherDAO = new voucherDAO();
        int result = voucherDAO.createVoucher(voucher);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/voucher");
        } else {
            request.setAttribute("errorMessage", "Tạo voucher thất bại.");
            request.getRequestDispatcher("/createVoucher.jsp").forward(request, response);
        }
    }

    private void handleUpdateVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int voucherId = Integer.parseInt(request.getParameter("voucherId"));
        voucherDAO voucherDAO = new voucherDAO();
        Voucher voucher = voucherDAO.getVoucherById(voucherId);
        request.setAttribute("voucher", voucher);
        request.getRequestDispatcher("/updateVoucher.jsp").forward(request, response);
    }

    private void updateVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int voucherId = Integer.parseInt(request.getParameter("voucherId"));
        int discountAmount = Integer.parseInt(request.getParameter("discountAmount"));
        int discountPercentage = Integer.parseInt(request.getParameter("discountPercentage"));
        Date expiryDate = Date.valueOf(request.getParameter("expiryDate"));
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        Date createdDate = Date.valueOf(request.getParameter("createdDate"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int minimumPrice = Integer.parseInt(request.getParameter("minimumPrice"));

        Voucher voucher = new Voucher(voucherId, discountAmount, discountPercentage, expiryDate, isActive, createdDate, quantity, minimumPrice);
        voucherDAO voucherDAO = new voucherDAO();
        int result = voucherDAO.updateVoucher(voucher);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/voucher");
        } else {
            request.setAttribute("errorMessage", "Cập nhật voucher thất bại.");
            request.getRequestDispatcher("/updateVoucher.jsp").forward(request, response);
        }
    }

    private void deleteVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int voucherId = Integer.parseInt(request.getParameter("voucherId"));

        voucherDAO voucherDAO = new voucherDAO();
        int result = voucherDAO.deleteVoucher(voucherId);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/voucher");
        } else {
            request.setAttribute("errorMessage", "Xóa voucher thất bại.");
            request.getRequestDispatcher("/admin/voucher").forward(request, response);
        }
    }

}
