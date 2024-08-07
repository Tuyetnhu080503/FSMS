/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;


public class Comment {
    private int commentId;
    private int orderItemId;
    private String comment;
    private int rating;
    private String image;
    private Timestamp createAt;

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Comment(int orderItemId, String comment, int rating, String image, Timestamp createAt) {
        this.orderItemId = orderItemId;
        this.comment = comment;
        this.rating = rating;
        this.image = image;
        this.createAt = createAt;
    }
    

    public Comment(int commentId, int orderItemId, String comment, int rating, String image, Timestamp createAt) {
        this.commentId = commentId;
        this.orderItemId = orderItemId;
        this.comment = comment;
        this.rating = rating;
        this.image = image;
        this.createAt = createAt;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getOrderId() {
        return orderItemId;
    }

    public void setOrderId(int orderId) {
        this.orderItemId = orderId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    
    

    
}
