/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO {

    private Connection conn;

    public AccountDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from Account");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Account getAccountByUsername(String username) {
        Account account = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt("AccountID"),rs.getString("Username").trim(), rs.getString("Password").trim(), rs.getString("Email").trim(), rs.getString("Firstname").trim(), rs.getString("Lastname").trim(), rs.getDate("DOB"), rs.getString("Avatar").trim(), rs.getString("Gender").trim(), rs.getString("Phonenumber").trim(), rs.getString("Address").trim(), rs.getBoolean("Isactive"), rs.getInt("RoleID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }
    
    public Account getAccountByEmail(String email) {
        Account account = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account(rs.getInt("AccountID"),rs.getString("Username").trim(), rs.getString("Password").trim(), rs.getString("Email").trim(), rs.getString("Firstname").trim(), rs.getString("Lastname").trim(), rs.getDate("DOB"), rs.getString("Avatar").trim(), rs.getString("Gender").trim(), rs.getString("Phonenumber").trim(), rs.getString("Address").trim(), rs.getBoolean("Isactive"), rs.getInt("RoleID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public Account getAccountByUsernameAndPassword(String username, String password) {
        Account account = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Username =? and Password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                account = new Account(rs.getInt("AccountID"),rs.getString("Username").trim(), rs.getString("Password").trim(), rs.getString("Email").trim(), rs.getString("Firstname").trim(), rs.getString("Lastname").trim(), rs.getDate("DOB"), rs.getString("Avatar").trim(), rs.getString("Gender").trim(), rs.getString("Phonenumber").trim(), rs.getString("Address").trim(), rs.getBoolean("Isactive"), rs.getInt("RoleID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }
    
    public boolean checkAccountIsActive(Account account) {
        boolean isActive = false;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where AccountID = ?");
            ps.setInt(1, account.getAccountId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isActive = rs.getBoolean("Isactive");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isActive;
    }
    
    public void updatePasswordByEmail(String email, String password) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Account SET Password = ? Where Email = ?");
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void banAccountByEmail(String email) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Account SET Isactive = 0 Where Email = ?");
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean checkRightPasswordByEmail(String email, String pass) {
        boolean isActive = false;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Email = ? and Password = ?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isActive = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isActive;
    }
    
    
    public void changePasswordByEmail(String email, String pass) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Account SET Password = ? Where Email = ?");
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Account updateCustomerProfile(Account account, int accId) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(""
                    + "update Account set Firstname =?, Lastname=?, Avatar=?, Gender=?, DOB=?,"
                    + "Address=?, Phonenumber=? where AccountID =?");

            ps.setString(1, account.getFirstName());
            ps.setString(2, account.getLastName());
            ps.setString(3, account.getAvatar());
            ps.setString(4, account.getGender());
            ps.setDate(5, account.getDob());
            ps.setString(6, account.getAddress());
            ps.setString(7, account.getPhoneNumber());
            ps.setInt(8,accId);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : account;
    }
    
}