/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Order;
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
 * @author dailoi
 */
public class OrderDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public OrderDAO() throws SQLException {
        conn = DBConnection.DBConnection.connect();
    }

    public ResultSet getAllOrder() {

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT o.OrderID, a. [Firstname], a.Lastname, a.Phonenumber, o.Status, o.PaymentMethod, c.Deliveryaddress FROM [Order] o \n"
                    + "join CustomerProfile as c on o.CustomerID = c.CustomerID\n"
                    + "join Voucher as v on o.VoucherID = v.VoucherID\n"
                    + "join Account as a on c.AccountID = a.AccountID");

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT o.OrderID,a.[Firstname], a.Lastname, a.Phonenumber, o.Status, o.PaymentMethod, c.Deliveryaddress FROM [Order] o \n"
                + "join CustomerProfile as c on o.CustomerID = c.CustomerID\n"
                + "join Voucher as v on o.VoucherID = v.VoucherID\n"
                + "join Account as a on c.AccountID = a.AccountID where o.OrderID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order(
                        rs.getInt("OrderID"),
                        rs.getString("Firstname"),
                        rs.getString("Lastname"),
                        rs.getString("Phonenumber"),
                        rs.getString("Status"),
                        rs.getString("PaymentMethod"),
                        rs.getString("Deliveryaddress")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public int updateOrder(Order order) {
        int result = 0;
        String sql = "UPDATE [Order] SET [Status] = ? WHERE OrderID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getStatus());
            ps.setInt(2, order.getOrderId());
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateOrderStatus(String orderId, String status) {
        String query = "UPDATE [Order] SET [Status] = ? WHERE OrderID = ?";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setString(2, orderId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

//    public static void main(String[] args) {
//
//        OrderDAO orderDAO = null;
//        try {
//            orderDAO = new OrderDAO();
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        boolean result = orderDAO.updateOrderStatus("1", "Success");
//        if (result) {
//            System.out.println("succes");
//        } else {
//            System.out.println("failed");
//        }
//    }
    public static void main(String[] args) {
        try {
            OrderDAO dao = new OrderDAO();
            int result = dao.deleteOrder(7);
            if (result > 0) {
                System.out.println("success");
            } else {
                System.out.println("Order not found.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int deleteOrder(int orderId) {
        int result = 0;
        String sql = "DELETE FROM [Order] WHERE OrderID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}
