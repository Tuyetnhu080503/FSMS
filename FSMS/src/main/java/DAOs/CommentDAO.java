/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CommentDAO {

    private Connection conn;

    public CommentDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAllCommentByProductID(int proID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from OrderItems ot \n"
                    + "inner join Comment c on ot.OrderItemsID = c.OrderItemID \n"
                    + "inner join ProductType pt on ot.ProductTypeID = pt.ProductTypeID\n"
                    + "inner join [Order] o on o.OrderID = ot.OrderID\n"
                    + "inner join [CustomerProfile] cp on cp.CustomerID = o.CustomerID\n"
                    + "inner join Account a on a.AccountID = cp.AccountID\n"
                    + "where ot.ProductID = ?");
            ps.setInt(1, proID);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int getQuantityComment(int proID) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select COUNT(CommentID) as Count from OrderItems ot \n"
                    + "inner join Comment c on ot.OrderItemsID = c.OrderItemID \n"
                    + "where ProductID = ?");
            ps.setInt(1, proID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getStar(int proID) {
        int star = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select AVG(Rating) as AVG from OrderItems ot \n"
                    + "inner join Comment c on ot.OrderItemsID = c.OrderItemID \n"
                    + "where ProductID = ?");
            ps.setInt(1, proID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                star = rs.getInt("AVG");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return star;
    }
    
    public boolean isComment(int orderID) {
        boolean isComment = false;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from OrderItems ot inner join Comment c on ot.OrderItemsID = c.OrderItemID where OrderID = ?");
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                isComment = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isComment;
    }
}
