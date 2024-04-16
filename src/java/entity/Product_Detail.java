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

public class Product_Detail {
    private int id;
    private int product_id;
    private int color_id;
    private int category_id;
    private int size_id;
    private int brand_id;
    private int stock;
    private int gender_id;
    private Date created_on;
    private int status;
    private Date statusDate;
}