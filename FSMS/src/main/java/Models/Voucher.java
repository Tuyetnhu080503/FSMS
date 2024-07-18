package Models;

import java.sql.Timestamp;
import java.util.Date;

public class Voucher {

    private int voucherID;
    private int discountAmount;
    private Integer discountPercentage;
    private Timestamp expiryDate;
    private boolean isActive;
    private Timestamp createdDate;
    private Integer quantity;
    private Integer minimumPrice;

    public Voucher() {
    }

 public Voucher(int voucherID, int discountAmount, Integer discountPercentage, Timestamp expiryDate, boolean isActive,  Integer quantity, Integer minimumPrice) {
        this.voucherID = voucherID;
        this.discountAmount = discountAmount;
        this.discountPercentage = discountPercentage;
        this.expiryDate = expiryDate;
        this.isActive = isActive;
        this.quantity = quantity;
        this.minimumPrice = minimumPrice;
    }


  public Voucher( int discountAmount, Integer discountPercentage, Timestamp expiryDate, boolean isActive,Timestamp createdDate , Integer quantity, Integer minimumPrice) {
        this.discountAmount = discountAmount;
        this.discountPercentage = discountPercentage;
        this.expiryDate = expiryDate;
        this.isActive = isActive;
        this.createdDate = createdDate;
        this.quantity = quantity;
        this.minimumPrice = minimumPrice;
    }

    // Getters and Setters
    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Integer getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(Integer discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getMinimumPrice() {
        return minimumPrice;
    }

    public void setMinimumPrice(Integer minimumPrice) {
        this.minimumPrice = minimumPrice;
    }
}
