package DAOs;

import Models.Category;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public CategoryDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAllCategory() {

        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from Category");
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public List<Product> getAllProductbyCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where categoryId=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getLong("price"),
                        rs.getString("image"),
                        rs.getInt("categoryId")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ResultSet getQuantityProductInCategory() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT c.CategoryID,c.name AS category_name,\n"
                    + "COUNT(p.productID) AS quantity\n"
                    + "FROM Category c\n"
                    + "JOIN Product p ON c.CategoryID = p.categoryID\n"
                    + "GROUP BY c.CategoryID, c.name;");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void main(String[] args) {
        CategoryDAO categoryDAO = new CategoryDAO();

        ResultSet rs = categoryDAO.getAllCategory();
        try {
            while (rs.next()) {
                int categoryId = rs.getInt("CategoryID");
                String categoryName = rs.getString("name");
                System.out.println("Category ID: " + categoryId + ", Category Name: " + categoryName);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ResultSet getAllProductsByCatID(int catID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Product p inner join Category c on p.CategoryID = c.CategoryID \n"
                    + "where p.CategoryID = ? and IsActive = 1", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, catID);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

}
