/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DBConnection.DBConnection;
import Models.Account;
import Models.Order;
import Models.OrderStatus;
import Models.OrderItems;
import java.sql.Connection;
import java.sql.Date;
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
        String query = "SELECT os.OrderStatusID, os.Time , os.Status, a.Firstname , a.Lastname, ep.EmployeeID	   \n"
                + "FROM OrderStatus os \n"
                + "join EmployeeProfile as ep on ep.EmployeeID = os.EmployeeID\n"
                + "join Account as a on a.AccountID = ep.AccountID\n"
                + "where os.[OrderID] = ? order by Time asc";
        try ( PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Timestamp time = rs.getTimestamp("Time");
                String status = rs.getString("Status");
                String firstName = rs.getString("Firstname");
                String lastname = rs.getString("Lastname");
                int employeeId = rs.getInt("EmployeeID");
                OrderStatus orderStatus = new OrderStatus();
                orderStatus.setStatus(status);
                orderStatus.setTime(time);
                orderStatus.setFirstName(firstName);
                orderStatus.setLastName(lastname);
                orderStatus.setEmployeeID(employeeId);
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
        Account result = orderDAO.getAccountByEmployeeId(14);
        
            System.out.println(result.getRoleId());
        

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

    public ResultSet getInforCus(int accID, int orderId) {
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
            PreparedStatement ps = conn.prepareStatement("insert into [Order] values(?,?,?,?,?,?,?,?,?,?)");
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
            ps.setString(9, order.getFullName());
            ps.setString(10, order.getPhonenumber());
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
    
    public void cancelOrder(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE [Order] SET [Status] = 'Cancel' Where OrderID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public int getTotalOfDate(Date date) {
        int total = -1;
        try {
            PreparedStatement ps = conn.prepareStatement("select sum(ToTalPrice) as total from [Order] o inner join [OrderStatus] ot on o.OrderID = ot.OrderID\n" +
                "  where ot.Status = 'Delivered' and CONVERT(date, [Time]) = ? ");
            ps.setDate(1, date);
            ResultSet rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    total = rs.getInt("total");
                }
            } else {
                total = 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
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

     public Account getAccountByEmployeeId(int id) {
        Account account = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account a\n"
                + "join EmployeeProfile as ep on ep.AccountID = a.AccountID\n"
                + "where ep.EmployeeID = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt("AccountID"),rs.getString("Username").trim(), rs.getString("Password").trim(), rs.getString("Email").trim(), rs.getString("Firstname").trim(), rs.getString("Lastname").trim(), rs.getDate("DOB"), rs.getString("Avatar").trim(), rs.getString("Gender").trim(), rs.getString("Phonenumber").trim(), rs.getString("Address").trim(), rs.getBoolean("Isactive"), rs.getInt("RoleID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }
}
