/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import lombok.Builder;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class ProductVM {
    private String imageLink;
    private int id;
    private String name;
    private Date create_on;
    private String description;
    private double price;
}
