/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class DBConnection {

    public static Connection connect() throws SQLException {
        String server = "VIETNGUYEN\\SQLEXPRESS";
        String port = "1433";
        String database = "SROMS";
        String user = "sa";
        String password = "Vietnguyen02";
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            conn = DriverManager.getConnection("jdbc:sqlserver://" + server + ":" + port
                    + ";databaseName=" + database + ";user=" + user + ";password=" + password
                    + ";encrypt=true;trustServerCertificate=true;");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conn;
    }
}
