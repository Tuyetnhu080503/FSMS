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
    private String lastname;
    private String phonenumber;
    private String deliveryaddress;

    public Order(int orderId, String lastname, String phonenumber, String status, String paymentMethod,  String deliveryaddress) {
        this.orderId = orderId;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.lastname = lastname;
        this.phonenumber = phonenumber;
        this.deliveryaddress = deliveryaddress;
    }

    public Order() {
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
    
    
    
}
