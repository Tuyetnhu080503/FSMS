/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Product;
import Models.ProductType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class productDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public productDAO() throws SQLException {
        conn = DBConnection.DBConnection.connect();
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.ProductID, p.Name, p.Description, p.Price, p.Image, c.Name, pt.Color, pt.Size, pt.Quantity from Product p\n"
                + "join ProductType as pt on p.ProductID = pt.ProductID\n"
                + "join Category as c on c.CategoryID = p.CategoryID";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String sql = "select * from Product where ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public ProductType getProductTypeByPId(int productId) {
        ProductType product = null;
        String sql = "SELECT * FROM ProductType WHERE ProductID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Retrieve data and create ProductType object
                int typeId = rs.getInt(1);        // Assuming the first column is TypeId
                String color = rs.getString(2);   // Assuming the second column is Color
                String size = rs.getString(3);    // Assuming the third column is Size
                int quantity = rs.getInt(4);      // Assuming the fourth column is Quantity
                product = new ProductType(color, size, quantity, typeId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public int createProduct(Product p, ProductType pt) {
        int result = 0;
        String insertProductSQL = "INSERT INTO Product (Name, Description, Price, Image, CategoryID) VALUES (?, ?, ?, ?, ?)";
        String insertProductTypeSQL = "INSERT INTO ProductType (ProductID, Color, Size, Quantity) VALUES (?, ?, ?, ?)";

        try {
            // Set auto-commit to false
            conn.setAutoCommit(false);

            // Insert into Product table
            PreparedStatement ps = conn.prepareStatement(insertProductSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getDescription());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setInt(5, p.getCategoryId());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve the generated ProductID
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int productId = generatedKeys.getInt(1);

                    // Insert into ProductType table
                    PreparedStatement psType = conn.prepareStatement(insertProductTypeSQL);
                    psType.setInt(1, productId);
                    psType.setString(2, pt.getColor());
                    psType.setString(3, pt.getSize());
                    psType.setInt(4, pt.getQuantity());

                    result = psType.executeUpdate();
                }
            }

            // Commit the transaction
            conn.commit();
        } catch (SQLException ex) {
            try {
                // Rollback the transaction in case of error
                conn.rollback();
            } catch (SQLException rollbackEx) {
                Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, rollbackEx);
            }
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Set auto-commit back to true
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return result;
    }
//    public static void main(String[] args) {
//        productDAO dao = new productDAO();
//        Product p = new Product("ao khoac", "dasdasdsa", BigDecimal.ONE, "url", 1);
//        ProductType pt = new ProductType("Blue", "M", 10);
//      int result = dao.AddNewProduct(p, pt);
//      if(result != 0) {
//          System.out.println("Success");
//      }
//    }

    public int updateProduct(Product p, ProductType pt) {
        int result = 0;
        String updateProductSQL = "UPDATE Product SET Name = ?, Description = ?, Price = ?, Image = ?, CategoryID = ? WHERE ProductID = ?";
        String updateProductTypeSQL = "UPDATE ProductType SET Color = ?, Size = ?, Quantity = ? WHERE ProductID = ?";

        try {
            // Set auto-commit to false
            conn.setAutoCommit(false);

            // Update Product table
            PreparedStatement ps = conn.prepareStatement(updateProductSQL);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getDescription());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setInt(5, p.getCategoryId());
            ps.setInt(6, p.getProductId()); // ProductID

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Update ProductType table
                PreparedStatement psType = conn.prepareStatement(updateProductTypeSQL);
                psType.setString(1, pt.getColor());
                psType.setString(2, pt.getSize());
                psType.setInt(3, pt.getQuantity());
                psType.setInt(4, p.getProductId()); // ProductID

                result = psType.executeUpdate();
            }

            // Commit the transaction
            conn.commit();
        } catch (SQLException ex) {
            try {
                // Rollback the transaction in case of error
                conn.rollback();
            } catch (SQLException rollbackEx) {
                Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, rollbackEx);
            }
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Set auto-commit back to true
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return result;
    }

    public int deleteProduct(int productId) {
        int result = 0;
        String deleteProductSQL = "DELETE FROM Product WHERE ProductID = ?";
        try {
            ps = conn.prepareStatement(deleteProductSQL);
            ps.setInt(1, productId);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.Name, p.Description, p.Price, p.Image, c.Name, pt.Color, pt.Size, pt.Quantity "
                + "FROM Product p "
                + "JOIN ProductType as pt ON p.ProductID = pt.ProductID "
                + "JOIN Category as c ON c.CategoryID = p.CategoryID "
                + "WHERE p.Name LIKE ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
           
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public static void main(String[] args) throws SQLException {
//        Product p = new Product("123", "description", 10, "image", 1);
//        ProductType pt = new ProductType("color", "size", 50);
//        productDAO productDao = new productDAO();
//        int result = productDao.createProduct(p, pt);
//        if (result > 0) {
//            System.out.println("success");
//        } else {
//            System.out.println("failed");
//        };
//    }
    public static void main(String[] args) throws SQLException {
        productDAO productDao = new productDAO();
        int result = productDao.deleteProduct(12);
        if (result == 1) { 
            System.out.println("success");
        }
        else {
            System.out.println("failed");
        }
    }
}
