package DAOs;

import DBConnection.DBConnection;
import Models.Product;
import Models.ProductType;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ProductDAO() {
        try {
            conn = DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAllProducts() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT p.ProductID, p.Name, p.Description, p.Price, p.Image, c.Name AS CategoryName, pt.Color, pt.Size, pt.Quantity "
                    + "FROM Product p "
                    + "JOIN ProductType pt ON p.ProductID = pt.ProductID "
                    + "JOIN Category c ON c.CategoryID = p.CategoryID");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * "
                + "FROM Product p "
                + "WHERE p.ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("CategoryID")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public ProductType getProductTypeByProductId(int productId) {
        ProductType productType = null;
        String sql = "SELECT * FROM ProductType WHERE ProductID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                productType = new ProductType(
                        rs.getString("Color"),
                        rs.getString("Size"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductID")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productType;
    }

    public int createProduct(Product product, ProductType productType) {
        int result = 0;
        String insertProductSQL = "INSERT INTO Product (Name, Description, Price, Image, CategoryID) VALUES (?, ?, ?, ?, ?)";
        String insertProductTypeSQL = "INSERT INTO ProductType (ProductID, Color, Size, Quantity) VALUES (?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false);

            // Insert into Product table
            ps = conn.prepareStatement(insertProductSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setLong(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getCategoryId());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int productId = generatedKeys.getInt(1);

                    // Insert into ProductType table
                    ps = conn.prepareStatement(insertProductTypeSQL);
                    ps.setInt(1, productId);
                    ps.setString(2, productType.getColor());
                    ps.setString(3, productType.getSize());
                    ps.setInt(4, productType.getQuantity());

                    result = ps.executeUpdate();
                }
            }

            conn.commit();
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException rollbackEx) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, rollbackEx);
            }
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return result;
    }

    public int updateProduct(Product product, ProductType productType) {
        int result = 0;
        String updateProductSQL = "UPDATE Product SET Name = ?, Description = ?, Price = ?, Image = ?, CategoryID = ? WHERE ProductID = ?";
        String updateProductTypeSQL = "UPDATE ProductType SET Color = ?, Size = ?, Quantity = ? WHERE ProductID = ?";

        try {
            conn.setAutoCommit(false);

            // Update Product table
            ps = conn.prepareStatement(updateProductSQL);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setLong(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, product.getProductId());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Update ProductType table
                ps = conn.prepareStatement(updateProductTypeSQL);
                ps.setString(1, productType.getColor());
                ps.setString(2, productType.getSize());
                ps.setInt(3, productType.getQuantity());
                ps.setInt(4, product.getProductId());

                result = ps.executeUpdate();
            }

            conn.commit();
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException rollbackEx) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, rollbackEx);
            }
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.Name, p.Description, p.Price, p.Image, c.Name, pt.Color, pt.Size, pt.Quantity "
                + "FROM Product p "
                + "JOIN ProductType pt ON p.ProductID = pt.ProductID "
                + "JOIN Category c ON c.CategoryID = p.CategoryID "
                + "WHERE p.Name LIKE ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("CategoryID")
                );
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        try {
            // Attempt to update the product
            ProductType result = productDAO.getProductTypeByProductId(4);
            if (result != null) {
                System.out.println("hi" + result.getQuantity());
            } else {
                System.out.println("fuck");
            }
        } catch (Exception ex) {
            System.err.println("Exception occurred:");
            ex.printStackTrace();
        }
    }

    public String getImgPathByProductId(int productId) {
        String img = "";
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Product where ProductID = ?");
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                img = rs.getString("Image");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }

}
