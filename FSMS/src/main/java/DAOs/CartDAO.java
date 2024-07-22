package DAOs;

import DBConnection.DBConnection;
import Models.Account;
import Models.Cart;
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
import java.util.stream.Collectors;

public class CartDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ResultSet getAllProductsInCart(int accId) {
        ResultSet rs = null;
        try {
            conn = DBConnection.connect();
            PreparedStatement ps = conn.prepareStatement("select pt.ProductTypeID, p.ProductID, p.[Image],p.[Name], pt.Color, pt.Size, p.Price, c.Quantity as CartQuantity, pt.Quantity as ProductTypeQuantity from Cart c \n"
                    + "  inner join CustomerProfile cp on c.CustomerID = cp.CustomerID\n"
                    + "  inner join ProductType pt on c.ProductTypeID = pt.ProductTypeID\n"
                    + "  inner join Product p on p.ProductID = c.ProductID\n"
                    + "  where AccountID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, accId);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public void addProductToCart(int accID, int proID, int proTypeID, int quantity) {
        int count = 0;
        try {
            int cusID = 0;
            conn = DBConnection.connect();
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("insert into [Cart] values(?,?,?,?)");
            ps.setInt(1, cusID);
            ps.setInt(2, proID);
            ps.setInt(3, quantity);
            ps.setInt(4, proTypeID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkProductExist(int accID, int productID, int productTypeID) {
        boolean isExist = false;
        try {
            int cusID = 0;
            conn = DBConnection.connect();
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("select * from Cart where CustomerID = ? and ProductID = ? and ProductTypeID = ?");
            ps.setInt(1, cusID);
            ps.setInt(2, productID);
            ps.setInt(3, productTypeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                isExist = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isExist;
    }

    public boolean addMoreQuantity(int accID, int proID, int proTypeID, int quantity) {
        try {
            int cusID = 0;
            conn = DBConnection.connect();
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            int currentQuantity = 0;
            //get current quantity
            PreparedStatement psQ = conn.prepareStatement("select * from Cart where CustomerID = ? and ProductID = ? and ProductTypeID = ?");
            psQ.setInt(1, cusID);
            psQ.setInt(2, proID);
            psQ.setInt(3, proTypeID);
            ResultSet rsQ = psQ.executeQuery();
            while (rsQ.next()) {
                currentQuantity = rsQ.getInt("Quantity");
            }

            int productTypeQuantity = 0;
            //get productType quantity
            PreparedStatement psPT = conn.prepareStatement("select * from ProductType where ProductTypeID = ?");
            psPT.setInt(1, proTypeID);
            ResultSet rsPT = psPT.executeQuery();
            while (rsPT.next()) {
                productTypeQuantity = rsPT.getInt("Quantity");
            }

            if (currentQuantity + quantity > productTypeQuantity) {
                return true;
            }

            PreparedStatement ps = conn.prepareStatement("UPDATE Cart SET Quantity = ? Where CustomerID = ? and ProductID = ? and ProductTypeID =?");
            ps.setInt(1, currentQuantity + quantity);
            ps.setInt(2, cusID);
            ps.setInt(3, proID);
            ps.setInt(4, proTypeID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void updateQuantityCartItems(int accID, int proID, int proTypeID, int quantity) {
        try {
            int cusID = 0;
            conn = DBConnection.connect();
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("UPDATE Cart SET Quantity = ? Where CustomerID = ? and ProductID = ? and ProductTypeID =?");
            ps.setInt(1, quantity);
            ps.setInt(2, cusID);
            ps.setInt(3, proID);
            ps.setInt(4, proTypeID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCartItems(int accID, int proID, int proTypeID) {
        try {
            int cusID = 0;
            conn = DBConnection.connect();
            PreparedStatement pss = conn.prepareStatement("select c.CustomerID from Account a inner join CustomerProfile c on a.AccountID = c.AccountID\n"
                    + "where a.AccountID = ?");
            pss.setInt(1, accID);
            ResultSet rss = pss.executeQuery();

            while (rss.next()) {
                cusID = rss.getInt("CustomerID");
            }

            PreparedStatement ps = conn.prepareStatement("Delete Cart Where CustomerID = ? and ProductID = ? and ProductTypeID =?");
            ps.setInt(1, cusID);
            ps.setInt(2, proID);
            ps.setInt(3, proTypeID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
