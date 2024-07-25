/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Order;
import Models.OrderItems;
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
            rs = st.executeQuery("SELECT o.OrderID, a. [Firstname], a.Lastname, a.Phonenumber, o.Status, o.PaymentMethod, c.Deliveryaddress FROM [Order] o \n"
                    + "join CustomerProfile as c on o.CustomerID = c.CustomerID\n"
                    + "join Voucher as v on o.VoucherID = v.VoucherID\n"
                    + "join Account as a on c.AccountID = a.AccountID");

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
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
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    public ResultSet getOrderByID(int accID, int orderId) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select o.OrderID, o.CustomerID, o.[Status], o.TotalPrice,oi.UnitPrice, p.[Name], p.[Image], oi.Quantity, pt.Size, pt.Color,o.PaymentMethod from [Order] o \n"
                    + "                    inner join CustomerProfile c on o.CustomerID = c.CustomerID\n"
                    + "                    inner join OrderItems oi on o.OrderID = oi.OrderID\n"
                    + "                    inner join Product p on oi.ProductID = p.ProductID\n"
                    + "                    inner join ProductType pt on oi.ProductTypeID = pt.ProductTypeID\n"
                    + "                    where c.AccountID = ? and o.OrderID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, accID);
            ps.setInt(2, orderId);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    public ResultSet getVoucherByOrderID(int accID, int orderId) {
        ResultSet rs = null;
        try {
            int cusID = 0;
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("select * from [Order] o inner join Voucher v on o.VoucherID = v.VoucherID\n"
                    + "  where o.OrderID = ? and o.CustomerID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, orderId);
            ps.setInt(2, cusID);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public String getAddress(int accID, int orderId) {
        String address = "";
        try {
            int cusID = 0;
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("select * from [Order]\n"
                    + "  where OrderID = ? and CustomerID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, orderId);
            ps.setInt(2, cusID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                address = rs.getString("Address");
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return address;
    }

    public ResultSet getAllStatus(int accID, int orderId) {
        ResultSet rs = null;
        try {
            int cusID = 0;
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("select os.[Time], os.[Status] from [Order] o inner join OrderStatus os on o.OrderID = os.OrderID\n"
                    + "\n"
                    + "  where o.OrderID = ?  and o.CustomerID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, orderId);
            ps.setInt(2, cusID);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    
    public ResultSet getOrderInfo(int accID, int orderId) {
        ResultSet rs = null;
        try {
            int cusID = 0;
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("select * from [Order]\n"
                    + "  where OrderID = ? and CustomerID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, orderId);
            ps.setInt(2, cusID);
            rs = ps.executeQuery();
            

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public void addOrderCOD(Order order) {
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [Order] values(?,?,?,?,?,?,?,?)");
            ps.setInt(1, order.getCustomerId());
            ps.setString(2, order.getStatus());
            ps.setLong(3, order.getTotalPrice());
            ps.setTimestamp(4,order.getCreateAt() );
            if(order.getVoucherId()!=0){
               ps.setInt(5,order.getVoucherId());
            }
            else{
               ps.setNull(5,java.sql.Types.INTEGER);
            }
            ps.setString(6, order.getPaymentMethod());
            ps.setString(7, order.getPaymentId());
            ps.setString(8, order.getDeliveryaddress());
            ps.executeUpdate();
 
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public int getOrderIDByCustomerIDAndCreateAt(int cusID) {
        int orderID = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [Order] where CustomerID = ?");
            ps.setInt(1, cusID);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                orderID = rs.getInt("OrderID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderID;
    }
    
    public void addOrderItems(OrderItems orderItem) {
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [OrderItems] values(?,?,?,?,?,?)");
            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getProductId());
            ps.setInt(3, orderItem.getProductTypeId());
            ps.setInt(4,orderItem.getQuantity());
            ps.setLong(5,orderItem.getUnitPrice());
            ps.setLong(6, orderItem.getTotalPrice());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
