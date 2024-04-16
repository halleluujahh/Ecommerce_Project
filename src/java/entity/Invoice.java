/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Invoice {
    private int id;
    private int account_id;
    private Date invoice_date;
    private float total_price;
    private int status_id;
    private String cartCode;
    private String address;
    private double subtotal_price;
    private double discount_percent;
    
    private Invoice_Details in_de;
    private Invoice_Status in_st;
    private Product pro;
}
