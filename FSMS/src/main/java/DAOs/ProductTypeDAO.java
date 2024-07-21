/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ProductType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductTypeDAO {

    private Connection conn;

    public ProductTypeDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ProductTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<ProductType> getProductTypesByProductID(int productID) {
        ArrayList<ProductType> productTypeList = new ArrayList<ProductType>();
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ProductType where ProductID = ?");
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productTypeList.add(new ProductType(rs.getInt("ProductTypeID"), rs.getString("Color"), rs.getString("Size"), rs.getInt("Quantity")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productTypeList;
    }

    public ResultSet getColors(int productID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select Color,ProductID from ProductType \n"
                    + "  group by Color,ProductID\n"
                    + "  having ProductID = ?");
            ps.setInt(1, productID);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getSizes(int productID) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select Size,ProductID from ProductType \n"
                    + "  group by Size,ProductID\n"
                    + "  having ProductID = ?");
            ps.setInt(1, productID);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
}
