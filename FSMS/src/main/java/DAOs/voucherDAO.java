/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Voucher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class voucherDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public voucherDAO() throws SQLException {
        conn = DBConnection.DBConnection.connect();
    }

    public List<Voucher> getAllVoucher() {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT * FROM [Voucher]";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getBoolean(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

   
    public int createVoucher(Voucher voucher) {
        int result = 0;
        String sql = "INSERT INTO Voucher (DiscountAmount, DiscountPercentage, ExpiryDate, IsActive, CreatedDate, Quantity, MinimumPrice) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, voucher.getDiscountAmount());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, voucher.getExpiryDate());
            ps.setBoolean(4, voucher.isIsActive());
            ps.setDate(5, voucher.getCreatedDate());
            ps.setInt(6, voucher.getQuantity());
            ps.setInt(7, voucher.getMinimumPrice());

            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
        }
        return result;
    }

    // Cập nhật Voucher
    public int updateVoucher(Voucher voucher) {
        int result = 0;
        String sql = "UPDATE Voucher SET DiscountAmount=?, DiscountPercentage=?, ExpiryDate=?, IsActive=?, CreatedDate=?, Quantity=?, MinimumPrice=? WHERE VoucherID=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, voucher.getDiscountAmount());
            ps.setInt(2, voucher.getDiscountPercentage());
            ps.setDate(3, voucher.getExpiryDate());
            ps.setBoolean(4, voucher.isIsActive());
            ps.setDate(5, voucher.getCreatedDate());
            ps.setInt(6, voucher.getQuantity());
            ps.setInt(7, voucher.getMinimumPrice());
            ps.setInt(8, voucher.getVoucherId());

            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
        }
        return result;
    }

    // Xóa Voucher
    public int deleteVoucher(int voucherId) {
        int result = 0;
        String sql = "DELETE FROM Voucher WHERE VoucherID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherId);
            result = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeResources();
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
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Voucher getVoucherById(int voucherId) {
 Voucher voucher = null;
        String sql = "SELECT * FROM [Voucher] WHERE VoucherID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherId);
            rs = ps.executeQuery();
            if (rs.next()) {
                voucher = new Voucher(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getBoolean(5),
                        rs.getDate(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(voucherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return voucher;    }
    public static void main(String[] args) throws SQLException {
        voucherDAO voucherDAO = new voucherDAO();
        List<Voucher> voucherList = voucherDAO.getAllVoucher();
        for (Voucher o : voucherList) {
            System.out.println(o.getMinimumPrice());
        }
    }
}
