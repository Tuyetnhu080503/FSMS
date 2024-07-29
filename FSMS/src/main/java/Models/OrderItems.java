/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

public class OrderItems {

    private int orderItemsId;
    private int orderId;
    private int productId;
    private int productTypeId;
    private int quantity;
    private long unitPrice;
    private long totalPrice;
    private ProductType productType;
    private Product product;

    public OrderItems(int orderItemsId, int orderId, int productId, int productTypeId, int quantity, long unitPrice, long totalPrice) {
        this.orderItemsId = orderItemsId;
        this.orderId = orderId;
        this.productId = productId;
        this.productTypeId = productTypeId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }

    public OrderItems(int orderId, int productId, int productTypeId, int quantity, long unitPrice, long totalPrice) {
        this.orderId = orderId;
        this.productId = productId;
        this.productTypeId = productTypeId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }

    public OrderItems(int orderId, int quantity, long unitPrice, long totalPrice, ProductType productType, Product product) {
        this.orderId = orderId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.productType = productType;
        this.product = product;

    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public int getOrderItemsId() {
        return orderItemsId;
    }

    public void setOrderItemsId(int orderItemsId) {
        this.orderItemsId = orderItemsId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(long unitPrice) {
        this.unitPrice = unitPrice;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
