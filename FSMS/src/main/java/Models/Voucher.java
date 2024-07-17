
package Models;

import java.sql.Timestamp;


public class Voucher {
    private int voucherId;
    private int discountAmount;
    private int discountPercentage;
    private Timestamp expiryDate;
    private boolean isActive;
    private Timestamp createdDate;
    private int quantity;
    private int minimumPrice;

    public Voucher(int voucherId, int discountAmount, int discountPercentage, Timestamp expiryDate, boolean isActive, Timestamp createdDate, int quantity, int minimumPrice) {
        this.voucherId = voucherId;
        this.discountAmount = discountAmount;
        this.discountPercentage = discountPercentage;
        this.expiryDate = expiryDate;
        this.isActive = isActive;
        this.createdDate = createdDate;
        this.quantity = quantity;
        this.minimumPrice = minimumPrice;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getMinimumPrice() {
        return minimumPrice;
    }

    public void setMinimumPrice(int minimumPrice) {
        this.minimumPrice = minimumPrice;
    }

    @Override
    public String toString() {
        return "Voucher{" + "voucherId=" + voucherId + ", discountAmount=" + discountAmount + ", discountPercentage=" + discountPercentage + ", expiryDate=" + expiryDate + ", isActive=" + isActive + ", createdDate=" + createdDate + ", quantity=" + quantity + ", minimumPrice=" + minimumPrice + '}';
    }
    
    
    
}
