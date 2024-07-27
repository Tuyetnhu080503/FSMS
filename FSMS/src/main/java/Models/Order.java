/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int customerId;
    private String status;
    private long totalPrice;
    private Timestamp createAt;
    private int voucherId;
    private String paymentMethod;
    private String paymentId;
    private String firstName;
    private String lastname;
    private String phonenumber;
    private String deliveryaddress;
    private String employeeFirstName;
    private String employeeLastName;
    private Timestamp updatedAt;
    private String fullName;
      public Order(int orderId, String firstName, String lastname, String phonenumber, String status, String paymentMethod,  String deliveryaddress, String employeeFirstName, String employeeLastName, Timestamp updatedAt) {
        this.orderId = orderId;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.firstName = firstName;
        this.lastname = lastname;
        this.phonenumber = phonenumber;
        this.deliveryaddress = deliveryaddress;
        this.employeeFirstName = employeeFirstName;
        this.employeeLastName = employeeLastName;
        this.updatedAt = updatedAt;
    }

    public Order(int customerId, String status, long totalPrice, Timestamp createAt, int voucherId, String paymentMethod, String paymentId, String phonenumber, String deliveryaddress, String fullName) {
        this.customerId = customerId;
        this.status = status;
        this.totalPrice = totalPrice;
        this.createAt = createAt;
        this.voucherId = voucherId;
        this.paymentMethod = paymentMethod;
        this.paymentId = paymentId;
        this.phonenumber = phonenumber;
        this.deliveryaddress = deliveryaddress;
        this.fullName = fullName;
    }

    public Order(int orderId, String firstName, String lastname, String phonenumber, String status, String paymentMethod,  String deliveryaddress) {
        this.orderId = orderId;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.firstName = firstName;
        this.lastname = lastname;
        this.phonenumber = phonenumber;
        this.deliveryaddress = deliveryaddress;
    }

    public Order() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
    public Order(int orderId, int customerId, String status, long totalPrice, Timestamp createAt, int voucherId, String paymentMethod, String paymentId) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.status = status;
        this.totalPrice = totalPrice;
        this.createAt = createAt;
        this.voucherId = voucherId;
        this.paymentMethod = paymentMethod;
        this.paymentId = paymentId;
    }
    
    public Order(int customerId, String status, long totalPrice, Timestamp createAt, int voucherId, String paymentMethod, String paymentId,String deliveryaddress) {
        this.customerId = customerId;
        this.status = status;
        this.totalPrice = totalPrice;
        this.createAt = createAt;
        this.voucherId = voucherId;
        this.paymentMethod = paymentMethod;
        this.paymentId = paymentId;
        this.deliveryaddress = deliveryaddress;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getEmployeeFirstName() {
        return employeeFirstName;
    }

    public void setEmployeeFirstName(String employeeFirstName) {
        this.employeeFirstName = employeeFirstName;
    }

    public String getEmployeeLastName() {
        return employeeLastName;
    }

    public void setEmployeeLastName(String employeeLastName) {
        this.employeeLastName = employeeLastName;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getDeliveryaddress() {
        return deliveryaddress;
    }

    public void setDeliveryaddress(String deliveryaddress) {
        this.deliveryaddress = deliveryaddress;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    
    
}
