package DAOs;

import DBConnection.DBConnection;
import Models.Banner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BannerDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Banner> getAllBanners() {
        List<Banner> list = new ArrayList<>();
        String query = "SELECT * FROM Banner";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Banner(
                        rs.getInt("BannerID"),
                        rs.getString("BannerName"),
                        rs.getString("Image"),
                        rs.getString("Content"),
                        rs.getBoolean("IsActive"),
                        rs.getTimestamp("CreateAt")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    public void deleteBanner(int bannerId) {
        String query = "SELECT IsActive FROM Banner WHERE BannerID = ?";
        String updateQuery = "UPDATE Banner SET IsActive = ? WHERE BannerID = ?";

        try {
            conn = DBConnection.connect();

            // Step 1: Fetch current isActive status
            ps = conn.prepareStatement(query);
            ps.setInt(1, bannerId);
            rs = ps.executeQuery();

            boolean isActive = false;

            if (rs.next()) {
                isActive = rs.getBoolean("IsActive");
            } else {
                System.out.println("No banner found with ID: " + bannerId);
                return;
            }

            // Step 2: Toggle isActive status
            isActive = !isActive; // Toggle isActive

            // Step 3: Update isActive status in the database
            ps = conn.prepareStatement(updateQuery);
            ps.setBoolean(1, isActive);
            ps.setInt(2, bannerId);

            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            if (rowsAffected > 0) {
                System.out.println("Toggled banner status with ID: " + bannerId + " to IsActive = " + isActive);
            } else {
                System.out.println("Failed to toggle banner status with ID: " + bannerId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public void addBanner(String bannerName, String image, String content, boolean isActive) {
    String query = "INSERT INTO Banner (BannerName, Image, Content, IsActive) VALUES (?, ?, ?, ?)";

    try {
        conn = DBConnection.connect();
        ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        ps.setString(1, bannerName);
        ps.setString(2, image);
        ps.setString(3, content);
        ps.setBoolean(4, isActive);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        throw new RuntimeException("Failed to create banner: " + e.getMessage());
    } finally {
        closeResources();
    }
}

    public Banner getBannerById(String sid) {
        String query = "SELECT * FROM Banner WHERE BannerID = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, sid);

            rs = ps.executeQuery();
            if (rs.next()) {
                return new Banner(
                        rs.getInt("BannerID"),
                        rs.getString("BannerName"),
                        rs.getString("Image"),
                        rs.getString("Content"),
                        rs.getBoolean("IsActive"),
                        rs.getTimestamp("CreateAt")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null;
    }
     public boolean checkBannerNameExists(String bannerName) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean exists = false;

        try {
            conn = DBConnection.connect(); // Replace with your database connection method
            String sql = "SELECT COUNT(*) AS count FROM Banner WHERE BannerName = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, bannerName);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");
                exists = (count > 0);
            }
        } catch (SQLException ex) {
            // Handle any SQL errors
            ex.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return exists;
    }
    public boolean updateBanner(String bannerName, String newImage, String content, boolean isActive, String sid) {
        String query = "UPDATE Banner SET BannerName = ?, Image = ?, Content = ?, IsActive = ? WHERE BannerID = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, bannerName);
            ps.setString(2, newImage);
            ps.setString(3, content);
            ps.setBoolean(4, isActive);
            ps.setString(5, sid);

            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            return rowsAffected > 0; // Return true if at least one row was updated
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources();
        }
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
    public List<String> getActiveBannerImages() {
    List<String> images = new ArrayList<>();
    String query = "SELECT Image FROM Banner WHERE IsActive = 1";

    try {
        conn = DBConnection.connect();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            images.add(rs.getString("Image"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return images;
}

    public static void main(String[] args) {
        BannerDAO bannerDAO = new BannerDAO();
        
        // Test data
//        String bannerName = "Updated Banner Name";
//        String image = "updated_image.jpg";
//        String content = "Updated banner content";
//        boolean isActive = true;
//        String sid = "1013"; // Assume BannerID to be updated is 1

        // Call the updateBanner method
//       
    String checkBannerName = "Sale";
    boolean bannerExists = bannerDAO.checkBannerNameExists(checkBannerName);
    if (bannerExists) {
        System.out.println("\nBanner with name '" + checkBannerName + "' already exists.");
    } else {
        System.out.println("\nBanner with name '" + checkBannerName + "' does not exist.");
    }
    }
}
