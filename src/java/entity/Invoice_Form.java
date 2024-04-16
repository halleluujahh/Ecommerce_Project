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
public class Invoice_Form {

    private int id;
    private int account_id;
    private String username;
    private String email;
    private String phoneNumber;
    private Date invoice_date;
    private int status_id;
    private String status;
    private String cartCode;
    private String address;
    private int invoiceDetail_id;
    private int product_id;
    private int productDetail_id;
    private float price;
    private float totalPrice;
    private String productName;
    private String productImage;
    private String productCategory;
    private String productBrand;
    private int productQuantity;
    private String productColor;
    private String productSize;
    private String productGender;
}
