package DAOs;

import DBConnection.DBConnection;
import Models.Voucher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VoucherDAO {
    public List<Voucher> getAllVouchers() {
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
                    rs.getTimestamp("expiryDate"),
                    rs.getBoolean("isActive"),
                    rs.getTimestamp("createdDate"),
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
     public static void main(String[] args) {
        VoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> voucherList = voucherDAO.getAllVouchers();

        if (voucherList.isEmpty()) {
            System.out.println("No vouchers found.");
        } else {
            for (Voucher voucher : voucherList) {
                System.out.println("Voucher ID: " + voucher.getVoucherId());
                System.out.println("Discount Amount: " + voucher.getDiscountAmount());
                System.out.println("Discount Percentage: " + voucher.getDiscountPercentage() + "%");
                System.out.println("Expiry Date: " + voucher.getExpiryDate());
                System.out.println("Is Active: " + (voucher.isIsActive() ? "Yes" : "No"));
                System.out.println("Created Date: " + voucher.getCreatedDate());
                System.out.println("Quantity: " + voucher.getQuantity());
                System.out.println("Minimum Price: " + voucher.getMinimumPrice());
                System.out.println("--------------------------------------------");
            }
        }
    }
}
