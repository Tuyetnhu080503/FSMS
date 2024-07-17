/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import Models.EmployeeProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeDAO {

    private Connection conn;

    public EmployeeDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public EmployeeProfile getEmployeeProfileByAccountID(int accountID) {
        EmployeeProfile employee = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from EmployeeProfile where AccountID = ?");
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                employee = new EmployeeProfile(rs.getInt("EmployeeID"),rs.getInt("AccountID"), rs.getString("CCCD").trim(), rs.getString("EmployeeCode").trim());
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }
    public void updateEmployeeCCCD(int accountId, String cccd) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE EmployeeProfile SET CCCD = ?  Where AccountID = ?");
            ps.setString(1, cccd);
            ps.setInt(2, accountId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateEmployee(int accountId, String cccd, String employeeCode) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE EmployeeProfile SET CCCD = ?, EmployeeCode=?  Where AccountID = ?");
            ps.setString(1, cccd);
            ps.setString(2, employeeCode);
            ps.setInt(3, accountId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addEmployee(EmployeeProfile employee) {
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [EmployeeProfile] values(?,?,?)");
            ps.setInt(1, employee.getAccountId());
            ps.setString(2, employee.getCccd());
            ps.setString(3, employee.getEmployeeCode());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getAccountIdByUsername(String username){
        int accId = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                accId = rs.getInt("AccountID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accId;
    }
}
