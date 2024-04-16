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
 * @author Win 10
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Product {
    private int id;
    private String name;
    private Date create_on;
    private String description;
    private double price;
    private String image_path;
    private int category_id;
    private int brand_id;
    private String status;
    private Date status_date;
}