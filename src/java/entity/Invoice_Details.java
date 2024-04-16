/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

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
public class Invoice_Details {
    private int id;
    private int invoice_id;
    private int product_id;
    private int productDetail_id;
    private int quantity;
    private float price;
    private float totalPrice;
}
