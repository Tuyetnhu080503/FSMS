/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    private Connection conn;

    public CategoryDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAllCategoryReturnResultSet() {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getQuantityProductInCategory() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("SELECT\n"
                    + "  c.CategoryID,\n"
                    + "  c.name AS category_name,\n"
                    + "  COUNT(p.productID) AS quantity\n"
                    + "FROM Category c\n"
                    + "JOIN Product p ON c.CategoryID = p.categoryID\n"
                    + "JOIN ProductType pt ON p.productID = pt.productID\n"
                    + "GROUP BY c.CategoryID, c.name;");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

}
