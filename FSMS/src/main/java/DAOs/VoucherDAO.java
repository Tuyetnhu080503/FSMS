package DAOs;

import DBConnection.DBConnection;
import Models.Voucher;
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
                voucher.setExpiryDate(rs.getTimestamp("ExpiryDate"));
                voucher.setActive(rs.getBoolean("IsActive"));
                voucher.setCreatedDate(rs.getTimestamp("CreatedDate"));
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
            ps.setTimestamp(3, new Timestamp(voucher.getExpiryDate().getTime()));
            ps.setBoolean(4, voucher.isActive());
            ps.setTimestamp(5, new Timestamp(voucher.getCreatedDate().getTime()));
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
            ps.setTimestamp(3, new Timestamp(voucher.getExpiryDate().getTime()));
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
     public ResultSet getAllVoucher() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM Voucher");
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
   

    public void banVoucherById(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Voucher SET IsActive = 0 Where VoucherID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unbanVoucherById(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Voucher SET IsActive = 1 Where VoucherID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public static void main(String[] args) throws SQLException {
        VoucherDAO dao = new VoucherDAO();

        // Create a new Voucher object
        Voucher voucher = new Voucher();
        voucher.setDiscountAmount(10); // Set discount amount
        voucher.setDiscountPercentage(5); // Set discount percentage
        voucher.setExpiryDate(new Timestamp(System.currentTimeMillis() + (24 * 60 * 60 * 1000))); // Set expiry date (tomorrow) as Timestamp
        voucher.setActive(true); // Set active status
        voucher.setCreatedDate(new Timestamp(System.currentTimeMillis())); // Set created date as Timestamp
        voucher.setQuantity(100); // Set quantity
        voucher.setMinimumPrice(50); // Set minimum price

        // Call addVoucher method to insert the voucher into the database
        boolean isSuccess = dao.addVoucher(voucher);

        if (isSuccess) {
            System.out.println("Voucher added successfully.");
        } else {
            System.out.println("Failed to add voucher.");
        }
    }
    
    public ResultSet getAllVouchersActive() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("  select * from Voucher where IsActive = 1 and ExpiryDate > GETDATE() and Quantity > 0");
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public void updateQuantity(int quantity, int voucherID) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Voucher SET Quantity = ? Where VoucherID = ?");
            ps.setInt(1, quantity);
            ps.setInt(2, voucherID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}
