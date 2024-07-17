package DAOs;

import Models.Order;
import DBConnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

 public List<Order> getAllOrders() {
    List<Order> list = new ArrayList<>();
    String query = "SELECT * FROM [Order]"; // Ensure the table name is correct

    try {
        conn = DBConnection.connect();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new Order(
                    rs.getInt("OrderID"),
                    rs.getInt("CustomerID"),
                    rs.getString("Status"),
                    rs.getLong("TotalPrice"),
                    rs.getTimestamp("CreateAt"),
                    rs.getInt("VoucherID"),
                    rs.getString("PaymentMethod"),
                    rs.getString("PaymentID")
            ));
        }
        System.out.println("Number of orders retrieved: " + list.size()); // Debug statement
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return list;
}
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

    // Method to get orders by CustomerId
   public List<Order> getOrdersByCustomerId(int customerId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Order] WHERE CustomerID = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("OrderID"),
                    rs.getInt("CustomerID"),
                    rs.getString("Status"),
                    rs.getLong("TotalPrice"),
                    rs.getTimestamp("CreateAt"),
                    rs.getInt("VoucherID"),
                    rs.getString("PaymentMethod"),
                    rs.getString("PaymentID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return orders;
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

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        
         int accountId = 1; // Replace with a valid AccountID from your database
        int customerId = orderDAO.getCustomerIdByAccountId(accountId);
        System.out.println("CustomerID for AccountID " + accountId + ": " + customerId);

        // Test getOrdersByCustomerId
        List<Order> orders = orderDAO.getOrdersByCustomerId(customerId);
        if (customerId != -1) {
            orderDAO.getOrdersByCustomerId(customerId);
            System.out.println("Orders for CustomerID " + customerId + ":");
            for (Order order : orders) {
                System.out.println(order);
            }
        } else {
            System.out.println("No CustomerID found for AccountID " + accountId);
        }
    }
    }
