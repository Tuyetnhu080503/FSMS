package DAOs;

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
        conn = DBConnection.DBConnection.connect();
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
}
