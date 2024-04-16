/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import lombok.Builder;
import lombok.Data;

/**
 *
 * @author LENOVO
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Product_Form {
    private int id;
    private String name;
    private Date create_on;
    private String description;
    private double price;
    private String image_path;
    private int status;
    private int product_id;
    private int color_id;
    private int category_id;
    private int size_id;
    private int brand_id;
    private int stock;
    private int gender_id;
    private String color;
    private String category;
    private String size;
    private String brand;
    private String gender;
    private Date created_on;
    private int quantity;
    private int account_id;
    private int cart_id;
    private int productDetailId;
}
