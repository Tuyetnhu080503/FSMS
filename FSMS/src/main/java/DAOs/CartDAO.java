package DAOs;

import DBConnection.DBConnection;
import Models.Cart;
import Models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CartDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int getCustomerIdByAccountId(int accountId) {
        int customerId = -1;
        String query = "SELECT CustomerID FROM CustomerProfile WHERE AccountID = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt("CustomerID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return customerId;
    }

   public List<Cart> getProductAndQuantityByCustomerID(int customerID) {
    List<Cart> cartItems = new ArrayList<>();
    String query = "SELECT c.ProductID, c.Quantity, p.Name, p.Price, p.Image " +
                   "FROM Cart c " +
                   "JOIN Product p ON c.ProductID = p.ProductID " +
                   "WHERE c.CustomerID = ?";
    try {
        conn = DBConnection.connect();
        ps = conn.prepareStatement(query);
        ps.setInt(1, customerID);
        rs = ps.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("ProductID");
            int quantity = rs.getInt("Quantity");
            String name = rs.getString("Name");
            long price = rs.getLong("Price");
            String image = rs.getString("Image");

            Product product = new Product(productId, name, "", price, image, 0);
            Cart cart = new Cart(customerID, productId, quantity);
            cart.setProduct(product);
            cartItems.add(cart);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return cartItems;
}

    public List<Product> getProductDetailsByCustomerAndProductIDs(int customerId, List<Integer> productIds) {
    List<Product> products = new ArrayList<>();
    if (productIds.isEmpty()) {
        return products;
    }

    String query = "SELECT ProductID, Name, Price, Image FROM Product WHERE ProductID IN (" +
                   productIds.stream().map(id -> "?").collect(Collectors.joining(", ")) + ")";
    try {
        conn = DBConnection.connect();
        ps = conn.prepareStatement(query);

        for (int i = 0; i < productIds.size(); i++) {
            ps.setInt(i + 1, productIds.get(i));
        }

        rs = ps.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("ProductID");
            String name = rs.getString("Name");
            long price = rs.getLong("Price");
            String image = rs.getString("Image");
            products.add(new Product(productId, name, "", price, image, 0));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return products;
}
     public void updateCartItem(int customerId, int productId, int quantity) {
        String query = "UPDATE Cart SET Quantity = ? WHERE CustomerID = ? AND ProductID = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, customerId);
            ps.setInt(3, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public void deleteCartItem(int customerId, int productId) {
        String query = "DELETE FROM Cart WHERE CustomerID = ? AND ProductID = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }


    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
