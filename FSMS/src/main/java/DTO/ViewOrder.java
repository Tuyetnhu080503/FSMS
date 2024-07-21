/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

public class ViewOrder {

    private int id;
    private String image;
    private String name;
    private int quantity;
    private int unitPrice;
    private String size;
    private String color;

    public ViewOrder(int id, String image, String name, int quantity, int unitPrice, String size, String color) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.size = size;
        this.color = color;
    }

    public ViewOrder(int id, String image, String name, int quantity, int unitPrice) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
