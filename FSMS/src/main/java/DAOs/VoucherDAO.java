package DAOs;

import DBConnection.DBConnection;
import Models.Voucher;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class VoucherDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public VoucherDAO() throws SQLException {
        conn = DBConnection.connect();
    }

    public ResultSet getAllVouchers() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT [VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice] FROM [finaldtb].[dbo].[Voucher]");
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Voucher getVoucherByID(int voucherID) {
        Voucher voucher = null;
        try {
            String query = "SELECT * FROM [Voucher] WHERE VoucherID = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, voucherID);
            rs = ps.executeQuery();
            if (rs.next()) {
                voucher = new Voucher();
                voucher.setVoucherID(rs.getInt("VoucherID"));
                voucher.setDiscountAmount(rs.getInt("DiscountAmount"));
                voucher.setDiscountPercentage(rs.getInt("DiscountPercentage"));
                voucher.setExpiryDate(rs.getDate("ExpiryDate"));
                voucher.setActive(rs.getBoolean("IsActive"));
                voucher.setCreatedDate(rs.getDate("CreatedDate"));
                voucher.setQuantity(rs.getInt("Quantity"));
                voucher.setMinimumPrice(rs.getInt("MinimumPrice"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return voucher;
    }

    public boolean addVoucher(Voucher voucher) {
        boolean isSuccess = false;
        try {
            String query = "INSERT INTO [Voucher] (DiscountAmount, DiscountPercentage, ExpiryDate, IsActive, CreatedDate, Quantity, MinimumPrice) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, voucher.getDiscountAmount());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, new Date(voucher.getExpiryDate().getTime()));
            ps.setBoolean(4, voucher.isActive());
            ps.setDate(5, new Date(voucher.getCreatedDate().getTime()));
            ps.setInt(6, voucher.getQuantity());
            ps.setInt(7, voucher.getMinimumPrice());
            isSuccess = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSuccess;
    }

    public boolean updateVoucher(Voucher voucher) {
        boolean isSuccess = false;
        try {
            String query = "UPDATE [Voucher] SET DiscountAmount = ?, DiscountPercentage = ?, ExpiryDate = ?, IsActive = ?,  Quantity = ?, MinimumPrice = ? WHERE VoucherID = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, voucher.getDiscountAmount());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, new Date(voucher.getExpiryDate().getTime()));
            ps.setBoolean(4, voucher.isActive());
            ps.setInt(5, voucher.getQuantity());
            ps.setInt(6, voucher.getMinimumPrice());
            ps.setInt(7, voucher.getVoucherID());
            isSuccess = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSuccess;
    }

    public boolean deleteVoucher(int voucherID) {
        boolean isSuccess = false;
        try {
            String query = "DELETE FROM [Voucher] WHERE VoucherID = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, voucherID);
            isSuccess = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSuccess;
    }
    public List<Voucher> getAllVoucher() {
        List<Voucher> vouchers = new ArrayList<>();
        String query = "SELECT * FROM Voucher";
        
        try (Connection conn = DBConnection.connect();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                Voucher voucher = new Voucher(
                    rs.getInt("voucherId"),
                    rs.getInt("discountAmount"),
                    rs.getInt("discountPercentage"),
                    rs.getDate("expiryDate"),
                    rs.getBoolean("isActive"),
                    rs.getDate("createdDate"),
                    rs.getInt("quantity"),
                    rs.getInt("minimumPrice")
                );
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return vouchers;
    }

    public static void main(String[] args) throws SQLException {
    // Sample data for testing
//    int discountAmount = 10;
//    int discountPercentage = 20;
//    Date expiryDate = Date.valueOf("2024-12-31");
//    boolean isActive = true;
//    Date createdDate = new Date(System.currentTimeMillis()); // Assuming current date/time
//    int quantity = 100;
//    int minimumPrice = 50;
//
//    // Create a Voucher object
//    Voucher voucher = new Voucher(discountAmount, discountPercentage, expiryDate, isActive, createdDate, quantity, minimumPrice);
//
//    try {
//        // Instantiate VoucherDAO
//        VoucherDAO voucherDAO = new VoucherDAO();
//
//        // Call addVoucher method
//        boolean result = voucherDAO.addVoucher(voucher);
//
//        // Check result and print success/failure message
//        if (result) {
//            System.out.println("Voucher added successfully.");
//        } else {
//            System.out.println("Failed to add voucher.");
//        }
//    } catch (SQLException ex) {
//        // Handle SQL exceptions
//        Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }

        VoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> vouchers = voucherDAO.getAllVoucher();
        
        for (Voucher voucher : vouchers) {
            System.out.println("Voucher ID: " + voucher.getVoucherID());
            System.out.println("Discount Amount: " + voucher.getDiscountAmount());
            System.out.println("Discount Percentage: " + voucher.getDiscountPercentage()+ "%");
            System.out.println("Expiry Date: " + voucher.getExpiryDate());
            System.out.println("Is Active: " + (voucher.isActive() ? "Yes" : "No"));
            System.out.println("Created Date: " + voucher.getCreatedDate());
            System.out.println("Quantity: " + voucher.getQuantity());
            System.out.println("Minimum Price: " + voucher.getMinimumPrice());
            System.out.println("---------------");
        }
}

}
