/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Order;
import Models.OrderStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
        conn = DBConnection.connect();
    }

    public ResultSet getAllOrder() {

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("WITH LatestOrderStatus AS (\n"
                    + "    SELECT \n"
                    + "        os.OrderID,\n"
                    + "        os.Status,\n"
                    + "        os.Time,\n"
                    + "        ROW_NUMBER() OVER (PARTITION BY os.OrderID ORDER BY os.Time DESC) as rn\n"
                    + "    FROM \n"
                    + "        OrderStatus os\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    o.OrderID, \n"
                    + "    a.Firstname, \n"
                    + "    a.Lastname, \n"
                    + "    a.Phonenumber, \n"
                    + "    los.Status, \n"
                    + "    o.PaymentMethod, \n"
                    + "    c.Deliveryaddress\n"
                    + "FROM \n"
                    + "    [Order] o\n"
                    + "JOIN \n"
                    + "    CustomerProfile c ON o.CustomerID = c.CustomerID \n"
                    + "LEFT JOIN \n"
                    + "    Voucher v ON o.VoucherID = v.VoucherID \n"
                    + "JOIN \n"
                    + "    Account a ON c.AccountID = a.AccountID \n"
                    + "JOIN \n"
                    + "    LatestOrderStatus los ON o.OrderID = los.OrderID AND los.rn = 1;");

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public List<OrderStatus> getListOrderStatusByOrderId(int orderId) throws SQLException {
        List<OrderStatus> orderStatuses = new ArrayList<>();
        String query = "SELECT OrderStatusID\n"
                + "      ,Time\n"
                + "      ,Status\n"
                + "  FROM OrderStatus where [OrderID] = ? order by Time asc";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Timestamp time = rs.getTimestamp("Time");
                String status = rs.getString("Status");
                OrderStatus orderStatus = new OrderStatus();
                orderStatus.setStatus(status);
                orderStatus.setTime(time);
                orderStatuses.add(orderStatus);
            }
        }
        return orderStatuses;
    }

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

    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT top 1  o.OrderID,  \n"
                + "              a1.Firstname ,  \n"
                + "              a1.Lastname,   \n"
                + "              a1.Phonenumber,   \n"
                + "              os.Status,   \n"
                + "              o.PaymentMethod,   \n"
                + "              c.Deliveryaddress,   \n"
                + "              eAccount.Firstname AS EmpFirstname,  \n"
                + "              eAccount.Lastname AS EmpLastname, \n"
                + "              os.Time as UpdatedAt \n"
                + "          FROM   \n"
                + "              [Order] o   \n"
                + "              JOIN CustomerProfile AS c ON o.CustomerID = c.CustomerID  \n"
                + "              LEFT JOIN Voucher AS v ON o.VoucherID = v.VoucherID  \n"
                + "              JOIN Account AS a1 ON c.AccountID = a1.AccountID   \n"
                + "              JOIN OrderStatus AS os ON o.OrderID = os.OrderID   \n"
                + "              JOIN EmployeeProfile AS ep ON os.EmployeeID = ep.EmployeeID  \n"
                + "              JOIN Account AS eAccount ON ep.AccountID = eAccount.AccountID  \n"
                + "          WHERE   \n"
                + "              o.OrderID = ?\n"
                + "			  order by os.Time desc;";
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
                        rs.getString("Deliveryaddress"),
                        rs.getString("EmpFirstname"),
                        rs.getString("EmpLastname"),
                        rs.getTimestamp("UpdatedAt")
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

    public int updateOrderStatus(String orderId, String status, int employeeId) {
        int rowsUpdated = 0;
        String query = "INSERT INTO OrderStatus(Time, Status, EmployeeID, OrderID) VALUES (GETDATE(), ?, ?, ?)";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, employeeId);
            ps.setString(3, orderId);
            rowsUpdated = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsUpdated;
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

//    public static void main(String[] args) {
//
//        OrderDAO orderDAO = null;
//        try {
//            orderDAO = new OrderDAO();
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        int result = orderDAO.getEmployeeIdByAccountId(5);
//        if (result>0) {
//            System.out.println(result);
//        } else {
//            System.out.println("failed");
//        }
//    }
    public static void main(String[] args) throws SQLException {
        // Tạo kết nối đến cơ sở dữ liệu
        OrderDAO orderDAO = new OrderDAO();

        // Thông tin cần cập nhật
       
       
        List<OrderStatus> result = orderDAO.getListOrderStatusByOrderId(1);
        for (OrderStatus orderStatus : result) {
            System.out.println(orderStatus.getTime());
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

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getAllOrdersInformation(int accID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select o.OrderID, o.CustomerID, o.[Status], o.TotalPrice,oi.UnitPrice, p.[Name], p.[Image], oi.Quantity, pt.Size, pt.Color from [Order] o \n"
                    + "inner join CustomerProfile c on o.CustomerID = c.CustomerID \n"
                    + "inner join OrderItems oi on o.OrderID = oi.OrderID\n"
                    + "inner join Product p on oi.ProductID = p.ProductID\n"
                    + "inner join ProductType pt on oi.ProductTypeID = pt.ProductTypeID\n"
                    + "where c.AccountID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, accID);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getAllsOrderID(int accID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select o.OrderID, c.AccountID,o.[Status],o.TotalPrice from [Order] o\n"
                    + "                      inner join CustomerProfile c on o.CustomerID = c.CustomerID\n"
                    + "                    inner join OrderItems oi on o.OrderID = oi.OrderID\n"
                    + "                     inner join Product p on oi.ProductID = p.ProductID\n"
                    + "                    group by o.OrderID,c.AccountID, o.[Status],o.TotalPrice having c.AccountID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, accID);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    public int getEmployeeIdByAccountId(int accountId) {
        int employeeId = -1;
        String query = "select ep.EmployeeID from EmployeeProfile ep\n"
                + "where ep.AccountID = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            if (rs.next()) {
                employeeId = rs.getInt("EmployeeID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeId;
    }
}
