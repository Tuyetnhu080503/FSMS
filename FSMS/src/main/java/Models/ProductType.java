package Models;

public class ProductType {

    private int typeId;
    private String color;
    private String size;
    private int quantity;
    private int productId;  // Foreign key referencing Product

    public ProductType() {
    }

    public ProductType(String color, String size, int quantity) {
        this.color = color;
        this.size = size;
        this.quantity = quantity;
    }

    public ProductType(String color, String size, int quantity, int productId) {
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.productId = productId;
    }

    // Getters and setters

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
