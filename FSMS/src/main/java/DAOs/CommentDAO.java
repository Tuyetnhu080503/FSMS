/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Comment;
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

    public ResultSet getDetailCommetByOrderId(int orderID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select c.Comment, c.[Image] as CommentImage, oi.OrderItemsID, c.Rating, p.[Image], p.[Name], pt.Color, pt.Size, oi.Quantity, oi.UnitPrice from [Order] o \n"
                    + "  inner join [OrderItems] oi on o.OrderID = oi.OrderID\n"
                    + "  inner join Comment c on oi.OrderItemsID = c.OrderItemID\n"
                    + "  inner join Product p on oi.ProductID = p.ProductID\n"
                    + "    inner join ProductType pt on oi.ProductTypeID = pt.ProductTypeID\n"
                    + "  where o.OrderID = ?");
            ps.setInt(1, orderID);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getDetailCommetWhenCreateByOrderId(int orderID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(" select oi.OrderItemsID, p.[Image], p.[Name],pt.Color, pt.Size, oi.Quantity, oi.UnitPrice from [Order] o \n"
                    + "  inner join [OrderItems] oi on o.OrderID = oi.OrderID\n"
                    + "  inner join Product p on oi.ProductID = p.ProductID\n"
                    + "  inner join ProductType pt on oi.ProductTypeID = pt.ProductTypeID\n"
                    + "  where o.OrderID = ?");
            ps.setInt(1, orderID);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public void updateComment(Comment comment) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Comment SET Rating = ?, Comment = ?, Image = ?, CreateAt = ?  Where OrderItemID = ?");
            ps.setInt(1, comment.getRating());
            ps.setString(2, comment.getComment());
            ps.setString(3, comment.getImage());
            ps.setTimestamp(4, comment.getCreateAt());
            ps.setInt(5, comment.getOrderItemId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addComment(Comment comment) {
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into Comment values (?,?,?,?,?)");
            ps.setInt(1, comment.getRating());
            ps.setString(2, comment.getComment());
            ps.setString(3, comment.getImage());
            ps.setTimestamp(4, comment.getCreateAt());
            ps.setInt(5, comment.getOrderItemId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getImageByID(int orderItemId) {
        String img = "";
        try {
            PreparedStatement ps = conn.prepareStatement("Select * from Comment where OrderItemID = ?");
            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                img = rs.getString("Image");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }

    public void deleteComment(int orderItemID) {
        try {
            PreparedStatement ps = conn.prepareStatement("delete Comment where OrderItemID = ?");
            ps.setInt(1, orderItemID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
