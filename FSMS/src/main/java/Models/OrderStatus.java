/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;


public class OrderStatus {
    private int OrderStatusID;
    private Timestamp time;
    private String status;
    private int employeeID;
    private int orderID;
    private String firstName;
    private String lastName;

    public OrderStatus() {
    }

    
    public OrderStatus(int OrderStatusID, Timestamp time, String status, int employeeID, int orderID, String firstName, String lastName) {
        this.OrderStatusID = OrderStatusID;
        this.time = time;
        this.status = status;
        this.employeeID = employeeID;
        this.orderID = orderID;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    
    public int getOrderStatusID() {
        return OrderStatusID;
    }

    public void setOrderStatusID(int OrderStatusID) {
        this.OrderStatusID = OrderStatusID;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    
    
}
