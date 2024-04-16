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
public class Feedback_Form {
    private int id;
    private int account_id;
    private int product_id;
    private String productName;
    private String content;
    private int star;
    private String image;
    private Date date_review;
    private String email;
    private String username;
}
