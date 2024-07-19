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
            rs = st.executeQuery("SELECT p.ProductID, p.Name, p.Description, p.Price, p.Image, c.Name AS CategoryName, pt.Color, pt.Size, pt.Quantity, p.IsActive "
                    + "FROM Product p "
                    + "JOIN ProductType pt ON p.ProductID = pt.ProductID "
                    + "JOIN Category c ON c.CategoryID = p.CategoryID");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
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
                        rs.getInt("ProductID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getLong("Price"),
                        rs.getString("Image"),
                        rs.getInt("CategoryID"),
                        rs.getBoolean("IsActive")
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

    public ResultSet getQuantityProduct() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT\n"
                    + "  p.productID,\n"
                    + "  COUNT(*) AS quantity\n"
                    + "FROM Product p\n"
                    + "JOIN ProductType pt ON p.productID = pt.productID\n"
                    + "GROUP BY p.productID;");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int createProduct(Product product, ProductType productType) {
        int result = 0;
        String insertProductSQL = "INSERT INTO Product (Name, Description, Price, Image, CategoryID, IsActive) VALUES (?, ?, ?, ?, ?, ?)";
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
            ps.setBoolean(6, true);
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

    public int getTotalProductsCount() {
        String sql = "SELECT COUNT(*) FROM Product";
        int totalProducts = 0;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalProducts = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return totalProducts;
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

    public boolean isProductExist(String productName, String color, String size) {
        String sql = "SELECT * FROM Product AS p "
                + "JOIN ProductType pt ON p.ProductID = pt.ProductID "
                + "WHERE p.Name = ? AND pt.Color = ? AND pt.Size = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, color);
            ps.setString(3, size);
            rs = ps.executeQuery();
            if (rs.next()) { // Sử dụng rs.next() để kiểm tra nếu có bản ghi nào được trả về
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void banProductById(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Product SET IsActive = 0 Where ProductID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unbanProductById(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Product SET IsActive = 1 Where ProductID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
