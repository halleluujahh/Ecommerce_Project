/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

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
public class Cart {
    private int id;
    private int discount_id;
    private int account_id;
    private String address;
    
    private String cartCode;
    
    private Cart_Detail c_Det;
    private Product_Detail p_Det;
    private Product p;
    private Color c;
    private Size s;
    private Category cate;
    private Gender gen;
    private Image ima;
    private Discount dis;
}
